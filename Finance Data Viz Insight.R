# Finance-Driven Data Visualization with ggplot2
# Author: Dr. Sunday Adetunji, MD PhD Epi | Data Science & Quant Finance
# Title: "Visual Finance: Strategic Insight from Charts"

# Rooted in insights from:
# - Osterwalder & Pigneur’s *Business Model Generation* (value proposition, key metrics, revenue streams)
# - Berk & DeMarzo’s *Corporate Finance* (risk, return, CAPM, capital budgeting, firm valuation)
# - Dyer et al.’s *Innovator’s DNA* (creative associations for data storytelling)

# ----------------------------------------------------------
# 1. Setup: Libraries & Data Simulation
# ----------------------------------------------------------
library(tidyverse)
library(scales)

# Simulated data for 3 key sectors
set.seed(42)
dates <- seq(as.Date("2023-01-01"), as.Date("2023-12-31"), by = "week")
stocks <- tibble(
  date = rep(dates, 3),
  sector = rep(c("Technology", "Energy", "Healthcare"), each = length(dates)),
  return = c(
    cumsum(rnorm(length(dates), mean = 0.8, sd = 2.5)),
    cumsum(rnorm(length(dates), mean = 0.5, sd = 1.8)),
    cumsum(rnorm(length(dates), mean = 0.6, sd = 1.2))
  )
)

# ----------------------------------------------------------
# 2. Strategic Visuals: Cumulative Returns
# ----------------------------------------------------------
# Value: Shows sector momentum, useful in portfolio design (per Berk & DeMarzo Ch. 10-11)

ggplot(stocks, aes(x = date, y = return, color = sector)) +
  geom_line(size = 1.1) +
  labs(
    title = "Cumulative Stock Returns by Sector (2023)",
    x = "Date",
    y = "Cumulative Return",
    color = "Sector"
  ) +
  theme_minimal() +
  scale_y_continuous(labels = dollar_format(prefix = "$"))

# ----------------------------------------------------------
# 3. Trend Inference with LOESS Smoothing
# ----------------------------------------------------------
# Value: Helps stakeholders recognize macro trends without volatility noise

ggplot(stocks, aes(x = date, y = return, color = sector)) +
  geom_line(alpha = 0.3) +
  geom_smooth(se = FALSE, method = "loess", span = 0.2, size = 1.2) +
  labs(
    title = "Smoothed Return Trends by Sector",
    subtitle = "LOESS smoothing for decision clarity",
    x = NULL, y = "Return ($)", color = "Sector"
  ) +
  theme_light()

# ----------------------------------------------------------
# 4. Faceted Panels: Investor Lens
# ----------------------------------------------------------
# Use: Enables VCs or finance managers to assess individual industry behavior

ggplot(stocks, aes(x = date, y = return)) +
  geom_line(color = "steelblue") +
  facet_wrap(~sector, scales = "free_y") +
  labs(
    title = "Sector-Specific Return Paths",
    x = NULL, y = "Cumulative Return"
  ) +
  theme_bw()

# ----------------------------------------------------------
# 5. Year-End Distribution for Risk Management
# ----------------------------------------------------------
# Value: Borrowing from *Business Model Generation*, this aligns with key metrics for CFOs
final_return <- stocks %>%
  group_by(sector) %>%
  summarise(end_return = last(return))

ggplot(final_return, aes(x = sector, y = end_return, fill = sector)) +
  geom_col(show.legend = FALSE) +
  geom_text(aes(label = round(end_return, 1)), vjust = -0.5, size = 5) +
  labs(
    title = "Year-End Returns by Sector",
    y = "Final Return ($)", x = NULL
  ) +
  theme_minimal()

# ----------------------------------------------------------
# 6. Scenario Simulation – Governance & Regulation
# ----------------------------------------------------------
# Insight: Scenario-based modeling (inspired by CAPM, arbitrage theory in *Corporate Finance*)
shock_stocks <- stocks %>%
  mutate(shock = if_else(date == as.Date("2023-09-01"), -10, 0),
         return = return + shock)

ggplot(shock_stocks, aes(x = date, y = return, color = sector)) +
  geom_line(size = 1) +
  geom_vline(xintercept = as.Date("2023-09-01"), linetype = "dashed", color = "red") +
  annotate("text", x = as.Date("2023-09-01"), y = 0, label = "Shock Event", vjust = -1.2, color = "red") +
  labs(
    title = "Shock Event Simulation on Sector Returns",
    subtitle = "Applied on Sept 1st across all sectors",
    y = "Return ($)"
  ) +
  theme_minimal()

# ----------------------------------------------------------
# Advanced Insight:
# • Business Model Generation: Use visuals to align ROI, customer segment, and revenue stream.
# • Corporate Finance: Use graphs for DCF insight, IRR visibility, and risk-return profiles.
# • Innovator's DNA: Combine financial metrics with creative cross-industry visuals to craft strategy.

# Chapter 3: Data Visualization with ggplot2
# R for Data Science – Section 3.1 to 3.3.1
# Author: Prof. [Your Name]

# Load Required Packages
install.packages("tidyverse")  # Only run once
library(tidyverse)

# 3.1 Introduction
# ggplot2 is based on the Grammar of Graphics.
# You construct graphics layer by layer using ggplot().

# 3.2 First Steps
# Question: Do bigger engines use more fuel?

# View the mpg dataset
mpg

# Scatterplot of engine size vs highway mpg
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy))

# Comment: A clear negative trend — larger engines have lower fuel efficiency.

# 3.2.4 Exercises

# 1. Blank plot
ggplot(data = mpg)

# 2. Dataset dimensions
dim(mpg)  # 234 rows, 11 columns

# 3. drv variable
?mpg  # Describes the type of drivetrain

# 4. cyl vs hwy
ggplot(data = mpg) + geom_point(mapping = aes(x = cyl, y = hwy))

# 5. class vs drv (categorical scatterplot)
ggplot(data = mpg) + geom_point(mapping = aes(x = class, y = drv))

# 3.3 Aesthetic Mappings

# color mapping
ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy, color = class))

# size mapping
ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy, size = class))

# shape mapping
ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy, shape = class))

# 3.3.1 Exercises

# Exercise 1: Wrong mapping
ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy, color = "blue"))
# "blue" becomes a factor level

# Fixed version:
ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy), color = "blue")

# Exercise 2: Categorical vs continuous
str(mpg)

# Exercise 3: continuous mappings
ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy, color = cty))

# Exercise 4: multiple aesthetics
ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy, color = class, shape = class))

# Exercise 5: stroke aesthetic
ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy, shape = class), stroke = 2)

# Exercise 6: logical mapping
ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy, color = displ < 5))

# 🚀 Finance & Health Applications
# Finance: Visualize loan size vs interest rates, map credit score to color.
# Health: BMI vs cholesterol levels, map smoking status to shape or color.

# 🧠 Sample Quiz Questions
# 1. What is the purpose of aes() in ggplot2?
# 2. What happens if you map a logical value (e.g., displ < 5) to color?
# 3. What’s the difference between mapping inside aes() and setting a fixed value outside it?

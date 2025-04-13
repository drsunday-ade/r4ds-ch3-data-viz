# Chapter 3 - Data Visualization: Sections 3.1 to 3.4
# Student: SUNDAY ADETUNJI
# Instructor: Prof Katherine (Katie) McLaughlin

# ==========================
# Section 3.1 – Introduction
# ==========================

# Load tidyverse which includes ggplot2
library(tidyverse)

# View the built-in mpg dataset
head(mpg)  # Shows the first 6 rows of the dataset

# Basic scatterplot: engine displacement vs highway mpg
# This shows a negative correlation (as engine size increases, highway mpg decreases)
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy))

# Template for ggplot2 graphs:
# ggplot(data = <DATA>) + 
#   <GEOM_FUNCTION>(mapping = aes(<MAPPINGS>))

# Scatterplot with color aesthetic: class determines the color of the points
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, color = class))

# Scatterplot with size aesthetic (not ideal for discrete variables like class)
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, size = class))

# Scatterplot with alpha (transparency)
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, alpha = class))

# Scatterplot with shape (up to 6 shapes)
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, shape = class))

# Scatterplot with fixed color (not mapped to variable)
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy), color = "blue")


# =============================
# Section 3.2.4 – Exercises
# =============================

# 1. What do you see when running ggplot(data = mpg)?
# A blank canvas is produced because no geom is specified
ggplot(data = mpg)

# 2. Number of rows and columns in mpg
dim(mpg)  # 234 rows, 11 columns

# 3. What does drv describe?
# drv: the type of drive train: f = front-wheel, r = rear-wheel, 4 = 4WD
?mpg

# 4. Scatterplot: hwy vs cyl (both numeric)
ggplot(data = mpg) +
  geom_point(mapping = aes(x = cyl, y = hwy))

# 5. Scatterplot: class vs drv (both categorical)
# This plot is not very informative due to overlapping points
ggplot(data = mpg) +
  geom_point(mapping = aes(x = class, y = drv))


# ==================================
# Section 3.3 – Aesthetic Mappings
# ==================================

# Example: Mapping class to color
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, color = class))

# Mapping class to size (warning: size not good for categorical)
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, size = class))

# Mapping class to alpha (transparency)
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, alpha = class))

# Mapping class to shape (only supports up to 6 shapes)
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, shape = class))

# Set color manually (not mapped)
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy), color = "blue")


# =============================
# Section 3.3.1 – Exercises
# =============================

# 1. What's wrong with this code?
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, color = "blue"))
# Answer: color = "blue" is inside aes(), so it's treated as a constant factor, not a color.

# Fix:
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy), color = "blue")

# 2. Which variables are categorical and which are continuous?
str(mpg)
# Categorical: manufacturer, model, trans, drv, fl, class
# Continuous: displ, year, cyl, cty, hwy

# 3. Map continuous variable to color, size, shape
# Color
ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy, color = cty))

# Size
ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy, size = cty))

# Shape (needs to be a factor)
ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy, shape = factor(cty)))

# 4. Mapping same variable to multiple aesthetics
# Color and shape
ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy, color = class, shape = class))

# 5. Stroke aesthetic: for shapes 21–24 only
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, shape = class), stroke = 2)

# 6. Logical aesthetic: color by condition (displ < 5)
ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy, colour = displ < 5))
# Produces TRUE/FALSE groups


# =============================
# Section 3.4 – Common Problems
# =============================

# Common problems include:
# - Using + at the start of a line (it must be at the end of the previous line)
# - Forgetting to match parentheses or quotation marks
# - Placing mappings outside aes() or setting aesthetics incorrectly

# Example of a common mistake:
ggplot(data = mpg) 
+ geom_point(mapping = aes(x = displ, y = hwy))  # WRONG

# Correct way:
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy))

rmarkdown::render("Chapter_1.1_3.1.spin.Rmd")

getwd()

list.files()

setwd("path/to/your/file")


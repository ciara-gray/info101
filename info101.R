library(ggplot2)
library(marinecs100b)


# Questionable organization choices ---------------------------------------

# P1 Call the function dir() at the console. This lists the files in your
# project's directory. Do you see woa.csv in the list? (If you don't, move it to
# the right place before proceeding.)
dir()

# P2 Critique the organization of woa.csv according to the characteristics of
# tidy data.

# I'm not a computer and I'm confused. The data is not a rectangle, some titles
# span more than one column and some columns are missing cells.

# Importing data ----------------------------------------------------------

# P3 P3 Call read.csv() on woa.csv. What error message do you get? What do you
# think that means?
read.csv("woa.csv")

# "Error in read.table(file = file, header = header, sep = sep, quote = quote,
# : more columns than column names"
# I think this means there is data in columns that are not titled.
?read.csv

# P4 Re-write the call to read.csv() to avoid the error in P3.
read.table("woa.csv", header = FALSE)
read.csv("woa.csv", skip = 1)


# Fix the column names ----------------------------------------------------

# P5 Fill in the blanks below to create a vector of the depth values.

depths <- c(
  seq(0, 100, by = 5),
  seq(125, 500, by = 25),
  seq(550, 2000, by = 50),
  seq(2100, 5500, by = 100)
)

?seq
depths

# P6 Create a vector called woa_colnames with clean names for all 104 columns.
# Make them the column names of your WOA data frame.

woa_colnames <- c("Latitude", "Longitude", paste0("Depth ", depths))
paste0("Depth ", depths)
?paste

# Analyzing wide-format data ----------------------------------------------

# P7 What is the mean water temperature globally in the twilight zone (200-1000m
# depth)?

depths[25]
depths[47]
x <- c(depths[25] : depths[47])
mean(x)
?mean

# Analyzing long-format data ----------------------------------------------

# P8 Using woa_long, find the mean water temperature globally in the twilight
# zone.


# P9 Compare and contrast your solutions to P8 and P9.


# P10 Create a variable called mariana_temps. Filter woa_long to the rows in the
# location nearest to the coordinates listed in the in-class instructions.


# P11 Interpret your temperature-depth profile. What's the temperature at the
# surface? How about in the deepest parts? Over what depth range does
# temperature change the most?

# ggplot is a tool for making figures, you'll learn its details in COMM101
ggplot(mariana_temps, aes(temp_c, depth_m)) +
  geom_path() +
  scale_y_reverse()

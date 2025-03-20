library(marinecs100b)
library(ggplot2)

read.csv(woa_sal)

# Questionable organization choices ---------------------------------------

# P1 Call the function dir() at the console. This lists the files in your
# project's directory. Do you see woa.csv in the list? (If you don't, move it to
# the right place before proceeding.)
dir()


# P2 Critique the organization of woa.csv according to the characteristics of
# tidy data. Consolidate the latitude column so that it's not repeating the same
# value for multiple rows. It makes it look messy. I'm also confused about what
# the numbers are past the third column. I think I'd switch the organization of
# the row labels and column labels.


# Importing data ----------------------------------------------------------

# P3 Call read.csv() on woa.csv. What error message do you get? What do you
# think that means?
read.csv("woa.csv")
?read.csv
# Error in read.table(file = file, header = header, sep = sep, quote = quote,  :
# more columns than column names
# I think it's saying that there are more columns than column names in the data
# set.

# P4 Re-write the call to read.csv() to avoid the error in P3.
woa <- read.csv("woa.csv", sep = "", fill = TRUE,
                quote = "", skip = 1 )
woa <- read.csv("woa.csv", fill = TRUE, skip = 1)

?read.csv(woa)

# Fix the column names ----------------------------------------------------

# P5 Fill in the blanks below to create a vector of the depth values.

depths <- c(
  seq(0, 100, by = 5),
  seq(125, 500, by = 25),
  seq(550, 2000, by = 50),
  seq(2100, 5500, by = 100)
)

# P6 Create a vector called woa_colnames with clean names for all 104 columns.
# Make them the column names of your WOA data frame.

woa_colnames <- c("Latitude", "Longitude", paste0("Depth", depths))

# Analyzing wide-format data ----------------------------------------------

# P7 What is the mean water temperature globally in the twilight zone (200-1000m
# depth)?
depths[27]
depths[49]
woa_wide <- read.csv("woa.csv", skip = 1)
woa_twilight <- woa_wide[ , 27:49]
sum_woa_twilight <- sum(woa_twilight, na.rm = TRUE)
num_measurements <- (sum(!is.na(woa_wide[, 27:49])))
sum_woa_twilight/num_measurements

# Analyzing long-format data ----------------------------------------------

# P8 Using woa_long, find the mean water temperature globally in the twilight zone.
View(woa_long)
twilight_temps <- woa_long[woa_long$depth_m >= 200 & woa_long$depth_m >= 1000,4]
mean(twilight_temps)

# P9 Compare and contrast your solutions to P7 and P8. My solution for P7 was
# 6.57, while my solution for P8 was 2.43. So, using wide-format my mean was
# about three times the mean of the long-format.


# P10 Create a variable called mariana_temps. Filter woa_long to the rows in the
# location nearest to the coordinates listed in the in-class instructions.
mariana_temps <- woa_long[woa_long$latitude == 11.5 & woa_long$longitude == 142.5, ]
# ggplot is a tool for making figures, you'll learn its details in COMM101
ggplot(mariana_temps, aes(temp_c, depth_m)) +
  geom_path() +
  scale_y_reverse()

# P11 Interpret your temperature-depth profile. What's the temperature at the
# surface? How about in the deepest parts? Over what depth range does
# temperature change the most? The temperature at the surface is about 28
# degrees Celsius. In the deepest parts, it's about 2 degrees Celsius. The
# temperature changes the most between 1000 meters and 0 meters.

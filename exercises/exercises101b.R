#DEMO

# How to create a data frame manually
noaa_survey <- data.frame(latitude = c(45, 45, 30, 30),
                          depth_m = c(5, 100, 5, 100),
                          temp_c = c(10.6, 7.1, 21.8, 18.3))
# Print data frame directly to the console
noaa_survey
# View () function to use RStudio's viewer
View(noaa_survey)

# Alternatively, we can import using read.csv()
write.csv(noaa_survey, "noaa_survey.csv", row.names = FALSE)

# Check the contents of your directory
dir()

# Read a data frame from a CSV file
noaa_survey2 <- read.csv("noaa_survey.csv")

# How to read a data frame from a CSV file
noaa_survey2 <- read.csv("noaa_survey.csv")
noaa_survey2

# How to see and modify column names
colnames(noaa_survey2)
colnames(noaa_survey2) <- c("Latitude", "Depth_M", "Temp_C")
noaa_survey2


# EXERCISES

# What are the dimensions (number of rows and columns) of this data frame?
rovs <- data.frame(
  model = c("Chasing M2 Pro", "Qysea Fifish Pro V6", "BlueROV2"),
  price_usd = c(3459, 2999, 6500)
)
# There are 3 rows and 2 columns in this data frame.

# Fill in the blanks to create a data frame with columns "species" and "mass_kg"
# The lingcod weighed 4.9 kg and the two halibut weighed 11.2 and 14.1 kg.
harvest <- data.frame(
  species = c("halibut", "lingcod", "halibut"),
  mass_kg = c(14.1, 4.9, 11.2)
)

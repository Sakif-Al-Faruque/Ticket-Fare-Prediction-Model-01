project_dataset <- read.csv('/Users/sakif/Desktop/R/ds_project/Dataset_midterm_Section(A).csv', header = TRUE, sep = ',');


str(project_dataset)
summary(project_dataset)
View(project_dataset)
names(project_dataset)
nrow(project_dataset)


head(project_dataset, 10)
tail(project_dataset, 10)


print(project_dataset$Gender)
print(project_dataset$age)
print(project_dataset$sibsp)
print(project_dataset$parch)
print(project_dataset$fare)
print(project_dataset$embarked)
print(project_dataset$class)
print(project_dataset$who)
print(project_dataset$alone)
print(project_dataset$survived)


freqofgen <- table(project_dataset$Gender)
View(freqofgen)
png(file = "/Users/sakif/Desktop/R/ds_project/gender_ratio_before_cleaning.png")
barplot(freqofgen)
dev.off()


freqofaln <- table(project_dataset$alone)
View(freqofaln)
png(file = "/Users/sakif/Desktop/R/ds_project/alone_bar_plot_before_cleaning.png")
barplot(freqofaln)
dev.off()


freqofcls <- table(project_dataset$class)
View(freqofcls)
png(file = "/Users/sakif/Desktop/R/ds_project/class_bar_plot_before_cleaning.png")
barplot(freqofcls)
dev.off()


png(file = "/Users/sakif/Desktop/R/ds_project/agebox_before_cleaning.png")
boxplot(project_dataset$age, 
        col = c("yellow", "red", "cyan"), 
        main = "Boxplot for Titanic dataset",
        notch = TRUE,
        horizontal = TRUE);
dev.off();
summary(project_dataset$age)



png(file = "/Users/sakif/Desktop/R/ds_project/farebox_before_cleaning.png")
boxplot(project_dataset$fare, 
        col = c("yellow", "red", "cyan"), 
        main = "Boxplot for Titanic dataset",
        notch = TRUE,
        horizontal = TRUE);
dev.off();
summary(project_dataset$fare)




project_dataset$alone <- as.logical(project_dataset$alone)
print(project_dataset$alone)


project_dataset$alone[
  project_dataset$alone != TRUE & 
  project_dataset$alone != FALSE
] <- NA


project_dataset$class[
  project_dataset$class != "First" & 
  project_dataset$class != "Second" &
  project_dataset$class != "Third"
] <- NA



project_dataset$age[
  project_dataset$age > 70
] <- NA




project_dataset$fare[
  project_dataset$fare > 100
] <- NA





colSums(is.na(project_dataset))
project_dataset <- na.omit(project_dataset)

print(paste("standard deviation of age: ", sd(project_dataset$age)))
print(paste("standard deviation of fare: ", sd(project_dataset$fare)))


png(file = "/Users/sakif/Desktop/R/ds_project/age_hist_after_cleaning.png")
hist(project_dataset$age, 
     breaks = 100, 
     col = "orange",
     main = "Histogram plot of age",
     xlab = "Age Bin")
dev.off()

png(file = "/Users/sakif/Desktop/R/ds_project/fare_hist_after_cleaning.png")
hist(project_dataset$fare, 
     breaks = 100, 
     col = "orange",
     main = "Histogram plot of fare",
     xlab = "Fare Bin")
dev.off()


project_dataset <- subset(project_dataset, select = -c(sibsp, parch, who))


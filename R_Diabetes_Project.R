# Dataset is from https://www.kaggle.com/datasets/nanditapore/healthcare-diabetes

# In this project, we will be focusing on Data manipulation, Visualization and Statistical Analysis.
# Skills/ Package used: ggplot, t-test, mean, Hmisc

# Claim 1: People with a higher BMI are more likely to have diabetes compared to those with a lower BMI.
# Claim 2: Older people are more likely to have diabetes

# Drop all columns except for BMI, Age, and Outcome. 
data <- subset(data, select = c(BMI, Age, Outcome))

head(data)
colnames(data)
table(data$Outcome)

# After installation of Hmisc package
# Click the "Tools" Pane to install packages if you are using Rstudio Cloud 
# Check if there is missing value
describe(data)
## Then we found 10 Variables(columns), 2768 Observations(rows)

ggplot(data, aes(x = factor(Outcome))) +
  geom_bar(fill = "skyblue") +
  geom_text(stat='count', aes(label = after_stat(count)), vjust=-0.5) + 
  labs(title = "Distribution of Diabetes Outcome",
       x = "Outcome",
       y = "Count") +
  scale_x_discrete(labels = c("Absence", "Presence"))


# BMI 
# Claim 1: People with a higher BMI are more likely to have diabetes compared to those with a lower BMI.
# presence (1) or absence (0) of diabetes

presence <- subset(data, Outcome == 1)
absence <- subset(data, Outcome == 0)
mean_BMI_presence <- mean(presence$BMI)
mean_BMI_absence <- mean(absence$BMI)

## We got Mean BMI for absence: 30.49 and Mean BMI for presence: 35.27
## Is this statistically significant?
t.test(presence$BMI, absence$BMI, alternative = "two.sided", conf.level = 0.95)
# If p-value(probability value) <0.05, we reject null hypothesis
# In this case, p-value < 2.2e-16, which is very close to 0 and extremely small 
# To conclude, the claim is statistically significant 

# Age
# Claim 2: Older people are more likely to have diabetes
mean_age_presence <- mean(presence$Age)
mean_age_absence <- mean(absence$Age)
t.test(presence$Age, absence$Age, alternative = "two.sided", conf.level = 0.95)
# If p-value(probability value) <0.05, we reject null hypothesis
# In this case, p-value < 2.2e-16, which is very close to 0 and extremely small 
# To conclude, the claim is statistically significant 

library(ggplot2)

df <- data.frame(category = c("Father Not Named", "Father Named and Close", "Father Named and Not Close"),
                 Social_Ties = c(4.85,5.75,5.23),
                 Male_Social_Ties = c(2.17,2.88,2.30),
                 Female_Social_Ties = c(2.67,2.86,2.93))


social_base <- ggplot(data = df, aes(x=category, y=Social_Ties))

social_base + geom_histogram(stat = "identity", aes(fill = category),
                             binwidth = 1)







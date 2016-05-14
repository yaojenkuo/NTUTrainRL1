# 建立草帽海賊團團員資訊的資料框

crew <- c("Monkey D Luffy", "Roronoa Zoro", "Nami", "Usopp", "Vinsmoke Sanji", "Tony Tony Chopper", "Nico Robin", "Franky", "Brook")
birthday <- c("1997-05-05", "1995-11-11", "1996-07-03", "1997-04-01", "1995-03-02", "1999-12-24", "1986-02-06", "1980-03-09", "1926-04-03")
gender <- c("Male", "Male", "Female", "Male", "Male", "Male", "Female", "Male", "Male")
strawHatPirate <- data.frame(crew, birthday, gender)

# 建立草帽海賊團惡魔果實的資料框
crew <- c("Monkey D Luffy", "Tony Tony Chopper", "Nico Robin", "Brook")
devilFruit <- c("Rubber", "Human", "Flower", "Underworld")
strawHatDevilFruit <- data.frame(crew, devilFruit)

# 將`strawHatPirate$birthday`利用`as.Date`轉換成日期格式
birthdayDate <- as.Date(strawHatPirate$birthday, format = "%Y-%m-%d")

# 以`cbind()`新增一欄`age`，利用`Sys.Date()`跟轉換後的`strawHatPirate$birthday`相減，除以365後以`round()`處理
age <- round(as.numeric((Sys.Date() - birthdayDate)/365))
strawHatPirate <- cbind(strawHatPirate, age)

# 利用`order()`將`strawHatPirate`以`age`做遞減排序
strawHatPirateOrdered <- strawHatPirate[order(strawHatPirate$age, decreasing = TRUE), ]
View(strawHatPirateOrdered)

# 使用`sqldf()`計算`strawHatPirate`男性與女性的平均年齡
install.packages("sqldf")
library(sqldf)
avgAge <- sqldf("select gender, avg(age) as avg_age
                from strawHatPirate
                group by gender")
View(avgAge)

# 分別使用`merge()`以及`sqldf()`建立新的資料框，為`strawHatPirate`新增一欄`devilFruit`，沒有吃惡魔果實的團員該欄以遺漏值顯示
# 使用merge()
strawHatMerged <- merge(x = strawHatPirate, y = strawHatDevilFruit, all.x = TRUE)
View(strawHatMerged)

# 使用sqldf()
strawHatJoined <- sqldf("select strawHatPirate.*, strawHatDevilFruit.devilFruit
                      from strawHatPirate 
                      left join strawHatDevilFruit
                        on strawHatPirate.crew=strawHatDevilFruit.crew")
View(strawHatJoined)
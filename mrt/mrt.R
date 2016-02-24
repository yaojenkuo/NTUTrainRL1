# Read in CSV
Sys.setlocale(category = "LC_ALL", locale = "cht")
dataMRT <- read.csv("c:/mrt/mrt2.csv", stringsAsFactors=FALSE)
# Separate date and numeric columns
date <- as.Date(dataMRT[, 1], "%Y/%m/%d")
number <- dataMRT[, -1]
# Create an empty list to insert vectors
result <- list()
# For loop
for(index in 1:ncol(number)){
  col <- number[, index]
  colNew <- gsub(',', '', col)# gsub every column
  colNum <- as.integer(colNew)# Transform into integer
  result[[index]] <- colNum# Insert into list
}
resultDF <- data.frame(result)# Transform into dataframe
# Assign column names
colnames(resultDF) <- c('松山機場','中山國中','南京復興','忠孝復興','大安','科技大樓','六張犁','麟光','辛亥','萬芳醫院','萬芳社區','木柵','動物園','大直','劍南路','西湖','港墘','文德','內湖','大湖公園','葫洲','東湖','南港軟體園區','南港展覽館','小碧潭','新店','新店區公所','七張','大坪林','景美','萬隆','公館','台電大樓','古亭','中正紀念堂','小南門','頂溪','永安市場','景安','南勢角','台大醫院','台北車站','中山','雙連','民權西路','圓山','劍潭','士林','芝山','明德','石牌','唭哩岸','奇岩','北投','新北投','復興崗','忠義','關渡','竹圍','紅樹林','淡水','頂埔','永寧','土城','海山','亞東醫院','府中','板橋','新埔','江子翠','龍山寺','西門','善導寺','忠孝新生','忠孝敦化','國父紀念館','市政府','永春','後山埤','昆陽','南港','象山','台北101/世貿','信義安和','大安森林公園','北門','松江南京','台北小巨蛋','南京三民','松山','輔大','新莊','頭前庄','先嗇宮','三重','菜寮','台北橋','大橋頭','中山國小','行天宮','東門','蘆洲','三民高中','徐匯中學','三和國中','三重國小','迴龍','丹鳳')
finalResult <- cbind(date, resultDF)# Final result
# Output
write.csv(finalResult, file="C:/mrt/finalResult.csv")
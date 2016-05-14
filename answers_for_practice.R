#cubeCalculate練習

cubeCalculate <- function(sideLength, volumeCal = 1){
  volume <- sideLength^3
  surface <- 6*(sideLength^2)
  totalSideLength <- 12*sideLength
  if (volumeCal==1){
    return(volume)
  } else if (volumeCal==2){
    return(surface)
  } else if (volumeCal==3){
    return(totalSideLength)
  }
}
cubeCalculate(3)#算體積3^3=27
cubeCalculate(3, 2)#算表面積(3^2)*6=54
cubeCalculate(3, 3)#算總邊長12*3=36

#Nested loop練習

x <- 1:15
nestMatrix <- matrix(x, nrow=3)#創造一個3X5的矩陣
for (j in 1:ncol(nestMatrix)){
  for (i in 1:nrow(nestMatrix)){
    print(paste("On row ", i, " and column ", j, " the element is ", nestMatrix[i, j]))
  }
}

# For Loop with next練習

x <- 1:100
for (i in 1:length(x)){
  if (x[i] %% 7 == 0){
    next
  }
  print(x[i])
}

# 利用`%>%`做到跟上一段程式一模一樣的事情

library(magrittr)
taipei %>% lapply(., FUN = class) %>% unlist

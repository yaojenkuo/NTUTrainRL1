# NTUTrainRL1
This is the lecture notes for NTU Train Course of R Project Lecture 1

## 開始使用R

### 工作目錄

```{r}
getwd()#get working directory取得目前工作目錄
setwd("c:/")#set working directory設定工作目錄至c:\
```

注意R使用的是"/"而不是"\"
或者我們可以使用RStudio的GUI設定工作目錄

![用GUI設定工作目錄](/screenshots/setwd.png)

### 套件

套件(Packages)是R語言非常重要且便利的應用，套件結合函式(Functions)與資料(data)。

```{r}
search()#查看現在已經載入可供使用的套件
install.packages("vcd")#下載名為vcd的套件
search()#還是看不到vcd套件
library(vcd)#啟動vcd套件
serch()#看到vcd套件了
```

套件只需要下載一次，但使用前需要放到library中，套件也有版本資訊

```{r}
installed.packages()#查看現在已經下載好的套件清單
update.packages()#更新所有下載好的套件
```

### 離開R

```{r}
q()#也可以使用quit()
```

&copy; Tony Yao-Jen Kuo 2015

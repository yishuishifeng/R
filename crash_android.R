library(xlsx)#引入xlsx包
path<-'D:/W/12.8/crash_12.8.xlsx'
CAdata<-read.xlsx(path,1)
CAdata<-CAdata[,-1:-2]
And_Version<-c('Android 8.0','Android 7.1','Android 7.0','Android 6.0','Android 5.1',
'Android 5.0','Android 4.4','Android 4.3','Android 4.2','Android 4.1','Android 4.0.3 - 4.0.4
','Android3.2')
Android8.0<-CAdata[which(CAdata$AndroidOSVersion==And_Version[1]),]
Android8.0<-Android8.0[,-1]
Android8.0<-apply(Android8.0,2,mean)
crash<-Android8.0
for(i in 2:length(And_Version)){
   a<-CAdata[which(CAdata$AndroidOSVersion==And_Version[i]),]
   a<-a[-1]
   a<-apply(a,2,mean)
   crash<-cbind(crash,a)
} 
crash<-t(crash)
And_Version<-as.data.frame(And_Version)
crash<-cbind(crash,And_Version)
write.xlsx(crash,'D:/W/12.8/crash_os12.8.xlsx',sheetName='1')#写入成xlsx格式


library(xlsx)#引入xlsx包
path<-'D:/W/12.8/ins_country_11.xlsx'#数据路径
data<-read.xlsx(path,2) #读取数据
data<-data[,-1:-2]#去除数据前两行
Cou<-c('IN','IQ','EG','SA','DZ','US','IL','NG','JO','TR','PK','KE',
'LY','AE','BR','BD','GB','ID','IT','MX','PE','CL','ZA','MM','GR','PR','MA')
IN<-data[which(data$Country==Cou[1]),]
IN<-IN[-1]
IN<-apply(IN,2,mean)
install<-IN
#从第二个国家开始循环
for (i in 2:length(Cou)){
  a<-data[which(data$Country==Cou[i]),]
  a<-a[-1]
  a<-apply(a,2,mean)
  install<-cbind(install,a)
}
install<-t(install)#转置数据
Cou<-as.data.frame(Cou)#将向量转为data.frame类型
install<-cbind(install,Cou)#合并数据
write.xlsx(install,'D:/w/12.8/ins_country_mean_11.xlsx')#写入成xlsx格式

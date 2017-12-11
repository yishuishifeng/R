library(xlsx)#����xlsx��
path<-'D:/W/12.8/ins_country_11.xlsx'#����·��
data<-read.xlsx(path,2) #��ȡ����
data<-data[,-1:-2]#ȥ������ǰ����
Cou<-c('IN','IQ','EG','SA','DZ','US','IL','NG','JO','TR','PK','KE',
'LY','AE','BR','BD','GB','ID','IT','MX','PE','CL','ZA','MM','GR','PR','MA')
IN<-data[which(data$Country==Cou[1]),]
IN<-IN[-1]
IN<-apply(IN,2,mean)
install<-IN
#�ӵڶ������ҿ�ʼѭ��
for (i in 2:length(Cou)){
  a<-data[which(data$Country==Cou[i]),]
  a<-a[-1]
  a<-apply(a,2,mean)
  install<-cbind(install,a)
}
install<-t(install)#ת������
Cou<-as.data.frame(Cou)#������תΪdata.frame����
install<-cbind(install,Cou)#�ϲ�����
write.xlsx(install,'D:/w/12.8/ins_country_mean_11.xlsx')#д���xlsx��ʽ
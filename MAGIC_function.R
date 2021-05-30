MAGIC = function(ax1,r0=0,####均值
			r01=0#####中位数

){


library(data.table)
library(MASS)

bx = matrix(NA,1,13)


try({
ax2 = ax1
re0 = cor(ax2$BETA.x, ax2$BETA.y)
vare1 = mean(ax2$SE.x^2)
vare2 = mean(ax2$SE.y^2)
if ((var(ax2$BETA.x)-vare1 <= 0) | (var(ax2$BETA.y)-vare2 <= 0))
{
re1 = re0
re2 = re0
}else {
re1 = (cov(ax2$BETA.x, ax2$BETA.y)-r0*sqrt(vare1*vare2))/sqrt((var(ax2$BETA.x)-vare1)*(var(ax2$BETA.y)-vare2))
re2 = (cov(ax2$BETA.x, ax2$BETA.y)-r01*sqrt(vare1*vare2))/sqrt((var(ax2$BETA.x)-vare1)*(var(ax2$BETA.y)-vare2))
}
if (re1>1) {re1 = re0}
if (re2>1) {re2 = re0}
bx[1,1:6] = c(dim(ax2)[1],re0,re1,re2,r0,r01)
})

m = dim(ax1)[1]
SS = 1000
bx0 = matrix(NA, SS, 3)

for (i in 1:SS)
{
try({
index = sample(1:m, m,replace=TRUE)
ax2 = ax1[index,]
re0 = cor(ax2$BETA.x, ax2$BETA.y)
vare1 = mean(ax2$SE.x^2)
vare2 = mean(ax2$SE.y^2)
if ((var(ax2$BETA.x)-vare1 <= 0) | (var(ax2$BETA.y)-vare2 <= 0))
{
re1 = re0
re2 = re0
}
else {
re1 = (cov(ax2$BETA.x, ax2$BETA.y)-r0*sqrt(vare1*vare2))/sqrt((var(ax2$BETA.x)-vare1)*(var(ax2$BETA.y)-vare2))
re2 = (cov(ax2$BETA.x, ax2$BETA.y)-r01*sqrt(vare1*vare2))/sqrt((var(ax2$BETA.x)-vare1)*(var(ax2$BETA.y)-vare2))
}
if (re1>1) {re1 = re0}
if (re2>1) {re2 = re0}
bx0[i,1:3] = c(re0,re1,re2)
})
}
bx0 = na.omit(bx0)
index1 = which((bx0[,1]<0) | (bx0[,2]<0) | (bx0[,3]<0))
if (length(index1) >0 ) bx0 = bx0[-index1,]
index1 = which((bx0[,1]>1) | (bx0[,2]>1) | (bx0[,3]>1))
if (length(index1) >0 ) bx0 = bx0[-index1,]
z0 = qnorm(mean(bx0[,2]<re1))
dx = bx0[,2] - mean(bx0[,2])
w = sum(dx^3)/(sum(dx^2)^1.5)/6
z1 = z0 + (z0+qnorm(0.025))/(1-w*(z0+qnorm(0.025)))
z2 = z0 + (z0+qnorm(0.975))/(1-w*(z0+qnorm(0.975)))
qx1 = function (x) {quantile(x[which((x>0) & (x<1))], probs = pnorm(z1), na.rm = TRUE)}
qx2 = function (x) {quantile(x[which((x>0) & (x<1))], probs = pnorm(z2), na.rm = TRUE)}
bx[1,7:8] = c(apply(bx0,2,qx1)[2],apply(bx0,2,qx2)[2])

qx1 = function (x) {quantile(x[which((x>0) & (x<1))], probs = 0.025, na.rm = TRUE)}
qx2 = function (x) {quantile(x[which((x>0) & (x<1))], probs = 0.975, na.rm = TRUE)}
bx[1,9:10] = c(apply(bx0,2,qx1)[2],apply(bx0,2,qx2)[2])
bx[1,11:13] = apply(bx0,2,sd)


colnames(bx)=c("m1","k","rg_mean","rg_median","r0_mean","r0_median","BCa1","BCa2","PB1","PB2","se_k","se_rg_mean","se_rg_median")


result=data.frame(round(bx,5))

return(list(rg=result))
}



#####删除median
MAGIC = function(ax1,r0=0
){
library(data.table)
library(MASS)
bx = matrix(NA,1,8)
try({
ax2 = ax1
re0 = cor(ax2$BETA.x, ax2$BETA.y)
vare1 = mean(ax2$SE.x^2)
vare2 = mean(ax2$SE.y^2)
if ((var(ax2$BETA.x)-vare1 <= 0) | (var(ax2$BETA.y)-vare2 <= 0))
{
re1 = re0
}else 
{
re1 = (cov(ax2$BETA.x, ax2$BETA.y)-r0*sqrt(vare1*vare2))/sqrt((var(ax2$BETA.x)-vare1)*(var(ax2$BETA.y)-vare2))
}
if (re1>1) {re1 = re0}
bx[1,1:4] = c(dim(ax2)[1],re0,re1,r0)
})

m = dim(ax1)[1]
SS = 1000
bx0 = matrix(NA, SS, 2)

for (i in 1:SS)
{
try({
index = sample(1:m, m,replace=TRUE)
ax2 = ax1[index,]
re0 = cor(ax2$BETA.x, ax2$BETA.y)
vare1 = mean(ax2$SE.x^2)
vare2 = mean(ax2$SE.y^2)
if ((var(ax2$BETA.x)-vare1 <= 0) | (var(ax2$BETA.y)-vare2 <= 0))
{
re1 = re0
}else 
{
re1 = (cov(ax2$BETA.x, ax2$BETA.y)-r0*sqrt(vare1*vare2))/sqrt((var(ax2$BETA.x)-vare1)*(var(ax2$BETA.y)-vare2))
}
if (re1>1) {re1 = re0}
bx0[i,1:2] = c(re0,re1)
})
}

qx1 = function (x) {quantile(x[which((x>0) & (x<1))], probs = 0.025, na.rm = TRUE)}
qx2 = function (x) {quantile(x[which((x>0) & (x<1))], probs = 0.975, na.rm = TRUE)}
bx[1,5:6] = c(apply(bx0,2,qx1)[2],apply(bx0,2,qx2)[2])
bx[1,7:8] = apply(bx0,2,sd)


colnames(bx)=c("m1","k","rg","r0","PB1","PB2","se_k","se_rg")


result=data.frame(round(bx,5))

return(list(rg=result))
}


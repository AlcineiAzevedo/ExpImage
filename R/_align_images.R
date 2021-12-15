# remove(list=ls())
# library(ExpImage)
# setwd("C:/Users/AlcineiAzevedo/Desktop/Alcinei/_R cran/CursoImagem")
# im1=read_image("Campo1.JPG",plot=T)
# im2=read_image("Campo2.JPG",plot=T)
#
# cor="red"
#
# plot_image(im1)
#
# n=dim(im1)[2]*.05
#
# x1=unlist(locator(n=1))
# points(x1[1],x1[2],col=cor)
# text(x1[1]+n,x1[2],label=1,col=cor)
#
# x2=unlist(locator(n=1))
# points(x2[1],x2[2],col=cor)
# text(x2[1]+n,x2[2],label=2,col=cor)
#
# x3=unlist(locator(n=1))
# points(x3[1],x3[2],col=cor)
# text(x3[1]+n,x3[2],label=3,col=cor)
#
# x4=unlist(locator(n=1))
# points(x4[1],x4[2],col=cor)
# text(x4[1]+n,x4[2],label=4,col=cor)
#
#
#
# plot_image(im2)
#
# y1=unlist(locator(n=1))
# points(y1[1],y1[2],col=cor)
# text(y1[1]+n,y1[2],label=1,col=cor)
#
# y2=unlist(locator(n=1))
# points(y2[1],y2[2],col=cor)
# text(y2[1]+n,y2[2],label=2,col=cor)
#
# y3=unlist(locator(n=1))
# points(y3[1],y3[2],col=cor)
# text(y3[1]+n,y3[2],label=3,col=cor)
#
# y4=unlist(locator(n=1))
# points(y4[1],y4[2],col=cor)
# text(y4[1]+n,y4[2],label=4,col=cor)
#
#
#
# coord.a <- x1
# coord.b <- x2
# coord<-as.data.frame(mapply(c, coord.a, coord.b))
# colnames(coord)<-c("x","y")
# lines(coord, col= "red")
# if((coord$y[1]>=coord$y[2])&(coord$x[2]>=coord$x[1])){theta = (atan2((coord$y[1] - coord$y[2]), (coord$x[2] - coord$x[1])))*(180/pi)}
# if((coord$y[2]>=coord$y[1])&(coord$x[2]>=coord$x[1])){theta = (atan2((coord$y[2] - coord$y[1]), (coord$x[2] - coord$x[1])))*(180/pi)}
# if((coord$y[1]>=coord$y[2])&(coord$x[1]>=coord$x[2])){theta = (atan2((coord$y[1] - coord$y[2]), (coord$x[1] - coord$x[2])))*(180/pi)}
# if((coord$y[2]>=coord$y[1])&(coord$x[1]>=coord$x[2])){theta = (atan2((coord$y[2] - coord$y[1]), (coord$x[1] - coord$x[2])))*(180/pi)}
#
# X=rbind(x1,x2,x3,x4)
# Y=rbind(y1,y2,y3,y4)
# im1copia=matrix(0,dim(im1)[1],dim(im1)[2])
# im1copia[X]=1
#
# im2copia=matrix(0,dim(im2)[1],dim(im2)[2])
# im2copia[Y]=1
#
#
# im1b=rotate_image(im1,angle = theta-90)
# im1copiab=rotate_image(im1copia,angle = theta-90)
#
# X=measure_image(im1copiab)$measures[,1:2]
#
# w=floor(min(X[,1])):ceiling(max(X[,1]))
# h=floor(min(X[,2])):ceiling(max(X[,2]))
# im1b=crop_image(im1b,w,h)
#
#
# plot(im2)
# coord.a <- y1
# coord.b <- y2
# coord<-as.data.frame(mapply(c, coord.a, coord.b))
# colnames(coord)<-c("x","y")
# lines(coord, col= "red")
# if((coord$y[1]>=coord$y[2])&(coord$x[2]>=coord$x[1])){theta = (atan2((coord$y[1] - coord$y[2]), (coord$x[2] - coord$x[1])))*(180/pi)}
# if((coord$y[2]>=coord$y[1])&(coord$x[2]>=coord$x[1])){theta = (atan2((coord$y[2] - coord$y[1]), (coord$x[2] - coord$x[1])))*(180/pi)}
# if((coord$y[1]>=coord$y[2])&(coord$x[1]>=coord$x[2])){theta = (atan2((coord$y[1] - coord$y[2]), (coord$x[1] - coord$x[2])))*(180/pi)}
# if((coord$y[2]>=coord$y[1])&(coord$x[1]>=coord$x[2])){theta = (atan2((coord$y[2] - coord$y[1]), (coord$x[1] - coord$x[2])))*(180/pi)}
#
#
# im2b=rotate_image(im2,angle = theta-90)
# im2copiab=rotate_image(im2copia,angle = theta-90)
#
# X=measure_image(im2copiab)$measures[,1:2]
#
# w=floor(min(X[,1])):ceiling(max(X[,1]))
# h=floor(min(X[,2])):ceiling(max(X[,2]))
# im2b=crop_image(im2b,w,h)
#
#

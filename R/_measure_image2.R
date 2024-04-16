measure_image2=function(object,reference,cropImage=FALSE,im=NULL,noise1=noise,plot=F,noise2=NULL,name=NULL){
  m2=reference
  im1=im
  m=reference
  if(is.null(noise2))noise2=noise1

  meas=measure_image(m2,noise=noise1,plot=F)

  x=meas$measures[,1]
  y=meas$measures[,2]
  area=meas$measures[,3]
  area2=area

  #    plot_image(m2)

  model1=lm(area2~+x+y)
  summary(model1)

  model2=lm(area2~+x+y+x:y)
  summary(model2)


  X=rep(1:nrow(m),ncol(m))
  Y=rep(1:ncol(m),each=nrow(m))
  pred=predict(object = model2,newdata=data.frame(x=X,y=Y))
  MAT=pred
  MAT=1/((matrix(pred,ncol=ncol(m)))/mean(area))

  # plot_image(MAT,col=1)

  MATb=m2*MAT

  noise=noise1
  MATref=EBImage::watershed(EBImage::distmap(m2))
  measb=measure_image(m2,splitConnected = T,plot=F)$measures
  id=rownames(measb)[measb[,3]>noise]

  Area=NULL
  m2r=(MATref==as.numeric(id[1]))*0
  for(i in 1:length(id)){

    a=MATref==as.numeric(id[i])
    Area=c(Area,sum(MATb[a@.Data]))
    m2r[MATref==as.numeric(id[i])]=i
  }
  MeasuresReference=cbind(CoordX=x,CoordY=y,Area=area,AreaCorr=Area)

  # plot_meansures(im1,coordx = x,coordy = y,text = round(area,2))
  # plot_meansures(im1,coordx = x,coordy = y,text = round(Area,2))

  if(cropImage==TRUE){im1B=crop_image(object,segmentation = m2r!=0,plot=F)}
  if(cropImage==FALSE){im1B=object}
  if(cropImage==TRUE){MATB=crop_image(MAT,segmentation = m2r!=0,plot=F)}
  if(cropImage==FALSE){MATB=MAT}
  #m2B=segmentation((m),treshold = 0.000001,selectHigher = T,plot=F,fillHull = T,fillBack = F)
  noise=noise2
  meas=measure_image(im1B,noise=noise,plot=F)
  meas$ObjectNumber
  x=meas$measures[,1]
  y=meas$measures[,2]
  area=meas$measures[,3]
  MAT2b=im1B*MATB

  #  plot_image(MATB,col=3)
  m2B=im1B
  MATref=EBImage::watershed(EBImage::distmap(m2B))
  measb=measure_image(m2B,splitConnected = T,noise = noise,plot=F)$measures
  measb
  id=rownames(measb)[measb[,3]>noise]

  Area=NULL
  for(i in 1:length(id)){
    a=MATref==as.numeric(id[i])
    Area=c(Area,sum(MAT2b[a@.Data]))

  }
  MeasuresObject=cbind(CoordX=x,CoordY=y,Area=area,AreaCorr=Area)
  # plot_meansures(m2B,coordx = x,coordy = y,text = round(area,2))
  # plot_meansures(m2B,coordx = x,coordy = y,text = round(Area,2))

  MEASURES=rbind(MeasuresReference,  MeasuresObject)
  MEASURES=data.frame(MEASURES)

  if(plot==1) {
    im1b=mask_pixels(im1,object,plot=F,Contour = T,col="green")
    im1c=mask_pixels(im1b,reference,plot=F,Contour = T,col="green")

    jpeg(paste0("Real_",names[ii]),quality =90)
    plot_meansures(im1c,coordx = MEASURES$CoordX,coordy = MEASURES$CoordY,
                   text = round(MEASURES$Area,2),col = "blue" )
    dev.off()



    jpeg(paste0("wCorr_",names[ii]),quality =90 )
    plot_meansures(im1c,coordx = MEASURES$CoordX,coordy = MEASURES$CoordY,
    text = round(MEASURES$AreaCorr,2),col = "blue",cex = 0.8 )
    dev.off()

    }


  return(list(MeasuresReference=MeasuresReference,MeasuresObject=MeasuresObject))
}


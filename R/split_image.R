#' Esta funcao divide a imagem em varias outras de acordo com as imagens que
#' contem
#'
#' @description Esta funcao permite dividir a imagem e obter medidas dos objetos
#' @usage split_image(im,Seg,noise=0,CutImage=T,lim=10,tolerance=0,
#'   colorBack=c(0,0,0) ,ext=1,saveImage=T,
#'   plot=T,col="red",cex=1,fileName="test.jpg")
#'
#' @param im    :Este objeto deve conter uma imagem no formato do EBImage.
#' @param Seg    : Este objeto deve ser obrigatoriamente uma matriz binaria,
#'   contendo os valores 0 (pixels do background) ou 1 (pixels do foreground)).
#' @param noise    :E o numero de pixeis a partir do qual a funcao nao
#'   considerara como ruido.
#' @param CutImage    : Se TRUE a imagem ao ser dividida ser cortada, englobando
#'   apenas o objeto de interesse
#' @param lim    : Indica  numero de pixels que sera acrescentada nas bordas da
#'   imagem cortada
#' @param tolerance    : The minimum height of the object in the units of image
#'   intensity between its highest point (seed) and the point where it contacts
#'   another object (checked for every contact pixel). If the height is smaller
#'   than the tolerance, the object will be combined with one of its neighbors,
#'   which is the highest. Tolerance should be chosen according to the range of
#'   x. Default value is 1, which is a reasonable value if x comes from distmap.
#' @param colorBack    : Deve ser um vetor com tres valores variando entre 0 a
#'   1. Estes valores indicam reespectivamente os valores de r, g e b que
#'   substituirao os pixels indesejados nas imagens divididas.
#' @param ext    :Radius of the neighborhood in pixels for the detection of
#'   neighboring objects. Higher value smoothes out small objects.
#' @param saveImage    :Se for TRUE serao salvas as imagens dividas.
#' @param plot    :Indica se sera apresentada (TRUE) ou nao (FALSE) (default) a
#'   imagem segmentada
#' @param col    :Indica a cor do numero sobreposto sobre a imagem segmentada
#'  @param cex    :Indica o tamanho do numero sobrepsosto sobre a imagem segmentada
#' @param fileName    :endereco e/ou nome do arquivo a ser salvo com extensao .jpg

#' @author Alcinei Mistico Azevedo (Instituto de ciencias agrarias da UFMG)
#' @return Retorna a medida em pixels dos objetos contidos na imagem e varias fotos
#' havendo em cada uma um objeto.
#' @seealso  \code{\link{segmentation_logit}}

#' @examples
#'\dontrun{
#'#remove(list=ls())
#'#require(ExpImage)
#'#require(EBImage)
#'im=readImage(example_image(3))
#'##mostrar imagem
#'plot(im)
#'
#'g=gray_scale(im,"g",plot=T)
#'Seg=segmentation(img.band = g,treshold = "otsu",selectHigher = F,
#'fillHull = T,plot = T)
#'
#'split_image(im=im,Seg=Seg,noise = 200,CutImage = F,tolerance = 1,
#'saveImage = F,plot = T,col="blue",cex=2)
#'}




split_image=function(im,Seg,noise=0,CutImage=T,lim=10,tolerance=0,
                     colorBack=c(0,0,0) ,ext=1,saveImage=T,
                     plot=T,col="red",cex=1,
                     fileName="test.jpg"){
  r=colorBack[1]
  g=colorBack[2]
  b=colorBack[3]
  SepSeg=watershed(Seg, tolerance=tolerance, ext=ext)
  a=0
  implot=im
  RES=NULL
  IIM=NULL
  SegplotR=SegplotG=SegplotB=SepSeg*0
  for(j in 2:length(unique(c(SepSeg)))){
    i=unique(c(SepSeg))[j]
    if((sum(SepSeg==i)<=noise)){print(sum(SepSeg==i))}
    if(sum(SepSeg==i)>noise){
      #print(sum(SepSeg==i))
      a=a+1
      imsep=extract_pixels(im,SepSeg==i,plot = F,valueSelect = c(r,g,b))
      if(saveImage==T){
        if(CutImage==F){writeImage(imsep,file=paste(a,fileName,sep="_"))}
        if(CutImage==T){
          seg=(SepSeg==i)*1


          idl=rowSums(seg)
          nl=length(idl)
          idl[(round(lim/2,0)+1):(nl-round(lim/2,0))]=idl[(lim+1):nl]+idl[1:(nl-lim)]

          idc=colSums(seg)!=0
          idc[(round(lim/2,0)+1):(nl-round(lim/2,0))]=idc[(lim+1):nl]+idc[1:(nl-lim)]
          imsep2=imsep
          imsep2@.Data=imsep@.Data[idl!=0,idc!=0,]



          writeImage(imsep2,file=paste(a,fileName,sep="_"))
        }
      }





      res=measure_image(SepSeg==i )
      RES=rbind(RES,(res$measures))

      SegplotR[SepSeg==i]=runif(1,0,1)
      SegplotG[SepSeg==i]=runif(1,0,1)
      SegplotB[SepSeg==i]=runif(1,0,1)
    }


  }

  implot@.Data[,,1]=SegplotR
  implot@.Data[,,2]=SegplotG
  implot@.Data[,,3]=SegplotB

  colnames(RES)= c( "m.cx"    ,  "m.cy" ,"s.area" ,"s.perimeter", "s.radius.mean" ,
                    "s.radius.sd", "s.radius.min", "s.radius.max","m.majoraxis",
                    "m.eccentricity"," m.theta")
  RES=RES[RES[,3]>noise,]
  print(noise)

  rownames(RES)=1:nrow(RES)


  if(plot==T){
    plot(implot)
    text(RES[,1],RES[,2],1:nrow(RES),cex=cex,col=col)
  }

  return(RES)
}
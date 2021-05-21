#'Funcao serve para excluir em uma imagem os pixels correspondente ao background
#'ou foreground
#'
#'@description Esta funcao permite criar uma imagem excluindo os pixels
#'  correspondente ao background ou foreground
#'@usage
#'extract_pixels(im,target,valueTarget=T,valueSelect=c(r=1,g=1,b=1),plot=F)
#'@param im    :Este objeto deve conter uma imagem no formato do EBImage.
#'@param target    : Este objeto deve ser obrigatoriamente uma matriz binaria,
#'  contendo os valores 0 (pixels do background) ou 1 (pixels do foreground)).

#' @param valueTarget    :Deve receber o valor 0 ou 1 a depender do que sera
#'   extraido da imagem (background ou foreground).
#' @param valueSelect    :Deve ser um vetor com tres valores variando entre 0 a
#'   1. Estes valores indicam reespectivamente os valores de r, g e b que
#'   substituirao os pixels indesejados na imagem.
#' @param plot    :Indica se sera apresentada (TRUE) ou nao (FALSE) (default) a
#'   imagem segmentada.

#' @return Retorna uma imagem com a cor indicada na variavel valueSelect sobre
#'   os pixels indesejaveis.
#' @seealso  \code{\link{segmentation_logit}}

#' @examples
#'\dontrun{
#'###########################################################################
#'#Estimar a area atacada por doenca no tomateiro
#'###########################################################################
#'
#'   im=readImage(example_image(ex=7))
#'   plot(im)
#'
#'   #Selecionando o melhor indice para a segmentacao da folha
#'   r=gray_scale(im,method = "r",plot=T)
#'   g=gray_scale(im,method = "g",plot=T)
#'   b=gray_scale(im,method = "b",plot=T)
#'
#'   #O limiar pode ser um valor escolhido aleatoriamente
#'   MatrizSegentada=segmentation(b,treshold = 0.5,fillHull = F)
#'   display(MatrizSegentada)

#'   #O limiar tambem pode ser estabelecido pelo metodo de otsu
#'   MatrizSegentada2=segmentation(b,treshold = "otsu",fillHull = T,selectHigher
#'   = F) display(MatrizSegentada2)
#'
#'   #Selecionar na imagem apenas os pixeis desejaveis (Folha)
#'   im2=extract_pixels(im,target=MatrizSegentada2,valueTarget=T,valueSelect=c(r=1,g=1,b=1),plot=T)
#'
#'   #####################################################################
#'   #####################################################################
#'   #Selecionando o melhor indice para a segmentacao da doenca
#'   r=gray_scale(im2,method = "r",plot=T) g=gray_scale(im2,method = "g",plot=T)
#'   b=gray_scale(im2,method = "b",plot=T)
#'
#'   MatrizSegmentada3=segmentation(g,treshold = 0.3,selectHigher = F,fillHull =
#'   T) display(MatrizSegmentada3)
#'
#'   #Como pode-se obsevar, a segmentacao por limiar nao e possivel. Entao vamos
#'   usar paletas de cores folha=readImage(example_image(ex=8))
#'   doenca=readImage(example_image(ex=9))
#'
#'   DoencaSeg=segmentation_logit(im,foreground = doenca,background =
#'   folha,sample = 2000,fillHull = TRUE,TargetPixels =MatrizSegentada2==1
#'   ,plot=T)
#'
#'   im3=mask_pixels(im2,TargetPixels=DoencaSeg==1) plot(im3)
#'
#'   ii=join_image(im,im3,plot=T)
#'
#'
#'   #Porcentagem da area lesionada.
#'
#'   100*(sum(DoencaSeg)/sum(MatrizSegentada2)) }




extract_pixels=function(im,target,valueTarget=T,valueSelect=c(r=1,g=1,b=1),plot=F){
  id=target!=valueTarget

  r=im@.Data[,,1]
  g=im@.Data[,,2]
  b=im@.Data[,,3]

  r[id]=valueSelect[1]
  g[id]=valueSelect[2]
  b[id]=valueSelect[3]

  im@.Data[,,1]=r
  im@.Data[,,2]=g
  im@.Data[,,3]=b

  if(plot==T){plot(im)}
  return(im)
}

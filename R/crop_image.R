#'Esta funcao corta a imagem retirando as laterais nao desejadas.
#'@description Esta funcao permite cortar a imagem.
#'@usage crop_image(im,w,h,plot=TRUE)
#'@param im    :Este objeto deve conter uma imagem no formato do EBImage.
#'@param w    : Deve ser um vetor contendo os numeros das colunas que
#'  permanecerao na imagem.
#'@param h    : Deve ser um vetor contendo os numeros das linhas que
#'  permanecerao na imagem.
#'@param plot    :Indica se sera apresentada (TRUE) ou nao (FALSE) (default) a
#'  imagem segmentada.
#'@author Alcinei Mistico Azevedo (Instituto de ciencias agrarias da UFMG)
#'@return Retorna uma imagem cortada, apresentando apenas os  pixels
#'  selecionados.
#'@seealso  \code{\link{segmentation_logit}}
#'@import EBImage
#'@importFrom stats binomial glm predict
#'@importFrom grDevices dev.off  jpeg
#' @examples
#'\dontrun{
#'library(ExpImage.pt)
#'library(EBImage)
#'#Carregar imagem de exemplo
#'im=readImage(example_image(1))
#'##mostrar imagem
#'plot(im)
#'
#'
#'##Diminuir a resolucao (tamanho da imagem)
#'im2=resize_image(im,w=1000,plot=T)
#'
#'##Cortar Imagem
#'im3=crop_image(im2,w =200:750,h=100:650,plot = T)
#'
#'##Aumentar brilho
#'im4=edit_image(im3,brightness = 0.1)
#'
#'#Aumentar contraste
#'im5=edit_image(im4,contrast = 1.2)
#'
#'#Aumentar gamma
#'im6=edit_image(im5,gamma  = 1.1)
#'
#'
#'#Alterando brilho, contraste e gamma
#'imb=edit_image(im3,brightness = 0.1,contrast = 1.7,gamma  = 1.2)
#'
#'#Mostrando ambas as imagens simultaneamente.
#'im4=join_image(im3,imb)
#'}


#'




crop_image=function(im,w,h,plot=TRUE){
  if(is.Image(im)){im@.Data=im@.Data[w,h,]}
  if(is.matrix(im)){im=im[w,h]}

  if(plot==T){
    if(is.Image(im)){plot(im)}
    if(is.matrix(im)){display(im)}

  }
  return(im)
}

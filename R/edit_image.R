#' sta funcao permite mudar o brilho, contraste e fazer um ajuste gamma na
#' imagem.
#'
#' @description Esta funcao permite mudar o brilho, contraste e fazer um ajuste
#'   gamma na imagem.
#' @usage edit_image(im,brightness=0,contrast=1,gamma =1,plot=T)

#' @param im    :Este objeto deve conter uma imagem no formato do EBImage.
#' @param brightness    : valor numerico entre -1 e 1 correspondente a alteracao
#'   desejada para o brilho.
#' @param contrast    : valor numerico  correspondente a alteracao desejada para
#'   o contraste.
#' @param gamma    : valor numerico entre -1 e 1 correspondente a alteracao
#'   desejada para o ajuste gamma
#' @author Alcinei Mistico Azevedo (Instituto de ciencias agrarias da UFMG)


#' @param plot    :Indica se sera apresentada (TRUE) ou nao (FALSE) (default) a
#'   imagem editada

#' @return Retorna uma imagem cortada, apresentando apenas os  pixels
#'   selecionados.
#' @seealso  \code{\link{segmentation_logit}}

#' @examples
#'\dontrun{
#'
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




edit_image=function(im,brightness=0,contrast=1,gamma =1,plot=T){
  if(is.Image(im)){
    im@.Data=im@.Data+brightness
    im@.Data=im@.Data*contrast
    im@.Data=im@.Data^gamma
    if(plot==T){plot(im)}
  }

  if(is.matrix(im)){
    im=im+brightness
    im=im*contrast
    im=im^gamma
    if(plot==T){display(im)}
  }

  return(im)
}

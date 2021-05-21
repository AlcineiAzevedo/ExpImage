#' untar imagens
#'
#' @description Esta funcao junta imagens colocando uma do lado da outra.
#' @usage join_image(im1,im2,im3,im4,im5,plot=T)

#' @param im1    :Objeto contendo um array ou imagem no formato do EBImage.
#' @param im2    :Objeto contendo um array ou imagem no formato do EBImage.
#' @param im3    :Objeto contendo um array ou imagem no formato do EBImage. Se
#'   nao tiver tantas imagens use a palavra "NULL" (default).
#' @param im4    :Objeto contendo um array ou imagem no formato do EBImage.Se
#'   nao tiver tantas imagens use a palavra "NULL" (default).
#' @param im5    :Objeto contendo um array ou imagem no formato do EBImage.Se
#'   nao tiver tantas imagens use a palavra "NULL" (default).
#' @param plot    :Indica se sera apresentada (TRUE) ou nao (FALSE) (default) a
#'   imagem segmentada.

#' @return Retorna a uniao de varias imagens.
#' @seealso  \code{\link{crop_image}}, \code{\link{edit_image}}
#' @author Alcinei Mistico Azevedo (Instituto de ciencias agrarias da UFMG)

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




join_image=function(im1=NULL,im2=NULL,im3=NULL,im4=NULL,im5=NULL,plot=T){
  im=combine(im1,im2,im3,im4,im5)
  if(plot==T){plot(im, all=T)}
  return(im)
}

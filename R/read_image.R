#'Funcao permite abrir uma imagem.
#'
#' @description Esta função abre uma imagem.
#' @usage read_image(file,plot=F)

#' @param file    :Nome do arquivo ou endereco da imagem.
#' @param plot    :Indica se sera apresentada (TRUE) ou nao (FALSE) (default) a
#'   imagem editada
#' @author Alcinei Mistico Azevedo (Instituto de ciencias agrarias da UFMG)

#' @return Abre uma imagem.
#' @seealso  \code{\link{crop_image}} , \code{\link{edit_image}}

#' @examples
#'\dontrun{
#'#Carregar imagem de exemplo
#'im=read_image(example_image(1),plot=T)
#'}



read_image=function(file,plot=F){
  im2=readImage(file)
if(plot==T){plot(im2)}
  return(im2)
}

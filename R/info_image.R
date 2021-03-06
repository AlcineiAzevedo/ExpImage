#' Image information  (Informacoes sobre as imagens).
#'
#' @description This function returns information about the image
#' (Esta funcao retorna informacoes sobre a imagem).
#' @usage info_image(im)

#' @param im    :Object containing an image (Objeto contendo a uma imagem).

#' @author Alcinei Mistico Azevedo (Instituto de ciencias agrarias da UFMG)

#' @return Importa uma imagem.
#' @seealso  \code{\link{crop_image}} , \code{\link{edit_image}}

#' @examples
# \donttest{
#'#Carregar imagem de exemplo
#'im=read_image(example_image(1),plot=TRUE)
#}
#'@export

info_image=function(im){
Class=c(class(im))
Length=dim(im)
Mode=mode(im)
Size=c(utils::object.size(im)/1024^2)
names(Size)="MB"

list(Class=Class,Length=Length,Mode=Mode,SizeMemory=Size)
}


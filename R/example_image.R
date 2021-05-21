#' anco de imagens utilizadas como exemplo.
#'
#' @description Apresenta endereco de imagens utilizadas no arquivo de exemplo.
#' @usage example_image(ex)

#' @param ex    :numero do exemplo.
#' @return Retorna o endereco das imagens de exempo.

#' @examples
#' \dontrun{
#' example_image(1)
#' example_image(2)
#'}
example_image <- function(ex) {
  if(ex==1){return(paste(system.file(package ="ExpImage" ),"images","feijao.jpg",sep="/"))}
  if(ex==2){return(paste(system.file(package ="ExpImage" ),"images","Ovos1.jpg",sep="/"))}
  if(ex==3){return(paste(system.file(package ="ExpImage" ),"images","imagem.jpg",sep="/"))}
  if(ex==4){return(paste(system.file(package ="ExpImage" ),"images","fundo.jpg",sep="/"))}
  if(ex==5){return(paste(system.file(package ="ExpImage" ),"images","folhas.jpg",sep="/"))}
  if(ex==6){return(paste(system.file(package ="ExpImage" ),"images","Referencia.jpg",sep="/"))}
  if(ex==7){return(paste(system.file(package ="ExpImage" ),"images","FolhaTomate.jpg",sep="/"))}
  if(ex==8){return(paste(system.file(package ="ExpImage" ),"images","TomateFolha.jpg",sep="/"))}
  if(ex==9){return(paste(system.file(package ="ExpImage" ),"images","TomateDoenca.jpg",sep="/"))}
}





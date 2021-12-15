##. Function to plot multiple indices (funcao para plotar varios indices)
##.
##. @description Function to plot multiple indices (funcao para plotar varios
##.  indices).
##. @usage shape_line(im,n=30,Matrix=NULL,pch=1,col="red",cex=2)
##. @param im    :This object must contain an image in EBImage format (Este
##.   objeto deve conter uma imagem no formato do EBImage).
##. @param n Numero de individuos contidos na linha
##. (Number of individuals contained in the line ).
##. @param Matrix Objeto criado pela propria funcao `shape_file` anteriormente
##. (Object created by `shape_file` function earlier).
##. @param pch Valor numerico indicando o simbolo a ser utilizado
##. (Numeric value indicating the symbol to be used ).
##. @param col Cor dos simbolos a serem plotados (Color of symbols to be plotted).
##. @param cex Tamanho do simbolo que sera plotado (Size of the symbol that will
##.  be plotted ).
##. @seealso  \code{\link{segmentation}}
##. @importFrom graphics par



##.@export


shape_line=function(im,n=30,Matrix=NULL,pch=1,col="red",cex=2){

  plot_image(im)

  if(isFALSE(is.null(Matrix))){
    points(Matrix[,3],Matrix[,4],pch=pch,col=col,cex=cex)

  }

  stop=FALSE
  while(stop==FALSE){

  a <- unlist(locator(type="p",n = 1, col="red",pch=19))
  b <- unlist(locator(type="p",n = 1, col="red",pch=19))

  d=seq(0,sqrt(sum((a-b)^2)),l=n)

  B=(b[2]-a[2])/(b[1]-a[1])

  mat=cbind(seq(a[1],b[1],l=n),a[2]+B*(seq(a[1],b[1],l=n)-a[1]))
  mat=cbind(1,1:nrow(mat),mat,sqrt((a[1]-mat[,1])^2+(a[2]-mat[,2])^2))

  coord=t(sapply(1:n,function(i) mat[abs(mat[,5]-d[i])==min(abs(mat[,5]-d[i])),3:4]))

  points(coord[,1],coord[,2],pch=pch,col=col,cex=cex)

  colnames(mat)=c("Line","Point","x","y","Distance")
# print(n)

  if(isFALSE(is.null(Matrix))){
    mat[,2]=mat[,2]+max(Matrix[,2])

    mat=rbind(Matrix,mat)
  }
  Matrix=mat

  bk=readline(prompt = " Deseja selecionar mais um shape_line (Do you want to select one more shape_line)? y/n ")
  if(sum((bk!="y"),(bk!="n"))==2){
    while(sum((bk!="y"),(bk!="n"))==2){
      message("A resposta deve ser 'y' ou 'n' (The answer must be 'y' or 'n' ).")
      bk=readline(prompt = " Deseja selecionar mais um shape_line (Do you want to select one more shape_line)? y/n ")
    }

  }

  if(bk=="n"){stop=TRUE}



  }

  return(Matrix)
}











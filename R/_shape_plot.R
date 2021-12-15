##, Function to plot multiple indices (funcao para plotar varios indices)
##,
##, @description Function to plot multiple indices (funcao para plotar varios
##,  indices).
##, @usage shape_plot(im,n=30,direction="min",Matrix=NULL)
##, @param im    :This object must contain an image in EBImage format (Este
##,   objeto deve conter uma imagem no formato do EBImage).
##, @param n Numero de parcelas contidos na linha
##, (Number of plots contained in the line ).
##, @param direction Argumento indicando o sentido que as parcelas serao divididas:\cr
##, 'min': indica que as parcelas sao perpendicular a menor lateral.
##, 'max': indica que as parcelas sao perpendicular a maior lateral.

##, @param Matrix Objeto criado anteriormente com o grid
##, (Object created earlier with the grid.).
##, @seealso  \code{\link{segmentation}}
##, @importFrom graphics par



##,@export


shape_plot=function(im,n=30,direction="min",Matrix=NULL){
  plot_image(im)

  if(isFALSE(is.null(Matrix))){
    points(Matrix[,3],Matrix[,4],col="red")

  }

  stop=FALSE
  n=n+1

  while(stop==FALSE){


    pa <- unlist(locator(type="p",n = 1, col="red",pch=19))
    pb <- unlist(locator(type="p",n = 1, col="red",pch=19))
    lines(rbind(pa,pb), col=col)
    pc <- unlist(locator(type="p",n = 1, col="red",pch=19))
    lines(rbind(pb,pc), col=col)
    pd <- unlist(locator(type="p",n = 1, col="red",pch=19))
    lines(rbind(pc,pd), col=col)
    lines(rbind(pd,pa), col=col)



    D=rbind(pa,pb,pc,pd)
    Dist=as.matrix(dist(D))
    diag(Dist)=NA
    Min=min(Dist,na.rm = T)
    if(direction=="min"){
      if(Min==Dist[1,2]){V1=rbind(pa,pd);V2=rbind(pb,pc)}
      if(Min==Dist[2,3]){V1=rbind(pa,pb);V2=rbind(pd,pc)}
      if(Min==Dist[3,4]){V1=rbind(pb,pc);V2=rbind(pa,pd)}
      if(Min==Dist[4,1]){V1=rbind(pc,pd);V2=rbind(pb,pa)}
    }


    if(direction=="max"){
      if(Min==Dist[1,2]){V1=rbind(pa,pb);V2=rbind(pd,pc)}
      if(Min==Dist[2,3]){V1=rbind(pb,pc);V2=rbind(pa,pd)}
      if(Min==Dist[3,4]){V1=rbind(pc,pd);V2=rbind(pb,pa)}
      if(Min==Dist[4,1]){V1=rbind(pd,pa);V2=rbind(pb,pc)}
    }


    a=V1[1,]
    b=V1[2,]
    d=seq(0,sqrt(sum((a-b)^2)),l=n)

    B=(b[2]-a[2])/(b[1]-a[1])

    mat=cbind(seq(a[1],b[1],l=n),a[2]+B*(seq(a[1],b[1],l=n)-a[1]))
    mat=cbind(1,1:nrow(mat),mat,sqrt((a[1]-mat[,1])^2+(a[2]-mat[,2])^2))

    coord=t(sapply(1:n,function(i) mat[abs(mat[,5]-d[i])==min(abs(mat[,5]-d[i])),3:4]))

    CC1=cbind(coord[,1],coord[,2])
    #############################################

    a=V2[1,]
    b=V2[2,]
    d=seq(0,sqrt(sum((a-b)^2)),l=n)

    B=(b[2]-a[2])/(b[1]-a[1])

    mat=cbind(seq(a[1],b[1],l=n),a[2]+B*(seq(a[1],b[1],l=n)-a[1]))
    mat=cbind(1,1:nrow(mat),mat,sqrt((a[1]-mat[,1])^2+(a[2]-mat[,2])^2))

    coord=t(sapply(1:n,function(i) mat[abs(mat[,5]-d[i])==min(abs(mat[,5]-d[i])),3:4]))

    CC2=cbind(coord[,1],coord[,2])

    sapply(1:n, function(i) lines(rbind(CC1[i,],CC2[i,]),col=col))



    colnames(mat)=c("Line","Point","x","y","Distance")
    #print(n)

    if(isFALSE(is.null(Matrix))){
      mat[,1]=mat[,1]+max(Matrix[,1])
      mat[,2]=mat[,2]+max(Matrix[,2])

      mat=rbind(Matrix,mat)
    }
    Matrix=mat

    bk=readline(prompt = " Deseja selecionar mais um shape_plot (y/n)? \n Do you want to select one more plot (y/n)? ")
    if(sum((bk!="y"),(bk!="n"))==2){
      while(sum((bk!="y"),(bk!="n"))==2){
        message(" A resposta deve ser 'y' ou 'n'. \n The answer must be 'y' or 'n'.")
        bk=readline(prompt = " Deseja selecionar mais um shape_plot (y/n)?  \n Do you want to select one more plot (y/n)? ")
      }

    }

    if(bk=="n"){stop=TRUE}



  }





  return(Matrix)
}











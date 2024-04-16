
#######################################
diamond=function(n,c){
  m=matrix(0,n,n)
  a=ceiling(n/2)

  x=-1
  for(i in 1:a){
    x=x+1
    m[(a-x):(a+x),i]=1

  }
  m[,(a+1):n]=m[,((a-1):1)]

  for(i in 1:c){
    m=cbind(0,m,0)
    m=rbind(0,m,0)
  }
  m

}

#f = makeBrush(2, shape='diamond', step=FALSE)

#######################################
lozenge=function(n,c){
  m=matrix(0,n,n)
  a=ceiling(n/2)


 D=diag(a)
  D2=rbind(D[a:1,],D)
  m=cbind(D2,D2[,a:1])


  for(i in 1:c){
    m=cbind(0,m,0)
    m=rbind(0,m,0)
  }
  m

}

#######################################
parenthesesRight=function(n,c){
  m=matrix(0,n,n)
  a=floor(n/2)


  D=diag(a)
  m=rbind(D[a:1,],D)

  for(i in 1:c){
    m=cbind(0,m,0)
    m=rbind(0,m,0)
  }

  m


}

#######################################
parenthesesAbove=function(n,c){
  t(parenthesesRight(n,c))
}

#######################################
parenthesesBelow=function(n,c){
  m=t(parenthesesRight(n,c))
nn=nrow(m)

m[nn:1,]
}

#######################################
parenthesesLeft=function(n,c){
  m=t(parenthesesRight(n,c))
  nn=ncol(m)

  m[,nn:1]
}




# diamond(5,2)
# lozenge(5,2)
# parenthesesAbove(8,2)
# parenthesesBelow(8,2)
# parenthesesRight(8,2)
# parenthesesLeft(8,2)

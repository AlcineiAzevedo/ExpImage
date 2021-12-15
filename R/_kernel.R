
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
f = makeBrush(2, shape='diamond', step=FALSE)

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

parenthesesV=function(n,c){
  m=matrix(0,n,n)
  a=ceiling(n/2)


  D=diag(a)
  D2=rbind(D[a:1,],D)
  m=cbind(D2,D2[,a:1])

  m[,(a-round(a/3,0)):(a+round(a/3,0))]=0

  for(i in 1:c){
    m=cbind(0,m,0)
    m=rbind(0,m,0)
  }

  m


}

parenthesesH=function(n,c){
  m=matrix(0,n,n)
  a=ceiling(n/2)


  D=diag(a)
  D2=rbind(D[a:1,],D)
  m=cbind(D2,D2[,a:1])

  m[(a-round(a/3,0)):(a+round(a/3,0)),]=0

  for(i in 1:c){
    m=cbind(0,m,0)
    m=rbind(0,m,0)
  }

  m


}

x<-1
class(x)
city<-"Bangalore"
class(city)
score<-100.4
class(score)

is_na=T
is_null=F
class(is_na)
class(is_null)

#Vectors
ages<-c(50,30,40,20,11)

ages
class(ages)
cities=c("BN","CH","MUM",10)
cities

length(ages)

##Subsetting Vectors
ages[1]
ages[length(ages)]

cities<-c("Bangalore","Cohi","Mumbai","Chennai")

for(i in 1:length(cities)){
  print (cities[i])
}
#sequence
seq(1,10)
cities<-c("Bangalore","Cohi","Mumbai","Chennai")
population<-c(100,400,400,500)

for (i in seq(1,4)){
  print (i)
  print(cities[i])
  print(population[i])
  print("---------")  
}
avg<-function(x){
i=0
p_s=0
for (p in population){
 
  p_s=p+p_s
  
  i=i+1
  
}
print(p_s/i)
  
}

# List

emp<-list(first_name="manojit",age=29,technologies=c("construction","R","Python"))
class(emp)

emp$age
emp$technologies[1]
labels(emp)
dim(emp)
length(emp)


reviews<-read.csv("datasets/narendramodi_tweets.csv")
View(reviews) 
class(reviews)

colnames(reviews)
str(reviews)


odi=read.csv("datasets/odi-batting.csv")
#stracture of odi
str(odi)
#view odi
View(odi)

#unique country

countries=c()

for (country in odi$Country){
  if(country%in%countries){
    next
  }
  else{
    countries<-c(countries,country)
  }
    
}

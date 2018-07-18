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
    next()
  }
  else{
    countries<-c(countries,country)
  }
    
}
print(countries)


# unique players

players<-c()

for (p in odi$Player){
  if(p %in% players){
    next()
  }else{
    players<-c(players,p)
  }
}
print(players)
length(players)


# matches sachin appered in

player="Sachin R Tendulkar"
s_count=0
for (pl_s in odi$Player){
  if (pl_s==player){
    s_count=s_count+1
  }else{
    next()
  }
}
print(s_count)
## list containing players and corresponding matches

u_players_matches<-list()

for(pl in odi$Player){
    if(pl %in% labels(u_players_matches)){
      u_players_matches[pl]=u_players_matches[pl][[1]]+1
    }
    else{
      u_players_matches[pl]=1;
    }
}

print(u_players_matches)


#nubers of matches played in sharjah

View(odi$Ground)


ground="Sharjah CA Stadium"
g_count=0
for (g in odi$Ground){
  if (g==ground){
    s_count=s_count+1
  }else{
    next()
  }
}
g_count

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

#playerwise total runs and sachin average

req_player="Sachin R Tendulkar"
total_runs=0
count=0
for(r_no in seq(1,nrow(odi))){
  c_player=odi$Player[r_no]
  c_runs=odi$Runs[r_no]
  
  if(c_player==req_player){
  total_runs=total_runs+c_runs
  count=count+1
  
  }
}
avg_run=total_runs/count

### Centuries by Sachin
player_name="Sachin R Tendulkar"
cent=0
for (p in seq(1,nrow(odi))){
  if(odi$Player[p]==player_name & odi$Runs[p]>99){
    cent=cent+1
  }
}
## Working with Dates

x="2010-10-21"
class(x)
y<-as.Date(x,"%Y-%m-%d")
class(y)
format(y,"%B") # Full month name
format(y,"%b") # Short form month name
format(y,"%Y") # Full Year
format(y,"%A") # Full day of the Week
format(y,"%a") #Short form for day
format (y,"%m-%Y") #month and year


##Assignments::
## For sachin yearwise total runs,centuries,total ducks ,total fifties...  
  
pl_name="Sachin R Tendulkar"  
y_total_runs<-list()
y_cent<-list()
y_ducks<-list()
y_fifties<-list()

for (p in seq(1:nrow(odi))){
  if(odi$Player[p]==pl_name){
      
    y_d<-(as.Date(odi$MatchDate[p],"%m-%d-%Y"))
    y<-format(y_d,"%Y")
    
    #if block for yearly total runs
    
    if(y %in% labels(y_total_runs)){
      y_total_runs[y]=y_total_runs[y][[1]]+odi$Runs[p]
    }else{
      y_total_runs[y]=odi$Runs[p]
    }
    if(odi$Runs[p]>99){
      if(y %in% labels(y_cent)){
          y_cent[y]=y_cent[y][[1]]+1                               
          
      }else{
        y_cent[y]=1
      }
    }
    if(odi$Runs[p]==0){
      if(y %in% labels(y_ducks)){
        y_ducks[y]=y_ducks[y][[1]]+1
      }else{
        y_ducks[y]=1
      }
    }
    if(odi$Runs[p]>49 & odi$Runs[p]<100){
      if(y %in% labels(y_fifties)){
        y_fifties[y]=y_fifties[[y]][1]+1
      }else{
        y_fifties[y]=1
      }
    }
  }
}
y_total_runs
y_cent
y_ducks
y_fifties
############################################################################################


install.packages("dplyr")
library(dplyr)

odi1=read.csv("datasets/odi-batting.csv")
View(odi1)
str(odi1)
dim(odi1)
## Filter the data for Sachin R Tendulkar
sachin<-filter(odi1,Player=="Sachin R Tendulkar")

dim(sachin)
### centuries of Sachin R Tendulkar

sachin_cent<-filter(odi1,Player=="Sachin R Tendulkar",Runs>99)
sachin_cent
dim(sachin_cent)

## Players "Sachin R Tendulkar" and "Ricky T Ponting"

S_R<-filter(odi1,Player=="Sachin R Tendulkar"| Player=="Ricky T Ponting")

dim(S_R)

## Sachin R Tendulkar Versus Australia scoring 100s

S_100_Aus<-filter(odi1,Player=="Sachin R Tendulkar", Versus=="Australia",Runs>99)
dim(S_100_Aus)

## Using %in% pipeline function

##Method 1

player_vec<-c("Sachin R Tendulkar","Sourav C Ganguly","Ricky T Ponting")

player_vec

filter_players<-filter(odi1,Player %in% player_vec)

View(filter_players)

#Method 2
filter_players1<-filter(odi1,Player %in% c("Sachin R Tendulkar","Sourav C Ganguly","Ricky T Ponting"))

View(filter_players1)

##Top 10 batsmen based on Runs

top_10<-odi1%>%
  group_by(Player)%>%
  summarise(Total_Runs=sum(Runs,na.rm=T))%>%
  arrange(desc(Total_Runs))
top_10[1:10,]

top_10_grounds_runs<-odi1%>%
  group_by(Ground)%>%
  summarise(Total_Runs=sum(Runs,na.rm=T))%>%
  arrange(-Total_Runs)%>% head(10)

top_10_ground_matches<-odi1%>%
  group_by(Ground)%>%
  summarise(Total_matches=n_distinct(MatchDate))%>%
  arrange(-Total_matches)
top_10_ground_matches[1:10,]

top_10_avg<-odi1%>%
  group_by(Player)%>%
  summarise(Total_runs=sum(Runs,na.rm=T),Avg_scr_rate=round(mean(ScoreRate,na.rm=T),2))%>%
  arrange(desc(Avg_scr_rate))
top_10_avg[1:10,]

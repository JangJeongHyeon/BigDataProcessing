install.packages("rPref")
install.packages("dplyr")
install.packages("igraph")
install.packages("ggplot2")
library(ggplot2)



sky1 <- psel(mtcars, high(mpg) * high(hp)) 

ggplot(mtcars, aes(x = mpg, y = hp)) + geom_point(shape = 21) +   geom_point(data = sky1, size = 3)

p <- high(mpg) * high(hp) 

res <- psel(mtcars, p, top = nrow(mtcars)) 

gp <- ggplot(res, aes(x = mpg, y = hp, color = factor(.level))) + geom_point(size = 3) 
gp 

gp + geom_step(direction = "vh")










# ticket data set loading
ticket <- read.csv("./Skyline/ticket(skyline).csv")
names(ticket) <- c("ticket","price","mileage")
ggplot(ticket, aes(x = price, y = mileage)) + geom_point(shape = 21) +geom_point(data = ticket, size = 3) 

sky2 <- psel(ticket, low(price)*low(mileage))
gg2 <- ggplot(ticket, aes(x=price, y=mileage))+geom_point(size=4)
gg2
gg2 + geom_step(data=sky2, direction = "vh")



soccer <- read.csv("./Skyline/soccer.csv")
soccer

sky3 <- psel(soccer, low(goal)*low(missGoal) , top=nrow(soccer))
gg3 <- ggplot(sky3, aes(x=goal, y=missGoal, color=factor(.level)))+geom_point(size=2)
gg3
gg3 + geom_step(data=sky3, direction = "vh")

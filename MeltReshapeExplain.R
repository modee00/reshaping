#You need to run ggplot2 and reshape2 in order to make the graph

set.seed(1)
sd = 3
#parameters for dummy data
m1 = (rnorm(30, 7, sd))
m2 = (rnorm(30, 9, sd))
m3 = (rnorm(30, 10.5, sd))
g = c('Gorilla', 'Chimp', 'Bonobo')
G = rep(g,each=10)
k.data = data.frame(cbind(m1, m2, m3, G))
k.data[, 1] <- as.numeric(as.character(k.data[, 1] ))
k.data[, 2] <- as.numeric(as.character(k.data[, 2] ))
k.data[, 3] <- as.numeric(as.character(k.data[, 3] ))
#dummy dataframe of raw measurements
k.data <- transform(k.data, r1 = k.data[, 1]/k.data[, 2])
k.data <- transform(k.data, r2 = k.data[, 2]/k.data[, 3])
k.data <- transform(k.data, r3 = k.data[, 1]/k.data[, 3])
#add new ratios to dataframe
attach(k.data)
ratio.data=data.frame(cbind(r1,r2,r3,G))
ratio.data[, 1] <- as.numeric(as.character(ratio.data[, 1] ))
ratio.data[, 2] <- as.numeric(as.character(ratio.data[, 2] ))
ratio.data[, 3] <- as.numeric(as.character(ratio.data[, 3] ))
#create new dataframe with ratios only
stack.ratio = melt(ratio.data, id = 'G')
#reshape data
p2 <- ggplot(stack.ratio, aes(x=factor(G),y=value,fill=factor(G))) + geom_boxplot() + labs(title="Ratios") + facet_wrap(~variable)
p2
#plot

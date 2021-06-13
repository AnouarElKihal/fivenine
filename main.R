#import libraries
library(devtools)
library(tidyverse)
library(ggplot2)
library(dplyr)

#check your working directory
setwd("/home/anouar/Desktop/Coding/R/dataset/")
getwd() 

#import .csv from dataset directory
#dataset <- read.csv("D4SI_challenge_DAD_R.csv", header = TRUE, sep = ",")
dad_dataset = read_csv("D4SI_challenge_DAD_R.csv")

#se volete avere tutti i nomi delle variabili con la minuscola 
names(dad_dataset)<- tolower(names(dad_dataset))

genere_data <- pivot_longer(dad_dataset,
                            cols = c(uomo,donna,altro),
                            names_to = "genere", 
                            values_to = "valori_genere") 
View(genere_data)


eta_data <- pivot_longer(dad_dataset,
                         cols = c('13-15 anni','16-17 anni','18-20 anni'),
                         names_to = "eta", 
                         values_to = "valori_eta")
View(eta_data)

# Grafico 1
g1<- eta_data %>%
  filter(risposta == "Più soddisfatto/a") %>% 
  ggplot(aes(x = eta, y = valori_eta)) + geom_boxplot() +ggtitle("Livello di soddisfazione tra le età") +
  xlab("Asse X") + ylab("Asse Y")
g1

# Grafico 2
g2<- eta_data %>%
  filter(risposta == "Meno soddisfatto/a") %>% 
  ggplot(aes(x = eta, y = valori_eta)) + geom_boxplot() +ggtitle("Livello di insoddisfazione tra le età") +
  xlab("Asse X") + ylab("Asse Y")
g2

# Grafico 3
g3<- genere_data %>%
  filter(risposta == "Più soddisfatto/a") %>% 
  ggplot(aes(x = genere, y = valori_genere)) + geom_boxplot() +ggtitle("Livello di soddisfazione tra i generi") +
  xlab("Asse X") + ylab("Asse Y")
g3

# Grafico 4
g4<- genere_data %>%
  filter(risposta == "Meno soddisfatto/a") %>% 
  ggplot(aes(x = genere, y = valori_genere)) + geom_boxplot() +ggtitle("Livello di insoddisfazione tra i generi") +
  xlab("Asse X") + ylab("Asse Y")
g4


#per unire i grafici (grafico 1 + grafico 2)
library(ggpubr)
figure <- ggarrange(g1, g2,
                    labels = c("A", "B"),
                    ncol = 2, nrow = 1)
figure





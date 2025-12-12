#This is our R script to clean data

install.packages("openxlsx")
library(openxlsx)
A_data=read.xlsx("Raw_Data/A.xlsx")
B_data=read.xlsx("Raw_Data/B.xlsx")
P_data=read.xlsx("Raw_Data/P.xlsx")
SE_data=read.xlsx("Raw_Data/SouthEast.xlsx")
H_data=read.csv("Raw_Data/H.csv")

names(SE_data)[names(SE_data) == "Phusical"] <- "PH"
names(SE_data)[names(SE_data) == "Mental"] <- "MH"
names(H_data)[names(H_data) == "Physical"] <- "PH"
names(H_data)[names(H_data) == "Mental"] <- "MH"

H_data$Smoker = NA 
H_data$SES5 = NA 

names(H_data)[names(H_data) == "Name"] <- "ID"

A_data$ID <- sprintf("%s%03d", A_data$Region, seq_len(nrow(A_data)))
B_data$ID <- sprintf("%s%03d", B_data$Region, seq_len(nrow(B_data)))
P_data$ID <- sprintf("%s%03d", P_data$Region, seq_len(nrow(P_data)))
SE_data$ID <- sprintf("%s%03d",SE_data$Region, seq_len(nrow(SE_data)))

class(SE_data$Region)
H_data$Region = as.character("H")

colnames(A_data)
colnames(B_data)
colnames(H_data)


final_data=rbind(A_data,B_data,P_data,SE_data,H_data)

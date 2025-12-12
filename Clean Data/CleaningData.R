#This is our R script to clean data

install.packages("openxlsx")
library(openxlsx)

#loading the data
A_data=read.xlsx("Raw_Data/A.xlsx")
B_data=read.xlsx("Raw_Data/B.xlsx")
P_data=read.xlsx("Raw_Data/P.xlsx")
SE_data=read.xlsx("Raw_Data/SouthEast.xlsx")
H_data=read.csv("Raw_Data/H.csv")

#Making column names consistent
names(SE_data)[names(SE_data) == "Phusical"] <- "PH"
names(SE_data)[names(SE_data) == "Mental"] <- "MH"
names(H_data)[names(H_data) == "Physical"] <- "PH"
names(H_data)[names(H_data) == "Mental"] <- "MH"
names(H_data)[names(H_data) == "Name"] <- "ID"

#Adding unfilled columns to H
H_data$Smoker = NA 
H_data$SES5 = NA 
class(SE_data$Region)
H_data$Region = as.character("H")



#Addjng ID to each person
A_data$ID <- sprintf("%s%03d", A_data$Region, seq_len(nrow(A_data)))
B_data$ID <- sprintf("%s%03d", B_data$Region, seq_len(nrow(B_data)))
P_data$ID <- sprintf("%s%03d", P_data$Region, seq_len(nrow(P_data)))

final_data=rbind(A_data,B_data,P_data,SE_data,H_data)

unique(final_data$MH)

final_data$MH[final_data$MH=="No"]=0
final_data$MH[final_data$MH=="Yes"]=1
final_data$MH[final_data$MH=="N"]=0
final_data$MH[final_data$MH=="Y"]=1

unique(final_data$MH)

final_data$PH[final_data$PH=="No"]=0
final_data$PH[final_data$PH=="Yes"]=1
final_data$PH[final_data$PH=="N"]=0
final_data$PH[final_data$PH=="Y"]=1
final_data$PH[final_data$PH=="NO"]=0
final_data$PH[final_data$PH=="YES"]=1

unique(final_data$PH)
unique(final_data$Belief)

final_data$Belief[final_data$Belief=="No"]=0
final_data$Belief[final_data$Belief=="Yes"]=1
final_data$Belief[final_data$Belief=="N"]=0
final_data$Belief[final_data$Belief=="Y"]=1

unique(final_data$Smoker)
#fixinfg Smoker
final_data$Smoker[final_data$Smoker=="Current"]=1
final_data$Smoker[final_data$Smoker=="Y"]=1
final_data$Smoker[final_data$Smoker=="N"]=0

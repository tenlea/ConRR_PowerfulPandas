Data<-final_data
head(final_data)

#Make dummy variables



#Fit the null model of belief that condition will get worse
fit_null<-glm(Belief~1,data=Data,family="binomial")
summary(fit_null)
confint(fit_null)

#Are we use that is what belief means?


#Fit the logistic rgeression model for mh effect on belief 
fitMH <- glm(Belief~MH,data=Data,family="binomial")
coef_summary <- summary(fitMH)
coefficients <- coef(fitMH)
p_values <- coef_summary$coefficients[, "Pr(>|z|)"]
conf_int <- confint(fitMH)
summary(fitMH)

#Fit the logistic rgeression model for ph effect on belief 
fitPH <- glm(Belief~PH,data=Data,family="binomial")
coef_summary <- summary(fitPH)
coefficients <- coef(fitPH)
p_values <- coef_summary$coefficients[, "Pr(>|z|)"]
conf_int <- confint(fitPH)
summary(fitPH)


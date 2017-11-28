library(ggplot2)

args = commandArgs(trailingOnly=TRUE)

if (length(args)==0 || length(args)==1) {
        stop("USAGE: Rscript normality_test.R InputFile OutputName", call.=FALSE)
}else if (length(args)==2) {
    #cat("Enter output filename: ")
    #filename <- scan("stdin", character(), n=1)
    mydata = read.table(args[1],header = TRUE,sep = ",")
    temp <- args[2]
    g <- gregexpr("/", temp, fixed=TRUE)
    loc <- g[[1]]
    pos <- loc[length(loc)]
    filename <- substr(temp, pos+1, nchar(temp))
    path <- substr(temp, 0, pos)
}

message("For obs:");
    result = shapiro.test(mydata$random_obs)
        result
        if(result$p.value<0.05){
            message("According to SHAPIRO TEST, we do not have evidence to reject that the sample is normal distribution");
        }else{
            message("According to SHAPIRO TEST, we reject that the  sample is normal distribution");
        }

message("For exp:");
result = shapiro.test(mydata$random_exp)
result
if(result$p.value<0.05){
    message("According to SHAPIRO TEST, we do not have evidence to reject that the sample is normal distribution");
}else{
    message("According to SHAPIRO TEST, we reject that the  sample is normal distribution");
}

message("For nor:");
result = shapiro.test(mydata$random_nor)
result
if(result$p.value<0.05){
    message("According to SHAPIRO TEST, we do not have evidence to reject that the sample is normal distribution");
}else{
    message("According to SHAPIRO TEST, we reject that the  sample is normal distribution");
}

#pdf(paste(path,filename,".pdf"))
pdf(paste(path,filename,".pdf"))

qplot(x=mydata$random_obs,
data = mydata,
col = "red",
geom="density",
main = "Densityplot of obs",
xlab="obs",
)+theme(legend.position="none")

#ggsave(paste("Distribution_of_",filename,"_obs.pdf"), width = 4, height = 3)

qplot(x=mydata$random_exp,
data = mydata,
col = "red",
geom="density",
main = "Densityplot of exp",
xlab="exp",
)+theme(legend.position="none")

#ggsave(paste("Distribution_of_",filename,"_exp.pdf"), width = 4, height = 3)

qplot(x=mydata$random_nor,
data = mydata,
col = "red",
geom="density",
main = "Densityplot of nor",
xlab="exp",
)+theme(legend.position="none")

#ggsave(paste("Distribution_of_",filename,"_nor.pdf"), width = 4, height = 3)
dev.off()
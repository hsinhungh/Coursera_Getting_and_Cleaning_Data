setwd("~/R_work/UCI HAR Dataset")

library(data.table)

# define set of files to read data from
datafile_set <- list(c("./test/X_test.txt","./test/y_test.txt","./test/subject_test.txt"),c("./train/X_train.txt","./train/y_train.txt","./train/subject_train.txt"))

#read feature column names into a vector
var_all <- read.table("./features.txt",colClasses=c("NULL","character"),sep="")[,1]

# use regular expression match to generate a logical vector for selecting 
# needed columns (mean and std)
sel_var_logic <- grepl(".*mean\\(\\).*|.*std\\(\\).*",var_all)

# vector of selected column names
sel_var_names <- var_all[sel_var_logic]

# fread can't handle multiple space as the separator
# testset <- fread("./test/X_test.txt") 

# function to read and combine data from different files
readDataFile <- function(fname_set) {
        ds <- read.table(fname_set[1],sep="") # read measurement file into a data frame
        ds <- ds[,sel_var_logic] # keep only desired columns
        ds <- data.table(ds) # convert data frame to a data table
        setnames(ds,sel_var_names) # assign descriptive column names
        actIndex <- read.table(fname_set[2],sep="")[,1] # read activity codes
        subjIndex <- read.table(fname_set[3],sep="")[,1] # read subject codes
        #ds[,object:=objIndex]; ds[,activity:=actIndex] # adding subject and activity columns
        ds[,c('subject','activity'):=list(subjIndex,actIndex)] # adding subject and activity columns to the main data table
}


# reading, modifying, and combining data sets
mds <- rbindlist(lapply(datafile_set,readDataFile))
setkey(mds,activity)

# reading activity labels
df_act <- data.table(read.table("./activity_labels.txt"))
setnames(df_act,c("activity","actName"))
setkey(df_act,activity)

# merging datasets and activity labels
mds<-merge(mds,df_act)

# calculating means by activity type and by subject
mds_avg <- mds[,lapply(.SD,mean),by=c('actName','subject')]
# sorting
mds_avg <- mds_avg[order(activity,subject)]

# drop unused activity index column
# mds_avg[,activity:=NULL] 

# write the tidy data set to a file
write.table(mds_avg,file='./tidy_avg.txt',row.names = F,sep = "\t",quote=F)

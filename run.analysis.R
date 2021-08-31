##Step 1  to Step 4
##Download .zip file 
donwload.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
              ,"PRW4.zip",mode="wb")
##Unzip .zip file
unzip("PWR4.zip")
##Check the contents of the .zip file 
##Directory is named as "UCI HAR Dataset"
##Determine the needed files
dir("UCI HAR Dataset",recursive = TRUE)


##Assign features.txt to feat as features
feat<-read.table("./UCI HAR Dataset/features.txt",header = FALSE, sep = "")
##Transpose feat
feat<-as.data.frame(t(feat))
##Delete feat's first row
feat<-feat[-1,]

##Assign subject_test.txt to testsub as test subjects
testsub<-read.table("./UCI HAR Dataset/test/subject_test.txt",header = FALSE,sep="")
colnames(testsub)<-"subject"

##Assign X_test.txt to testset as test sets
testset<-read.table("./UCI HAR Dataset/test/X_test.txt",header = FALSE,sep="")
##Rename testset's column names using feat values
colnames(testset)<-feat

##Assign y_test.txt to testlabel as test labels
testlabel<-read.table("./UCI HAR Dataset/test/y_test.txt",header = FALSE,sep="")
##Add header to testlabel
colnames(testlabel)<-"Activity"
##Define testlabel$Activity as factor and define each activity
testlabel$Activity<-as.factor(testlabel$Activity)
levels(testlabel$Activity)<-c("Walkng","Walkng_upstrs","Walkng_downstrs",
                               "Sittng","Standng","Laying")

##Merge testlabel and testset into test
test<-cbind(testlabel,testset)
##Merge testsub and test into test
test<-cbind(testsub,test)


##Assign subject_train.txt to trainsub as train subjects
trainsub<-read.table("./UCI HAR Dataset/train/subject_train.txt",header = FALSE,sep="")
colnames(trainsub)<-"subject"

##Assign X_train.text to trainset as training sets
trainset<-read.table("./UCI HAR Dataset/train/X_train.txt",header = FALSE,sep="")
##Rename trainset's column names using feat values
colnames(trainset)<-feat

##Assign y_train.txt to trainlabel as train labels
trainlabel<-read.table("./UCI HAR Dataset/train/y_train.txt",header = FALSE,sep="")
##Add header to trainlabel
colnames(trainlabel)<-"Activity"
##Define trainlabel$Activity as factor and define each activity
trainlabel$Activity<-as.factor(trainlabel$Activity)
levels(trainlabel$Activity)<-c("Walkng","Walkng_upstrs","Walkng_downstrs",
                              "Sittng","Standng","Laying")

##Merge trainlabel and trainset into train
train<-cbind(trainlabel,trainset)
##Merge trainsub and train into train
train<-cbind(trainsub,train)


##Merge train and test to form trte
trte<-rbind(train,test)
##Order/rearrange the data by subject in ascending manner.
trte<-trte[order(trte$subject),]
trte$subject<-as.factor(trte$subject)


##Extract mean and standard deviation for each measurement. 
##Create trtes varaible for subsetting mean and std
trtes<-grep("mean\\(\\)|std\\(\\)|Activity|subject",names(trte),value = TRUE)
##Subset trte using trtes
trte<-trte[,trtes]

##Format variable names
##Lowercase
names(trte)<-tolower(names(trte))
##Switch "-" to "_"
names(trte)<-gsub("\\-","_",names(trte))
##Delete "()"
names(trte)<-gsub("\\(\\)","",names(trte))

##Step 5
##Create a blank data frame for step 5.
trtef<-data.frame(matrix(ncol=68,nrow=0))

##Create a data frame with the average for every variable 
##for each subject and activity.
for(s in levels(trte$subject)){
  for(a in levels(trte$activity))
      {
    ts1<-trte[trte$subject == s & trte$activity==a,]
    ts1<-lapply(ts1[,3:68],mean)
    ts1<-as.data.frame(ts1)
    ts1<-cbind(list(subject = s,activity = a),ts1)
    trtef<-rbind(trtef,ts1)
        
  }
}
##Create the .txt file with the data set.
##If needed or wanted, you can change the file name.
write.table(trtef,"tidystep5_msa1.txt",row.names = FALSE)
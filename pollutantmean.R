##########################################
##  Johns Hopkins Univ
##  Coursera Data Science Specialization
##  Programing Assignments 1
##  Part 1
##########################################

##########################################
##  Function pollutantmean
##  calculates the mean of a pollutant
##  across a specified list ot monitors
##  arguments:
##  directory, pollutant, and id
##########################################

pollutantmean <- function(directory, pollutant, id = 1:332) {
        ## 'directory' is a character vector of length 1 indicating
        ## the location of the CSV files
        
        
        ## 'pollutant' is a character vector of length 1 indicating
        ## the name of the pollutant for which we will calculate the
        ## mean; either "sulfate" or "nitrate".
        
        ## 'id' is an integer vector indicating the monitor ID numbers
        ## to be used
        
        ## Return the mean of the pollutant across all monitors list
        ## in the 'id' vector (ignoring NA values)
        var <- NULL
        setwd(directory)
        for (i in id){
                if (i <10){
                        flname <- paste("00", i, ".csv",sep="")
                }else if (i>=100){
                        flname <- paste(i,".csv",sep="")
                }else{
                        flname <- paste("0",i,".csv",sep="")
                }
                data <- read.csv(flname)
                var <- c(var, as.vector(unlist(data[pollutant])))
        }
        mean(var, na.rm=TRUE)
}
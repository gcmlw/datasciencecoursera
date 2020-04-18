
library(stringr)

pollutantmean <- function(directory, pollutant, id = 1:332) {
        
        filter_files <- character()
        for(i in id) {
                fna <- str_pad(i, 3, pad = "0")
                fna_full <- paste(directory,"/",fna,".csv", sep = "")
                filter_files <- append(filter_files, fna_full)
        }
        
        dfValues <- numeric()
        for(f in filter_files) {
                df <- read.csv(f)
                dfVal <- df[!is.na(df[pollutant]),]
                dfValues <- c(dfValues, dfVal[,pollutant])
        }
        result <- mean(dfValues)
        result
        
}

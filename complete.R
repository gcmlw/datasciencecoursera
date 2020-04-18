
library(stringr)

complete <- function(directory, id=1:332) {
        
        filter_files <- character()
        for(i in id) {
                fna <- str_pad(i, 3, pad = "0")
                fna_full <- paste(directory,"/",fna,".csv", sep = "")
                filter_files <- append(filter_files, fna_full)
        }
        
        count <- 1
        dfValues <- data.frame(matrix(ncol = 2, nrow = 0), stringsAsFactors = FALSE)
        colnames(dfValues) <- c("id", "nobs")
        for(f in filter_files) {
                df <- read.csv(f)
                good <- complete.cases(df)
                total <- sum(good)
                dfValues[nrow(dfValues)+1,] <- c(id[count], total)
                count <- count + 1
        }
        dfValues
}
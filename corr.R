
source("complete.R")

corr = function(directory, threshold = 0) {
        
        result = complete(directory)
        thresholdResult <- result[result$nobs > threshold,]
        
        corResults <- numeric(0)
        
        if(nrow(thresholdResult) != 0) {
                
                resultId <- thresholdResult[1]
                filter_files <- character()
                for(i in resultId) {
                        fna <- str_pad(i, 3, pad = "0")
                        fna_full <- paste(directory,"/",fna,".csv", sep = "")
                        filter_files <- append(filter_files, fna_full)
                }
                
                for(f in filter_files) {
                        df <- read.csv(f)
                        good <- complete.cases(df)
                        goodResult <- df[good,]
                        corResults <- c(corResults, cor(goodResult$sulfate, goodResult$nitrate)) 
                }
        }
        corResults
        
}

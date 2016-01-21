# this is originally from http://stackoverflow.com/questions/4090169/elegant-way-to-check-for-missing-packages-and-install-them

list.of.packages <- c("ggplot2","Hmisc","plyr","ggthemes","R.matlab")
new.packages <- list.of.packages[!(list.of.packages %in% installed.packages()[,"Package"])]
if(length(new.packages)) install.packages(new.packages, repos='http://lib.stat.cmu.edu/R/CRAN/')
rm(list=ls())
setwd("~/Documents/NCSU/RNAseq_Mimulus/HeatMaps/")
getwd()

library ("pheatmap")
library ("NMF")
library("dendextend")
library("d3heatmap")
library("ape")
library("gplots")
library("RColorBrewer") 

# get data
Day00= read.table(file="d00_FDR005FC2_RPKM.txt",header=TRUE, sep="\t")
#Day00$d00 <- (Day00$Day00_BR1 + Day00$Day00_BR4 + Day00$Day00_BR5 + Day00$Day00_BR6  + Day00$Day00_BR7)/5
#Day00=Day00[,c(-2:-6)]

Day02= read.table(file="d02_FDR005FC2_RPKM.txt",header=TRUE, sep="\t")
#Day02$d02 <- (Day02$Day02d_BR4 + Day02$Day02d_BR5 + Day02$Day02d_BR6 + Day02$Day02d_BR7)/4
#Day02=Day02[,c(-2:-5)]

Day04= read.table(file="d04_FDR005FC2_RPKM.txt",header=TRUE, sep="\t")
#Day04$d04 <- (Day04$Day04_BR2 +  Day04$Day04_BR3 +  Day04$Day04_BR4)/3
#Day04=Day04[,c(-2:-4)]

Day06= read.table(file="d06_FDR005FC2_RPKM.txt",header=TRUE, sep="\t")
#Day06$d06 <- (Day06$Day06_BR1 +Day06$Day06_BR2 + Day06$Day06_BR3 + Day06$Day06_BR4)/4
#Day06=Day06[,c(-2:-5)]

Day08= read.table(file="d08_FDR005FC2_RPKM.txt",header=TRUE, sep="\t")
#Day08$d08 <- (Day08$Day08_BR1+ Day08$Day08_BR2+Day08$Day08_BR3+Day08$Day08_BR4)/4
#Day08=Day08[,c(-2:-5)]

#merge all data
all = merge(Day00,Day02,by=c(1))
all2 =merge(all,Day04,by=c(1))
all3=merge(all2,Day06,by=c(1))
all4=merge(all3,Day08,by=c(1))

#all5=head(all4,50)
# get the finla gene list of ~50



####################################################################################################################
# HEATMAPS
####################################################################################################################

#pheatmap This command guarrantess nice colors

#my 50 genes
#pheatmap(all5[,-1], scale="row", border_color=NA,rownames=TRUE, color = colorRampPalette(c("navy", "black", "yellow"))(50))


####################################################################################################################
# HEATMAPS ggplot
####################################################################################################################

hmcol <- colorRampPalette(brewer.pal(9, "GnBu"))(100)


all4 = unique(all4)
all5 = all4[,2:ncol(all4)]
rownames(all5) = all4[,1]

all5= as.matrix(all5)

heatmap.2(all5,dendrogram="both",trace="none",scale="row",col=hmcol)

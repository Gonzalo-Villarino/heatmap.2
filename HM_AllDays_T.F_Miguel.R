rm(list=ls())
setwd("~/Documents/NCSU/RNAseq_Mimulus/HeatMaps_TFonly_Miguel/")
getwd()

library ("pheatmap")
library ("NMF")
library("dendextend")
library("d3heatmap")
library("ape")
library("gplots")
library("RColorBrewer") 

# get data

TF=read.table(file = "19_common_TF_AllDays.txt", header = T)
#TF=TF[,c(-22)] # this line adds the annotation instead of gene id

####################################################################################################################
# HEATMAPS
####################################################################################################################

hmcol <- colorRampPalette(brewer.pal(9, "GnBu"))(100)


#TF = unique(TF)
all5 = TF[,2:(ncol(TF)-1)]
rownames(all5) = TF[,1] # this line adds the annotation instead of gene id

all5= as.matrix(all5)

par(oma=c(2,0,2,3))

heatmap.2(all5,dendrogram="both",trace="none",scale="row",col=hmcol,labRow = TF$Family)

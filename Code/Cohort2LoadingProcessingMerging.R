library(Seurat)
memory_base=memory.size()
#expand memory limit if need be, both Seurat files are ~5-7GB. List basic info about both parts of cohort 2.
frozePBMC_c2 <-
  readRDS("./data/seurat_COVID19_PBMC_jonas_FG_2020-07-23.rds")
frozePBMC_c2
freshPBMC_c2 <-
  readRDS("./data/seurat_COVID19_freshWB-PBMC_cohort2_rhapsody_jonas_FG_2020-08-18.rds")
freshPBMC_c2
memory.limit(size=3*memory_base)
#Filter out data points with no diagnosis listed
freshPBMC_c2<-freshPBMC_c2[,is.na(freshPBMC_c2$diagnosis)==FALSE]
frozePBMC_c2<-frozePBMC_c2[,is.na(frozePBMC_c2$diagnosis)==FALSE]
freshPBMC_c2
frozePBMC_c2
#Create a new column for covid diagnosis that is true if patient isn't control/no covid. Helps with data merge. 
freshPBMC_c2$covid<-(freshPBMC_c2$diagnosis!="control")
frozePBMC_c2$covid<-(frozePBMC_c2$diagnosis!="no_covid19")
cohort2_pbmcMerge<-merge(x=freshPBMC_c2,y=frozePBMC_c2,project="CS760CovidSeurat")
rm(freshPBMC_c2,frozePBMC_c2)
# Look for RNA counts, features, mitochondral reads
# Idents(cohort2_pbmcMerge)<-cohort2_pbmcMerge$diagnosis
# VlnPlot(cohort2_pbmcMerge,features=c("nFeature_RNA","nCount_RNA","percent.mito"),ncol=3)
# plot1 <- FeatureScatter(cohort2_pbmcMerge,feature1 = "nCount_RNA",feature2="percent.mito")
# plot2 <- FeatureScatter(cohort2_pbmcMerge,feature1 = "nCount_RNA",feature2="nFeature_RNA")
# plot1+plot2
# filter out high RNA feature, low RNA feature and high mitochondrial data. Basically use most of the defaults from Seurat tutorial but with a higher
# mitochondrial cutof
cohort2_pbmcMerge <- subset(cohort2_pbmcMerge, subset = nFeature_RNA > 200 & nFeature_RNA < 2500 & percent.mito < 15)
saveRDS("./data/cs760project_COVID19scRNAseq_dataCohort2.rds")


Data and Repository Links:
https://github.com/shanstiles/cs760_project
https://uwmadison.box.com/s/i3k2p9gkz4av04ewg4scu5t7yaz7z6h4

# CS_760 Final Project
## Fall 2020

## Project Objective:
To classify patients as severe COVID-19  or Control based on their cell's scRNA-seq gene expression values comparing two machine learning methods, K-Nearest Neighbors classification and Support Vector Machine classification using a Radial Basis Function (RBF).

## Abstract:
Single-cell RNA-sequencing is being used to profile the immune landscape of patients with differing COVID-19 symptoms to try to understand the different immune cell responses to the viral infection.  In this paper, the capability of K-Nearest Neighbors (KNN) and a radial basis function (RBF) Support Vector Machine (SVM), two supervised machine learning methods, to classify cells from Severe COVID-19 and Control donors based on cell gene expression profiles from Single-cell RNA-sequencing data (scRNA-seq) were compared.  The RBF SVM had the best performance in terms of both accuracy and efficiency. The RBF SVM had ~91.8% accuracy, ~0.97 sensitivity, and ~0.86 specificity, while the KNN classifier had ~80.1% accuracy, 0.86 sensitivity, and ~0.73 specificity.  For both classifiers, all patients in the testing set were correctly identified as Severe COVID-19 or Control based on the accuracy of their cell classifications.

## Data
Data from: Severe COVID-19 Is Marked by a Dysregulated Myeloid Cell Compartment
DOI:https://doi.org/10.1016/j.cell.2020.08.001
Raw Data can be downloaded from FASTGENOMICS: https://www.fastgenomics.org/news/fg-covid-19-cell/

Large Data Files are stored on BOX:https://uwmadison.box.com/s/i3k2p9gkz4av04ewg4scu5t7yaz7z6h4

Large Data:

- seurat_COVID19_freshWB-PBMC_cohort2_rhapsody_jonas_FG_2020-08-18.rds: original RDS file from paper of fresh WB and PBMC count matrices for Bonn Cohort

- seurat_COVID19_PBMC_jonas_FG_2020-07-23.rds:  original RDS file from paper of frozen PBMC count matrices for Bonn cohort

- cs760project_COVID19scRNAseq_dataCohort2.rds: merged and cleaned data set of fresh and frozen PBMC count matrices

- training_data: contains cells from 4 randomly assigned severe COVID-19 and 4 Control donors

- testing_data: contains cells from the other 4 severe COVID-19 and 4 Control donors

smv_opt:  Folder that contains the classifiers and final results of the RBF SVM hyperparameter optimization

- 17 RBF SVM classifier files (16 from 4x4 hyperparameter combinations and 1 from default SVM hyperparameters)
- SVM_Optimization_Results: dataframe of the parameter combinations and the resulting accuracy, sensitivity, and specificity values

Github Repository: https://github.com/shanstiles/cs760_project

File Directory:

README.md: Overview of Project

Code: Folder where code used in project is stored

- Cohort2LoadingProcessingMerging.R: this code merged the fresh and frozen PBMC data together, created a new metadata variable for COVID-19 (T/F), and filtered out cells with unique feature counts <200 and >2500 and cells with greather than 15% mitochondrial DNA.

- Training_Testing_Processing.Rmd:  This code preprocesses the data and separates the data into training and testing sets by randomly assigning 4 COVID-19 and 4 Control donors to each set.

- Diff_Gene_Expression.Rmd: This code preprocesses the data, explores the differential gene expression between all COVID-19 and Control cells and Severe COVID-19 and Control cells, and writes out a list of all of the genes that have significant expression differences between Severe COVID-19 and Control cells.

- ML_workflow.Rmd:  This code reads in the training and testing data sets along with the differentially expressed genes and reduces the feature space from 33,419 to 1,22.  A KNN classifier is defined and run.  An 4x4 RBF SVM hyperparameter experiment was run.  A final RBF SVM classifier was defined.  The results of the two classifiers were summarized in confusion matrices and ROC curves.  Patients were classified based on the the classificaiton of their cells by the two classifiers.

Data:  Folder where data used and produced in project is stored

- mmc1.xlsx: cohort information in the seq-QC tab

- DE_genes: List of differentially expressed genes between Severe COVID-19 and Control cells

- Severe_Control_DE_genes.csv:  data frame of differentially expressed genes between Severe COVID-19 and Control cells with p-values

- Donor_Classification_Results.csv: Summary results of the accuracy of the KNN and RBF SVM classifiers correctly classifying Donor cells and classification of the Donors as COVID-19 or Control in the testing set.

- knn_classifier:  file where KNN results are stored
- svm_classifier:  file where RBF SVM training info and model is stored

smv_opt:  Folder that contains the classifiers and final results of the RBF SVM hyperparameter optimization

- 1/17 RBF SVM classifier files that was below the upload limit (16 from 4x4 hyperparameter combinations and 1 from default SVM hyperparameters total - Please see on Box)
- SVM_Optimization_Results: dataframe of the parameter combinations and the resulting accuracy, sensitivity, and specificity values

Figures: Folder where all figures are located in .png format

- Severe_Mild_Control_UMAP: Figure 1 (a)
- Severe_Mild_Control_SPLIT_UMAP: Figure 1 (b)
- KNN_ROC_labelled: Figure 2 (a)
- SVM_ROC_labelled_opt: Figure 2 (b)
- Elbox Plot: Appendix Figure 3
- PCA_DimPlot: unused in final paper (exploratory)
- PCA_VizDim: unused in final paper (exploratory)
- UMAP: unused in final paper (exploratory)
- Covid_Control_Split_UMAP: unused in final paper (exploratory)
- Covid_Control_UMAP: unused in final paper (exploratory)

Report: Folder where report and latex files are located
  - Stiles_Khatri_CS760_Project_Report.pdf: Final Report
  - Stiles_Khatri_CS760_Report zip folder: Final Report Submission (All .tex source files, .pdf of a report, and README.md with github repository and BOX data storage links)
  
  
## Deliverables
  You need to hand in a zip file containing:
    - All .tex source files and .pdf of a report, in the format of this project description, with no more than 8 pages long excluding references and appendix
    - Source code or reference to github repository with all the code required to replicate experiments and results
    

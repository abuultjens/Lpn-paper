# Lpn-paper

## Data files

### One-hot encoded matrices
#### environmental isolate training matrix
```data/329-535_SKA_align_m-0.1_k-15_p-0.1_CLIPPED_OHE.csv```  
#### clinical isolate testing matrix
```data/206-535_SKA_align_m-0.1_k-15_p-0.1_CLIPPED_OHE.csv```  

### Target observation label files
#### ESSEX-A
```data/target_329_ESSEX-A.csv```  
#### ESSEX-B
```data/target_329_ESSEX-B.csv```  
#### ESSEX-E
```data/target_329_ESSEX-E.csv```  
#### ESSEX-G
```data/target_329_ESSEX-G.csv```  
#### ESSEX-H
```data/target_329_ESSEX-H.csv```  


## Scripts

### upsample the training data
```sh upsample.sh OB_list.txt```  
```upsample.py```  

### make the config file
```sh config-file-maker.sh OB_list.txt k_list.txt model_list.txt class_1_weight_list.txt```  

### run the CV-loop on the environmental isolate training dataset
```sh train_val_runner.sh config.csv```  
```ML_train_val.py```  

### compile the CV report
```sh report-maker.sh config.csv```  
##### outfiles  
```report.csv```  
### determin the best models  
```sh evaluate-report.sh report.csv```  
##### outfiles  
 ```BEST_MODELS.csv```  


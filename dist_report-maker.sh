#!/bin/bash

OB_file=$1
PREFIX=$2

# rm existing outfile
if ls ${PREFIX}_DIST_report.csv 1> /dev/null 2>&1; then
	rm ${PREFIX}_DIST_report.csv
fi

# generate random prefix for all tmp files
RAND_1=`echo $((1 + RANDOM % 100))`
RAND_2=`echo $((100 + RANDOM % 200))`
RAND_3=`echo $((200 + RANDOM % 300))`
RAND=`echo "${RAND_1}${RAND_2}${RAND_3}"`

# write report header
echo "PREFIX,TP_dist,TN_dist,FP_dist,FN_dist,f1_dist" > ${PREFIX}_DIST_report.csv

for OB in $(cat OB_file); do

	NAME=${OB}_${PREFIX}

	TN_dist=`head -1 ${NAME}_confusion_matrix_dist.csv | cut -f 1 -d ','`	
	FP_dist=`head -1 ${NAME}_confusion_matrix_dist.csv | cut -f 2 -d ','`  
	FN_dist=`tail -1 ${NAME}_confusion_matrix_dist.csv | cut -f 1 -d ','`  
	TP_dist=`tail -1 ${NAME}_confusion_matrix_dist.csv | cut -f 2 -d ','`  
        f1_dist=`cat ${NAME}_f1_score_dist.csv`

	echo "${NAME},${TP_dist},${TN_dist},${FP_dist},${FN_dist},${f1_dist}" >> ${PREFIX}_DIST_report.csv


done

# rm tmp files
rm ${RAND}_*

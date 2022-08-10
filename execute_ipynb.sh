#!/bin/bash
DDI_FILE=./DDI.ipynb
PARSE_DRUGBANK=./parse_Drugbank.ipynb
PARSE_DRUGBANK_ATC=./parse_Drugbank-atc.ipynb
PARSE_DRUGBANK_DTI=./parse_Drugbank-DTI.ipynb
MATH_NOTEBOOK=./benford.nb
cd ./DrugBank_statistics
find . -maxdepth 1 -mindepth 1 -type d | while read dir; do
        echo "Listing Dir:""$dir"
        cd $dir
        echo "Checking file...[$(date +"%T")]"
        if [[ -f "$PARSE_DRUGBANK" ]]; then
                echo "$PARSE_DRUGBANK exists in $dir"
		echo "Start execution of $PARSE_DRUGBANK [$(date +"%T")]"
#		jupyter nbconvert --to notebook --inplace --execute $PARSE_DRUGBANK
        fi
        if [[ -f "$PARSE_DRUGBANK_ATC" ]]; then
                echo "$PARSE_DRUGBANK_ATC exists in $dir"
		echo "Start execution of $PARSE_DRUGBANK_ATC [$(date +"%T")]"
#		jupyter nbconvert --to notebook --inplace --execute $PARSE_DRUGBANK_ATC
        fi
        if [[ -f "$PARSE_DRUGBANK_DTI" ]]; then
		echo "$PARSE_DRUGBANK_DTI exists in $dir"
		echo "Start execution of $PARSE_DRUGBANK_DTI [$(date +"%T")]"
#		jupyter nbconvert --to notebook --inplace --execute $PARSE_DRUGBANK_DTI
        fi
        if [[ -f "$DDI_FILE" ]]; then
                echo "$DDI_FILE exists in $dir"
		echo "Start execution of $DDI_FILE [$(date +"%T")]"
#		jupyter nbconvert --to notebook --inplace --execute $DDI_FILE
        fi
	for file in ./*.py
	do
	    if [ -f "${file}" ]; then
	        echo "PYTHON FILE:$file";
		echo "Start execution of $file [$(date +"%T")]"
		python $file
	    fi
	done

	if [[ -f "$MATH_NOTEBOOK" ]]; then
		echo "$MATH_NOTEBOOK exists in $dir"
		echo "Start execution of $MATH_NOTEBOOK [$(date +"%T")]"
#		wolframscript -v --file $MATH_NOTEBOOK >/dev/null
		ERROR_NUMBER=$(echo $?)  
		echo "ERROR: $ERROR_NUMBER" 
	fi

        cd ../
done
echo "Done"

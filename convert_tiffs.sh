#!/bin/bash

#conda activate py38dabquant
source /Users/Caden/miniconda3/bin/activate py38dabquant
ImageDIR="/Users/Caden/Desktop/Pou2f3_Data/IHC_Images/PR_8wk_3031_IHC_quant"
DabQ_DIR="/Users/Caden/Desktop/Pou2f3_Data/IHC_Images/DAB-quant"
cd $DabQ_DIR
mkdir $ImageDIR/converted_tiffs

for file in $ImageDIR/*.tif; do
	currentName=$(basename $file)
	vips tiffsave $file $ImageDIR/converted_tiffs/new_$currentName --tile --pyramid --compression deflate --tile-width 256 --tile-height 256

done

#cd $ImageDIR/converted_tiffs

python quantify.py --folder=$ImageDIR/converted_tiffs --reprocess --ext=.tif --region_size=100 --num_regions=50

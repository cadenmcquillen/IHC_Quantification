#!/bin/bash

conda activate py38dabquant
ImageDIR="/Users/Caden/Desktop/Pou2f3_Data/IHC_Images/6wk_5858_IHC_quant/"
DabQ_DIR="/Users/Caden/Desktop/Pou2f3_Data/IHC_Images/DAB-quant"
cd $DabQ_DIR
mkdir $ImageDIR/converted_tiffs

for file in $ImageDIR/*.tif; do
	vips tiffsave $file $ImageDIR/converted_tiffs/new_$file --tile --pyramid --compression deflate --tile-width 256 --tile-height 256

done

cd converted_tiffs

python quantify.py --folder=$ImageDIR/converted_tiffs --reprocess --ext=.tif



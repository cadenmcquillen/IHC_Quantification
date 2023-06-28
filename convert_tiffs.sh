#!/bin/bash

conda activate py38dabquant
DIR="/Users/Caden/Desktop/Pou2f3_Data/IHC_Images/6wk_5858_IHC_quant/"
cd $DIR
mkdir converted_tiffs

for file in *.tif; do
	vips tiffsave $file $DIR/converted_tiffs/new_$file --tile --pyramid --compression deflate --tile-width 256 --tile-height 256

done

cd converted_tiffs

python quantify.py --folder=$DIR/converted_tiffs --reprocess --ext=.tif



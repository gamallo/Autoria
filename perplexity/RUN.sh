#!/bin/bash

train=$1

#echo "Generating the models"
sh train.sh  $train

#echo "Making all possible tests"
rm x
for i in corpora/test/*; do  file=`basename "$i"`; 
    sh test.sh $train $file >> x;
    			     
done
cat x |./normalizarZ.perl |sort -g > xx

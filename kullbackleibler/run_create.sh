#!/bin/bash

N=$1
DIR=$2 #test or train

#sh run_create.sh 500 test

for i in  ../corpus/$DIR/*; do echo $i; file=`basename "$i"`; echo $file; cat $i |./tokenizer.perl |sort |uniq -c |sort -nr |head -$N   >  ./$DIR/$file
done

#!/bin/bash

TREINO="../corpus/train"
TEST="../corpus/test"
PROGS="./scripts"
MODEL_TRAIN="./train"
MODEL_TEST="./test"

Target=$1
N=$2

cat $TREINO/$Target |perl tokenizer.perl  |$PROGS/token2freq.perl $N >  $MODEL_TRAIN/$Target

for i in  $TEST/*; do echo $i; file=`basename "$i"`; 
	  cat $i  |perl tokenizer.perl  | $PROGS/token2freq.perl $N >  $MODEL_TEST/$file  
done

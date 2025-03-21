#!/bin/bash

TREINO="../corpus/train"
MODEL="./models"
LEX="./lexicon"


Target=$1
#Test=$2
#Size=$3

#echo "criando ngrams: lm = $Target -- teste = $Test"
#cat $TREINO/$Target  |~/Linguakit-master/linguakit key es |cut -f 1 |sed "s/ /@/g"  |grep -v "^[A-Z]" > $MODEL"/unigram_"$Target".ngram"
cat $TREINO/$Target  |perl tokenizer.perl  > $MODEL"/unigram_"$Target".ngram"

echo "$Target"
cat $MODEL"/unigram_"$Target".ngram" |sed "s/ /_/g" |sort |uniq -c |sort -nr > $LEX/$Target".lx"
#cat $Target.lx |./ranking_new.perl $Test.lx $Size



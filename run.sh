
train=$1

rm corpus/train/*
rm corpus/test/*
rm perplexity/models/*
rm perplexity/corpora/test/*
rm perplexity/corpora/train/*
rm kullbackleibler/test/*
rm kullbackleibler/train/*


cp corpus/all/$1 corpus/test/.
cp corpus/all/* corpus/train/.
rm corpus/train/$train

echo "perplexity"
cd perplexity
sh run_create.sh 10000 test
sh run_create.sh 35000 train
sh RUN.sh $train

cd ../
rm corpus/train/*
rm corpus/test/*
cp corpus/all/$1 corpus/train/.
cp corpus/all/* corpus/test/.
rm corpus/test/$train

cd ./kullbackleibler
echo "KL"
sh run_create.sh 15000 test
sh run_create.sh 15000 train
sh RUN.sh $train

cd ../ranking
echo "ranking" ##N=100
sh RUN.sh $train

cd ../matrix
echo "matrix"
sh RUN.sh $train 15000


cd ../mean
echo "mean"
sh run_mean.sh


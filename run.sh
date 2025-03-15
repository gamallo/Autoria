

train=$1

# Remove files from directories
rm -f corpus/train/*
rm -f corpus/test/*
rm -f perplexity/models/*
rm -f perplexity/corpora/test/*
rm -f perplexity/corpora/train/*
rm -f kullbackleibler/test/*
rm -f kullbackleibler/train/*

# Copy files for training and testing
cp corpus/all/"$train" corpus/test/.
cp corpus/all/* corpus/train/.
rm -f corpus/train/"$train"

# Run perplexity steps
echo "perplexity"
(cd perplexity && sh run_create.sh 10000 test)
(cd perplexity && sh run_create.sh 35000 train)
(cd perplexity && sh RUN.sh "$train")

# Reset corpus directories
rm -f corpus/train/*
rm -f corpus/test/*
cp corpus/all/"$train" corpus/train/.
cp corpus/all/* corpus/test/.
rm -f corpus/test/"$train"

# Run Kullback-Leibler steps
echo "KL"
(cd kullbackleibler && sh run_create.sh 15000 test)
(cd kullbackleibler && sh run_create.sh 15000 train)
(cd kullbackleibler && sh RUN.sh "$train")

# Run ranking steps
echo "ranking" ##N=100
(cd ranking && sh RUN.sh "$train")

# Run matrix steps
echo "matrix"
(cd matrix && sh RUN.sh "$train" 15000)

# Run mean steps
echo "mean"
(cd mean && sh run_mean.sh)


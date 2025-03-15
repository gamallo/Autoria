# Autoria: Authorship attribution

Pablo Gamallo, Miguel Cavadas (CiTIUS, Universidade de Santiago de Compostela)

## Description:
It uses the mean of 4 distance measures (perplexity, kullbackleibler, ranking, and cosine) to compute the distance between the text of an unknown author and the texts of known authors

## Requirements:
* Linux, Bash, Perl
* Perl module: Math::KullbackLeibler::Discrete [Alberto Simões](https://metacpan.org/author/AMBS). 
## How to use:

```
sh run.sh Desconocido_ElburladordeSevilla.txt
```

The final results are in the file `mean/mean.txt`.

The input texts are in directory `corpus/all`

## How to cite:
Cavadas, Miguel, Pablo Gamallo (2022). Automatic Authorship Attribution in the Work of Tirso de Molina. In Ana Dinu et al. (eds.). Recent Advances in Digital Humanities: Romance Language Applications, Peter Lang Edition, (pp. 185-195). DOI 10.3726/b19920.

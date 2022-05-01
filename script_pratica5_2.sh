#!/bin/bash


$url = "https://github.com/owid/covid-19-data/archive/refs/heads/master.zip
wget $url

$path_file1 = "covid-19-data-master/public/data/"
$file1 = "owid-covid-data.csv"
$path_file2 = "covid-19-data-master/public/data/"
$file2 = "owid-covid-codebook.csv"

# Unzip only the two files we need from master.zip file
unzip -j -o master.zip $path_file1$file1 -d $file1
unzip -j -o master.zip $path_file2$file2 -d $file2

# Create a new directory for the data
mkdir -p covid_data

# Move the two files to the new directory and overwrite the old files
mv $file1 covid_data/
mv $file2 covid_data/

# Rename the files to the correct name
mv covid_data/owid-covid-data.csv covid_data/dados-covid-owid.csv
mv covid_data/owid-covid-codebook.csv covid_data/manual-dados-covid-owid.csv









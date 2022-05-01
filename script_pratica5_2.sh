#!/bin/bash


$url = "https://github.com/owid/covid-19-data/archive/refs/heads/master.zip
wget $url

$file1 = "covid-19-data-master/public/data/owid-covid-data.csv"
$file2 = "covid-19-data-master/public/data/owid-covid-codebook.csv"

# Unzip only the two files we need from master.zip file
unzip -j -o master.zip $file1 -d $file1
unzip -j -o master.zip $file2 -d $file2

# Create a new directory for the data
mkdir -p covid_data

# Move the two files to the new directory and overwrite the old files
mv $file1 covid_data/
mv $file2 covid_data/

# Rename the files to the correct name
mv covid_data/owid-covid-data.csv covid_data/dados-covid-owid.csv
mv covid_data/owid-covid-codebook.csv covid_data/manual-dados-covid-owid.csv









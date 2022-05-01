#!/bin/bash


# Function that returns current date and time as AAA-MM-DD,hh:mm,ss
function current_date(){
  date +"%F,%T"
}

# Function that keeps only the 6th and 12th columns of the input file
function keep_columns(){
  awk '{print $6,$12}'
}

# Function that converts first column from KiB to MB
function convert_to_mb(){
  awk '{print $1*0.001024}'
}

# Function that captures top 5 memory consuming processes
function top5memory(){
  top -n 1 -o %MEM | head -n 12 | tail -n 5
}

# Call top5memory function and keep only the 6th and 12th columns
top5memory | keep_columns | convert_to_mb | sort -n | head -n 5



#!/bin/bash


# Function that returns current date and time as AAA-MM-DD,hh:mm,ss
function current_date(){
  date +"%F,%T"
}

# Function that keeps only the 6th and 12th columns of the input file
function keep_columns(){
  awk '{print $13, $6}'
}

# Function that converts first column from KiB to MB
function convert_to_mb(){
  awk '{print $1,sep,",",$2*0.001024}'
}

# Function that captures top 5 memory consuming processes
function top5memory(){
  top -n 1 -o %MEM | head -n 12 | tail -n 5
}

# Add current date and time do each line of the input file
function add_date(){
  while read line; do
    echo "$(current_date), $line MB"
  done
}

# Call and process top5memory function and add current date and time to each line
# Store into memory_top5.log
top5memory | keep_columns | convert_to_mb | add_date > memory_top5.log

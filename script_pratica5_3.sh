#!/bin/bash


# Function that reads a file and keep only the uniques values of 3rd column
function read_file_and_keep_uniques_values {
  # Read the file
  while read line; do
    # Split the line
    IFS=' ' read -ra array <<< "$line"
    # Check if the value is already in the array
    if [[ ! " ${array[2]} " =~ " ${array[2]} " ]]; then
      # Add the value to the array
      array[2]="${array[2]}"
      # Print the array
      echo "${array[@]}"
    fi
  done < "$1"
}
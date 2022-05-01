#!/bin/bash

echo "Verifying if parameter is greater than 2..."
# If true, loop n parameter times
# If false, print that parameter should be greater than 2
if [[ $1 -le 2 ]];
then
  echo "Apenas n >2"
else

  echo "Creating a new file with the name of the loop..."
  for ((i=1; i<=$1; i++))
  do
    touch "interacao_$i.log"
    top -n 1 > "interacao_$i.log"
  done

  echo "Creating folder for even files and one for odd files..."
  mkdir -p backup_par backup_impar

  echo "Copying all files to their respective folder..."
  for ((i=1; i<=$1; i++))
  do
    if [[ $i%2 -eq 0 ]]
    then
      cp "interacao_$i.log" backup_par
    else
      cp "interacao_$i.log" backup_impar
    fi
  done

  echo "Merging even folder and odd folder into a tarball file..."
  tar -cf backup_par_impar.tar backup_par backup_impar

  echo "Cleaning all files generated into root directory..."
  for ((i=1; i<=$1; i++))
  do
    rm "interacao_$i.log"
  done

  echo "Everything done!"
fi

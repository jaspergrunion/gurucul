#!/bin/bash

# Create current date to use in file name
current_date=$(date +"%Y-%m-%d")

# Connect to MySQL
mysql -u root -p"mysql" -e "use gra; select * from analytical_models where enabled=1\G; quit;" > "./gra_models_$current_date.txt"

git add -A
git commit -m "Copying latest Gurucul model configs"


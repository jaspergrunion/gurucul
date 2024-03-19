#!/bin/bash
# Script to pull model configuration files from Gurucul and back up to git

# Create current date to use in file name
# current_date=$(date +"%Y-%m-%d")
current_date=$(date +"%Y-%m-%d-%H-%M-%S")

# Connect to MySQL and pull model configs
mysql -u root -p"mysql" -e "use gra; select * from analytical_models where enabled=1\G; quit;" > "./config_history/gra_models_$current_date.txt"

git add -A config_history/*.txt
git commit -m "Copying latest Gurucul model configs - $current_date"
git push
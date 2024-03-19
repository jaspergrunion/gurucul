#!/bin/bash

current_date=$(date +"%Y-%m-%d")

echo "Current date: $current_date"

# Connect to MySQL
mysql -u root -p"mysql" -e "use gra; select * from analytical_models where enabled=1\G; quit;" > "./gra_models_$current_date.txt"

#!/bin/bash
# Script to pull model configuration files from Gurucul and back up to git
git_dir=$"C:/Users/jgunn/gurucul"
output_dir=$"$git_dir/model_config_tracker/config_history"

echo "Git directory: $git_dir"
echo "Output directory: $output_dir"

# Pull from git to make sure files are synced
echo "Pull latest from Git"
git -C $git_dir pull

# Create current date to use in file name
# current_date=$(date +"%Y-%m-%d")
current_date=$(date +"%Y-%m-%d-%H-%M-%S")
echo "Running model backup for $current_date"

# Connect to MySQL and pull model configs
mysql -h localhost -u root -p"mysql" -e "use gra; select * from analytical_models where enabled=1\G;" > "$output_dir/gra_models_$current_date.txt"

latest_file=$(find $output_dir -type f -print | sort -r | head -1)
echo "Latest file: $latest_file"

compare_file=$(find $output_dir -type f -print | sort -r | head -2 | tail -1)
echo "Compare file: $compare_file"

# Commit files to git only if there is a difference
if cmp -s $latest_file $compare_file; then
    echo "Files are identical, delete latest file"
    rm $latest_file
else
    echo "Files are different, commit to Git"
    echo "File differences:"
    diff $latest_file $compare_file
    git -C $git_dir add -A "$output_dir/*.txt"
    git -C $git_dir commit -m "Copying latest Gurucul model configs - $current_date"
    git -C $git_dir push
fi

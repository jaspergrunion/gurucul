target_dir=$"C:/Users/jgunn/gurucul/model_config_tracker/config_history"

latest_file=$(find $target_dir -type f -print | sort -r | head -1)
echo $latest_file

compare_file=$(find $target_dir -type f -print | sort -r | head -2 | tail -1)
echo $compare_file

if cmp -s $latest_file $compare_file; then
    echo "Files are identical"
else
    echo "Files are different"
    diff $latest_file $compare_file
fi

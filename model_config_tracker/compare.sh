latest_file=$(find $PWD | sort -r | head -1)
echo $latest_file

compare_file=$(find $PWD | sort -r | head -2 | tail -1)
echo $compare_file

diff $latest_file $compare_file

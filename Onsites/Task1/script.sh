# echo "">file4.txt
# # join -1 2 -2 3 -t , file3.txt file1.txt >> file4.txt
# join -e- -1 2 -2 3 -t , <(sort -k 2 file3.txt) <(sort -k 3 file1.txt) >> file4.txt


echo -n "">file5.txt
join -a1 -1 2 -2 1 -t , <(sort -k 2 -t , file1.txt) <(sort -k 1 -t , file2.txt) >> file5.txt

echo -n "">file6.txt
join -a1 -1 3 -2 2 -t , -e'-' -o '0,1.1,1.2,1.4,2.1,2.3' <(sort -k 3 -t , file5.txt) <(sort -k 2 -t , file3.txt) >> file6.txt
# -o 1.1,1.2,1.3,2.2,2.1        -e'-' -o '0,1.4'

# (sort -k 3 -t , file6.txt) >file.txt
sed '1h;1d;$!H;$!d;G' file6.txt >file.txt

rm -f file5.txt
rm file6.txt

# join -1 2 -2 1 -t , <(sort -k2 file1.txt) <(sort -k1 file2.txt) >> file5.txt
# file3.txt


# join -1 2 -2 1 <(sort -k 2 wine.txt) <(sort reviews.txt)

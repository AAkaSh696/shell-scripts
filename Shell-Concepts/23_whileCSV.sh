while IFS="," read id name age
do 
	echo $id
	echo $name
	echo $age
done < test.csv

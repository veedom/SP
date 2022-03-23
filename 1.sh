#!/bin/sh

echo "ya danya"
echo "Current directory:"
pwd
while true; do
echo "Enter username:"
read username
if grep $username /etc/passwd
then
break
else
echo "User not found.Again?(y/n)"
read yn
if [$yn = Y]
then 
continue
else
echo "Done"
break
fi
fi
done

read -p "Enter filename: " fname
if [ -f $fname ]; then
	echo "Your rwx rights for file $fname"
	ls -l $fname | awk "{print $1}" | cut -c 2-4
else
	echo "No such file"
fi

while true; do
	read -p "Do you want to continue? (y/n)" yn
	case $yn in
		[Yy]* ) read -p "Enter filename: " fname
			if [ -f $fname ]; then
				echo "Your rwx rights for file $fname"
				ls -l $fname | awk "{print $1}" | cut -c 2-4
			else
				echo "No such file"
			fi;;
		[Nn]* ) exit;;
		* ) echo "Please enter y(Y) or n(N)"
	esac
done

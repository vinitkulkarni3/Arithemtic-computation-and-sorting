#!/bin/bash

declare -A arr
k=0;
n=1;
echo "Enter three numbers:"
read num1
read num2
read num3

while [ $n -gt 0 ]
do
echo "1.(a+b*c) 2.(a*b+c) 3.(c+a/b) 4.(a%b+c)"
read -p "Enter the option: " option

case $option in
	1)answer1=`echo - | awk '{print '$num1' + '$num2'}'`
	answer1=$(($answer1*$num3))
	echo "Answer = "$answer1
	arr[$k]=$answer1
	((k++))
	;;
	2)answer2=$(($num1*$num2))
	answer2=$(($answer2+$num3))
	echo "Answer = "$answer2
	arr[$k]=$answer2
	((k++))
	;;
	3)answer3=$(($num3+$num1))
	answer3=`echo - | awk '{print '$answer3' / '$num2'}'`
	echo "Answer = "$answer3
	arr[$k]=$answer3
	((k++))
	;;
	4)answer4=`echo - | awk '{print '$num1' % '$num2'}'`
	answer4=$(($answer4+$num3))
	echo "Answer = "$answer4
	arr[$k]=$answer4
        ((k++))
	;;
	*)echo "Invalid option"
	;;
esac
	echo "press 0 to exit press 1 to continue"
	read e
	n=$e
done

echo "Dictionary elements are : "${arr[@]}

echo ""
range=${#arr[@]}
for (( i=0; i<$range; i++ ))
do
        arrstore[$i]=${arr[$i]}
done
echo "Array elements are: "${arrstore[@]}


echo ""
ran=${#arrstore[@]}
for (( i=0; i<$ran; i++ ))
do
        for (( j=$i+1; j<$ran; j++))
        do
        #x=$(($i+1))
        #echo "----------"$x
        if [ ${arrstore[$i]} -gt ${arrstore[$j]} ]
        then
                #echo "++++"$x
                temp=${arrstore[$i]}
                arrstore[$i]=${arrstore[$j]}
                arrstore[$j]=$temp
        fi
        done
done

echo "Descending order: "${arrstore[@]}

rrr=${#arrstore[@]}
for (( i=0; i<$rrr; i++ ))
do
        for (( j=$i+1; j<$rrr; j++))
        do
        if [ ${arrstore[$i]} -lt ${arrstore[$j]} ]
        then
                #echo "++++"$x
                temp=${arrstore[$i]}
                arrstore[$i]=${arrstore[$j]}
                arrstore[$j]=$temp
        fi
        done
done

echo "Ascending order: "${arrstore[@]}

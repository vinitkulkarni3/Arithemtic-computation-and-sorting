#!/bin/bash

echo "Enter three numbers:"
read num1
read num2
read num3

echo "1.(a+b*c) 2.(a*b+c)"
read -p "Enter the option: " option

case $option in
	1)answer1=`echo - | awk '{print '$num1' + '$num2'}'`
	answer1=$(($answer1*$num3))
	echo "Answer = "$answer1
	;;
	2)answer2=$(($num1*$num2))
	answer2=$(($answer2+$num3))
	echo "Answer ="$answer2
	;;
	*)echo "Invalid option"
	;;
esac


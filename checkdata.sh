#!/bin/bash

while read line
do
	awk -F [,] '{if (NF <=10) printf("%d:%s",NR,$0)}' var=$line
done < data.csv

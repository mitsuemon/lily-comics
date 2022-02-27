#!/bin/bash

while read line
do
	awk -F [,] '{if (NF <=10) printf("%d:%s",NR,$0)}' var=$line
done < data.csv

tmpfile="/tmp/checkdata.sh.$$"

git diff > ${tmpfile}
grep '^+9784' ${tmpfile} | awk -F , '{printf("- %s\n",$4)}'
rm ${tmpfile}

#!/bin/bash

cards_list=(
	"rtx3060"
	"rtx3070"
	"rtx3080"
	"rtx3090"
	"rx6700"
)

base_url="http://0.0.0.0:5000/";

function make_sales_report () {
	
	echo "$(date)" >> ~/exam_FREMONT/exam_bash/sales.txt;
	
	for card in ${cards_list[@]}; do
		number=$(curl -s "${base_url}${card}");
		line_to_add="${card}:${number}";
		echo $line_to_add >> ~/exam_FREMONT/exam_bash/sales.txt;
	done
}

make_sales_report;
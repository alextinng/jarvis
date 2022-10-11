#!/bin/bash

function ceil() {
    floor=$(echo "scale=0;$1/1" | bc -l) # 向下取整
    add=$(awk -v num1=$floor -v num2=$1 'BEGIN{print(num1<num2)?"1":"0"}')
    echo $(( floor + add ))
}

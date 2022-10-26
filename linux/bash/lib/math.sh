#!/bin/bash

function plus() {
    local n1=$1
    local n2=$2
    local scale=$3
    if [[ "x:$scale" == "x:" ]]; then
        scale=2
    fi

    echo $(echo "scale=$scale;$n1+$n2" | bc)
}

function sub() {
    local n1=$1
    local n2=$2
    local scale=$3
    if [[ "x:$scale" == "x:" ]]; then
        scale=2
    fi

    echo $(echo "scale=$scale;$n1-$n2" | bc)
}

function multi() {
    local n1=$1
    local n2=$2
    local scale=$3
    if [[ "x:$scale" == "x:" ]]; then
        scale=2
    fi

    echo $(echo "scale=$scale;$n1*$n2" | bc)
}

function div() {
    local n1=$1
    local n2=$2
    local scale=$3
    if [[ "x:$scale" == "x:" ]]; then
        scale=2
    fi

    echo $(echo "scale=$scale;$n1/$n2" | bc)
}

function ceil() {
    floor=$(echo "scale=0;$1/1" | bc -l) # 向下取整
    add=$(awk -v num1=$floor -v num2=$1 'BEGIN{print(num1<num2)?"1":"0"}')
    echo $((floor + add))
}

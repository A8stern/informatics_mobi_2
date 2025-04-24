#!/bin/bash

decimal_to_binary() {
    local decimal=$1
    local binary=$(echo "obase=2; $decimal" | bc)
    
    while [ ${#binary} -lt 8 ]; do
        binary="0$binary"
    done

    echo "$binary"
}

if [ -z "$1" ]; then 
    echo "Not found any entered data, pls enter IPv4-adress"
    exit 1
fi

o1=$(echo "$1" | cut -d '.' -f 1)
o2=$(echo "$1" | cut -d '.' -f 2)
o3=$(echo "$1" | cut -d '.' -f 3)
o4=$(echo "$1" | cut -d '.' -f 4)

echo "$o1.$o2.$o3.$o4"

if ! [[ "$o1" =~ ^[0-9]+$ && "$o2" =~ ^[0-9]+$ && "$o3" =~ ^[0-9]+$ && "$o4" =~ ^[0-9]+$ ]]; then
    echo "Invalid IPv4 address"
    exit 1
fi

b1=$(decimal_to_binary "$o1")
b2=$(decimal_to_binary "$o2")
b3=$(decimal_to_binary "$o3")
b4=$(decimal_to_binary "$o4")

echo "$b1.$b2.$b3.$b4"

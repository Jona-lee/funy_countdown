#!/bin/sh

############################
# global digit array      ##
############################
num1arr0="       00000     "
num1arr1="   000000000     "
num1arr2="  0000  0000     "
num1arr3="        0000     "
num1arr4="        0000     "
num1arr5="        0000     "
num1arr6="        0000     "
num1arr7="        0000     "

num2arr0="    00000000     "
num2arr1="  0000000000000  "
num2arr2=" 00000    00000  "
num2arr3="          00000  "
num2arr4="        00000    "
num2arr5="    00000        "
num2arr6=" 00000000000000  "
num2arr7=" 00000000000000  "

num3arr0="   00000000000   "
num3arr1=" 000000   00000  "
num3arr2="          00000  "
num3arr3="     00000000    "
num3arr4="     000000000   "
num3arr5="           0000  "
num3arr6=" 00000     0000  "
num3arr7="  000000000000   "

num4arr0="         00000   "
num4arr1="       0000000   "
num4arr2="     000000000   "
num4arr3="    000   0000   "
num4arr4="  0000    0000   "
num4arr5=" 000000000000000 "
num4arr6="         000000  "
num4arr7="          0000   "

num5arr0="  0000000000000  "
num5arr1="  0000           "
num5arr2="  0000           "
num5arr3=" 0000000000000   "
num5arr4="           0000  "
num5arr5="   0       00000 "
num5arr6=" 0000     00000  "
num5arr7="   00000000000   "

num6arr0="     00000000    " 
num6arr1="  0000000000000  "
num6arr2=" 00000     000   "
num6arr3=" 00000           "
num6arr4=" 00000000000000  "
num6arr5=" 00000     00000 "
num6arr6="  0000000000000  "
num6arr7="     0000000     "

num7arr0=" 00000000000000  "
num7arr1=" 000000000000000 "
num7arr2="          0000   "
num7arr3="        00000    "
num7arr4="       00000     "
num7arr5="     00000       "
num7arr6="    00000        "
num7arr7="    00000        "
     
num8arr0="   00000000000   "
num8arr1=" 00000    00000  "
num8arr2=" 00000    00000  "
num8arr3="   0000000000    "
num8arr4="  000000000000   "
num8arr5=" 00000     0000  "
num8arr6=" 00000     0000  "
num8arr7="  000000000000   "

num9arr0="  000000000000   "
num9arr1=" 00000    00000  "
num9arr2=" 0000      0000  "
num9arr3=" 00000    000000 "
num9arr4="   0000000000000 "
num9arr5="           0000  "
num9arr6=" 00000    00000  "
num9arr7="   0000000000    "

num0arr0="      00000      " 
num0arr1="   00000000000   "
num0arr2=" 00000    00000  "
num0arr3=" 0000      00000 "
num0arr4=" 0000      00000 "
num0arr5=" 00000     0000  "
num0arr6="  00000  000000  "
num0arr7="    000000000    "

echonum () {
    local i=0 && local num=$1
    local n4th=$(($num/1000))
    local n3th=$(($num%1000/100))
    local n2th=$(($num%100/10))
    local n1th=$(($num%10))
    
    for i in 0 1 2 3 4 5 6 7 8
        do   
        if [ $n4th -gt 0 ];then 
            local sdigit="\"\${num${n4th}arr$i}\""
        else
            local sdigit=""
        fi
        if [ $n4th -eq 0 ] && [ $n3th -eq 0 ];then
           hdigit=""
        else
            local hdigit="\"\${num${n3th}arr$i}\""
        fi
        if [ $n4th -eq 0 ] && [ $n3th -eq 0 ] && [ $n2th -eq 0 ];then
            ddigit=""
        else
            local ddigit="\"\${num${n2th}arr$i}\""
        fi
        local udigit="\"\${num${n1th}arr$i}\""
        linestr=`eval "echo $sdigit $hdigit $ddigit $udigit"`
        echo -e "\033[32;1m$linestr\033[1m"
    done
}

#######################
## count down main   ##
#######################
i=$1
while true
do
if [ -z "$i" ] || [ $i -le 0 ];then
    break
fi 
i=$((i-1))
echonum $i
sleep 1
done

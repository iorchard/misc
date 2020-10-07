#!/bin/bash
# Modified from https://ceph.io/geen-categorie/ceph-rbd-objects-placement/
# by Heechul Kim.

if [ -z ${1} ] || [ -z ${2} ];
then
    echo "USAGE: ./rbd_loc.sh <pool> <image>"
    exit 1
fi

declare -a osds

rbd_prefix=$(sudo rbd -p ${1} info ${2} | grep block_name_prefix | awk '{print $2}')
c=$(sudo rados -p volumes ls |grep rbd_data.332b48c4292ac |wc -l)
echo "There are $c objects for ${2}"

n=0
for b in $(sudo rados -p ${1} ls | grep ${rbd_prefix})
do
  # osdmap e452 pool '$1' (3) object '$b' -> pg 3.5ecaadff (3.1ff) -> 
  # up ([12,11,14], p12) acting ([12,11,14], p12)
  out=$(sudo ceph osd map ${1} ${b} |grep -P -m1 -o "\[([\d,]+)\]" |head -1 |tr -d '[]')
  IFS=',' read -r -a tmp_arr <<< "$out"
  for i in ${tmp_arr[@]}; do
    if [[ ! "${osds[@]}" =~ "${i}" ]]; then
      echo "not exist. add it to osds."
      osds+=(${i})
    fi
  done
  n=$(($n+1))
  echo "$n/$c objects processed."
done

echo "osds ${2} objects are in: ${osds[@]}"


#!/bin/bash
# Generate random dirs/files with random size and random content.
#

USAGE() {
    echo "Usage: $0 [-n <num_files>] [-d <dir>] [-i <interval_sec>]
	Description
        -n: the number of files to creates. (default: 4)
		-d: the directory to create files. (default: current directory)
		-i: the interval of creating files in seconds. (default: 0)
	"
    exit 1
}

# Check arguments.
while getopts d:n:i: opt
do
    case "${opt}" in
        d)
            DIR="${OPTARG}"
            ;;
        n)
            NUM="${OPTARG}"
            ;;
        i)
            INTERVAL="${OPTARG}"
            ;;
        \?)
            USAGE
            exit 1
            ;;
    esac
done

NUM=${NUM:-4}
DIR=${DIR:-'.'}
INTERVAL=${INTERVAL:-0}

# Check if the directory ${DIR} exists.
if [[ ! -d "${DIR}" ]]
then
    echo "Warn) No such directory: ${DIR}. Use the current directory."
	DIR="."
fi
if [ ${NUM} -lt 4 ]
then
    NUM=4  # it should be at least 4.
fi
# Create tmp subdir names.
# num_subdirs is chosen from 2 to half of the num_files.
NUM_SUBDIRS=$(shuf -i 2-$(($NUM/2)) -n 1)
echo "Info) The chosen number of subdirs is ${NUM_SUBDIRS}."
DIRS[0]=${DIR}
for (( i=1; i<=${NUM_SUBDIRS}; i++))
do
	DIRS[i]=${DIR}/$(basename $(mktemp -d -u))
done

for (( c=1; c<=${NUM}; c++))
do
	i=$(($c%$NUM_SUBDIRS))
	echo "Creating a file ${DIRS[$i]}/rfile.${c}."
	if [ ! -d ${DIRS[$c]} ]
	then
		mkdir -p ${DIRS[$c]}
	fi
	dd bs=512 count=$RANDOM skip=$RANDOM </dev/urandom >${DIRS[$i]}/rfile.${c}
	sleep ${INTERVAL}
done

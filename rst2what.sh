#!/bin/bash
# rst2what.sh: Convert rst file to whatever file using pandoc.
#

USAGE() {
    echo "Usage: $0 -f <infile> -t [pdf|docx|...] [-o <outfile>] " 1>&2
    exit 1
}
INFILE=""
OTYPE=""
OUTFILE=""

# Check arguments.
while getopts f:t:o: opt
do
    case "${opt}" in
        f)
            INFILE="${OPTARG}"
            ;;
        t)
            OTYPE="${OPTARG}"
            ;;
        o)
            OUTFILE="${OPTARG}"
            ;;
        \?)
            USAGE
            exit 1
            ;;
    esac
done

# Check if ${INFILE} exists.
if [ ! -f "${INFILE}" ]
then
    echo "Error) No such file: ${INFILE}"
    USAGE
    exit 1
fi
# Check if the directory of ${OUTFILE} exists.
if [ "${OUTFILE}" == "" ]
then
    DIR="."
else
    DIR=$(dirname ${OUTFILE})
fi
OUTFILE=$(basename ${INFILE} | cut -d'.' -f1)

if [ ! -d "${DIR}" ]
then
    echo "Warn) No such directory: ${DIR}."
fi

case $OTYPE in
    pdf)
        echo "Info) Convert to pdf."
        echo "Debug) pandoc -s --latex-engine=xelatex -o ${DIR}/${OUTFILE}.pdf -V mainfont='NanumMyeongjo' ${INFILE}"
        pandoc -s --latex-engine=xelatex \
            -o ${DIR}/${OUTFILE}.pdf \
            -V mainfont='NanumMyeongjo' ${INFILE}
        ;;
    *)
        echo "Info) Convert to ${OTYPE}."
        echo "Debug) pandoc -s -t ${OTYPE} -o ${DIR}/${OUTFILE}.${OTYPE} ${INFILE}"
        pandoc -s -t ${OTYPE} -o ${DIR}/${OUTFILE}.${OTYPE} ${INFILE}
esac


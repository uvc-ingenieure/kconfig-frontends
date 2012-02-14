#!/bin/sh

if [ "${1}" = "--plain" ]; then
    plain=1
else
    plain=0
fi

k_ver="$(  head -n 1 .version |cut -d ' ' -f 1  )"
k_cset="$( head -n 1 .version |cut -d ' ' -f 2  )"
k_name="$( head -n 1 .version |cut -d ' ' -f 3- )"
kf_ver="$( tail -n 1 .version                   )"

k_ver_plain="$( echo "${k_ver}" |sed -r -e 's/-rc[[:digit:]]+$//;' )"

case "${k_ver}" in
    *-rc*)  k_ver_extra="_$( printf "%-7.7s" "${k_cset}" )";;
    *)      k_ver_extra="";;
esac
k_ver_extra="$( echo "${k_ver_extra}" |tr '-' '_' )"

case "${kf_ver}" in
    hg) kf_ver="-hg_$( hg id -i -r . )";;
    "") kf_ver="";;
    *)  kf_ver="-${kf_ver}";;
esac

if [ "${plain}" -eq 1 ]; then
    echo "${k_ver_plain}"
else
    echo "${k_ver}${k_ver_extra}${kf_ver}"
fi


#!/bin/sh

k_ver="$(  head -n 1 .version |cut -d ' ' -f 1  )"
k_cset="$( head -n 1 .version |cut -d ' ' -f 2  )"
k_name="$( head -n 1 .version |cut -d ' ' -f 3- )"
kf_ver="$( tail -n 1 .version                   )"

case "${k_ver}" in
    *-rc*)  k_ver="${k_ver}_$( printf "%-7.7s" "${k_cset}" )";;
    *)      ;;
esac
k_ver="$( echo "${k_ver}" |tr '-' '_' )"

case "${kf_ver}" in
    hg) kf_ver="-hg_$( hg id -i -r . )";;
    "") kf_ver="";;
    *)  kf_ver="-${kf_ver}";;
esac

echo "${k_ver}${kf_ver}"

#!/bin/sh

my_name="${0##*/}"

# If an argument is given, it's the location
# of the Linux kernel source tree
k_dir="${1}"
if [ -n "${k_dir}" -a -d "${k_dir}/kernel" ]; then
    # Get the version
    eval $( head -n 5 "${k_dir}/Makefile"               \
            |sed -r -e 's/^/K_/; s/ = ?/="/; s/$/"/;'   \
          )
    printf "Found Linux kernel %d.%d.%d%s '%s'\n"           \
          "${K_VERSION}" "${K_PATCHLEVEL}" "${K_SUBLEVEL}"  \
          "${K_EXTRAVERSION}" "${K_NAME}"
else
    if [ -n "${k_dir}" ]; then
        printf "%s: \`%s': not a Linux kernel source tree\n"    \
               "${my_name}" "${k_dir}"
    else
        printf "Usage: %s /path/to/kernel/dir\n" "${my_name}"
    fi
    exit 1
fi

exec <misc/kernel2kfrontends.list

while read k_file trash kf_file; do
    cp -v "${k_dir}/${k_file}" "${kf_file}"
    if [ -f "${kf_file}.patch" ]; then
        patch --no-backup-if-mismatch -g0 -F1 -p1 -f <"${kf_file}.patch"
    fi
done

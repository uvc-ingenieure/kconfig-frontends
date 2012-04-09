#!/bin/sh

my_name="${0##*/}"

# If an argument is given, it's the location
# of the Linux kernel source tree
k_dir="${1}"
if [ ! \( -n "${k_dir}" -a -d "${k_dir}/kernel" \) ]; then
    if [ -n "${k_dir}" ]; then
        printf "%s: \`%s': not a Linux kernel source tree\n"    \
               "${my_name}" "${k_dir}"
    else
        printf "Usage: %s /path/to/kernel/dir\n" "${my_name}"
    fi
    exit 1
fi

# Get the kernel version
eval $( head -n 5 "${k_dir}/Makefile"                       \
        |sed -r -e 's/^/K_/; s/"//g; s/ = ?/="/; s/$/"/;'   \
      )
k_cset="$( cd "${k_dir}";                   \
           git log -n 1 --pretty='format:%H' \
         )"
printf "Found Linux kernel %d.%d.%d%s '%s' (%7.7s)\n"   \
       "${K_VERSION}" "${K_PATCHLEVEL}" "${K_SUBLEVEL}" \
       "${K_EXTRAVERSION}" "${K_NAME}" "${k_cset}"

# Get the kconfig-frontends version
kf_version="$( tail -n 1 .version )"

# Store the new version
printf "%d.%d.%d%s %s %s\n%s\n"             \
       "${K_VERSION}" "${K_PATCHLEVEL}"     \
       "${K_SUBLEVEL}" "${K_EXTRAVERSION}"  \
       "${k_cset}" "${K_NAME}"              \
       "${kf_version}"                      \
       >.version

exec <scripts/kernel2kfrontends.list
while read k_file trash kf_file; do
    mkdir -p "${kf_file%/*}"
    cp -v "${k_dir}/${k_file}" "${kf_file}"
    if [ -f "${kf_file}.patch" ]; then
        patch --no-backup-if-mismatch -g0 -F1 -p1 -f <"${kf_file}.patch"
    fi
done

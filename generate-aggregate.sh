#!/usr/bin/env sh

# Name of the playlists aggregate file
aggregate_file="aggregate.m3u"

# Replace existing playlist file and adds M3U content header
echo -e "#EXTM3U\n" > $aggregate_file

# Sort, deduplicate, sanitize and append found URLs
for fp in $(ls -R1 **/*.{pls,m3u}); do
    grep -E '^.*http.*$' $fp | \
        sed -e 's/^.*\(http.*\)$/\1/g' \
            -e 's/[^[:print:]]//g'
done | sort -bi | uniq >> $aggregate_file

exit 0

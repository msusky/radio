#!/usr/bin/env sh

# Name of the playlists aggregate file
aggregate_file="aggregate.m3u"

# Replace existing playlist file and adds M3U content header
echo -e "#EXTM3U\n" > $aggregate_file

# Append found URLs of playlist files located in current directory
for fp in $(ls -R1 **/*.{pls,m3u}); do
    grep -E '^.*=http[s]?://.*$' $fp | \
        sed -e 's/^File[[:digit:]]=\(.*\)$/\1/g' >> $aggregate_file
done

exit 1

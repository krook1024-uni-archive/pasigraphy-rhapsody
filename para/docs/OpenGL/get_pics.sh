#!/usr/bin/env sh

rm *.png

for i in {1..6}; do
    curl -Lo "$i.jpg" https://picsum.photos/500
    convert "$i.jpg" "$i.png"
done

rm *.jpg

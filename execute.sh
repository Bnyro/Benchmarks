#!/usr/bin/bash

# build all the programs
zig build-exe -lc -O ReleaseFast zig.zig
go build -ldflags "-s -w" golang.go
rustc -C opt-level=3 rust.rs
v -prod -no-bounds-checking -prealloc v.v
crystal build --release crystal.cr
gcc c.c -O3 -o c
nim c -d:release nim.nim 2> /dev/null

# benchmark a program by build size and execution time
benchmark() {
  echo ""
  echo "-----------------"
  echo "$1"
  actualsize=$(du -k "$1" | cut -f 1)
  echo "Size: $actualsize kb"
  start=`date +%s%3N`
  ./$1 > /dev/null
  end=`date +%s%3N`
  echo Execution time: `expr $end - $start` ms
  echo "-----------------"
}

# benchmark all the programs
for lang in zig c rust golang v crystal nim; do
  benchmark $lang
  rm "$lang"
done

# final cleanup
rm zig.o

#!/usr/bin/bash

# build all the programs
zig build-exe zig.zig
go build golang.go
rustc rust.rs
v v.v
crystal build crystal.cr
gcc c.c -o c

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
for lang in zig c rust golang v crystal; do
  benchmark $lang
  rm "$lang"
done

# final cleanup
rm zig.o

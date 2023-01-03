package main

import "fmt"

func main() {
	fmt.Println(fib(42))
}

func fib(n uint32) uint32 {
	if n <= 1 {
		return n
	}
	return fib(n - 1) + fib(n - 2);
}
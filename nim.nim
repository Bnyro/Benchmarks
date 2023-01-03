proc fib(n: int): int =
  if n <= 1:
    result = n
  else:
    result = fib(n - 1) + (n - 2).fib

echo fib 42
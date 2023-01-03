const std = @import("std");

pub fn main() !void {
    const writer = std.io.getStdOut().writer();
    try writer.print("{}", .{fib(42)});
}

fn fib(n: u32) u32 {
    if (n <= 1) return n;
    return fib(n - 1) + fib(n - 2);
}

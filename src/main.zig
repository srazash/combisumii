const std = @import("std");
const rand = std.rand;

pub fn main() !void {
    const stdout = std.io.getStdOut().writer();
    try stdout.print("RNG: {d}\n", .{rng()});
}

fn rng() !i32 {
    try return rand.Random.int(1...100);
}
const std = @import("std");

pub fn main() !void {
    const stdout = std.io.getStdOut().writer();
    try stdout.print("RNG: {d}\n", .{rng(0,1)});
}

fn rng(lower: u8, upper: u8) !u8 {
    // note: the lower and upper values are inclusive
    var prng = std.rand.DefaultPrng.init(blk: {
        var seed: u64 = undefined;
        try std.os.getrandom(std.mem.asBytes(&seed));
        break :blk seed;
    });
    const rand = prng.random();
    
    try return rand.intRangeAtMost(u8, lower, upper);
}
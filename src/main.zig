const std = @import("std");

pub fn main() !void {
    const stdout = std.io.getStdOut().writer();
    var counter: u8 = 0;
    var limit: u8 = try rng(1, 255);
    while (counter < limit) : (counter += 1)  {
        try stdout.print("PseudoRNG {d}/{d}: {d}\n", .{counter+1, limit, rng(1, 100)});
    }
}

fn rng(lower: u8, upper: u8) !u8 {
    // note: both the lower and upper values are inclusive
    var prng = std.rand.DefaultPrng.init(blk: {
        var seed: u64 = undefined;
        try std.os.getrandom(std.mem.asBytes(&seed));
        break :blk seed;
    });
    const rand = prng.random();
    
    try return rand.intRangeAtMost(u8, lower, upper);
}
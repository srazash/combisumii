const std = @import("std");

pub fn main() !void {
    const stdout = std.io.getStdOut().writer();
    const stdin = std.io.Reader;

    const array = std.ArrayList;
    const alloc = std.heap.page_allocator;

    var candidates = array(u8).init(alloc);

    try stdout.print("What is the target? :", .{});
    var target: u8 = try stdin.read();
    try stdout.print("\n\n", .{}); // generates error --- why?

    var arraylen: u8 = 1;
    while (arraylen <= try rng(1, 100)) : (arraylen += 1) {
        try candidates.append(try rng(1, 50));
    }

    try stdout.print("# of candidates: {d}\n", .{candidates.items.len});
    try stdout.print("Candidates: {d}\n", .{candidates.items});

    //const target: u8 = 30; // chnaged target to const
    //var target: u8 = try rng(1,30);

    try stdout.print("Target: {d}\n", .{target});

    // TEST CODE COMMENTED OUT :)
    // var counter: u8 = 1;
    // var limit: u8 = try rng(1, 255);
    // while (counter <= limit) : (counter += 1)  {
    //     try stdout.print("PseudoRNG {d}/{d}: {d}\n", .{counter, limit, rng(1, 100)});
    // }
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

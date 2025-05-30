const std = @import("std");
const debug_print = std.debug.print;

pub fn main() !void {
    //var unordered_array = [_]i8{ 45, 1, -78, -9, 100 };
    //var unordered_array = [_]i8{ 0, 1, 78, -9, 30 };
    var unordered_array = [_]i8{ 5, 2, 4, 3, 0, 1 };
    var swapper: i8 = undefined;
    debug_print("unordered_array: {any}\n", .{unordered_array});

    // unordered_array[1], unordered_array[0] = .{ unordered_array[0], unordered_array[1] };
    for (unordered_array, 0..) |_, outer_index| {
        if (outer_index == unordered_array.len - 1) {
            break;
        }
        if (unordered_array[outer_index - 1] > unordered_array[outer_index]) {
            swapper = unordered_array[outer_index - 1];
            unordered_array[outer_index - 1] = unordered_array[outer_index];
            unordered_array[outer_index] = swapper;
        }
        debug_print("outer_index: {any}\n", .{outer_index});
        debug_print("unordered_array: {any}\n", .{unordered_array});
    }

    debug_print("unordered_array: {any}\n", .{unordered_array});
}

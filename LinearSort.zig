const std = @import("std");
const debug_print = std.debug.print;
pub fn main() !void {
    const unordered_array = [_]i8{ 45, 1, -78, -9, 100 };
    var ordered_array: [unordered_array.len]i8 = undefined;
    debug_print("unordered_array: {any}\n", .{unordered_array});

    var smallest = unordered_array[0];
    var first_compare = unordered_array[0];
    var second_compare = unordered_array[1];

    if (first_compare < second_compare) {
        ordered_array[0] = first_compare;
    } else {
        ordered_array[0] = second_compare;
    }

    first_compare = unordered_array[1];
    second_compare = unordered_array[2];

    if (first_compare < second_compare) {
        ordered_array[1] = first_compare;
    } else {
        ordered_array[1] = second_compare;
    }

    for (ordered_array, 0..) |_, h| {
        for (unordered_array.len - 1, 0..unordered_array.len - 1) |_, i| {
            first_compare = unordered_array[i];
            second_compare = unordered_array[i + 1];

            debug_print("ordered_array[h]{any}\t", .{ordered_array[h]});
            debug_print("smallest{any}\n", .{smallest});
            if (smallest != ordered_array[h]) {
                if (first_compare < smallest and second_compare < smallest) {
                    if (first_compare < second_compare) {
                        smallest = first_compare;
                    } else {
                        smallest = second_compare;
                    }
                }
            }
            debug_print("first_compare: {any}\t", .{first_compare});
            debug_print("second_compare: {any}\t", .{second_compare});
            debug_print("smallest: {any}\n", .{smallest});
        }
        debug_print("smallest: {any}\n\n", .{smallest});
        ordered_array[h] = smallest;
        debug_print("ordered_array[{any}]: {any}\n\n\n", .{ h, ordered_array[h] });
    }
    debug_print("ordered_array: {any}\n", .{ordered_array});
}

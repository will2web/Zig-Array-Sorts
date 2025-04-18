const std = @import("std");
const debug_print = std.debug.print;
pub fn main() !void {
    //var unordered_array = [_]i8{ 45, 1, -78, -9, 100 };
    //var unordered_array = [_]i8{ 0, 1, 78, -9, 30 };
    var unordered_array = [_]i8{ 5, 2, 4, 3, 0, 1 };

    debug_print("unordered_array: {any}\n", .{unordered_array});

    var smallest: i8 = undefined;
    var first_compare: i8 = undefined;
    var second_compare: i8 = undefined;

    var smallest_index: usize = undefined;
    var place_holder: i8 = undefined;

    for (unordered_array, 0..) |_, outer_index| {
        if (outer_index == unordered_array.len - 1) {
            break;
        }
        debug_print("outer_index: {any}\n", .{outer_index});
        smallest = unordered_array[outer_index];
        smallest_index = outer_index;
        for (unordered_array.len - 1 - outer_index, outer_index..unordered_array.len - 1) |_, i| {
            debug_print("i: {any}\t", .{i});
            first_compare = unordered_array[i];

            debug_print("first_compare: {any}\t", .{first_compare});

            second_compare = unordered_array[i + 1];
            debug_print("second_compare: {any}\t", .{second_compare});

            if (first_compare < smallest or second_compare < smallest) {
                if (first_compare < second_compare) {
                    smallest_index = i;
                    smallest = first_compare;
                } else if (second_compare < first_compare) {
                    smallest = second_compare;
                    smallest_index = i + 1;
                }
            }

            debug_print("smallest: {any}\t", .{smallest});
            debug_print("smallest_index:{}\n", .{smallest_index});
        }

        place_holder = unordered_array[outer_index];
        unordered_array[outer_index] = smallest;
        unordered_array[smallest_index] = place_holder;
        smallest = unordered_array[0];
        debug_print("pass#{any}: unordered_array: {any}\n\n", .{ outer_index, unordered_array });
    }
}

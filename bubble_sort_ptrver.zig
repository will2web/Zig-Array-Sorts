const std = @import("std");
const debug_print = std.debug.print;

pub fn main() !void {
    //var unordered_array = [_]i8{ 45, 1, -78, -9, 100 };
    //var unordered_array = [_]i8{ 0, 1, 78, -9, 30 };
    var unordered_array = [_]i8{ 5, 2, 4, 3, 0, 1 };
    //    const array_pointer: [*]const i8 = &unordered_array;
    var array_pointer: [*]i8 = &unordered_array;
    //var array_pointer: *[unordered_array.len]i8 = &unordered_array;

    //    var swapper: i8 = undefined;
    debug_print("unordered_array: {any}\n", .{unordered_array});
    debug_print("array_pointer: {any}\n", .{array_pointer});
    debug_print("array_pointer + 1: {any}\n", .{array_pointer + 1});
    debug_print("array_pointer + unordered_array.len-1: {any}\n", .{array_pointer + unordered_array.len - 1});
    debug_print("BEGIN FOR LOOP\n\n", .{});
    for (&unordered_array) |*elem| {
        if (@intFromPtr(elem) == @intFromPtr(array_pointer + unordered_array.len - 1)) {
            //if (elem.* == unordered_array[unordered_array.len - 1]) { //this works, in case the pointer version doesn't
            break;
        }
        debug_print("elem.*: {any}\t", .{elem.*});
        debug_print("elem: {*}\t", .{elem});
        debug_print("elem - 1: {*}\t", .{elem - 1});
        debug_print("&elem: {any}\n", .{&elem});
        debug_print("&unordered_array: {any}\n", .{&array_pointer});
        debug_print("unordered_array slice: {any}\n", .{array_pointer[0..]});
        debug_print("Pointer Address: {any}\n", .{array_pointer});
        //debug_print("Reference Value: {any}\n", .{array_pointer});
        debug_print("\n", .{});

        // if (elem-1 > unordered_array[outer_index]) {
        //     swapper = unordered_array[outer_index - 1];
        //     unordered_array[outer_index - 1] = unordered_array[outer_index];
        //     unordered_array[outer_index] = swapper;
        // }
    }

    // unordered_array[1], unordered_array[0] = .{ unordered_array[0], unordered_array[1] };
    // for (&unordered_array) |*outer_index| {
    //     if (outer_index == unordered_array.len) {
    //         break;
    //     }
    //     if (unordered_array[outer_index - 1] > unordered_array[outer_index]) {
    //         swapper = unordered_array[outer_index - 1];
    //         unordered_array[outer_index - 1] = unordered_array[outer_index];
    //         unordered_array[outer_index] = swapper;
    //     }
    //     debug_print("outer_index: {any}\n", .{outer_index});
    //     debug_print("unordered_array: {any}\n", .{unordered_array});
    // }

    debug_print("unordered_array: {any}\n", .{unordered_array});
}

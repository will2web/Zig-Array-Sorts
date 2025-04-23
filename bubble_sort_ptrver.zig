const std = @import("std");
const debug_print = std.debug.print;

pub fn main() !void {
    //var unordered_array = [_]i8{ 45, 1, -78, -9, 100 };
    //var unordered_array = [_]i8{ 0, 1, 78, -9, 30 };
    var unordered_array = [_]i8{ 5, 2, 4, 3, 0, 1 };
    //    const array_pointer: [*]const i8 = &unordered_array;
    var array_pointer: [*]i8 = &unordered_array;
    //var index: u8 = 0;
    //var array_pointer: *[unordered_array.len]i8 = &unordered_array;

    var swapper: i8 = undefined;

    var outer_index = unordered_array.len;
    while (outer_index > 1) {
        debug_print("unordered_array: {any}\n\n", .{unordered_array});
        debug_print("unordered_array slice: {any}\t", .{array_pointer[0..]});
        debug_print("Pointer Address: {any}\t", .{array_pointer});
        debug_print("array_pointer: {any}\n", .{array_pointer});
        debug_print("array_pointer + unordered_array.len-1: {any}\n", .{array_pointer + unordered_array.len - 1});
        debug_print("&array_pointer: {any}\n", .{&array_pointer});

        debug_print("array_pointer + 1: {any}\n", .{array_pointer + 1});
        //debug_print("&elem: {any}\n", .{&elem});  //same address (address of a pointer)
        debug_print("BEGIN FOR LOOP\n\n", .{});
        var index: u8 = 0;

        for (&unordered_array) |*elem| {
            if (@intFromPtr(elem) == @intFromPtr(array_pointer + unordered_array.len - 1)) {
                //if (elem.* == unordered_array[unordered_array.len - 1]) { //this works, in case the pointer version doesn't
                break;
            }
            if (array_pointer[index] > array_pointer[index + 1]) {
                swapper = array_pointer[index + 1];
                array_pointer[index + 1] = array_pointer[index];
                array_pointer[index] = swapper;
            }
            debug_print("elem.*: {any}\n", .{elem.*});
            debug_print("array_pointer[index]: {any}\n", .{array_pointer[index]});
            debug_print("elem: {*}\n", .{elem});
            //debug_print("elem + 1: {*}\n", .{elem + @ptrFromInt(1)});         //try more with this
            debug_print("index: {any}\n", .{index});
            //  debug_print("elem - 1: {*}\t", .{elem - 1});
            debug_print("array_pointer: {any}\n", .{array_pointer});
            debug_print("unordered_array: {any}\n", .{unordered_array});
            debug_print("unordered_array slice: {any}\n", .{array_pointer[0..]});
            debug_print("array_pointer: {*}\n", .{array_pointer});
            debug_print("array_pointer + unordered_array.len-1: {any}\n", .{array_pointer + unordered_array.len - 1});
            debug_print("&array_pointer: {any}\n", .{&array_pointer});
            //debug_print("Reference Value: {any}\n", .{array_pointer});
            //debug_print("array_pointer[index]: \n", .{array_pointer[index]});
            //debug_print("index: \n", .{index});
            index += 1;

            debug_print("\n", .{});
        }
        outer_index -= 1;
    }

    debug_print("unordered_array: {any}\n", .{unordered_array});
}

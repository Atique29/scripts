const std = @import("std");
const Io = std.Io;

pub fn main(init: std.process.Init.Minimal) !void {

    // fire up the writer
    var threaded_io: std.Io.Threaded = .init_single_threaded;
    defer threaded_io.deinit();
    const io = threaded_io.io();

    const filename = "/home/phaetan/atiqxe/scripts/dmenu_qute/reading_list/list.txt";
    const file = try Io.Dir.cwd().openFile(io, filename, .{.mode = .write_only});
    defer file.close(io);

    // read the QUTE_URL env variable set by qutebrowser
    const url = init.environ.getPosix("QUTE_URL");
    if (url) |val| {
        //append the url to the file
        const file_len = try file.length(io);
        try file.writePositionalAll(io, val[0..] , file_len);
    }

    const site_title = init.environ.getPosix("QUTE_TITLE");
    if (site_title) |val| {
        //append the url to the reading list
        const file_len = try file.length(io);
        try file.writePositionalAll(io, "   ", file_len);
        try file.writePositionalAll(io, val[0..] , file_len + 3);
        try file.writePositionalAll(io, "\n", file_len + 3 + val.len);
    }

    const qute_fifo_path = init.environ.getPosix("QUTE_FIFO");
    if(qute_fifo_path) |fifo_path| {
        const qute_fifo = try Io.Dir.cwd().openFile(io, fifo_path, .{.mode = .write_only});
        defer qute_fifo.close(io);
        try qute_fifo.writeStreamingAll(io, "message-info '++ added to reading list'");
    }

}

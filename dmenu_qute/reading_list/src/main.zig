const std = @import("std");
const Io = std.Io;
const proc = std.process;

const dmenu_cmd = &.{"dmenu", "-i", "-l", "7", 
    "-nb", "#1c1c1c",
    "-nf", "#fbf1c7", 
    "-sb", "#fbf1c7",
    "-sf", "#1c1c1c",
    "-fn", "\'JetBrainsMono:pixelsize=16\'", 
    "-p" , "Choose File:",
};

const files = [_] []const u8 {
    "zig",
    "coding",
    "research",
    "literature", 
    "general",
    "music",
};


pub fn main(init: std.process.Init) !void {

    const io = init.io;
    const gpa = init.gpa;

    // get the file name with dmenu

    var child = try proc.spawn(io, .{ 
        .argv = dmenu_cmd,
        .stdin = .pipe,
        .stdout = .pipe,
        .stderr = .inherit,
    });

    defer child.kill(io);

    var buff: [1024] u8 = undefined;
    var stdin_writer = child.stdin.?.writerStreaming(io, buff[0..]);

    for (files) |item| {
        try stdin_writer.interface.print("{s}\n", .{item});
        try stdin_writer.interface.flush();
    }

    child.stdin.?.close(io);
    child.stdin = null;


    var stdout_reader = child.stdout.?.readerStreaming(io, buff[0..]);
    const bytes: []u8 = stdout_reader.interface.peekDelimiterExclusive('\n') catch |err| switch (err) {
        error.EndOfStream => "",  // nothing was selected in dmenu
        else => return err,
    };


    const path: []u8 = try std.fmt.allocPrint(gpa, 
        "/home/phaetan/atiqxe/scripts/dmenu_qute/reading_list/data/{s}.txt", .{bytes}
    );

    defer gpa.free(path);

    const term = try child.wait(io);
    switch (term) {
        .exited => |code| {
            if (code != 0) {
                std.debug.print("no selection, exit code: {d}\n", .{code});
                proc.exit(0);
            }
        }, 
        .signal, .stopped, .unknown => {
            std.debug.print("abnormal stuff", .{});
            proc.exit(1);
        }
    }



    // Saving the url

    // If the file is not there, create, otherwise open
    const file = try Io.Dir.createFileAbsolute(io, path, .{.truncate = false});
    defer file.close(io);

    // read the QUTE_URL env variable set by qutebrowser
    const url = init.minimal.environ.getPosix("QUTE_URL");
    if (url) |val| {
        //append the url to the file
        const file_len = try file.length(io);
        try file.writePositionalAll(io, val[0..] , file_len);
    }

    const site_title = init.minimal.environ.getPosix("QUTE_TITLE");
    if (site_title) |val| {
        //append the url to the reading list
        const file_len = try file.length(io);
        try file.writePositionalAll(io, "   ", file_len);
        try file.writePositionalAll(io, val[0..] , file_len + 3);
        try file.writePositionalAll(io, "\n", file_len + 3 + val.len);
    }

    const qute_fifo_path = init.minimal.environ.getPosix("QUTE_FIFO");
    if(qute_fifo_path) |fifo_path| {
        const qute_fifo = try Io.Dir.cwd().openFile(io, fifo_path, .{.mode = .write_only});
        defer qute_fifo.close(io);
        const out_str = try std.fmt.allocPrint(gpa, "message-info '++ added to {s}'", .{bytes});
        try qute_fifo.writeStreamingAll(io, out_str);
    }

}

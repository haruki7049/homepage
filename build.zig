const std = @import("std");
const zine = @import("zine");

pub fn build(b: *std.Build) void {
    zine.website(b, .{
        .title = "haruki7049's homepage",
        .host_url = "https://haruki7049.dev",
        .layouts_dir_path = "layouts",
        .content_dir_path = "content",
        .assets_dir_path = "assets",

        .static_assets = &.{ "fonts/UDEVGothicNF-Regular.ttf", "haruki7049.jpg", "favicon.ico", "use-nix_nixos.jpg" },
    });
}

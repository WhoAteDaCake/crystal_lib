@[Include(
  "/home/toshiba/projects/native-ui/LCUI/include/LCUI.h",
  flags: [
    `pkg-config --cflags --libs x11 xcb libpng fontconfig`,
    ["-I/home/toshiba/projects/native-ui/LCUI/include"],
  ],
  # ends_with: "PARAMS _EVENTS _BUTTONS _STATES _MASK",
  keep: %w(LCUI TEXT SCROLL) # keep: %w(LCUI_BackgroundPosition)
)]
lib LibScitter
end
# crystal run ./src/main.cr -- ./notes/liblcui.cr ./tmp/output.cr
# cp ./tmp/output.cr /home/toshiba/projects/native-ui/src/lcui/liblcui.cr

@[Include(
  "/home/augustinas/projects/sciter-tests/api/include/sciter-x.h",
  flags: [
    "-pthread -I/usr/include/gtk-3.0 -I/usr/include/at-spi2-atk/2.0 -I/usr/include/at-spi-2.0 -I/usr/include/dbus-1.0 -I/usr/lib/x86_64-linux-gnu/dbus-1.0/include -I/usr/include/gtk-3.0 -I/usr/include/gio-unix-2.0 -I/usr/include/cairo -I/usr/include/pango-1.0 -I/usr/include/fribidi -I/usr/include/harfbuzz -I/usr/include/atk-1.0 -I/usr/include/cairo -I/usr/include/pixman-1 -I/usr/include/uuid -I/usr/include/freetype2 -I/usr/include/libpng16 -I/usr/include/gdk-pixbuf-2.0 -I/usr/include/libmount -I/usr/include/blkid -I/usr/include/glib-2.0 -I/usr/lib/x86_64-linux-gnu/glib-2.0/include",
    "-I/home/augustinas/projects/sciter-tests/api/include",
  ],
  keep: %w(Sciter Value SCITER_ HANDLE_ SOM_ Element MOUSE_ KEY_ FOCUS_ DRAW_ TIMER_ BEHAVIOR_ METHOD_ DATA_ SCROLL_ EVENT_)
)]
lib LibScitter
end
# rm ./tmp/output.cr && crystal run ./src/main.cr -- ./notes/libsciter.cr >> ./tmp/output.cr
# cp ./tmp/output.cr /home/ubuntu/projects/sciter-tests/src/libsciter.cr

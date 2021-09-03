@[Include(
  "gtk/gtk.h",
  prefix: %w(gtk_),
  remove_prefix: false
)]
@[Link("gtk+-3.0")]
lib LibGtk
end
# rm ./tmp/output.cr && crystal run ./src/main.cr -- ./tmp/libgtk.cr >> ./tmp/output.cr
# cp ./tmp/output.cr /home/ubuntu/projects/sciter-tests/src/libgtk.cr
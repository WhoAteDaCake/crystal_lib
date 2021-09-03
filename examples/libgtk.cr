@[Include(
  "gtk/gtk.h",
  prefix: %w(gtk_),
  remove_prefix: false
)]
@[Link("gtk+-3.0")]
lib LibGtk
end
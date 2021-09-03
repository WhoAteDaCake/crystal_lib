@[Include(
  "/home/ubuntu/projects/sciter-tests/api/include/sciter-x.h"
  import_docstrings: "full",
  prefix: %w(Sciter Value SCITER_ HANDLE_ SOM_ Element MOUSE_ KEY_ FOCUS_ DRAW_ TIMER_ BEHAVIOR_ METHOD_ DATA_ SCROLL_ EVENT_),
  remove_prefix: false
)]
@[Link("gtk+-3.0")]
@[Link(ldflags: "-I/home/ubuntu/projects/sciter-tests/api/include -I/usr/include/glib-2.0")]
lib LibScitter

end
# rm ./tmp/output.cr && crystal run ./src/main.cr -- ./tmp/libsciter.cr >> ./tmp/output.cr
# cp ./tmp/output.cr /home/ubuntu/projects/sciter-tests/src/libsciter.cr
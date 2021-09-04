@[Include(
  "/home/augustinas/projects/crystal_lib/notes/test.h",
  flags: [] of String,
  keep: %w(test)
)]
lib LibScitter
end
# rm ./tmp/output.cr && crystal run ./src/main.cr -- ./notes/libsciter.cr >> ./tmp/output.cr
# cp ./tmp/output.cr /home/ubuntu/projects/sciter-tests/src/libsciter.cr

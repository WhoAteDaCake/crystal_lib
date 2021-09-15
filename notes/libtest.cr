@[Include(
  "./headers/test.h",
  flags: [] of String,
  keep: %w(LCUI)
)]
lib LibScitter
end
# rm ./tmp/output.cr && crystal run ./src/main.cr -- ./notes/libsciter.cr >> ./tmp/output.cr
# cp ./tmp/output.cr /home/ubuntu/projects/sciter-tests/src/libsciter.cr

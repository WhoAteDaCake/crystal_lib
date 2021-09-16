crystal_lib: $(shell find . -name "*.cr")
	crystal build src/main.cr

clean:
	rm -rf .crystal main

.PHONY: run
run:
	crystal run ./src/main.cr -- ./notes/libtest.cr ./tmp/output.cr

.PHONY: dev
dev:
	fwatcher --all-events \
	  --dir src \
	  -x \
	  execute make run
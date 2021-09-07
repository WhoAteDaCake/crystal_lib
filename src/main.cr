# require "crystal"
require "./crystal_lib"

node = Crystal::Parser.parse(File.new(ARGV[0]).gets_to_end)
visitor = CrystalLib::LibTransformer.new
transformed = node.transform visitor
content = File.open(ARGV[1], "w") do |file|
  transformed.to_s(file, emit_doc: true)
end

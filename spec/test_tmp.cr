require "./spec_helper"

private def assert_transform(header, input, output, file = __FILE__, line = __LINE__)
  it "transforms #{input.inspect} in #{header.inspect}", file: file, line: line do
    nodes = parse(File.read("#{__DIR__}/headers/#{header}.h"))
    transformer = LibBodyTransformer.new(nodes)

    lib_def = Crystal::Parser.parse(%(
      lib LibSome
        #{input}
      end
    )).as(Crystal::LibDef)
    lib_def.body = transformer.transform(lib_def.body)
    puts lib_def.to_s
    # join_lines(lib_def.to_s).should eq(join_lines("lib LibSome\n#{output}\nend"))
  end
end

private def join_lines(string)
  string.split("\n").map(&.strip).reject(&.empty?).join("\n")
end

describe LibBodyTransformer do
  assert_transform "test",
    "fun rgb", %(
    )
end

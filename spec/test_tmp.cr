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
    # puts lib_def.to_s
    join_lines(lib_def.to_s).should eq(join_lines("lib LibSome\n#{output}\nend"))
  end
end

private def join_lines(string)
  string.split("\n").map(&.strip).reject(&.empty?).join("\n")
end

describe LibBodyTransformer do
  assert_transform "test",
    "fun rgb", %(
      alias UcharT = UInt8
      union LcuiArgb8888
        value : Int32T
        field_0 : LcuiArgb8888Child0
        field_1 : LcuiArgb8888Child1
        rgba : Rgba
      end
      type LcuiColor = LcuiArgb8888
      alias Int32T = LibC::Int
      struct LcuiArgb8888Child0
        blue : UcharT
        green : UcharT
        red : UcharT
        alpha : UcharT
      end
      struct LcuiArgb8888Child1
        b : UcharT
        g : UcharT
        r : UcharT
        h : UcharT
      end
      struct Rgba
        b : UcharT
        g : UcharT
        r : UcharT
        a : UcharT
      end
      fun rgb(r : UcharT, g : UcharT, b : UcharT) : LcuiColor
    )
end

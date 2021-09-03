module CrystalLib
  # Uses the internals of crystal compiler
  # This way we don't have to care about strigification
  # and dealing with representation of nodes
  class LibTransformer < Crystal::Transformer
    @include : Crystal::Annotation? = nil
    @flag : Crystal::Annotation? = nil

    def initialize
    end

    def parse_node_flags(flags)
      results = [] of String
      flags.each do |arg|
        case arg
        when Crystal::StringLiteral
          results << arg.value
        when Crystal::ArrayLiteral
          results += parse_node_flags(arg.elements)
        else
          raise "Expected String or Array value, received #{arg}"
        end
      end
      results
    end

    def flag_ls
      flags = @flag.try do |flags|
        parse_node_flags(flags.args)
      end
      # Helps to normalize all flags
      # since we allow long string as well
      flags.try &.join(" ").split(" ") || [] of String
    end

    def header
      if inc = @include
        arg = inc.args[0]
        case arg
        when Crystal::StringLiteral
          arg.value
        else
          raise "Expected string for header file path"
        end
      else
        raise "Expected and include tag for c header file"
      end
    end

    def transform(node : Crystal::Annotation)
      case node.path.names
      when ["Include"]
        @include = node
        Crystal::Nop.new
      when ["Flags"]
        @flag = node
        Crystal::Nop.new
      else
        node
      end
    end

    def transform(node : Crystal::LibDef)
      nodes = Parser.parse(flag_ls, header)

      # headers, flags, prefixes, remove_prefix, options = process_includes
      # nodes = CrystalLib::Parser.parse(headers, flags, options)

      # if prefixes.empty?
      #   node.body = node.body.transform CrystalLib::LibBodyTransformer.new(nodes)
      # else
      #   prefix_matcher = PrefixMatcher.new(prefixes, remove_prefix)
      #   node.body = CrystalLib::PrefixImporter.import(nodes, prefix_matcher)
      # end
      node
    end
  end
end

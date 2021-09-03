require "clang"
require "clang/clang-c/Index"

module CrystalLib
  class Parser
    def self.parse(flags, header)
      parser = Parser.new(flags, header)
      parser.parse
      nodes = parser.nodes
      nodes
    end

    property nodes = [] of ASTNode

    def initialize(flags : Array(String), header : String)
      @cursor_hash_to_node = {} of UInt32 => ASTNode
      @idx = Clang::Index.new
      Clang.default_c_include_directories(flags)

      # puts flags
      @tu = Clang::TranslationUnit.from_source(
        @idx,
        [Clang::UnsavedFile.new("input.c", "#include \"#{header}\"")],
        flags,
        Clang::TranslationUnit.default_options |
        Clang::TranslationUnit::Options::IncludeBriefCommentsInCodeCompletion
      )
    end

    def parse
      @tu.cursor.visit_children do |cursor|
        node = visit(cursor)
        if node
          node.doc = generate_comments(cursor)
          @nodes << node
          Clang::ChildVisitResult::Continue
        else
          Clang::ChildVisitResult::Recurse
        end
      end
    end
  end
end

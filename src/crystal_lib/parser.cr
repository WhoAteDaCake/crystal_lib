require "clang"
require "clang/clang-c/Index"

module CrystalLib
  class Parser
    def initialize(flags : Array(String), header : String)
      @nodes = [] of ASTNode
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
  end
end

module CrystalLib
  class Importer
    def self.import(keep, nodes)
      proc = Importer.new(keep, nodes)
      proc.run
    end

    def initialize(@keep : Array(String), @nodes : Array(ASTNode))
      @selected = Array(ASTNode).new
      @pending = [] of String
      @defined = Hash(String, Array(Type | ASTNode | Nil)).new
    end

    def mdeps
      Array(Type | ASTNode | Nil).new
    end

    def no_deps
      deps = mdeps
      deps << nil
      deps
    end

    def walk(type : PrimitiveType)
      sr = type.as(String)
      @defined[sr] = no_deps
      {type, [@defined[sr]]}
    end

    def walk(type : PointerType | BlockPointerType | ConstantArrayType | IncompleteArrayType)
      # Because it's a pointer, we only care about underlying type
      type = type.type
      sr = type.to_s
      unless @defined.has_key?(sr)
        @defined[sr] = walk(type)[1]
      end
      {sr, @defined[sr]}
    end

    def walk(type : FunctionType)
      sr = type.to_s
      unless @defined.has_key?(sr)
        deps = mdeps
        type.inputs.each do |t|
          deps += walk(t)[1]
        end
        deps += walk(type.output)[1]
        @defined[sr] = deps
      end
      {sr, deps}
    end

    def walk(type : TypedefType)
      sr = type.name
      unless @defined.has_key?(sr)
        @defined[sr] = walk(type.type)[1]
      end
      {sr, @defined[sr]}
    end

    def walk(type : UnexposedType)
      sr = type.name
      unless @defined.has_key?(sr)
        raise "Unexposed struct not defined\n#{type}"
      end
      {sr, @defined[sr]}
    end

    def walk(type : NodeRef)
      walk(type.node)
    end

    def walk(type : Define)
      {type.name, no_deps}
    end

    def walk(type : Var)
      walk(type.type)
    end

    def walk(type : Function)
      sr = type.name
      unless @defined.has_key?(sr)
        deps = mdeps
        type.args.each do |a|
          deps += walk(a)[1]
        end
        deps += walk(type.return_type)[1]
        @defined[str] = deps
      end
      {sr, @defined[sr]}
    end

    def walk(type : Arg)
      walk(type.type)
    end

    def walk(type : StructOrUnion)
      sr = type.name
      unless @defined.has_key?(sr)
        deps = mdeps
        type.fields.each do |a|
          deps += walk(a)[1]
        end
        @defined[str] = deps
      end
      {sr, @defined[sr]}
    end

    def walk(type : Typedef)
      sr = type.name
      unless @defined.has_key?(sr)
        @defined[str] = walk(type.type)[1]
      end
      {sr, @defined[sr]}
    end

    def walk(type : Enum)
      {name.name, no_deps}
    end

    def walk(type : EnumValue)
      {type.name, no_deps}
    end

    def walk(type : VaListType | ErrorType)
      raise "Do not support (VaListType | ErrorType) types"
    end

    def run
      selected = @nodes.select do |n|
        name = n.unscoped_name
        @keep.index { |k| name.includes?(k) } != nil
      end
      selected.map { |n| walk(n) }
      puts @defined
    end
  end
end

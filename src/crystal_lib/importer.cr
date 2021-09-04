module CrystalLib
  class Importer
    def self.import(keep, nodes)
      proc = Importer.new(keep, nodes)
      proc.run
    end

    def initialize(@keep : Array(String), @nodes : Array(ASTNode))
      @selected = Array(ASTNode).new
      @pending = [] of String
      @defined = Hash(String, Bool).new
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
      sr = type.kind.to_s
      @defined[sr] = true
    end

    def walk(type : PointerType | BlockPointerType | ConstantArrayType | IncompleteArrayType)
      # Because it's a pointer, we only care about underlying type
      type = type.type
      sr = type.to_s
      unless @defined.has_key?(sr)
        @defined[sr] = true
        walk(type)
      end
    end

    def walk(type : FunctionType)
      sr = type.to_s
      unless @defined.has_key?(sr)
        @defined[sr] = true
        type.inputs.each do |t|
          walk(t)
        end
        walk(type.output)
      end
    end

    def walk(type : TypedefType)
      sr = type.name
      unless @defined.has_key?(sr)
        @defined[sr] = true
        walk(type.type)
      end
    end

    def walk(type : UnexposedType)
      sr = type.name
      unless @defined.has_key?(sr)
        raise "Unexposed struct not defined\n#{type}"
      end
    end

    def walk(type : NodeRef)
      walk(type.node)
    end

    def walk(type : Define)
      @defined[type.name] = true
    end

    def walk(type : Var)
      walk(type.type)
    end

    def walk(type : Function)
      sr = type.name
      unless @defined.has_key?(sr)
        @defined[sr] = true
        type.args.each do |a|
          walk(a)
        end
        walk(type.return_type)
      end
    end

    def walk(type : Arg)
      walk(type.type)
    end

    def walk(type : StructOrUnion)
      sr = type.name
      unless @defined.has_key?(sr)
        @defined[sr] = true
        type.fields.each do |a|
          walk(a)
        end
      end
    end

    def walk(type : Typedef)
      sr = type.name
      unless @defined.has_key?(sr)
        @defined[sr] = true
        walk(type.type)
      end
      {sr, @defined[sr]}
    end

    def walk(type : Enum)
      @defined[type.name] = true
    end

    def walk(type : EnumValue)
      @defined[type.name] = true
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

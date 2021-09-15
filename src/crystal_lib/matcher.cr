module CrystalLib
  class Matcher
    def self.required(keep, ends_with, nodes)
      proc = new(keep, ends_with, nodes)
      proc.required_nodes
    end

    def initialize(@keep : Array(String), @ends_with : Array(String), @nodes : Array(ASTNode))
      @selected = Array(ASTNode).new
      @pending = [] of String
      @defined = Hash(Type | ASTNode, Bool).new
    end

    def walk(type : PrimitiveType)
      @defined[type] = true
    end

    def walk(type : PointerType | BlockPointerType | ConstantArrayType | IncompleteArrayType)
      # Because it's a pointer, we only care about underlying type
      unless @defined.has_key?(type)
        @defined[type] = true
        walk(type.type)
      end
    end

    def walk(type : FunctionType)
      unless @defined.has_key?(type)
        @defined[type] = true
        type.inputs.each do |t|
          walk(t)
        end
        walk(type.output)
      end
    end

    def walk(type : TypedefType)
      unless @defined.has_key?(type)
        @defined[type] = true
        walk(type.type)
      end
    end

    def walk(type : UnexposedType)
      unless @defined.has_key?(type)
        raise "Unexposed struct not defined\n#{type}"
      end
    end

    def walk(type : NodeRef)
      walk(type.node)
    end

    def walk(type : Define)
      @defined[type] = true
    end

    def walk(type : Var)
      walk(type.type)
    end

    def walk(type : Function)
      unless @defined.has_key?(type)
        @defined[type] = true
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
      unless @defined.has_key?(type)
        @defined[type] = true
        type.fields.each do |a|
          walk(a)
        end
      end
    end

    def walk(type : Typedef)
      unless @defined.has_key?(type)
        @defined[type] = true
        walk(type.type)
      end
    end

    def walk(type : Enum)
      @defined[type] = true
    end

    def walk(type : EnumValue)
      @defined[type] = true
    end

    def walk(type : VaListType | ErrorType)
      raise "Do not support (VaListType | ErrorType) types"
    end

    def required_nodes
      # Filters down the types we need
      selected = @nodes.select do |n|
        name = n.unscoped_name
        @keep.index { |k| name.starts_with?(k) } != nil || @ends_with.index { |k| name.ends_with?(k) }
      end
      # Walk the
      selected.map { |n| walk(n) }
      @defined.keys
    end
  end
end

module CrystalLib
  class Importer
    def self.import(nodes)
      importer = new
      nodes.each do |node|
        importer.process node
      end
      importer.result
    end

    def initialize
      @nodes = [] of Crystal::ASTNode
      @mapper = TypeMapper.new
    end

    def process(node : Define)
      name = match_prefix(node)
      return unless name

      begin
        value = Crystal::Parser.parse(node.value)
        return unless value.is_a?(Crystal::NumberLiteral)
      rescue
        # Ignore for now
        return
      end

      name = Crystal::Path.new(name.upcase)
      @nodes << Crystal::Assign.new(name, value).tap(&.doc = node.doc)
    end

    def process(node : Var)
      name = match_prefix(node)
      return unless name

      @nodes << Crystal::ExternalVar.new(name, @mapper.map(node.type)).tap(&.doc = node.doc)

      check_pending_definitions
    end

    def process(node : Function)
      name = match_prefix(node)
      return unless name

      name = @mapper.crystal_fun_name(name)
      args = node.args.map_with_index do |arg, i|
        Crystal::Arg.new(arg.name.empty? ? "x#{i}" : @mapper.crystal_arg_name(arg.name), restriction: map_type(arg.type))
      end
      return_type = map_type(node.return_type)
      return_type = nil if void?(return_type)

      varargs = node.variadic?

      @nodes << Crystal::FunDef.new(name, args, return_type, varargs, real_name: node.name).tap(&.doc = node.doc)

      check_pending_definitions
    end

    def process(node : Enum)
      if node.name.empty?
        node.values.each do |value|
          name = match_prefix(value)
          next unless name

          @nodes << Crystal::Assign.new(Crystal::Path.new(@mapper.crystal_type_name(name)), Crystal::NumberLiteral.new(value.value)).tap(&.doc = value.doc)
        end
      else
        @mapper.map(node)
        check_pending_definitions
        # @nodes << @mapper.map(node)
      end
    end

    def process(node : StructOrUnion)
      name = match_prefix(node.unscoped_name)
      return unless name

      @mapper.map(node)

      check_pending_definitions
    end

    def process(node : Typedef)
      # We skip these because they should be imported when importing functions
    end

    def process(node)
      # Nothing to do
    end

    def check_pending_definitions
      return if @mapper.pending_definitions.empty?

      @nodes.concat @mapper.pending_definitions.dup
      @mapper.pending_definitions.clear
    end

    def match_prefix(node : CrystalLib::ASTNode)
      match_prefix(node.name)
    end

    def match_prefix(name : String)
      name
    end

    def map_type(type)
      @mapper.map(type)
    end

    def void?(node)
      node.is_a?(Crystal::Path) && node.names.size == 1 && node.names.first == "Void"
    end

    def result
      # Remove duplication
      @nodes.uniq!
      @nodes.select! do |n|
        if n.is_a?(Crystal::Alias)
          n.name.to_s != n.value.to_s
        else
          true
        end
      end
      # Put external vars at the end
      external_vars = @nodes.select { |var| var.is_a?(Crystal::ExternalVar) }
      @nodes.reject! { |var| var.is_a?(Crystal::ExternalVar) }
      @nodes.concat external_vars

      Crystal::Expressions.from(@nodes)
    end
  end
end

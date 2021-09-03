module CrystalLib
  abstract class ASTNode
    property doc : String?

    def unscoped_name
      name
    end
  end
end

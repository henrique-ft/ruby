# Uma classe básica, sem nada
class Baseball
end

# Retorna undefined method swing, porque não existe esse método na classe
p Baseball.new.swing

# Com a metaprogramação do Ruby podemos escrever denovo o corpo da classe
class Baseball
    def swing
        "Homerun"
    end
end

# Agora não teremos erro
p Baseball.new.swing

# Com a metaprogramação do Ruby podemos escrever denovo também, uma função de uma classe
class Baseball
    def swing
        "Strike"
    end
end

# Agora não teremos erro
p Baseball.new.swing
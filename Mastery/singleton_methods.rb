# No ruby você pode definir novos métodos para objetos vazios

# Cria um objeto vazio

ob = Object.new

class << ob
    def blather(str)
        p "Blather, blather #{str}"
    end
end

ob.blather "hey"

# ou

ob2 = Object.new

def ob2.blather(str)
    p "Blather2, blather2 #{str}"
end

ob2.blather "ho"
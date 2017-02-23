class Hey
    
    # Variável de classe é uma variável que igual para todas as instâncias, ou seja, se for alterada em uma, é alterada em todas as instâncias.
    
    @@numero_de_instancias = 0 
    
    def initialize
        
        @@numero_de_instancias += 1 # Incrementa a variável de classe
    end
    
    def numero_de_instancias
        @@numero_de_instancias
    end
    
end

ob = Hey.new
ob2 = Hey.new
ob3 = Hey.new

p ob.numero_de_instancias # 3
p ob2.numero_de_instancias # 3
p ob3.numero_de_instancias # 3

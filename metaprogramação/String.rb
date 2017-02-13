# Redeclarando a classe string nativa do ruby
class String
    
    # Suponhamos que não queremos que nosso programa tenha palavras inadequadas, criando o método abaixo podemos chama-lo em qualquer string no Ruby
    def censor(bad_word)
        
        # Self está referenciando o objeto em si, que ja foi instanciado
        # Ou seja, no caso abaixo, estamos chamando a função gsub! da próprio objeto string que foi instanciado
        self.gsub! "#{bad_word}", "CENSORED"
    end
    
    def num_of_chars
        
        size
    end
end

p "The bunny was in trouble with the king's bunny".censor "bunny"

p "The bunny was in trouble with the king's bunny".num_of_chars

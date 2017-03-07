
string = "The quick 12 brown foxes jumped over the 10 lazy dogs"

# O =~ é o shortcut para expressões regulares

# Retorna a posição da string onde há a letra o

p string =~ /o/

# Retorna a posição da string onde há a palavra quick

p string =~ /quick/

# Operador ternário, se a string tem a letra z retorna válido, se não retorna inválido

p string =~ /z/ ? "valid" : "invalid"

# Nesse caso retornará inválido, pois não é case sensitive

p string =~ /Z/ ? "valid" : "invalid"

# Nesse caso retornará válido, pois o i tranforma em case insensitive

p string =~ /Z/i ? "valid" : "invalid"

# O d retorna inteiros e o + retorna todas os casos de inteiro, não somente o primeiro

# Regexp é uma classe própria do ruby para trabalhar com regex

p string.to_enum(:scan, /\d+/).map { Regexp.last_match }

# Regex para validar email

VALID_EMAIL_REGEX = /\A([\w+\-].?)+@[a-z\d\-}+(\.[a-z]+)*\.[a-z]+\z/i

def is_valid_email? email
    
    email =~ VALID_EMAIL_REGEX
end

# Nesse caso irá retornar erro, pois funções em if ternário devem ter ()

p is_valid_email? "teste@teste.com" ? "Valid" : "Invalid"

# Nesse caso está tudo ok

p is_valid_email?("teste@teste.com") ? "Valid" : "Invalid"
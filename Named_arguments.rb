# No Ruby você pode nomear os argumentos que está passando

def print_address city:, state:, zip:
    
   p city
   p state
   p zip
end

# Dessa forma, para chamar os métodos, você deve colocar os nameds arguments e seus valores

print_address city: "Santos", state: "SP", zip: 11025011

# Named arguments são importantes para legibilidade do código, você não precisa se importar com a ordem dos argumentos na hora da chamada do métod. Veja o que acontece abaixo:

def sms_generator api_key, num, message, locale
    
    # magic sms stuff...
end

# Se trocarmos a ordem, podemos acabar por colocar o numero no lugar da api_key, temos sempre que ficar verificando a ordem.

sms_generator "K0w91MADK", 139999999, 'hey there', 'US'

# Agora não temos mais esse problema, repare que dessa vez colocamos um valor padrão para o argumento locale, logo, na chamada do método se torna opcional

def sms_generator2 api_key:, num:, message:, locale: "US"
    
    # magic sms stuff...
end

# Named arguments tornam o código mais claro para outros desenvolvedores que forem pega-lo

sms_generator2 api_key: "K0w91MADK", num: 139999999, message: 'hey there'

# Também podemos chamar named arguments de maneira dinâmica

def invoice options={}
   p options[:company]
   p options[:total]
   p options[:something_else]
end

invoice company: "Google", total: 100.00, something_else: "ho"
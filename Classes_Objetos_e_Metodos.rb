# Uma das funcionalidades comuns a diversas linguagens orientadas a objeto está na capacidade de, dado um objeto, descobrir de que tipo ele é.
# No ruby, existe um método chamado class(), que retorna o tipo do objeto, enquanto object_id(), retorna o número da referência, ou identificador único do objeto
# dentro da memória heap. Todo objeto que criarmos ja vão vir com os métodos class e object_id

# Criando um Objeto -------------------------------------------------------------------------------------------------------------------------------------------------------

pessoa = Object.new()

# Função -------------------------------------------------------------------------------------------------------------------------------------------------------

# No ruby o retorno de um método sempre é a ultima instrução, existe a palavra return, porém não é boa prática. Os parenteses na chamada do método são opcionais na maioria dos casos

lugar = gets

# Um parâmetro

def pessoa.ir_para(lugar)  # Nesse caso atibuímos a função ir_para ao objeto objeto
  "indo para #{lugar}"
end

puts pessoa.ir_para(lugar)

# Dois parâmetros

def trocar_roupa(lugar,roupa)
  "Trocando minha #{roupa} no #{lugar}"
end

puts trocar_roupa(lugar,"calça")

# Parametro pré-definido

def trocar_roupa2(lugar="banheiro",roupa)
  "trocando minha #{roupa} no #{lugar}"
end

puts trocar_roupa2('camisa')

def trocar_roupa_ruby_3(lugar="banheiro",roupa) = "trocando minha #{roupa} no #{lugar}"

puts trocar_roupa_ruby_3('camisa')

# Múltiplos parâmetros
# A variável produtos vira um Array contendo todos os parâmetros passados

def comprar(*produtos)
  puts produtos.size()

  for i in produtos
    puts i
  end
end

comprar('oi','tchal','adeus')

# Em ruby não é necessário colocar parenteses para a chamada de métodos

comprar 'oi','adeus','tchal'

# Também pode se passar um array como parâmetro, que o Ruby vai entender da mesma maneira

listadecompra = [1,2,3,"maçã","banana","pera"]

def comprar2(*produtos) # O operador * é chamado de splat
  puts "<começo da lista de compra>"
  puts "tamanho = #{produtos.size()}"

  for i in produtos
    for e in i
      puts e
    end
  end

  puts "<fim da lista>"
end

comprar2 listadecompra  # nesse caso produtos.size() se torna 1 , produtos é uma variável que contêm um array

comprar2 listadecompra,listadecompra  # nesse caso produtos.size() se torna 2 , produtos é uma variável que contêm dois arrays

# Também podemos passar parâmetros através de hash

def transfere(argumentos)
  destino = argumentos[:destino]
  data = argumentos[:data]
  valor = argumentos[:valor]

  puts "#{data} #{destino} #{valor}"
end

transfere({destino: "escola", data: Time.now, valor: 50.00})

# Classes

puts "------------------------------"

class Pessoa
  def fala
    puts "Estou falando"
  end

  def trocar_roupa(lugar,roupa)
    "Trocando minha #{roupa} no #{lugar}"
  end
end

Edgar = Pessoa.new()

puts Edgar.class
puts Edgar.object_id

Edgar.fala


# No Ruby qualquer classe pode ser reaberta e qualquer método redefinido ou incluido.

puts "----------------------------"

class Pessoa
  def trocar_roupa_intima(lugar="banheiro",roupa)
    "Trocando minha #{roupa} no #{lugar}"
  end

  def chamar_outro_metodo
    self.fala # O self no Ruby é análogo ao This do Java, c# e outras linguagens. Mas você pode chamar um método da mesma classe sem ele.
    fala # Automaticamente vai apontar para o self
    puts " denovo"
  end
end

Maria = Pessoa.new()
Maria.chamar_outro_metodo

# Atributos(ou variáveis de instância) no Ruby são SEMPRE privados e começam com @. Não há como alterá-los de fora da classe; Apenas os métodos de um objeto podem alterar os seus atributos
# (Encapsulamento). Diferente das outras linguagens, em Ruby você não declara os atributos fora dos métodos.

puts "----------------------------"

class Pessoa
  def mudar_nome(novo_nome)
    @nome = novo_nome
  end

  protected # todos os métodos abaixo desse são Protecteds

  def diz_nome
    "meu nome é #{@nome}"
  end
end

Roberto = Pessoa.new()
Roberto.mudar_nome "Roberto"
puts Roberto.diz_nome

# O initialize é o método construtor no Ruby

puts "-------------------------------"

class Pessoa
  def initialize(nome,altura,cor_do_cabelo) # Método constutor
    @nome = nome
    @altura = altura
    @cor_do_cabelo = cor_do_cabelo
  end
end

Diandra = Pessoa.new("Diandra",1.70,"preto")
puts Diandra.diz_nome
Diandra.mudar_nome "Robertona"
puts Diandra.diz_nome

# No Ruby temos algumas coisas diferentes em relação a atributos de uma classe: Métodos acessores e modificadores
# Métodos acessores são métodos que servem apenas para acessar/retornar um valor de um atributo
# Métodos modificadores servem para modificar/setar o valor de um atributo (alternativa aos métodos Set) fazendo a sintaxe ficar parecida com outras linguagens
# É uma forma de deixar o atributo mascaradamente público

puts "-------------------------------"

class Pessoa
  def sexo
    @sexo
  end

  def sexo=(novo_sexo)
    @sexo = novo_sexo
  end
end

Robervaldo = Pessoa.new("Roberto",1.80,"preto")
Robervaldo.sexo = "masculino" # O Ruby têm exceções na sintaxe que são usadas para deixar o código mais bonito, essas exceções são chamadas de "Syntax Sugar"
# por exemplo, se um método tem o nome 'oi=' o ruby permite que você acesse sem precisar repetir o sinal = ficando Objeto.oi = 'valor'
# também não estaria serrado fazer Objeto.oi=('valor')
puts Robervaldo.sexo


# A mesma regra se aplica às operações aritméticas que havíamos visto, Os números em Ruby também são objetos!
# Os operadores em Ruby são métodos comuns, Tudo em ruby é um objeto e todas as operações funcionam como envio de mensagens

puts "-------------------------------"

puts 10.+(3)

# attr_reader , attr_writer, attr_accessor
# imagine uma classe com muitos atributos... ficar definindo os métodos acessores e modificadores para cada atributo que precisar se torna muito trabalhoso.
# O Ruby tem um método
# que escreve para você o métodos acessor: attr_reader e um outro que escreve o modificador: attr_writer de cada atributo, tem também um que escreve os dois: attr_acessor.

class Pessoa
  attr_accessor :altura
  attr_accessor :cor_dos_olhos

  # repare que eu não havia declarado o atributo @peso antes. De uma certa meneira, o attr_acessor é uma forma mascarada de declarar atributos que podem ser acessados e modificados fora da classe.
  attr_accessor :peso
end

Marinaldo = Pessoa.new("Marinaldo",1.80,"loiro")

Marinaldo.altura = 1.50
puts Marinaldo.altura

Marinaldo.peso = 200
puts Marinaldo.peso

# Na orientação a objetos a chamada de um método é análoga ao envio de uma mensagem ao objeto. Cada objeto pode reagir de uma forma diferente à mesma mensagem, ao mesmo estímulo
# Isso é polimorfismo.
# Seguindo a ideia de envio de mensagens, uma maneira alternativa de chamar um me´todo é usar o método send(), que todo objeto em Ruby possui

Marinaldo.send(:fala)

# O método send recebe como argumento o nome do método a ser invocado, que pode ser um símbulo ou uma string. De acordo com a orientação a objetos
# É como se estivéssemos enviando a mensagem "fala" ao objeto pessoa.

# Todo objeto tem o método methods, que retorna uma aray com os nome de todos os métodos que o objeto sabe responder naquele instante

puts Marinaldo.methods

# Métodos de classe e métodos de instância

class Invoice
  # Métodos de classe, são equivalentes aos métodos estáticos
  def self.print_out
    "Printed our invoice"
  end

  # Métodos de instância
  def convert_to_pdf
    puts "Converted to PDF"
  end
end

puts Invoice.print_out


class ImExtending < Invoice
  def extend
    'im extending another class'
  end

  def convert_to_pdf # Polimorfismo
    super # Chama o convert_to_pdf da classe pai antes desse

    puts "Converted to PDF extended"
  end

  private # Métodos privados abaixo desse

  def metodo_private
    'im a private method'
  end
end

fim = gets

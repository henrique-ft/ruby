# Símbolos também são texto, como as Strings. Só que devem ser precedidos do caractere ':', ao invés de aspas.
# As principais diferenças são:
# São Imutáveis. Uma vez criado, um símbolo não pode ser alterado.
# São compartilhados. Símbolos com o mesmo valor, mesmo que em locais diferentes do código, compartilham do mesmo objeto.
# Por serem imutáveis e compartilhados, objetos Symbol geralmente são usados como identificadores e para nomenclatura (labels)

=begin

Use :simbolos para "strings" de controle de código, e "strings" para o que aparecerá na tela do usuário.

A primeira coisa que deve ser dita é que você não deve confundir strings com simbolos.
Quando você escreve :string, está instanceando um símbolo.
Quando você escreve "string" está instanceando uma string. Vamos ver isso na prática:

:string.class
 => Symbol 
'string'.class
 => String 
Os métodos que estão disponíveis para objetos String não são os mesmos que estão disponíveis para objetos Symbol. 
Então, muitas vezes esses objetos não são intercambeáveis.

A maior diferença entre um símbolo e uma string é que um símbolo é imutável. 
Isso significa que uma vez que ele seja instanceado, é impossível modificar seu valor. 
Uma string, por outro lado, é mutável. Por exemplo, e possível usar o método tr! para mudar o valor de uma string:

 a = 'string'
=> "string"
 a
=> "string" # valor da string
 a.tr!('i', 'e')
=> "streng"
 a
=> "streng" # mesma variável possui outro valor agora
Uma diferença importantíssima é que um objeto da classe símbolo nunca tem sua memória desalocada, diferente de uma string. 
O ruby é uma linguagem interpretada que tem um coletor de lixo - isso significa que você não tem que alocar e desalocar memória manualmente como é necessário em linguagens de mais baixo nível como C (através da função malloc, por exemplo). 
Quando você não vai mais usar uma string, o coletor de lixo do ruby descarta essa string. Isso nunca acontece com símbolos. 
Para liberar a memória consumida pelos símbolos, só tem um jeito: Saindo do seu programa.

Quando um programa consome cada vez mais memória sem nunca liberá-la, esse programa está vazando memória. Se você deixar ele rodando para sempre, a memória usada vai sendo cada vez maior. 
Isso não é desejável para programas que vão rodar por muito tempo, por exemplo um aplicativo em Rails.
Para evitar isso, não se deve criar símbolos dinamicamente no programa em strings desconhecidas. 
Por exemplo, utilizando o método to_sym em entrada de dados do usuário.

Agora que já assustei, vamos a parte boa dos símbolos :-)

Como eles são imutáveis, não é necessário instanceá-los a cada vez que eles aparecem no programa.
 Isso significa que ele o ruby nota que já existe um símbolo igual aquele, e usa novamente, quantas vezes forem necessárias. Vamos provar isso:

 "minha string".object_id == "minha_string".object_id
 => false 
 :simbolo.object_id == :simbolo.object_id
 => true 

Como você pode ver, a primeira linha instancia dois objetos diferentes, enquanto a segunda utiliza duas vezes o mesmo objeto.
Isso aí prova que o ruby reutiliza símbolos, mas não strings.

Tá, legal.
E eu com isso? 
O problema é que instancear ou comparar strings demora muito mais do que instancear ou comparar símbolos. 
Então, apesar de perder um pouco utilizando constantemente mais memória, as operações feitas com símbolos são normalmente mais rápidas.

Como vimos, a comparação de um símbolo pode ser feito com object_id, enquanto uma string é feita comparando o valor interno. 
Isso é muito mais caro para o processador, que trabalha a nivel de bits, onde numeros são representados utilizando bem menos espaço que strings.

Não digo que você irá comparar um símbolo manualmente.
Por exemplo, usar símbolos como chaves para um objeto do tipo Hash em que os valores serão buscados frequentemente aumenta em muito a performance, exatamente pela comparação de símbolos ser mais rápida do que de strings.

Pela suas características, os Símbolos foram pensados para ser utilizados para controle de código. 
Por exemplo, para chaves de um dicionário ou então um atributo tipo de um objeto. 
Você usará constantemente esses valores no código, e são usados para comparação (direta no caso do atributo, implícita no caso de chave para um hash). 
Por isso é mais vantajoso utilizar símbolos e evitar ficar instanceando uma nova string cada vez que seu código é utilizado.

Já as Strings brilham quando quando os valores são manipulados, ou quando elas são definidas dinamicamente. 
Por exemplo, para o apelido de um usuário de um site - existem muitos usuários e dificilmente todos irão entrar no site ao mesmo tempo, então não há motivos para utilizar símbolo e sofrer com o aumento de memória.

=end

puts :simbolo
puts :simbolo.class



fim = gets

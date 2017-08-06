# A constante $LOAD_PATH contêm os caminhos dos diretórios onde estão os arquivos .rb das classes core do Ruby
# Todos os arquivos que estão nos diretóros de $LOAD_PATH são carregados automaticamente quando um programa Ruby é inicializado
# Inclusive, nesses diretórios é que estão as famosas Gems, e é para lá que vão quando são instaladas através do comando gem install
# Quando damos um require como este:
require 'rails'
# O Ruby irá procurar entre os diretórios principais aonde se encontra a gem rails e suas dependências e adicionar ao $LOAD_PATH 
# para carregar automaticamente junto a sua inicialização
# Se no caso o require fosse escrito dessa maneira:
# require 'rails.rb'
# Se o parâmetro não for o caminho absoluto do arquivo rails.rb
# o mesmo será procurado nos diretórios definidos no $LOAD_PATH e carregado junto a inicialização do Ruby caso encontrado.

puts $LOAD_PATH.inspect
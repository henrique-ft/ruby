# A constante $LOAD_PATH contêm os caminhos dos diretórios onde estão os arquivos .rb das classes core do Ruby
# Todos os arquivos que estão nos diretóros de $LOAD_PATH são carregados automaticamente quando um programa Ruby é inicializado
# Inclusive, nesses diretórios é que estão as famosas Gems, e é para lá que vão quando são instaladas através do comando gem install
# Quando damos um require como este:
require 'rails'
# O Ruby irá procurar entre os diretórios principais os locais aonde se encontram a gem Rails e suas dependências e adicionar no $LOAD_PATH 
# para carregar automaticamente junto a sua inicialização

puts $LOAD_PATH.inspect
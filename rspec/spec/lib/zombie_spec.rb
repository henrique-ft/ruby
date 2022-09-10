require "spec_helper"
require "zombie"

# Para instalar a gem rspec:
#
# gem install rspec
#
# Para rodar o rspec use o comando 'rspec':
#
# rspec spec/lib/zombie_spec.rb

# Aqui você descreve um conjunto de testes, no caso exemplo, "A Zombie".
# describe "A zombie" do
# Você também pode dizer que irá escrever testes para uma classe específica, passando ela como parâmetro.
describe Zombie do

  # Aqui você escreve as especificações de um "Zombie", as especificações da sua crspec spec/lib/zombie_spec.rblasse. (os testes de fato)
  # Os it são como se fosse um "to-do list"

  # Nome do exemplo. todo nome de uma especificação começa com a função it
  it "is named ash" do
    zombie = Zombie.new

    # equivalente ao assert_equal do Test::Unit
    expect(zombie.name).to eq('ash')
  end

  # Outras especificações de um Zombie
  it "has no brains" do
    zombie = Zombie.new

    # Todo zombie deve ter menos que um cérebro
    expect(zombie.brains).to be < 1
  end

  # O Rspec também entende sobre métodos da sua classe dinamicamente com metaprogramação
  # Por exemplo:
  # Se a sua classe tiver um método com o ? por exemplo, xxx?, o rspec automaticamente vai criar um método be_xxx? que irá chamar o método xxx? da sua classe
  # É esperado que métodos com ? retornem sempre true ou false
  # Também funciona para métodos que contêm ? e precisam de argumentos
  # expect(actual).to have_xxx(:arg) # passes if actual.has_xxx?(:arg)
  it "is hungry" do
    zombie = Zombie.new

    expect(zombie).to be_hungry
  end

  # Você pode primeiro escrever todos os testes da sua aplicação e depois implementa-los,
  # Para facilitar podemos declarar testes como pendentes

  # Se você escrever xit, significa que esta é uma espeficação que ainda vai ser implementada na sua aplicação
  # Você declara como sendo uma espeficação pendente, ou seja, não é uma falha no sistema, é uma pendêncio, uma especificação que ainda não foi implementada
  xit "is dead" do
    zombie = Zombie.new

    # Todo zombie deve estar morto
    expect(zombie.alive).to be false
  end

  # Você também pode declarar uma especificação pendente colocando a palavra pending
  it "is rotting" do
    pending

    zombie = Zombie.new

    # Todo zombie deve estar andando por ai
    expect(zombie.rotting).to be true
  end
end

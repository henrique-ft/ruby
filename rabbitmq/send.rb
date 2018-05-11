require 'bunny'

# O Rabbit MQ é um "coletador de mensagens". Uma plataforma para trabalharmos com filas.

connection = Bunny.new
connection.start

# Criando um canal, onde a maior parte da API que faz as coisas funcionarem estão

channel = connection.create_channel

# Para enviar mensagens precisamos declarar uma fila, se ela não existir, é criada.

queue =  channel.queue('hello')

# Enviando uma mensagem

channel.default_exchange.publish('Hello World', routing_key: queue.name)

puts " [x] Sent 'Hello World' to queue 'hello'"

connection.close
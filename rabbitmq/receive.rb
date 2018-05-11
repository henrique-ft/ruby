require 'bunny'

connection = Bunny.new
connection.start

channel = connection.create_channel

# Nos conectamos a uma fila
queue = channel.queue('hello')

begin
  puts ' [*] Waiting for messages. To exit press CTRL+C'

  # Nos "inscrevemos" em uma fila para recebermos todas as suas mensagens
  # O parâmetro block como true é apenas para deixar o teste mais demonstrativo
  # queue.subscribe ficará em loop infinito esperando mensagens do sender
  queue.subscribe(block: true) do |_delivery_info, _properties, body|
    puts " [x] Received #{body}"
  end
rescue Interrupt => _
  connection.close

  exit(0)
end
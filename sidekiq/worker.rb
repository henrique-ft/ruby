require "sidekiq"

# Sidekiq é uma biblioteca Ruby para processar background jobs e funciona em conjunto com o Redis
# O Sidekiq consiste em três partes: o Sidekiq Client API, o Sidekiq Server e um Redis server
# Configura o Sidekiq

Sidekiq.configure_client do |config|
  config.redis = { db: 5 }
end

Sidekiq.configure_server do |config|
  config.redis = { db: 5 }
end

# Quando chamamos o método perform do worker um "Job" é criado, colocado na fila "Default" do Sidekiq no Redis.
# Recebemos o seu id do job como retorno (JID)
# Todo worker gera um Job
# Um Job pode ser definido como uma abstração do worker dado um estado definido pela aplicação
# Ou seja, um Job é uma representação da classe worker(com estado definido na hora que foi criado) esperando para ser executado na fila
# Os parâmetros do Perform são os valores(estado definido) que o Job irá carregar e utilizar quando executar a sua regra de negócio

# Todo processo Sidekiq da um "pull" na fila "Default" de jobs do Redis e executa-o

# Podemos criar jobs na fila das seguintes maneiras:

# MyWorker.perform_async(1, 2, 3)
# ou
# Sidekiq::Client.push('class' => MyWorker, 'args' => [1, 2, 3])

# Quando o processo do sidekiq der um "pull" na fila e receber o Job, ele executará o perform

class OurWorker
  include Sidekiq::Worker

  def perform(complexity)
    case complexity
    when "super_hard"
      sleep 20
      puts "Really took quite a bit of effort"
    when "hard"
      sleep 10
      puts "That was a bit of work"
    else
      sleep 1
      puts "That wasn't a lot of effort"
    end
  end
end

# Podemos definir em qual fila queremos inserir o Job definindo dentro da classe:
# sidekiq_options queue: 'critical'

class OtherQueueWorker
  include Sidekiq::Worker
  sidekiq_options queue: 'other_queue'

  def perform(complexity)
    case complexity
    when "super_hard"
      sleep 20
      puts "Really took quite a bit of effort"
    when "hard"
      sleep 10
      puts "That was a bit of work"
    else
      sleep 1
      puts "That wasn't a lot of effort"
    end
  end
end

# Podemos definir ordem de prioridade para filas nos argumentos:
#
# sidekiq -q critical,2 -q default
#
# Ou em um arquivo de configuração:
#
# :queues:
# - [critical, 2]
# - default
#

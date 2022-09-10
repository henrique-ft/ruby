
# Má prática, captura qualquer tipo de erro:
begin
  # Ocorre um erro, divisão por zero não existe
  puts 8/0
rescue
  # Caso um erro for capturado, cai no bloco de rescue
  puts "Aconteceu um erro"
end

# Melhor prática, captura um tipo específico de erro:
begin
  # Ocorre um erro, divisão por zero não existe
  puts 8/0
rescue ZeroDivisionError => e # Captura apenas erros ZeroDivisionError
  # Captura o erro, e adiciona sua descrição a variável e
  puts "Um erro ocorreu: #{e}"
end

# Melhor prática, captura um tipo específico de erro:
begin
  # Ocorre um erro, divisão por zero não existe
  puts 8/0
rescue StandardError => e # Captura qualquer erro do tipo StandardError
  # Captura o erro, e adiciona sua descrição a variável e
  puts "Um erro ocorreu: #{e}"
end

# Captura de erro customizado
def error_logger(e)
  File.open('errors/error_log.txt','a') do |file|
    file.puts e
  end
end

begin
  puts nil + 10
rescue StandardError => e
  error_logger("Error: #{e} at #{Time.now}")
end


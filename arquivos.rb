
# Cria o arquivo, passando o caminho, e recebe como segundo argumento as opções, como leitura, escrita etc...

File.open('arquivos/teams.txt','w+')

# r reading
# a appending to a file
# w just writing
# w+ reading and writing
# a+ open a file for reading and appending
# r+ opening a file for updatins, both reading and writing

# Cria o arquivo e escreve Twis, Astros e Mets

File.open('arquivos/teams.txt','w+') {|f|
  f.write("Twis, Astros, Mets")
}

# Também temos a maneira orientada a objetos

file = File.new('arquivos/other_teams.txt','w+')
file.puts("A's, Diamondbacks, Mariners")
file.close

# Lendo arquivos

teams = File.read('arquivos/teams.txt')

# Retorna uma string contendo o conteúdo do arquivo

p teams

# Quebra a string

p teams.split

# Deletar um arquivo

File.delete("arquivos/teams.txt")

# Adicionando conteúdo a um arquivo

10.times do
  sleep 1

  puts "Record saved..."

  File.open("arquivos/logs.txt", "a") {|f|

    f.puts "Server started as: #{Time.new}"
  }
end

class Author

  # Com a função define_method, você pode definir um método dinamicamente dentro de uma classe

  define_method("some_method") do
    puts "Some details"
  end

  # É a mesma coisa que escrever o método abaixo

  # def some_method
  # puts "some details"
  # end

  def fiction_details(arg)
    puts "Fiction"
    puts arg
    puts "anything"
  end

  def coding_details(arg)
    puts "Fiction"
    puts arg
    puts "anything"
  end

  def history_details(arg)
    puts "Fiction"
    puts arg
    puts "anything"
  end
end

author = Author.new
author.some_method

author.coding_details("Call Newport")

# Em Author você tem exatamente as mesmas funcionalidades da classe Author, porém com os métodos criados dinamicamente dentro da própria classe

class Author2
  genres = %w(fiction coding history)

  genres.each do |genre|
    define_method("#{genre}_details") do |arg|
      puts "Genre: #{genre}"
      puts arg
      puts "anything"
    end
  end
end


author = Author2.new
author.fiction_details("Call Newport")
author.coding_details("Call Newport")
author.history_details("Call Newport")

# Quando usamos o define_method, nós definitivamente criamos o método em tempo de execução, diferentemente do method_missing, logo, o respond_to retorna true

p author.respond_to?(:coding_details)

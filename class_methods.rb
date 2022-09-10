class Hey
  def aMethod
    puts "hello"
  end

  # Método de Classes, ou métodos estáticos, também podem serem declarados dessa maneira

  def Hey.aClassMethod
    puts "goodbye"
  end
end

ob = Hey.new
ob.aMethod

Hey.aClassMethod

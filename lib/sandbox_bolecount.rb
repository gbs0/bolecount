class Bolecount

  def initialize
    @boletos = []
  end

  # Calculando soma total dos valores   
  def calculating_values
    int = 0 
    @boletos.each do |element|
      int += element
    end
    return int
  end

  def ask_for_new_boleto
    $stdout.puts 'Digite o valor do boleto: (ou \'ok\' para continuar)'
    n = gets.chomp
    if n == 'ok'
      nome_do_outro_metodo
    else
      @boletos << n.to_f
      show_boletos
    end
  end

  def show_boletos
    #Mostrando os valores no terminal
    $stdout.puts
    $stdout.puts 'Tabela dos valores inseridos:'
    $stdout.puts @boletos.sort.to_s
    $stdout.puts 'Total:R$ ' + calculating_values.to_s
    $stdout.puts '-' * 34
    $stdout.puts
  end
end

bolecount = Bolecount.new

loop do
  bolecount.ask_for_new_boleto
end


#Método que recebe o algoritmo de soma
# def into_sum_of_allowed_numbers(n)
#   return [] if n == 0 
#   @cache ||= {}
#   return @cache[n] if @cache[n]
  
#   ALLOWED_NUMBERS.each do |x|  
#     next if (n + 1) - x < 0
#     lesser_sum = into_sum_of_allowed_numbers(n - x)
#     next unless lesser_sum
#     @cache[n] = lesser_sum + [x]
#     return @cache[n]
#   end
#   nil
# end

# bolecount = Bolecount.new
# bolecount.show_boletos
# bolecount.ask_for_new_boleto
# bolecount.show_boletos
# bolecount.ask_for_new_boleto
# bolecount.show_boletos

#Mostrando os números
# into_sum_of_allowed_numbers(4.5) # ==> [0.5, 2, 2]
# $stdout.puts 
# $stdout.puts '-' * 34
# $stdout.puts 'Esses são os valores que correspondem sua soma:'
# $stdout.puts into_sum_of_allowed_numbers(n)
# $stdout.puts '-' * 34
# $stdout.puts


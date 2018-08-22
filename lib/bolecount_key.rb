 #Declarando os valores presentes
=begin
    Declaração de números decimais utilizamos o '.'
    Para separar os números, utilizamos ','
=end

@boletos = []

# Calculando soma total dos valores   
def soma(allowed)
  sum = 0 
  allowed.each do |i|
    sum += i
  end
  return sum
end

def n_in_boleto
  b = gets.chomp.to_f
  @boletos << b
  check_method
end

def check_method
    mynum = @boletos.first
    if mynum == 0
      ask_conttibuente
    end
end
#Script loop here
loop do
  $stdout.puts '(Digite \'ok\' p/ continuar ou \'sair\' p/ sair)'
  $stdout.puts 'Qual o valor do boleto? (Dica: Utilize \',\' p/ separar os centavos)'
  n_in_boleto

  #Mostrando os valores no terminal
  $stdout.puts
  $stdout.puts '-' * 34
  $stdout.puts 'Valores inseridos:'
  $stdout.puts @boletos.sort.to_s
  $stdout.puts 'Total:R$ ' + soma(@boletos).to_s
  $stdout.puts '-' * 34
  $stdout.puts
  
  #Garbage Colector
  # while n_in_boleto !=

  # if check_method == false
  #   break
  # end


end

#Section of remaing info
#Perguntando ao usuário qual foi o valor pago
def ask_conttibuente
  $stdout.puts 'Agora, qual o valor pago pelo contribuente? (ou \'sair\' para sair)'
  n = gets.chomp.to_f
end

#Método que recebe o algoritmo de soma
def into_sum_of_allowed_numbers(n)
  return [] if n == 0 
  @cache ||= {}
  return @cache[n] if @cache[n]
  
  @boletos.each do |x|  
    next if (n + 1) - x < 0
    lesser_sum = into_sum_of_allowed_numbers(n - x)
    next unless lesser_sum
    @cache[n] = lesser_sum + [x]
    return @cache[n]
  end
  nil
end


#Mostrando os números
# into_sum_of_allowed_numbers(4.5) # ==> [0.5, 2, 2]
$stdout.puts 
$stdout.puts '-' * 34
$stdout.puts 'Esses são os valores que correspondem sua soma:'
$stdout.puts into_sum_of_allowed_numbers(n)
$stdout.puts '-' * 34
$stdout.puts


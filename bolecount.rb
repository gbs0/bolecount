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

loop do
$stdout.puts 'Qual o valor do boleto? (ou \'sair\' para sair)'
b = gets.chomp.to_f
@boletos << b


#Mostrando os valores no terminal
$stdout.puts '-' * 34
$stdout.puts 'Tabela dos valores inseridos:'
$stdout.puts @boletos.sort.to_s
$stdout.puts 'Total:R$ ' + soma(@boletos).to_s
$stdout.puts '-' * 34
$stdout.puts
end

#Perguntando ao usuário qual foi o valor pago
$stdout.puts 'Qual o valor pago? (ou \'sair\' para sair)'
n = gets.chomp.to_f



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


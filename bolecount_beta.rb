#Declarando os valores presentes
=begin
    Declaração de números decimais utilizamos o '.'
    Para separar os números, utilizamos ','
=end
@boletos = []


def ask_boleto_value
  $stdout.puts '(Digite \'ok\' p/ continuar ou \'sair\' p/ sair)'
  $stdout.puts 'Qual o valor do boleto? (Dica: Utilize \',\' p/ separar os centavos)'
end

def n_in_boleto
  b = gets.chomp.to_f
  @boletos << b
end

# Calculando soma total dos valores   
def soma(allowed)
  sum = 0 
  allowed.each do |i|
    sum += i
  end
  return sum
end

def showing_table
  $stdout.puts
  $stdout.puts '-' * 34
  $stdout.puts 'Valores inseridos:'
  $stdout.puts @boletos.sort.to_s
  $stdout.puts 'Total:R$ ' + soma(@boletos).to_s
  $stdout.puts '-' * 34
  $stdout.puts  
end


#Perguntando ao usuário qual foi o valor pago
def aks_final_value 
  $stdout.puts 'Qual o valor pago? (ou \'sair\' para sair)'
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


#Showing final recipe
def show_recipe
  $stdout.puts 
  $stdout.puts '-' * 34
  $stdout.puts 'Esses são os valores que correspondem sua soma:'
  $stdout.puts into_sum_of_allowed_numbers(n)
  $stdout.puts '-' * 34
  $stdout.puts
end

loop do 
  #Pressionar ENTER ou 'sair'
  until n_in_boleto << '' or n_in_boleto << 0.0 do

  ask_boleto_value
  n_in_boleto
  showing_table

  end


end




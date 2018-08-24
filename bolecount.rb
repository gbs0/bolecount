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

  def ask_for_new_boleto
    $stdout.puts 'Digite o valor dos boletos: (\'ok\' p/ entrar valor pago ou \'h\' p/ ajuda)'
    b = gets.chomp
    if b == 'ok'
      show_result
    elsif b == 'h'
      show_help
    elsif b == 'sair'
      exit!      
    else
      @boletos << b.to_f
      show_boletos
    end
  end

  #Mostrando os números
  #into_sum_of_allowed_numbers(4.5) # ==> [0.5, 2, 2]
  def show_help
    $stdout.puts '(Utilize \'sair\' p/ encerrar o programa)'
    $stdout.puts '(Dica: Use \'.\' p/ separar as casas decimais)'
  end

  def show_result
  $stdout.puts 'Qual o valor pago? (ou \'sair\' para sair)'
  n = gets.chomp.to_f
  show_boletos
  if n == 'sair'
    exit
  end

  $stdout.puts 
  $stdout.puts '-' * 34
  $stdout.puts 'Esses são os valores que correspondem sua soma:'
  $stdout.puts into_sum_of_allowed_numbers(n)
  $stdout.puts '-' * 34
  $stdout.puts
  end

  def show_boletos
    #Mostrando os valores no terminal
    $stdout.puts
    $stdout.puts '-' * 34
    $stdout.puts 'Tabela dos valores inseridos:'
    $stdout.puts @boletos.to_s
    $stdout.puts 'Total:R$ ' + calculating_values.to_s
    $stdout.puts '-' * 34
    $stdout.puts
  end

end

bolecount = Bolecount.new

loop do
  bolecount.ask_for_new_boleto
end



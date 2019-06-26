require 'cli/ui'

class Router
  def initialize(controller)
    @controller = controller
  end

  def run
    loop do
      print_actions
      action = gets.chomp.to_i
      dispatch(action)
    end
  end

  private

  def print_actions
    puts "\n---"
    CLI::UI::Prompt.ask('O que você deseja fazer?') do |handler|
      handler.option('Mostrar Boletos')  { |selection| selection }
      handler.option('Adicionar Boletos')     { |selection| selection }
      handler.option('Marcar como pago')   { |selection| selection }
      handler.option('Deletar Boleto') { |selection| selection }
      puts '---'
    end # Callback will be  options: %w(rails go ruby python)
  end

  def dispatch(action)
    case action
    when 1 then @controller.list
    when 2 then @controller.create
    when 3 then @controller.mark_as_pay
    when 4 then @controller.destroy
    else
      puts "Please type 1, 2, 3 or 4 :)"
    end
  end
end
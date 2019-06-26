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
    CLI::UI::Prompt.ask('O que você deseja fazer?') do |handler|
      handler.option('Mostrar Boletos')  { |selection| selection }
      handler.option('Adicionar Boletos')     { |selection| selection }
      handler.option('Marcar como pago')   { |selection| selection }
      handler.option('Deletar Boleto') { |selection| selection }
    end # Callback will be  options: %w(rails go ruby python)

    puts "\n---"
    
    puts '1 - Display tasks'
    puts '2 - Add a new task'
    puts '3 - Mark a task as done'
    puts '4 - Remove a task'
    puts '---'
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
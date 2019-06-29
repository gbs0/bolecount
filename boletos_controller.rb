require_relative 'boleto'
require_relative 'boletos_view'

class BoletosController
  def initialize(repository)
    @repository = repository
    @view = BoletosView.new
  end

  def list
    display_boletos
  end

  def create
    # 1. Get description from view
    description = @view.ask_user_for_description
    # 2. Create new task
    boleto = Boleto.new(description)
    # 3. Add to repo
    @repository.add(boleto)
  end

  def mark_as_paid
    # 1. Display list with indices
    display_boletos
    # 2. Ask user for index
    index = @view.ask_user_for_index
    # 3. Fetch boleto from repo
    boleto = @repository.find(index)
    # 4. Mark boleto as done
    boleto.mark_as_paid!
  end

  def destroy
    # 1. Display list with indices
    display_boletos
    # 2. Ask user for index
    index = @view.ask_user_for_index
    # 3. Remove from repository
    @repository.remove(index)
  end

  private

  def display_boletos
    # 1. Fetch boletos from repo
    boletos = @repository.all
    # 2. Send them to view for display
    @view.display(boletos)
  end
end
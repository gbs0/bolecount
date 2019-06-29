require_relative 'boleto_repository'
require_relative 'boletos_controller'
require_relative 'router'

# repository = TaskRepository.new
controller = TasksController.new(repository)
router = Router.new(controller)
router.run
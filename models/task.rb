
class Task

  def initialize
    @tasks = []
  end



  def get_all_task
    @tasks
  end

  def add_task(task_name,task)
    raise ArgumentError, 'Nome da tarefa não pode ser vazio' if task_name.nil? || task_name.empty?
    raise ArgumentError, 'Conteúdo da tarefa não pode ser vazio' if task.nil? || task.empty?
    id = @tasks.length + 1

    new_task = {id:id,task_name:task_name,task:task,check:false}
    @tasks << new_task
    end


    def find_task_by_id(id)

     raise ArgumentError, "Necessário informar id da tarefa" if id.nil?

     my_task = @tasks.find do |task| task[:id] == id.to_i
     end

     raise ArgumentError, "Tarefa não encontrada" if my_task.nil?

     my_task

  end

  def remove_task(id)

    selected_task = find_task_by_id(id)

    @tasks.delete_if {|task| task[:id] == selected_task[:id]}

    'Tarefa deletada com sucesso!'

  end


  def check_task(id)

    task =  find_task_by_id(id)

    task[:check] = true

    @tasks

  end

  def edit_task(data)

    id = data['id']
    task_name = data['task_name']
    task = data['task']
    my_task = find_task_by_id(id)

    raise ArgumentError, 'Nome da tarefa não pode ser vazio' if task_name.nil? || task_name.empty?
    raise ArgumentError, 'Conteúdo da tarefa não pode ser vazio' if task.nil? || task.empty?

    my_task[:task_name] = task_name
    my_task[:task] = task
    my_task

  end


end

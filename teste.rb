require './models/task'

teste = Task.new

teste.add_task("cagar tronco","limpar")
teste.add_task("mijar","pao")


#  teste.check_task("2")
p teste.get_all_task

p teste.edit_task({id:1,task_name:'arrumar o quarto',task:"arrumar o quanto amannha 14h"})

p teste.get_all_task

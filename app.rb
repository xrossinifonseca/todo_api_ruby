require 'sinatra'
require 'json'
require './models/task'

task_model = Task.new

get '/task/all' do

  begin
    tasks  = task_model.get_all_task
    status 200
    content_type :json
    {data:tasks}.to_json

  rescue ArgumentError =>e

    status 400
    content_type :json
    { message: "#{e.message}", status: 400 }.to_json

  rescue => e
  puts "Erro interno: #{e.message}"
  status 500
  content_type :json
  { message: "Desculpe, Houve um erro no servidor", status: 500 }.to_json
end
end

post '/task/add' do

  payload = JSON.parse(request.body.read)

  begin
  task_model.add_task(payload["task_name"],payload["task"])

  status 201
  content_type :json
  {message:"Tarefa criada com sucesso!",status:201}.to_json

  rescue ArgumentError => e
    status 400

    content_type :json
    { message: "Erro ao criar tarefa: #{e.message}", status: 400 }.to_json

  rescue => e

    puts "Erro interno: #{e.message}"

    status 500
    content_type :json

    { message: "Desculpe, Houve um erro no servidor", status: 500 }.to_json
  end
end


post '/task/check/:id' do
  task_id = params['id']
  begin
  task_model.check_task(task_id)

  status 200
  content_type :json
  { message: "Tarefa concluída com sucesso!", status: 200 }.to_json

rescue ArgumentError =>e
  status 400
  content_type :json
  { message: "#{e.message}", status: 400 }.to_json
rescue => e

  puts "Erro interno: #{e.message}"
  status 500
  content_type :json
  { message: "Desculpe, Houve um erro no servidor", status: 500 }.to_json

end
end


delete '/task/:id' do
  task_id = params['id']

  begin
  task_model.remove_task(task_id)

  status 200
  content_type :json
  { message: "Tarefa excluída com sucesso!", status: 204 }.to_json

rescue ArgumentError =>e
  status 400
  content_type :json
  { message: "#{e.message}", status: 400 }.to_json
rescue => e

  puts "Erro interno: #{e.message}"
  status 500
  content_type :json
  { message: "Desculpe, Houve um erro no servidor", status: 500 }.to_jso

end
end


patch '/task' do

  payload = JSON.parse(request.body.read)

  begin
    puts payload['id']

  task_model.edit_task(payload)

  status 200
  content_type :json
  { message: "Tarefa editada com sucesso", status: 204 }.to_json

rescue ArgumentError =>e
  status 400
  content_type :json
  { message: "#{e.message}", status: 400 }.to_json
rescue => e

  puts "Erro interno: #{e.message}"
  status 500
  content_type :json
  { message: "Desculpe, Houve um erro no servidor", status: 500 }.to_json

end
end

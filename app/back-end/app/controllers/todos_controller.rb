require 'socket'

class TodosController < ApplicationController
 before_action :set_todo, only: [:show, :update, :destroy]

 # GET /todos
 def index
  @todos = Todo.all
  data = {data: @todos, ip: '172.24.4.25'}
  render json: data, status: :ok
 end

 # POST /todos
 def create
  @todo = Todo.create!(todo_params)
  if @todo.valid?
   @todo.save!
   data = {data: @todo, ip: '172.24.4.25'}
   render json: data, status: :created
  else
   render json:@todo.errors, status: :bad_request
  end
 end

 # GET /todos/:id
 def show
  data = {data: @todo, ip: '172.24.4.25'}
  render json: data, status: :ok
 end

 # PUT /todos/:id
 def update
  @todo.update(todo_params)
  head :no_content
 end

 # DELETE /todos/:id
 def destroy
  @todo.destroy
  head :no_content
 end

 private
 def todo_params
  # whitelist params
  params.permit(:title)
 end

 def set_todo
  @todo = Todo.new
 end
end

require 'rspec'
require_relative 'task'
require_relative 'task_list'

describe 'TaskList' do
  # Story: As a developer, I can add all of my Tasks to a TaskList.
  it 'has to be real' do
    expect{ TaskList.new }.to_not raise_error
  end

  # Story: As a developer with a TaskList, I can print the completed items.
  it 'has completed items' do
    monday = TaskList.new
    p 'monday', monday
    expect(monday.completed).to eq []
    expect(monday.completed).to be_an Array
#     expect(monday.incomplete_list).to eq []
    trash = Task.new 'Trash'
    trash.change_status
    p trash
    laundry = Task.new 'Laundry'
    dishes = Task.new 'Dishes'
    dishes.change_status
    # monday.view_status trash
    p monday.completed
    expect{ monday.view_status trash}.to change{ monday.completed }.from([]).to([trash])
    p "monday", monday
    
    # expect{ monday.view_status laundry}.to change{ monday.completed }.from([trash]).to([trash])
    # expect{ monday.view_status dishes}.to change{ monday.completed }.from([trash]).to([trash, dishes])
#     expect{ monday.progress laundry}.to change{ monday.incomplete_list }.from([]).to([laundry])
  end

end
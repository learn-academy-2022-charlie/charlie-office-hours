# User Stories








# Story: As a developer with a TaskList, I can print the incomplete items.

require 'rspec'
require_relative 'task'
# require_relative 'tasklist'
# require 'date'

describe 'Task' do
  # Story: As a developer, I can create a Task.
  it 'has to be real' do
    expect{ Task.new }.to_not raise_error
  end

  # Story: As a developer, I can give a Task a title and retrieve it.
  it 'has a title' do
    trash = Task.new 'Trash'
    expect(trash.title).to be_a String
    expect(trash.title).to eq 'Trash'
  end

  # Story: As a developer, I can give a Task a description and retrieve it.
  it 'has a description' do
    purpose = Task.new
    # p "purpose", purpose
    #<Task:0x000000012d39a048 @title="", @description=nil>
    purpose.description = 'bathroom trash'
    # p "purpose", purpose
    #<Task:0x000000015a25d158 @title="", @description="bathroom trash">
    expect(purpose.description).to be_a String
    expect(purpose.description).to eq 'bathroom trash'
  end

  # Story: As a developer, I can mark a Task done. Tasks should be initialized as 'in progress'.
  # Story: As a developer, when I print a Task that is done, its status is shown.
  it 'can mark task done' do
    laundry = Task.new
    # check default value of status
    expect(laundry.status).to be_a String
    expect(laundry.status).to eq 'in progress'

    # check that value will change with the method call
    # need method call if checking expected output of values 
    laundry.change_status
    expect(laundry.status).to eq 'done'

    # do not need to do a method call outside of the expect statement when checking for behavior. The method will be invoked with the method call inside the {}
    expect{ laundry.change_status }.to change{ laundry.status }.from('done').to('in progress')

    # this expect tests the output
    # expect{ laundry.change_status }.to output(/This is done/).to_stdout
  end

  # it 'can print task done' do
  #   laundry = Task.new

  #   # do not need to do a method call outside of the expect statement when checking for behavior. The method will be invoked with the method call inside the {}

  # end

end

# describe 'TaskList' do

#   it 'has to be real' do
#     expect{ TaskList.new }.to_not raise_error
#   end

#   it 'has a title' do
#     monday = TaskList.new 'Monday'
#     expect(monday.title).to be_a String
#     expect(monday.title).to eq 'Monday'
#   end

#   it 'has a status' do
#     monday = TaskList.new 'Monday'
#     expect(monday.status).to eq 'in progress'
#     expect{ monday.set_status }.to change{ monday.status }.from('in progress').to('done')
#   end

#   it 'has a list' do
#     monday = TaskList.new 'Monday'
#     trash = Task.new 'Trash'
#     expect(monday.list).to eq []
#     expect{ monday.add_task trash}.to change{ monday.list }.from([]).to([trash])
#   end

#   it 'has lists with status' do
#     monday = TaskList.new 'Monday'
#     expect(monday.complete_list).to eq []
#     expect(monday.incomplete_list).to eq []
#     trash = Task.new 'Trash'
#     trash.set_status
#     laundry = Task.new 'Laundry'
#     dishes = Task.new 'Dishes'
#     dishes.set_status
#     meals = Task.new 'Meals'
#     monday.add_task trash
#     monday.add_task laundry
#     monday.add_task dishes
#     monday.add_task meals
#     expect{ monday.progress trash}.to change{ monday.complete_list }.from([]).to([trash])
#     expect{ monday.progress laundry}.to change{ monday.incomplete_list }.from([]).to([laundry])
#   end

#   it 'has a due_date' do
#     monday = TaskList.new 'Monday'
#     trash = Task.new 'Trash'
#     expect(monday.due_date).to eq Date.today
#     expect(trash.due_date).to eq Date.today
#   end

#   it 'has a due list' do
#     monday = TaskList.new 'Monday'
#     trash = Task.new 'Trash'
#     dishes = Task.new 'Dishes'
#     dishes.set_status
#     expect(monday.task_due).to eq []
#     expect(monday.task_done).to eq []
#     expect{ monday.daily_task trash}.to change{ monday.task_due }.from([]).to([trash])
#     expect{ monday.daily_task dishes}.to change{ monday.task_done }.from([]).to([dishes])

#   end

#   it 'has a sorted list' do
#     monday = TaskList.new 'Monday'
#     trash = Task.new 'Trash'
#     dishes = Task.new 'Dishes'
#     laundry = Task.new 'Laundry'
#     meals = Task.new 'Meals'
#     monday.add_task meals
#     monday.add_task trash
#     monday.add_task laundry
#     monday.add_task dishes
#     dishes.set_status
#     dishes.another_day 5
#     trash.another_day 5
#     laundry.another_day 2
#     monday.progress meals
#     monday.progress trash
#     monday.progress laundry
#     monday.progress dishes
#     expect(monday.incomplete_list).to eq [meals, trash, laundry]
#     expect(monday.complete_list).to eq [dishes]
#     expect{ monday.sorter }.to change{ monday.incomplete_list }.from([meals, trash, laundry]).to([meals, laundry, trash])

#   end

# end
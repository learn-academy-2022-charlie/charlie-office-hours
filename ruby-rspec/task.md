Challenge: Tasklist with TDD
For each story:
Copy the story into your RSpec file as a comment
Write the test(s) that class/method tests must pass
Then run the test(s) and see that they fail
Then implement the class/method, with comments, so that it passes the tests one at a time

User Stories
Story: As a developer, I can create a Task.
```ruby
# in rspec_spec.rb
require 'rspec'
require_relative 'task'

describe 'Task' do

  it 'has to be real' do
    expect{ Task.new }.to_not raise_error
  end

end

# rspec.rb
class Task
end
```
- Run the following terminal command after creating test and creating code to see the test fail and pass
- $ rspec rspec_spec.rb

Story: As a developer, I can give a Task a title and retrieve it.
- Add an additional it block
```ruby
  it 'has a title' do
    trash = Task.new
    trash.title = 'Trash'
    expect(trash.title).to be_a String
    expect(trash.title).to eq 'Trash'
  end
```
- $ rspec rspec_spec.rb

- Update Task Class and create object
```ruby
  # attr_accessor
  attr_accessor :title
  # initialize method
  def initialize title
    @title = title
  end

  trash = Task.new 'Trash'
```
- $ rspec rspec_spec.rb

- Error message due to the updates
```#<ArgumentError: wrong number of arguments (given 0, expected 1)> with backtrace:```
> The updates of initializing a title parameter
caused my first test `Task has to be real` to fail
> Updating the expect block to show that the creation of a new object from the Task class will need an argument.
```ruby
expect{ Task.new ''}.to_not raise_error
```

Story: As a developer, I can mark a Task done. Tasks should be initialized as 'in progress'.
Story: As a developer, when I print a Task that is done, its status is shown.

- Add an additional it block
```ruby
  it 'has a status' do
    trash = Task.new 'Trash'
    expect(trash.status).to eq 'in progress'
    expect{ trash.set_status }.to change{ trash.status }.from('in progress').to('done')
  end
```
- Update class
```ruby
  # attr_accessor
    attr_accessor :title, :status
  # initialize method
  def initialize title
    @title = title
    @status = 'in progress'
  end
  # setter method
  def set_status
    @status = 'done' 
  end
```

Story: As a developer, I can add all of my Tasks to a TaskList.
```ruby
class TaskList < Task  
  def initialize title  
    super(title)
    @list = []  
  end
  
  def add_task task
    @list << task
  end
end
```

Story: As a developer with a TaskList, I can print the completed items.
Story: As a developer with a TaskList, I can print the incomplete items.
-used similar steps as created the @list array

Stretch: Due Date
Story: As a developer, I can give a Task a due date. Hint: Use the built-in Ruby Date class.
```ruby
require 'date'

@due_date = Date.today 
```


Story: As a developer with a TaskList, I can list all the not completed items that are due today.

Story: As a developer with a TaskList, I can list all the not completed items in order of due date.

Story: As a developer with a TaskList with and without due dates, I can list all the not completed items in order of due date, and then the items without due dates.
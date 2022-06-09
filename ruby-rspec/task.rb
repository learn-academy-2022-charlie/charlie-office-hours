require 'date'

class Task
  # attr_accesor
  attr_accessor :title, :status, :due_date
  # initialize method
  def initialize title=''
    @title = title
    @status = 'in progress'
    @due_date = Date.today 
  end
  # setter method
  def set_status
    @status = 'done' 
  end
  def another_day number
    @due_date = @due_date + number
  end
end

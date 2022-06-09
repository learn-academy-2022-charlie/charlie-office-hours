require 'date'

class Task
  # attr_accesor
  attr_accessor :title, :status, :due_date
  # initialize method
  def initialize title
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

class TaskList < Task
  attr_accessor :list, :complete_list, :incomplete_list, :task_due, :task_done
  def initialize title  
    super(title)
    @list = []
    @complete_list = []
    @incomplete_list = []
    @task_due = []
    @task_done = []
  end 
  def add_task task
    @list << task
  end

  def progress task
    if task.status=='done'
      @complete_list << task
    else
      @incomplete_list << task
    end
  end

  def daily_task task
    if task.status=='done' && task.due_date == Date.today
      @task_done << task
    elsif task.status=='in progress' && task.due_date == Date.today
      @task_due << task
    end
  end  

end

monday = TaskList.new 'Monday'
p monday
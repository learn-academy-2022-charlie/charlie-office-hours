# google search access another ruby file 
# because we are requiring the actual class we need to capitalize it to say class vice the lower class for the file
require_relative 'Task'

class TaskList
  attr_accessor :completed
  def initialize  
    @completed = []
  end 
  def view_status task
    # need to use dot notation to obtain value and not the instance variable that is living in a different file
    p "task", task.status
    if task.status == 'done'
      @completed << task
    end
  end

  tuesday = TaskList.new
  p tuesday
  trash = Task.new 'Trash'
  trash.change_status
  p trash
  tuesday.view_status trash
  p tuesday

  # def progress task
  #   if task.status=='done'
  #     @complete_list << task
  #   else
  #     @incomplete_list << task
  #   end
  # end

  # def daily_task task
  #   if task.status=='done' && task.due_date == Date.today
  #     @task_done << task
  #   elsif task.status=='in progress' && task.due_date == Date.today
  #     @task_due << task
  #   end
  # end  

end
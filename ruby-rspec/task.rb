# require 'date'

class Task
  # attr_accesor
  # attr_accessor :title, :status, :due_date
  attr_accessor :title, :description, :status
  # initialize method
  def initialize title=''
    @title = title
    @description = description
    @status = 'in progress'

#   #   @due_date = Date.today 
  end

  def change_status
    if status == 'in progress'
      @status = 'done'
      # p 'This is done'
    else
      @status = 'in progress'
      # p 'This is still in progress'
    end
  end
#   # def another_day number
#   #   @due_date = @due_date + number
#   # end
end

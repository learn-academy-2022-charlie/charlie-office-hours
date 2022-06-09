# Challenges
# For the following Task challenge, use initialize and getter methods in your class

# class
class Task
  # initialize method
  def initialize title
    @title = title
    @status = 'incomplete'
  end
  # getter method
  def get_title
    @title
  end
  # setter method
  def set_status
    @status = 'complete'
  end
end

# objects
trash = Task.new 'Trash'
meals = Task.new 'Meals'
bills = Task.new 'Bills'

# print objects
p trash
p meals
p bills

# print getter method call
p trash.get_title
p meals.get_title
p bills.get_title

# print setter method call
trash.set_status
meals.set_status
bills.set_status
p trash
p meals
p bills


# As a developer, I can create a class called Task.
# class Task
# end

# As a developer, I can create three instances (objects) of class Task. (e.g laundry = Task.new)
# trash = Task.new
# meals = Task.new
# bills = Task.new
# p trash
# p meals
# p bills
# Output:
#<Task:0x000000011c80cba0>
#<Task:0x000000011c80cb78>
#<Task:0x000000011c80ca88>

# As a developer, I can initialize each instance of class Task with a title.
# def initialize title
#   @title = title
# end
# Update the new instances of the class(the objects)
# trash = Task.new 'Trash'
# meals = Task.new 'Meals'
# bills = Task.new 'Bills'
# Output:
#<Task:0x00000001428b3920 @title="Trash">
#<Task:0x00000001428b38a8 @title="Meals">
#<Task:0x00000001428b3858 @title="Bills">

# As a developer, I can see the title of each instance of class Task.
# # getter method
# def get_title
#   @title
# end
# # method call
# p trash.get_title
# p meals.get_title
# p bills.get_title
# Output:
# "Trash"
# "Meals"
# "Bills"

# As a developer, I can initialize each instance of class Task with a status that has a default value of 'incomplete'.
# add instance variable
# @status = 'incomplete'
# Output:
#<Task:0x00000001158a3318 @title="Trash", @status="incomplete">
#<Task:0x00000001158a3278 @title="Meals", @status="incomplete">
#<Task:0x00000001158a31b0 @title="Bills", @status="incomplete">

# As a developer, I can update the status of each instance of class Task when the task has been completed.
# # setter method
# def set_status
#   @status = 'complete'
# end
# print setter method call
# trash.set_status
# meals.set_status
# bills.set_status
# p trash
# p meals
# p bills
# Output:
#<Task:0x000000012b9813c8 @title="Trash", @status="complete">
#<Task:0x000000012b981350 @title="Meals", @status="complete">
#<Task:0x000000012b9812d8 @title="Bills", @status="complete">

# For the following ColorPalette challenge use initialize and attr_accessor methods in your class

class ColorPalette
  # attr_accesor
  attr_accessor :color1, :color2, :color3
  # initialize method
  def initialize color1, color2, color3
    @color1 = color1
    @color2 = color2
    @color3 = color3
  end
  # # getter method
  def all_colors
    "The three colors of this palette are #{color1}, #{color2}, and #{color3}."
  end
end

# objects
orange = ColorPalette.new 'Sunburst', 'Rust', 'Neon'
gray = ColorPalette.new 'Pewter', 'Midnight', 'Hazy'
red = ColorPalette.new 'Burgundy', 'Wine', 'Strawberry'

# print objects
# p orange
# p gray
# p red

# # print values
# p orange.color1
# p gray.color2
# p red.color3

# # print getter method call
# p orange.all_colors
# p gray.all_colors
# p red.all_colors

gray.color1 = 'Smoky'
p gray

# As a developer, I can create a class called ColorPalette.
# As a developer, I can create three instances (objects) of class ColorPalette. (e.g green = ColorPalette.new)
# As a developer, I can initialize each instance of the class ColorPalette with three colors. (e.g. green = ColorPalette.new('Chartreuse', 'Kelly', 'Seafoam'))
  # initialize method
  # def initialize color1, color2, color3
  #   @color1 = color1
  #   @color2 = color2
  #   @color3 = color3
  # end
# Output:
#<ColorPalette:0x000000013b05e358 @color1="Sunburst", @color2="Rust", @color3="Neon">
#<ColorPalette:0x000000013b05e2b8 @color1="Pewter", @color2="Midnight", @color3="Hazy">
#<ColorPalette:0x000000013b05e218 @color1="Burgundy", @color2="Wine", @color3="Strawberry">

# As a developer, I can print the value of each individual color.
# attr_accessor
# attr_accessor :color1, :color2, :color3

# As a developer, I can create a method called all_colors that when called will print a sentence telling me the three colors of a given palette.
  # # getter method
  # def all_colors
  #   "The three colors of this palette are #{color1}, #{color2}, and #{color3}."
  # end
# Output:
# "The three colors of this palette are Sunburst, Rust, and Neon."
# "The three colors of this palette are Pewter, Midnight, and Hazy."
# "The three colors of this palette are Burgundy, Wine, and Strawberry."

# As a developer, I can change one or more colors of a given palette.
# reassign a value
# gray.color1 = 'Smoky'
# Output:
#<ColorPalette:0x000000013094cbf0 @color1="Smoky", @color2="Midnight", @color3="Hazy">

# Animal Kingdom
# As a developer, I can make an Animal (generic Animal class).
# As a developer, upon initialization, I can give my Animal a status of alive, which will be set to true.
# As a developer, I can give my Animal an age of 0 upon creation.
# As a developer, I can age my Animal up one year at a time.
# As a developer, I can return my Animal's age, as well as if they're alive.
# Hint: Use attr_accessor as well as an initialize method.
# As a developer, I can create a Fish that inherits from Animal.
# As a developer, I can initialize all of my fish to be cold_blooded. (Yes, there is one fish who is technically fully warm-blooded but we aren't going to talk about that.)
# As a developer, I can create a Salmon that inherits from Fish.
# As a developer, I can initialize my Salmon to be a specific species (Atlantic, Sockeye, etc).
# As a developer, I can see that my Salmon is cold-blooded.
# As a developer, I can age my Salmon up.
# As a developer, I can see a message that tells me all of my Salmon's information.
# As a developer, if my Salmon reaches the ripe old age of 4, I can make it die peacefully after a full and happy life.
# Hint: You will need a method that changes the status of alive in the initialize method of Animal.
# As a developer, I can create a Mammal that inherits from Animal.
# As a developer, I can initialize all of my Mammals to be warm_blooded.
# As a developer, I can create a Bear that inherits from Mammal.
# As a developer, I can age my Bear up.
# As a developer, I can see a message that tells me all of my Bear's information.
# As a developer, if my Bear turns 20 years old, I can make it die peacefully after a full and happy life.
# Hint: You will need a method that changes the status of alive in the initialize method of Animal.
# As a developer, I can create a Mammal of my choice.
# As a developer, I can interact with the new Mammal via various methods.
# As a developer, I can see a message that tells me all of my new Mammal's information.
# STRETCH: As a developer, I can keep a collection of two of each Animal.
# Hint: You'll want to add your Animals into an array.
# STRETCH: As a developer, I can sort my collection of Animals based on age.
# Hint: Find out how the spaceship operator can help you with an array.
# SUPER STRETCH: As a developer, I can utilize a Ruby module to help DRY up my code. I can create a swim method inside of my module that will apply to Animals who can swim. This method should return "I can swim!"
# Hint: Look into module mix ins. Since not all animals can swim, only certain Animals will have access to this module.
// Class inheritance

// final Car Class 
class Car{
  constructor(model, year){
    this.model = model
    this.year = year
    this.lights = "off"
    this.signal = "off"
    this.speed = 0
  }

  wheelsCount(){
    this.wheels = 4
  }

  lightsOn(){
    this.lights = "on"
  }

  lightsOff(){
    this.lights = "off"
  }

  carInfo(){
    return `The status of the ${this.year} ${this.model} is wheels: ${this.wheels}, lights: ${this.lights}, signal: ${this.signal}, and speed: ${this.speed}` 
  }
}

let myCar = new Car("generic car", "myCar year")
myCar.wheelsCount()
console.log(myCar)

// final Tesla Class 
class Tesla extends Car{
  constructor(model, year){
    super(model, year)
  }

  acceleration(){
    this.speed = this.speed += 10
  }

  braking(){
    this.speed = this.speed -= 7
  }
}

let myTesla = new Tesla("Tesla", 2021)
myTesla.lightsOn()
myTesla.wheelsCount()
console.log(myTesla)
myTesla.lightsOff()
myTesla.acceleration()
console.log(myTesla)
myTesla.acceleration()
console.log(myTesla)
myTesla.braking()

// final Toyota Class 
class Toyota extends Car{
  constructor(model, year){
    super(model, year)
  }
  acceleration(){
    this.speed = this.speed += 5
  }

  braking(){
    this.speed = this.speed -= 2
  }
}

let myToyota = new Toyota("Toyota", 1993)
myToyota.lightsOn()
myToyota.wheelsCount()
console.log(myToyota)
myToyota.lightsOff()
console.log(myToyota)
myToyota.acceleration()
console.log(myToyota)
myToyota.braking()
myToyota.braking()
console.log(myToyota)

// final Volkswagen Class 
class Volkswagen extends Car{
  constructor(model, year){
    super(model, year)
  }

  acceleration(){
    this.speed = this.speed += 7
  }

  braking(){
    this.speed = this.speed -= 5
  }
}

let myVolkswagen = new Volkswagen("Volkswagen", 1989)
myVolkswagen.wheelsCount()
myVolkswagen.lightsOn()
console.log(myVolkswagen)
myVolkswagen.lightsOff()
myVolkswagen.acceleration()
myVolkswagen.acceleration()
myVolkswagen.acceleration()
console.log(myVolkswagen)
myVolkswagen.braking()
console.log(myVolkswagen)

console.log(myTesla.carInfo())
console.log(myToyota.carInfo())
console.log(myVolkswagen.carInfo())

// This is just one approach. 
// Story: As a programmer, I can make a car.

// Write a variable called myCar which is an instance of the class Car 
// ---> Create a class named Car

// class Car{
//   constructor(){
//   }
// }

// ---> Create a new instance of the Car Class, saved as a variable named myCar

// let myCar = new Car()
// console.log(myCar)


// Story: As a programmer, I can give my car a model on initialization.
// The model for the car class can be "generic car" 
 
// ---> Update the Car Class to pass model property upon initialization

// class Car{
//   constructor(){
//     this.model = "generic car"
//   }
// }


// Story: As a programmer, I can give my car a year on initialization.
// The year for the car class can be "myCar year" 

// ---> Update the Car Class to pass year property upon initialization

// class Car{
//   constructor(){
//     this.model = "generic car"
//     this.year = "myCar year"
//   }
// }


// Story: As a programmer, I can tell how many wheels myCar has.
// Calling the method wheels will return 4 

// ---> wheels method to change wheels to 4

// wheelsCount(){
//   this.wheels = 4
// }

  // call the method to alter the new instance of car

// myCar.wheelsCount()
// console.log(myCar)

// Story: As a programmer, I can make a Tesla car.
// class Tesla inherits from class Car

// class Tesla extends Car{
//   constructor(){
//     super()
//   }
// }

// Create an object called myTesla which is a instance of class Tesla

// let myTesla = new Tesla()
// console.log(myTesla)

// Story: As a programmer, I can give my Tesla a model on initialization.
// The model can be inherited from the parent class Car by passing the model through the constructor() and super() on the child class (done)

// By using extends and calling super() the tesla object variable contains all the information of the Car class.

// Story: As a programmer, I can give my Tesla a year on initialization.
// The year can be inherited from the parent class Car by passing the year through the constructor() and super() on the child class

// By using extends and calling super() the tesla object variable contains all the information of the Car class.

// Story: As a programmer, I can make a Toyota car.
// class Toyota inherits from class Car
// create an object called myToyota which is a instance of class Toyota

// Same steps as for Tesla


// Story: As a programmer, I can give my Toyota a model on initialization.
// The model can be inherited from the parent class Car by passing the model through the constructor() and super() on the child class

// Same steps as for Tesla


// Story: As a programmer, I can give my Toyota a year on initialization.
// The year can be inherited from the parent class Car by passing the year through the constructor() and super() on the child class

// Same steps as for Tesla


// Story: As a programmer, I can make a Volkswagen car.
// class Volkswagen inherits from class Car
// create an object called myVolkswagen which is a instance of class Volkswagen

// Same steps as for Tesla


// Story: As a programmer, I can give my Volkswagen a model on initialization.
// The model can be inherited from the parent class Car by passing the model through the constructor() and super() on the child class

// Same steps as for Tesla


// Story: As a programmer, I can give my Volkswagen a year on initialization.
// The year can be inherited from the parent class Car by passing the year through the constructor() and super() on the child class

// Same steps as for Tesla


// Story: As a programmer, I can give all my cars a lights property. Lights start in the off position.


// Update the Car class with a light property

// constructor(){
//   this.model = "generic car"
//   this.year = "myCar year"
//   this.lights = "off"
// }

// Story: As a programmer, I can turn the lights in all my cars on and off.

// Add lights method

// lightsOn(){
//   this.lights = "on"
// }

// lightsOff(){
//   this.lights = "off"
// }

// call the method to alter the new instance of any car

// myTesla.lightsOn()
// console.log(myTesla)
// myTesla.lightsOff()
// console.log(myTesla)

// Story: As a programmer, I can give all my cars a signal property. Turn signal starts in the off position.

// Update the Car class with a signal property

//   this.signal = "off"


// Story: As a programmer, I can determine the speed of a car. Speed starts at 0 mph.

// Update the Car class with a speed property

//   this.speed = 0

// Story: As a programmer, I can speed my Tesla up by 10 per acceleration.

// Add acceleration method to Tesla object

// acceleration(){
//   this.speed = this.speed += 10
// }

// Story: As a programmer, I can slow my Tesla down by 7 per braking.

// Add braking method to Tesla object

// braking(){
//   this.speed = this.speed -= 7
// }

// Story: As a programmer, I can speed my Toyota up by 5 per acceleration.

// Same steps as for Tesla

// Story: As a programmer, I can slow my Toyota down by 2 per braking.

// Same steps as for Tesla

// Story: As a programmer, I can speed my Volkswagen up by 7 per acceleration.

// Same steps as for Tesla

// Story: As a programmer, I can slow my Volkswagen down by 5 per braking.

// Same steps as for Tesla


// Story: As a programmer, I can call upon a carInfo method that will tell me all the information about a car.
// The method can be created in the parent class and accessed by all child classes

// The current setup is not allowing the data to be update when accessing the data in Tesla, Toyota, and Volkswagen, therefore, I need to update Car Class constructor to accept two parameters of model and year. Ensure model and year properties reflect these parameters.

// constructor(model, year){
//   this.model = model
//   this.year = year
//   this.lights = "off"
//   this.signal = "off"
//   this.speed = 0
// }

// Update constructor and super of the Tesla, Toyota, and Volkswagen objects to inherit model and year
// constructor(model, year){
//   super(model, year)
// }


// Update Car class with carInfo() method

// carInfo(){
//   return `The status of the ${this.year} ${this.model} is wheels: ${this.wheels}, lights: ${this.lights}, signal: ${this.signal}, and speed: ${this.speed}` 
// }

// Reassign the Tesla, Toyota, and Volkswagen objects to give unique arguments to the model and year properties. 

// let myTesla = new Tesla("Tesla", 2021)
// let myToyota = new Toyota("Toyota", 1993)
// let myVolkswagen = new Volkswagen("Volkswagen", 1989)

// console.log(myTesla.carInfo())
// console.log(myToyota.carInfo())
// console.log(myVolkswagen.carInfo())
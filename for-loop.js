// console.log("Aloha, Charlie, it's office hours!!!")
// console.log("Aloha, Charlie, it's office hours!!!")
// console.log("Aloha, Charlie, it's office hours!!!")
// console.log("Aloha, Charlie, it's office hours!!!")
// console.log("Aloha, Charlie, it's office hours!!!")

// for(let i = 0; i < 12; i++) {
//   console.log("Aloha, Charlie, it's office hours!!!", i)
// }

// for(let i = 0; i < 12; i = i + 2) {
//   console.log("Aloha, Charlie, it's office hours!!!", i)
// }

// for(let i = 0; i < 12; i++) {
//   if(i % 2 === 0) {
//     console.log(i)
//   }
// }

// for(let i = 12; i > 1; i--) {
//   if(i % 2 !== 0) {
//     console.log(i)
//   }
// }

const myString = "learn student"
//console.log(myString[2])
// Create the code that will log the number of times the letter "e" occurs in the string.
// Reference: https://github.com/learn-academy-2022-charlie/Syllabus/blob/main/javascript/intro.md

var count = 0
var myStringArray = myString.split("")

for (let i = 0; i < myStringArray.length; i++){
    if(myStringArray[i] === "e" ){
        console.log(i, myStringArray[i])
        count = count + 1
    }
}
console.log(count)


// Pseudocode
// change string into array
// index array to find "e"
// check each subset of the string
// use for loop

// Create the code that will log every other character in the string.

for (let i = 0; i < myStringArray.length; i+=2){
    
    console.log(myStringArray[i])

}

// STRETCH Challenges
// Create the code that iterates from 5 to 15. For each iteration log if the current number is odd or even.

for (i = 5; i < 16; i++) {
    if (i % 2 === 0) {
        console.log(i, "even")
    } else {
        console.log(i, "odd")
    }
}

// Expected output: "5 is odd" "6 is even" "7 is odd" ...etc
// Fizz Buzz: Create the code that will iterate from 1-100. If a number is a multiple of 3, replace it with the word fizz. If a number is a multiple of five, replace it with the word buzz. If a number is a multiple of both 3 and 5, replace it with fizzbuzz.

for(i = 0; i < 101; i++){
    if (i % 3 === 0 && i % 5 === 0) {
        console.log("fizzbuzz")
    } else if (i % 3 === 0) {
        console.log("fizz")
    } else if (i % 5 === 0) {
        console.log("buzz")
    } else {
        console.log(i)
    }
}

// Expected output: 1, 2, "fizz", 4, "buzz", "fizz", 7, 8, "fizz", "buzz", 11, "fizz", 13, 14, "fizzbuzz" ...etc
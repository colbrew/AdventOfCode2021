import Foundation

var arrayOfInts: [Int] = []
var prevVal = 100000000000
var numIncrease = 0

guard let fileURL = Bundle.main.url(forResource: "Depths", withExtension: "txt") else { fatalError() }

// Setup
do {
  let data = try String(contentsOf: fileURL, encoding: .utf8)
  let arrayOfStrings = data.components(separatedBy: "\n")
  arrayOfStrings.forEach { str in
    if let num = Int(str) {
      arrayOfInts.append(num)
    }
  }
} catch {
    print(error)
}

// Part 1
arrayOfInts.forEach { num in
  if num > prevVal {
    numIncrease += 1
  }
  prevVal = num
}

print(numIncrease)

// Part 2
var prevSum = 100000000
var currSum = 0
numIncrease = 0
for index in 0...arrayOfInts.count - 3 {
currSum = arrayOfInts[index] + arrayOfInts[index + 1] + arrayOfInts[index + 2]
  if currSum > prevSum {
    numIncrease += 1
  }
  prevSum = currSum
}

print(numIncrease)

import Foundation

guard let fileURL = Bundle.main.url(forResource: "Day2Input", withExtension: "txt") else { fatalError() }

var arrayOfStrings: [String] = []

// Setup
do {
  let data = try String(contentsOf: fileURL, encoding: .utf8)
  arrayOfStrings = data.components(separatedBy: "\n")
} catch {
  print(error)
}

// Part 1
var down = 0
var up = 0
var forward = 0

arrayOfStrings.forEach { string in
  let tempStrArr = string.components(separatedBy: " ")
  let num = Int(tempStrArr[1])!
  switch tempStrArr[0] {
  case "down":
    down += num
  case "up":
    up += num
  case "forward":
    forward += num
  default:
    break
  }
}
var finalVal = (down-up) * forward
print(finalVal)

// Part 2
var aim = 0
down = 0
forward = 0

arrayOfStrings.forEach { string in
  let tempStrArr = string.components(separatedBy: " ")
  let num = Int(tempStrArr[1])!
  switch tempStrArr[0] {
  case "down":
    aim += num
  case "up":
    aim -= num
  case "forward":
    forward += num
    down += num * aim
  default:
    break
  }
}

finalVal = down * forward
print(finalVal)

import times
import math

const MAX_PASSWORD_LEN = 128

type TPassEntry = enum
  UPPERCASE,
  LOWERCASE,
  SYMBOLS,
  NUMBERS

let upperCaseArray = ['A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z']
let lowerCaseArray = ['a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z']
let symbolArray = ['`','~','!','@','#','$','%','^','&','*','(',')','-','_','=','+','\\','|','{','[','}',']',';',':','\'','\"',',','<','.','>','/','?']
let numberArray = ['0','1','2','3','4','5','6','7','8','9']
let upperCaseArrayLen = upperCaseArray.len
let lowerCaseArrayLen = lowerCaseArray.len
let symbolArrayLen = symbolArray.len
let numberArrayLen = numberArray.len

proc generateUppercase(): char =
  randomize()
  var randomNumber = random(upperCaseArrayLen)
  return upperCaseArray[randomNumber]

proc generateLowercase(): char = 
  randomize()
  var randomNumber = random(lowerCaseArrayLen)
  return lowerCaseArray[randomNumber]

proc generateSymbol(): char = 
  randomize()
  var randomNumber = random(symbolArrayLen)
  return symbolArray[randomNumber]

proc generateNumber(): char =
  randomize()
  var randomNumber = random(numberArrayLen)
  return numberArray[randomNumber]

proc generate*( passwordLen: int, 
                allowAlphabetUpperCase: bool,
                allowAlphabetLowerCase: bool,
                allowSymbols: bool,
                allowNumbers: bool): string =
  if passwordLen > MAX_PASSWORD_LEN:
    stderr.writeln("Error: the password length should be less than " & $MAX_PASSWORD_LEN & ".")
    return nil

  var entry: seq[TPassEntry] = @[]

  result = ""

  if true == allowAlphabetUpperCase:
    entry.add(UPPERCASE)

  if true == allowAlphabetLowerCase:
    entry.add(LOWERCASE)

  if true == allowSymbols:
    entry.add(SYMBOLS)

  if true == allowNumbers:
    entry.add(NUMBERS)

  var entryLen = entry.len
  if 0 == entryLen:
    return nil

  if 1 == entryLen:
    for index in countup(0, passwordLen-1):
      case entry[0]:
      of UPPERCASE:
        result &= $(generateUppercase())
      of LOWERCASE:
        result &= $(generateLowercase())
      of SYMBOLS: 
        result &= $(generateSymbol())
      of NUMBERS:
        result &= $(generateNumber())
      else: discard
  else:
    for index in countup(0, passwordLen-1):
      randomize()
      var randomChoice = random(entryLen)
      case entry[randomChoice]:
        of UPPERCASE:
          result &= $(generateUppercase())
        of LOWERCASE:
          result &= $(generateLowercase())
        of SYMBOLS: 
          result &= $(generateSymbol())
        of NUMBERS:
          result &= $(generateNumber())
        else: discard
      

when isMainModule:
  var res = generate(10, true, true, true, true)
  
  for counter in countup(0,100):
    stderr.write(generateUppercase())
  echo("")

  for counter in countup(0,100):
    stderr.write(generateLowercase())
  echo("")

  for counter in countup(0,100):
    stderr.write(generateSymbol())
  echo("")

  for counter in countup(0,100):
    stderr.write(generateNumber())
  echo("")

  echo(res)
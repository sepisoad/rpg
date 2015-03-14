import os
import strutils
import parseopt2
import password

const APP_VERSION = "0.1.0"

## show command line usage
proc printCmdLineUsage() =
  echo("usage: rpg [-option:][value]")
  echo("example:")
  echo("  rpg -l -u -s -n -L:25")
  echo("  rpg -h")
  echo("  rpg -v")

## show command line option, help
## TODO: improve
proc performOptionHelp() =
  echo("rpg (random password generator) version : " & APP_VERSION)
  echo("Copyright: Sepehr Aryani © 2015")
  echo("License: GPLv3")
  echo("Github: https://github.com/sepisoad/rpg")
  echo("Twitter: @sepisoad")
  echo("====================")
  echo("here is the list of available options:")
  
  echo(" -v")
  echo("    shows version number")

  echo(" -h")
  echo("    shows help")

  echo(" -l")
  echo("    will include lowercase alphabets in generated password")

  echo(" -u")
  echo("    will include uppercase alphabets in generated password")

  echo(" -s")
  echo("    will include symbols in generated password")

  echo(" -n")
  echo("    will include numbers in generated password")


## print applicatin version and other related information
proc performOptionVersion() =
  echo("rpg version : ", APP_VERSION)

## parse the command-line argument
## TODO: test, improve
proc parseAppCmdLineArgs() =
  if 0 == os.commandLineParams().len:
    printCmdLineUsage()
    return

  var canUseLowerCase: bool = false
  var canUseUpperCase: bool = false
  var canUseSymbol: bool = false
  var canUseNumber: bool = false
  var passwordLen: int = 0

  var optParser = initOptParser()
  # optParser.next()
    


  while true:
    optParser.next()

    if cmdShortOption != optParser.kind:
      break
  
    case optParser.key:
      of "v":
        performOptionVersion()
        return

      of "h":
        performOptionHelp()
        return

      of "l":
        canUseLowerCase = true

      of "u":
        canUseUpperCase = true

      of "s":
        canUseSymbol = true

      of "n":
        canUseNumber = true

      of "L":
        try:
          passwordLen = strutils.parseInt(optParser.val)
        except ValueError:
          stderr.writeln("Error: password lenght value is invalid") 
          return
        except OverflowError:
          stderr.writeln("Error: password is too big") 
          return
      
      else: 
        stderr.writeln("Error: '" & optParser.key & "' is not a valid option")

  var password = password.generate( passwordLen,
                                    canUseUpperCase,
                                    canUseLowerCase,
                                    canUseSymbol,
                                    canUseNumber)
  if nil == password:
    return

  echo(password)

## this is where our cli app starts
proc run*(): void =
  parseAppCmdLineArgs()

run()
import nake
import os

const EXE_NAME = "  --out:./rpg ./src/rpg.nim "
const DEBUG_FLAGS = " c --debuginfo --lineDir:on -d:useSysAssert -d:useGcAssert --nimcache:./BUILD/DEBUG/"
const RELEASE_FLAGS = " c -d:release --nimcache:./BUILD/RELEASE/"

task "debug", "this option will compile source codes under debug mode":
  if not shell(nimExe & DEBUG_FLAGS & EXE_NAME):
    echo("Error")
  else:
    try:
      moveFile("./src/rpg", "rpg")
    except OSError:
      echo("Cannot find generated executable file")
    echo("Yay")

task "release", "this option will compile source codes under release mode":
  if not shell(nimExe & RELEASE_FLAGS & EXE_NAME):
    echo("Error")
  else:
    try:
      moveFile("./src/rpg", "rpg")
    except OSError:
      echo("Cannot find generated executable file")
    echo("Yay")
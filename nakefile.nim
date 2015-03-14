import nake
import os

const EXE_NAME = "  --out:./rpg ./src/rpg.nim "
const COMMON_FLAGS = ""
const DEBUG_FLAGS = " c --debuginfo --lineDir:on -d:useSysAssert -d:useGcAssert --nimcache:./BUILD/DEBUG/"
const RELEASE_FLAG = " -d:release "
const THROW_NAKE_CATCH = " --nimcache:./BUILD/NAKECATCH "

task "debug", "this option will compile source codes under debug mode":
  if not shell(nimExe & DEBUG_FLAGS & COMMON_FLAGS & EXE_NAME):
    echo("Error")
  else:
    try:
      moveFile("./src/rpg", "rpg")
    except OSError:
      echo("Cannot find generated executable file")
    echo("Yay")
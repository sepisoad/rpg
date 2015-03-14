# RPG (Random Password Generator)

rpg is a command line tool that helps you create random password which you can use for any purpose.
The code is licensed under GPLv3 license.

##Usage sample
rpg -l -u -s -n -L:26
  - -l switch defines that lowercase alphabets will be used in generated password (a, b, c, ...)
  - -u switch defines that uppercase alphabets will be used in generated password (A, B, C, ...)
  - -s switch defines that symbols will be used in generated password (#, @, $, ...)
  - -n switch defines that numbers will be used in generated password (0, 1, 2, ...)
  - -L switch along with a number will define the length of the generated password
  
##Version
0.1.0

##How to compile
all you need to do is to get the latest version of [nim](http://nim-lang.org/) compiler and compile 
it and then use 'nakefile' with 'debug' or 'release' option to build the source code.

##Contact me
email: [sepehr.aryani@gmail.com](sepehr.aryani@gmail.com)
twitter: [@sepisoad](https://twitter.com/sepisoad)
github: [@sepisoad](https://github.com/sepisoad)
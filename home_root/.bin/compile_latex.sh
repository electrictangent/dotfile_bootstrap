#!/bin/bash

if [ "$1" = "--help" ]; then
  echo "LaTeX compiler for Physics Reports."
  echo "    compile_latex <name of LaTeX file>"
  echo
  echo "That's literally all there is to it. It's so easy dumbass!" 
  echo "Don't you have a degree or something? Probably forgot Newton's"
  echo "laws or some trivial ass shit like that. Fucking idiot."
else
  latex $1
  latex $1
  dvips $1
  ps2pdf $1.ps $1.pdf
  zathura $1.pdf
fi

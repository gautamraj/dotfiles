#!/bin/bash
for i in .[a-z]*; do
  # Skip .git
  if [ $i == ".git" ]; then
    continue
  fi
  if [ $i == ".gitignore" ]; then
    continue
  fi

  echo ln -sf $PWD/$i ../$i;
done

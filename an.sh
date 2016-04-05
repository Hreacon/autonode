#!/bin/bash


if [ $1 == 'g' ]; then
  if[ $2 == 'component' ]; then
    echo "What is your selector?"
    read selector
    FILENAME=$3'.'$2'.ts'
    CAP3="$(tr '[:lower:]' '[:upper:]' <<< ${3:0:1})${3:1}"
    CAP2="$(tr '[:lower:]' '[:upper:]' <<< ${2:0:1})${2:1}"
    NAME="$CAP3$CAP2"
    echo "import { Component } from 'angular2/core';" >> $FILENAME
    echo "" >> $FILENAME
    echo "@Component({" >> $FILENAME
    echo "  selector: '$selector'," >> $FILENAME
    echo "  template: `" >> $FILENAME
    echo "    <div>Template code goes here!</div>" >> $FILENAME
    echo "  `" >> $FILENAME
    echo "})" >> $FILENAME
    echo "export class "$NAME" {" >> $FILENAME
    echo "}" >> $FILENAME
  fi
fi

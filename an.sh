#!/bin/bash


if [ $1 == 'g' ]; then

  FILENAME = $3'.'$2'.ts'
  echo "import { Component } from 'angular2/core';" >> $FILENAME
  echo "@Component({" >> $FILENAME
  echo "  selector: 'my-app'," >> $FILENAME
  echo "  template: `" >> $FILENAME
  echo "    <h1>Skeleton Angular2 App!</h1>" >> $FILENAME
  echo "  `" >> $FILENAME
  echo "})" >> $FILENAME
  echo "export class "$3$2" {" >> $FILENAME
  echo "}" >> $FILENAME

fi

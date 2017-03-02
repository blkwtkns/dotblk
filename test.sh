#!/bin/bash

foo=`ps h -p $$ -o args=''`
ed=${foo:0:3}
echo ${ed}

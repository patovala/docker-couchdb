#!/bin/sh
#######################################################################
# Script: Use the environment var to set the -name user@fdqn param    #
# Author: Copyright © 2015 Patricio Valarezo (c) @patovala            #
#######################################################################
VMARGS='vm.args'
SED='gsed'

if [[ -n "$ERLANG_HOST" ]]; then
    if [[ "$(grep -v '#' $VMARGS | grep '\-name' | wc -l)" -ne "0" ]]; then
      $SED "s/-name .*$/-name $ERLANG_HOST/" -i $VMARGS && echo "Replacing $ERLANG_HOST"
    else
      $SED "s/{{node_name}}/-name $ERLANG_HOST/" -i $VMARGS && echo "Adding $ERLANG_HOST"
    fi
fi

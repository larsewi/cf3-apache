#!/bin/bash

cf-remote spawn --platform ubuntu-24 --name cfengine-hub   --count 1 --role hub
cf-remote spawn --platform ubuntu-24 --name apache-servers --count 2 --role client

sleep 30
 
cf-remote --version master install --bootstrap cfengine-hub --hub     cfengine-hub
cf-remote --version master install --bootstrap cfengine-hub --clients apache-servers

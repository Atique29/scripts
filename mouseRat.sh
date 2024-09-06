#!/bin/bash

# Get the ID of the mouse device
mouse_id=$(xinput list | grep "Mouse" | grep -o "id=[0-9]*" | cut -d= -f2)

# Set the properties for the mouse device
xinput set-prop $mouse_id 187 -1 0 0 0 -1 0 0 0 1

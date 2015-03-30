#!/bin/bash

if $(dconf read /org/mate/marco/general/compositing-manager) == "true"
then
  dconf write /org/mate/marco/general/compositing-manager false
else
  dconf write /org/mate/marco/general/compositing-manager true
fi

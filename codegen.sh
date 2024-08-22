#!/bin/bash

cd gen
rm oid-998-*                                                   
~/tttool-1.9/osx/tttool --code-dim 148 --dpi 600 oid-codes davecraft.yaml
cd ..
#!bin/bash 

if [[ $1 == "-c" ]]; then
    kill -9 $(ps aux | grep build | awk '{print $2}')
fi




clang -o checkers *.m  -framework ApplicationServices -framework Foundation -framework Cocoa -framework AppKit -fobjc-arc
if [[ $? -ne 0 ]]; then
    echo "Build failed"
    exit 1
    else
    echo "Build succeeded "
    ./checkers
fi

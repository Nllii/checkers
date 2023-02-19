#!bin/bash 
if [[ $1 == "-c" ]]; then
    kill -9 $(ps aux | grep checkers | awk '{print $2}')

    kill -9 $(ps aux | grep run | awk '{print $2}')
fi

# if [[ -d ".build" ]]; then
#     rm -rf .build
# fi
# swiftc -import-objc-header /System/Library/Frameworks/AppKit.framework/Headers/AppKit.h -o birthday main.swift && ./birthday

swift build

if [[ $? -ne 0 ]]; then
    echo "Build failed"
    exit 1
    else
    echo "Build succeeded --- running "
    ./.build/debug/checkers 
fi



# wait for command then kill

# kill -9 $(ps aux | grep checkers | awk '{print $2}')

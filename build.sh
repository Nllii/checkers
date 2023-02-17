# clang -fobjc-arc -framework Foundation main.m -o myprogram
# clang -framework Foundation main.m -o safari-detector
# clang main.m -o checkers-bot -fobjc-arc -framework Cocoa -framework Foundation


clang main.m -o checkers-bot -fobjc-arc -framework Cocoa -framework Foundation -Wl,-sectcreate,__TEXT,__info_plist,Info.plist
./checkers-bot

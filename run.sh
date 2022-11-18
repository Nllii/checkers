lsof -P | grep ':5000' | awk '{print $2}' | xargs kill -9
python main.py
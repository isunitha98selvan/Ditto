from flask import Flask 
from apscheduler.scheduler import Scheduler
import random
import requests

app = Flask(__name__) 
cron = Scheduler(daemon=True)

@cron.interval_schedule(hours=0.1)
@app.route('/') 
def data_generator():
    humidity = random.randrange(20,80)
    temp = random.randrange(20,80)
    level = random.randrange(30,120)
    engine_temp = random.randrange(20,80)
    battery_capacity = random.randrange(20,80)
    current_level = random.randrange(20,80)
    
    dictToSend = {
     "environment": {
        "properties": {
            "humidity": 10,
            "temperature": 20            }
    },
     "fuel": {
       "properties": {
         "type": "Leaded",
         "capacity": 70 ,
         "level": 50 ,
         "rating": "A"
       }
     },
     "engine": {
       "properties": {
         "temperature": 5,
         "batterycapacity": 5 ,
         "currentlevel": 5      
       }
     },
     "tyres":  {
       "properties": {
            "pressure": 40,
            "wear": 20.5,
            "rating": "B",
            "temp": 35
     }
    },
    "brakes": {
      "properties": {
        "type": "CarbonCeramic",
        "temp": 200,
        "fluidlevel": 48.5
        }
    }
    }

    res = requests.put('http://localhost:8080/api/2/things/org.eclipse.ditto:vehicle/features', json=dictToSend)

    # dictFromServer = res.json()
    print('response from server:',res.text)
    # print(dictFromServer)
    return res.text
    
if __name__ == '__main__': 
    app.run() 


# curl -u ditto:ditto -X PUT -d '80' 'http://localhost:8080/api/2/things/org.eclipse.ditto:vehicle/features/environment/properties/humidity'
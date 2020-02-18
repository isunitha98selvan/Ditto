curl -X PUT 'http://localhost:8080/api/2/things/org.eclipse.ditto:vehicle/features' -u 'ditto:ditto' -H 'Content-Type: application/json' -d '{
    "environment": {
        "properties": {
            "humidity": 10,
            "temperature": 20
            }
    },
     "fuel": {
       "properties": {
         "type": "Leaded",
         "capacity": 70 ,
         "level": 20 ,
         "rating": "A"
       }
     },
     "engine": {
       "properties": {
         "temperature": 10,
         "batterycapacity": 10 ,
         "currentlevel": 10      
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
}'

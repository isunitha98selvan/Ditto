# for i in {0..100..1}
# do
    curl -u ditto:ditto -X PUT -d '{
    "definition": "digitaltwin:Vehicle:1.0.1",
    "attributes": {
        "manufacturer":"Suz" ,
        "VIN":1234
    },
   "features": {
     "environment": {
        "properties": {
            "humidity": 60,
            "temperature": 20
        }
     },
     "fuel": {
       "properties": {
         "type": "Leaded",
         "capacity": 70 ,
         "level": 78.6 ,
         "rating": "A"
       }
     },
     "engine": {
       "properties": {
         "temperature": 120,
         "batterycapacity": 60 ,
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
}' 'http://localhost:8080/api/2/things/org.eclipse.ditto:vehicle'+$i;

# done

curl -u ditto:ditto -X GET 'http://localhost:8080/api/2/things/org.eclipse.ditto:vehicle'
curl -u ditto:ditto -X GET 'http://localhost:8080/api/2/things/org.eclipse.ditto:vehicle/features'



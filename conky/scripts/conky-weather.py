#!/usr/bin/env python3
### conky-weather.py
### Builds a nice weather text widget for conky.
###
### Author: Nathan Campos <nathanpc@dreamintech.net>

import urllib.request
import json

with urllib.request.urlopen("http://api.wunderground.com/api/d9bd3f9e4521751b/conditions/q/Brazil/SBVT.json") as response:
    data = json.loads(response.read())["current_observation"]

    print("${{alignc}}Weather in {:s}".format(data["display_location"]["city"]))
    print("{:s} {:d}°C${{alignr}}Feels Like: {:d}°C".format(data["weather"], int(data["temp_c"]), int(float(data["feelslike_c"]))))
    print("Dewpoint: {:d}°C${{alignr}}Visibility: {:s} km".format(data["dewpoint_c"], data["visibility_km"]))
    print("Humidity: {:s}${{alignr}}Wind: {:s} {:.1f} km/h".format(data["relative_humidity"], data["wind_dir"], data["wind_kph"]))


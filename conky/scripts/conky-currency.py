#!/usr/bin/env python3
### conky-weather.py
### Builds a nice weather text widget for conky.
###
### Author: Nathan Campos <nathanpc@dreamintech.net>

import sys
import urllib.request
import json

# Check if we have enough arguments.
if len(sys.argv) < 3:
    print("Usage: " + sys.argv[0] + " <base> <currency1> [currency2]")
    print("\nNote: Maximum of 2 other currencies is currently supported due to the free API limitation.")
    sys.exit(1)

# Create a list of them to be used later.
base_curr = sys.argv[1]
currencies = sys.argv[2:]
query_str = "http://free.currencyconverterapi.com/api/v5/convert?compact=ultra&q="

# Build the URL.
for curr in currencies:
    query_str += curr + "_" + base_curr + ","

# Trim the trailing underline.
query_str = query_str[:-1]

# Let's go!
try:
    with urllib.request.urlopen(query_str) as response:
        # Get the data and extract the currencies available.
        data = json.loads(response.read())
        currencies = data.keys()
        rates = []

        # Go though each currency.
        for curr_key in currencies:
            curr = curr_key.split("_", 1)[0]
            rates.append(curr + ": " + "{:.4f}".format(data[curr_key]))

        if len(rates) == 1:
            print(rates[0])
        elif len(rates) == 2:
            print(rates[0] + "${alignr}" + rates[1])
        else:
            print("Too many rates, update the code.")
except Exception as e:
    print("Error: " + str(e))

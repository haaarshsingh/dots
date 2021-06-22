#!/usr/bin/python

import requests
import argparse

def get_icon(str):
    return {
        "01d": '',         # Clear sky - day
        "01n": '',         # Clear sky - night
        "02d": '',         # Few clouds (11-25%) - day
        "02n": '',         # Few clouds (11-25%) - night
        "03d": '',         # Scattered clouds (25-50%) - day/night
        "03n": '',
        "04d": '',         # Broken / Overcast clouds (51-84% / 85-100%) - day/night
        "04n": '',
        "09d": '',         # Shower rain - day
        "09n": '',         # Shower rain - night
        "10d": '',         # Moderate / heavy rain - day
        "10n": '',         # Moderate / heavy rain - night
        "11d": '',         # Thunderstorm - day
        "11n": '',         # Thunderstorm - night
        "13d": '',         # Snow - day
        "13n": '',         # Snow - night
        "50d": '',         # Fog - day
        "50n": '',         # Fog - night
    }[str]

parser = argparse.ArgumentParser(description="Display weather on polybar")
parser.add_argument("--city", type=str, nargs="?", required=True, help="City ID in openweather.org portal.")
parser.add_argument("--api", type=str, nargs="?", required=True, help="Api key in openweather.org portal.")
parser.add_argument("--units", type=str, nargs="?", default="metric", choices=["metric", "imperial"], help="Units for temperature.")
parser.add_argument("--prefix", type=str, nargs="?", default="", help="Prefix to the output.")

args = parser.parse_args()

response = requests.get(f"http://api.openweathermap.org/data/2.5/weather?id={args.city}&appid={args.api}&units={args.units}").json()

weather = response["main"]
temp = int(round(weather["temp"]))
icon = get_icon(response["weather"][0]["icon"])
if args.units == "metric":
    temp_sym = "C"
else:
    temp_sym = "F"

print(f"{args.prefix}{icon} {temp}°{temp_sym}")

import requests as req
import json
from datetime import date
url1 = 'https://api.football-data.org/v2/'
key = "a7716a05f3574d5a8f413c35354b5fd5"

def fixtures(key):
    url = 'http://api.football-data.org/v3/teams/86/matches?status=SCHEDULED&limit=1'
    headers = {'X-Auth-Token':key}
    try:
        response = req.get(url,headers=headers)
        match = response.json()['matches'][0]
        data = {'mday':match['matchday'],'utc':match['utcDate'],
            'hteam':match['homeTeam']['name'],'ateam':match['awayTeam']['name']}
        # print(data)
        return data
    except req.exceptions.ConnectionError:
        return "ERROR: Can't connect to the internet"
    except KeyError:
        return error_codes[response.json()['errorCode']]


match_date = fixtures(key)['utc'][8:10]
today = date.today().strftime("%d")
# print(match_date)
# print(today)

with open("/home/phaetan/atiqxe/scripts/real_fix_indicator/text.txt","r+") as file:
    if match_date != today:
        file.truncate(0)
        file.write("")
        file.close()
    else:
        file.truncate(0)
        file.write("  ")
        file.close()


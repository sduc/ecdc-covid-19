#!/bin/bash

current_date=$(date +'%y-%m-%d')
curl "https://www.ecdc.europa.eu/sites/default/files/documents/COVID-19-geographic-disbtribution-worldwide-${current_date}.xlsx" --output COVID-19-geographic-distribution-worldwide.xlsx

git clone git@github.com:sduc/ecdc-covid-19.git
mv COVID-19-geographic-distribution-worldwide.xlsx ecdc-covid-19/current/
cd ecdc-covid-19
git add .
git commit -m "Updating file"
git push origin master
cd ..
rm -rf ecdc-covid-19

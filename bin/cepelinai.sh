#!/bin/sh
echo `curl --silent -A "Mozilla/5.0" http://www.cepelinai.eu/lt/uzsakymas | grep "product-name" | sed 's/<[^>]*>//g' | shuf -n 1` && echo `curl --silent -A "Mozilla/5.0" http://www.cepelinai.eu/lt/uzsakymas | grep \"order_sauce\" -A 5 | grep option | sed 's/<[^>]*>//g' | shuf -n 1`

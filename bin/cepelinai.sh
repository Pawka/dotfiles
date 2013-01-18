#!/bin/sh
H="Mozilla/5.0 (iPhone; U; CPU iPhone OS 4_3_3 like Mac OS X; en-us) AppleWebKit/533.17.9 (KHTML, like Gecko) Version/5.0.2 Mobile/8J2 Safari/6533.18.5" && A=`curl --silent -A $H http://www.cepelinai.eu/lt/uzsakymas` && echo `echo $A | grep "product-name" | sed 's/<[^>]*>//g' | shuf -n 1` && echo `echo $A | grep \"order_sauce\" -A 5 | grep option | sed 's/<[^>]*>//g' | shuf -n 1`

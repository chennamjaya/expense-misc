requests=$1

curl -s "https://random-word-api.herokuapp.com/word?number=$requests" | sed -e "s/\[//" -e 's/\]//' | sed -e 's/,/ /g' -e 's/"//g' >/tmp/words
cat /tmp/words
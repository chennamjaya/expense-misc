requests=$1
url=$2

curl -s "https://random-word-api.herokuapp.com/word?number=$requests" | sed -e "s/\[//" -e 's/\]//' | sed -e 's/,/ /g' -e 's/"//g' >/tmp/words #s/\[// s/\]// search for [] and remove it s/,/ /g search for , and replace with space

for word in `cat /tmp/words`; do
  curl -X POST $url/api/transaction --header "Content-Type: application/json" -d "{\"amount\":\"$RANDOM\",\"desc\":\"$word\"}" &>/tmp/out #we are using \ to cancel out to use doublequotes inside doubleqoutes as variables dont use single quotes
  curl -X DELETE $url/api/transaction &>>/tmp/out
done
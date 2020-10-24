# API tests

set -v

# start the server in the background
node api.js &
sleep 1

echo POST some data to fill the database which is only in memory
curl --header "Content-Type: application/json" --request POST --data '{"isbn":"12345678","title":"The Lord of the Rings"}' http://localhost:3000/book
curl --header "Content-Type: application/json" --request POST --data '{"isbn":"999","title":"The Bible"}' http://localhost:3000/book
curl --header "Content-Type: application/json" --request POST --data '{"whatever":"abc","novalidation":"xyz"}' http://localhost:3000/book

echo
echo GET all the data
curl http://localhost:3000/book

## -*- sh -*-

for i in $(seq 0 $1)
do
   echo $(date) I am $$ $i
   sleep 1
done
echo 'Bye!'

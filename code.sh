#!/bin/bash
input="insert-domains-here"
echo "Adicionando lista de Dominios"
echo "."
echo ".."
echo "..."
sleep 1
echo "Analise iniciada"
echo "."
echo ".."
echo "..."
sleep 1
echo "---------------RESULTADOS-----------------"
while IFS= read -r line
do
echo "---------------------------------------------------------------------"
WEBSITEHTTP=$(echo "http://$line")
WEBSITEHTTPS=$(echo "https://$line")
HTTP=$(echo | curl -sL -w "%{http_code}\\n" $WEBSITEHTTP -o /dev/null)
HTTPS=$(echo | curl -sL -w "%{http_code}\\n" $WEBSITEHTTPS -o /dev/null)
IP=$(echo| nslookup $line | awk '/^Address/{n++; if (n==2){print $2; exit}}')
echo "O site $line ip $IP retorna o codigo $HTTP(HTTP) e $HTTPS(HTTPS)"
done <"$input"

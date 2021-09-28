#!/bin/bash
input="insert-domains-here"
echo "---------------Verificação Iniciada-----------------"
while IFS= read -r line
do
echo ""
echo ""
echo ""
echo "---------------------------------------------------------------------"
echo "Analisando $line"
echo "---------------------------------------------------------------------"
echo "                  [RESULTADOS]"
WEBSITEHTTP=$(echo "http://$line")
WEBSITEHTTPS=$(echo "https://$line")
HTTP=$(echo | curl -sL -w "%{http_code}\\n" $WEBSITEHTTP -o /dev/null)
HTTPS=$(echo | curl -sL -w "%{http_code}\\n" $WEBSITEHTTPS -o /dev/null)
IP=$(echo| nslookup $line | awk '/^Address/{n++; if (n==2){print $2; exit}}')
echo "O site $line ip $IP retorna o codigo $HTTP(HTTP) e $HTTPS(HTTPS)"
done <"$input"

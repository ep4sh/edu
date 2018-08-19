#!/bin/bash
#by ep4sh
if [[ -z ${1} ]]
then 
  echo "usage: crt2text <client_crt> <ca_crt> <HMAC_key>"
  echo "WARN: U should to gather all *.crt and *.key into same dir "
  echo "exmpl: crt2text client ca ta"
######################
else
  echo "............"
  client_conf="client.ovpn"
  client_cert=$(cat ./${1}.crt)
  client_key=$(cat ./${1}.key)
  ca=$(cat ./${2}.crt)
  ta=$(cat ./${3}.key)

###### CERT AUTHORITY
  cat <<EOF > ${client_conf}
<ca>
${ca}
</ca>
EOF


###### CLIENT KEY
  cat <<EOF >> ${client_conf}
<key>
${client_key}
</key>
EOF
  
####### HMAC
  cat <<EOF >> ${client_conf}
<tls-auth>
${ta}
</tls-auth>
EOF
  
#### CLIENT CERT
  cat <<EOF >> ${client_conf}
<cert>
${client_cert}
</cert>
EOF
#################
echo ".......Creating ${client_conf}...."
chmod 400 ${client_conf}
fi

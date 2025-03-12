#!/bin/bash
#
#  |════════════════════════════════════════════════════════════════════════════════════════════════════════════════|
#  • Autoscript AIO Lite Menu By cyber Project                                          |
#  • cyber Project Developer @Shahnawazyt | @Fezansohail | https://t.me/Cyberdecode |
#  • Copyright 2024 18 cyber Decode [  ] | [ @cyberdecode ] | [ Pakistan ]       |
#  |════════════════════════════════════════════════════════════════════════════════════════════════════════════════|
#
domain=$(cat /etc/xray/domain)
izp=$(cat /root/.isp)
region=$(cat /root/.region)
city=$(cat /root/.city)
clear
until [[ $user =~ ^[a-za-z0-9_]+$ && ${client_exists} == '0' ]]; do
echo -e "
════════════════════════════
<=   Create X-Ray Vless   =>
════════════════════════════
"
read -p "Username: " user
client_exists=$(grep -w $user /etc/xray/config.json | wc -l)
if [[ ${client_exists} == '1' ]]; then
clear
echo -e "
Already Exist Name
"
fi
done
read -p "Limit Quota: " quota
read -p "Active Time: " masaaktif
if [[ $quota -gt 0 ]]; then
echo -e "$[$quota * 1024 * 1024 * 1024]" > /etc/xray/quota/$user
else
echo > /dev/null
fi
exp=`date -d "$masaaktif days" +"%y-%m-%d"`
uuid=$(xray uuid)
sed -i '/#vless$/a\### '"$user $exp"'\
},{"id": "'""$uuid""'","email": "'""$user""'"' /etc/xray/config.json
systemctl daemon-reload ; systemctl restart xray
systemctl restart quota
vlesslink1="vless://${uuid}@${domain}:443?path=/vlessws&security=tls&encryption=none&host=${domain}&type=ws&sni=${domain}#${user}"
vlesslink2="vless://${uuid}@${domain}:80?path=/vlessws&security=none&encryption=none&host==${domain}&type=ws#${user}"
vlesslink3="vless://$uuid@$domain:443?mode=gun&security=none&encryption=none&authority=$domain&type=grpc&serviceName=vless-grpc&sni=$domain#${user}"
vlesslink4="vless://${uuid}@${domain}:443?path=/rere-cantik&security=tls&encryption=none&host=${domain}&type=httpupgrade&sni=${domain}#${user}"
vlesslink5="vless://${uuid}@${domain}:80?path=/rere-cantik&security=none&encryption=none&host=${domain}&type=httpupgrade#${user}"
vlesslink6="vless://${uuid}@${domain}:443?path=%2Fvless-split&security=tls&encryption=none&alpn=h3,h2,http/1.1&host=${domain}&type=splithttp&sni=${domain}#${user}"
vlesslink7="vless://${uuid}@${domain}:80?path=/vless-split&security=none&encryption=none&host=${domain}&type=splithttp#${user}"
clear
TEKS="
═════════════════════════════
<=   X-Ray Vless Account   =>
═════════════════════════════

Hostname  : $domain
WildCard  : bug.com.${domain}
Remark    : $user
UUID      : $uuid
Expired   : $exp
═════════════════════════════
Port TLS  : 443
Port HTTP : 80
Network   : Ws, gRPC, httpupgrade
Path WS   : /vless | /vlessws
Path HTTP : /rere  | /rere-cantik
Serv Name : vless-grpc
════════════════════════════
<=   Detail Information   =>

ISP           : $izp
CITY          : $city
REGION        : $region
════════════════════════════
<=   DNSTT  Information   =>

Port         : 5300
Publik Key   : $(cat /etc/slowdns/server.pub)
Nameserver   : $(cat /etc/slowdns/nsdomain)
═════════════════════════════
WS TLS    : $vlesslink1
═════════════════════════════
WS HTTP   : $vlesslink2
═════════════════════════════
HTTP TLS  : $vlesslink4
═════════════════════════════
HTTP NTLS : $vlesslink5
═════════════════════════════
gRPC      : $vlesslink3
═════════════════════════════
"
CHATID=$(cat /etc/funny/.chatid)
KEY=$(cat /etc/funny/.keybot)
TIME="10"
URL="https://api.telegram.org/bot$KEY/sendMessage"
curl -s --max-time $TIME --data-urlencode "chat_id=$CHATID" --data-urlencode "text=$TEKS" $URL >/dev/null 2>&1
clear
echo "$TEKS"

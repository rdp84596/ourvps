#!/bin/bash
#  |═════════════════════════════════════════════════════════════════════════════════|
#  • Autoscript AIO Lite Menu By cyber Project                                       |
#  • cyber Project Developer @Shahnawazyt | @Fezansohail | https://t.me/Cyberdecode  |
#  • Copyright 2024 18 cyber Decode [  ] | [ @cyberdecode ] | [ Pakistan ]           | 
#  |═════════════════════════════════════════════════════════════════════════════════|
#
domain=$(cat /etc/xray/domain)
izp=$(cat /root/.isp)
region=$(cat /root/.region)
city=$(cat /root/.city)
clear
Login=trial`</dev/urandom tr -dc 0-9 | head -c3`
echo "2" > /etc/xray/limit/ip/ssh/$Login
Pass="1"
masaaktif="1"
useradd -e `date -d "$masaaktif days" +"%Y-%m-%d"` -s /bin/false -M $Login
expi="$(chage -l $Login | grep "Account expires" | awk -F": " '{print $2}')"
echo -e "$Pass\n$Pass\n"|passwd $Login &> /dev/null
echo "$Login:$Pass" | sudo chpasswd
TEKS="
═══════════════════════════
<=      SSH ACCOUNT      =>
═══════════════════════════

Username     : $Login
Password     : $Pass
Host/IP      : $domain
Limit IP     : 2
Port ssl/tls : 443
Port non tls : 80, 2082
Port openssh : 22, 3303, 53
Port dropbear: 109, 69, 143
Udp Custom   : 1-65535, 56-7789
Http Proxy   : 8888
OHP All      : 8181, 8282, 8383
BadVpn       : 7100, 7200, 7300
Chisell TLS  : 9443
Chisell HTTP : 8000
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
═══════════════════════════
Port OVPN    : 1194 TCP / 2200 UDP
OVPN TCP     : http://$domain:8081/tcp.ovpn
OVPN UDP     : http://$domain:8081/udp.ovpn
═══════════════════════════
Payload Ws   => GET / HTTP/1.1[crlf]Host: $domain[crlf]Upgrade: websocket[crlf][crlf]
═══════════════════════════
Payload Ovpn => GET /ovpn HTTP/1.1[crlf]Host: $domain[crlf]Upgrade: websocket[crlf][crlf]
═══════════════════════════
Expired => 60 Minutes
═══════════════════════════
"
clear
CHATID=$(cat /etc/funny/.chatid)
KEY=$(cat /etc/funny/.keybot)
TIME="10"
URL="https://api.telegram.org/bot$KEY/sendMessage"
curl -s --max-time $TIME --data-urlencode "chat_id=$CHATID" --data-urlencode "text=$TEKS" $URL >/dev/null 2>&1
echo "userdel -f \"$Login\" && systemctl restart ssh" | at now + 60 minutes >/dev/null 2>&1
clear
echo -e "$TEKS"

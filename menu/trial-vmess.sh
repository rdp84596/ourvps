#!/bin/bash
clear
#
#  |════════════════════════════════════════════════════════════════════════════════════════════════════════════════|
#  • Autoscript AIO Lite Menu By cyber Project                                       |
#  • cyber Project Developer @Shahnawazyt | @Fezansohail | https://t.me/Cyberdecode  |
#  • Copyright 2024 18 cyber Decode [  ] | [ @cyberdecode ] | [ Pakistan ]           | 
#  |════════════════════════════════════════════════════════════════════════════════════════════════════════════════|
#
domain=$(cat /etc/xray/domain)
izp=$(cat /root/.isp)
region=$(cat /root/.region)
city=$(cat /root/.city)
clear
user=trial`</dev/urandom tr -dc 0-9 | head -c3`
masaaktif="1"
exp=`date -d "$masaaktif days" +"%y-%m-%d"`
uuid=$(xray uuid)
sed -i '/#vmess$/a\### '"$user $exp"'\
},{"id": "'""$uuid""'","alterid": '"0"',"email": "'""$user""'"' /etc/xray/config.json
systemctl daemon-reload ; systemctl restart xray
systemctl restart quota
acs=`cat<<eof
{
"v": "2",
"ps": "${user}",
"add": "${domain}",
"port": "443",
"id": "${uuid}",
"aid": "0",
"net": "ws",
"path": "/vmessws",
"type": "none",
"host": "${domain}",
"tls": "tls"
}
eof`
ask=`cat<<eof
{
"v": "2",
"ps": "${user}",
"add": "${domain}",
"port": "80",
"id": "${uuid}",
"aid": "0",
"net": "ws",
"path": "/worryfree",
"type": "none",
"host": "${domain}",
"tls": "none"
}
eof`
grpc=`cat<<eof
{
"v": "2",
"ps": "${user}",
"add": "${domain}",
"port": "443",
"id": "${uuid}",
"aid": "0",
"net": "grpc",
"path": "vmess-grpc",
"type": "none",
"host": "${domain}",
"tls": "tls"
}
eof`
hts=`cat<<eof
{
"v": "2",
"ps": "${user}",
"add": "${domain}",
"port": "80",
"id": "${uuid}",
"aid": "0",
"net": "httpupgrade",
"path": "/love-dinda",
"type": "httpupgrade",
"host": "${domain}",
"tls": "none"
}
eof`
cs=`cat<<eof
{
"v": "2",
"ps": "${user}",
"add": "${domain}",
"port": "443",
"id": "${uuid}",
"aid": "0",
"net": "httpupgrade",
"path": "/love-dinda",
"type": "httpupgrade",
"host": "${domain}",
"tls": "tls"
}
eof`
bpjs=`cat<<eof
{
"v": "2",
"ps": "${user}",
"add": "${domain}",
"port": "8880",
"id": "${uuid}",
"aid": "0",
"net": "ws",
"path": "/whatever",
"type": "none",
"host": "${domain}",
"tls": "none"
}
eof`
split1=`cat<<eof
{
"v": "2",
"ps": "${user}",
"add": "${domain}",
"port": "443",
"id": "${uuid}",
"aid": "0",
"net": "splithttp",
"path": "/tkj3",
"type": "splithttp",
"host": "${domain}",
"tls": "tls"
}
eof`
split2=`cat<<eof
{
"v": "2",
"ps": "${user}",
"add": "${domain}",
"port": "80",
"id": "${uuid}",
"aid": "0",
"net": "splithttp",
"path": "/tkj3",
"type": "splithttp",
"host": "${domain}",
"tls": "none"
}
eof`
vmess_base641=$( base64 -w 0 <<< $vmess_json1)
vmess_base642=$( base64 -w 0 <<< $vmess_json2)
vmess_base643=$( base64 -w 0 <<< $vmess_json3)
vmesslink1="vmess://$(echo $acs | base64 -w 0)"
vmesslink2="vmess://$(echo $ask | base64 -w 0)"
vmesslink3="vmess://$(echo $grpc | base64 -w 0)"
vmesslink4="vmess://$(echo $hts | base64 -w 0)"
vmesslink5="vmess://$(echo $cs | base64 -w 0)"
vmesslink6="vmess://$(echo $bpjs | base64 -w 0)"
vmesslink7="vmess://$(echo $split1 | base64 -w 0)"
vmesslink8="vmess://$(echo $split2 | base64 -w 0)"
celar
TEKS="
═════════════════════════════
<=   X-Ray Vmess Account   =>
═════════════════════════════

Remarks    : $user
Hostname   : $domain
WildCard   : bug.com.${domain}
UUID       : $uuid
Expired    : 60 Minutes
═════════════════════════════
Port TLS   : 443
Port HTTP  : 80
AlterID    : 0
Network    : ws, gRPC, httpupgrade, splithttp
Alpn       : http/1.1
Path WS    : /vmess | /vmessws
Path HTTP  : /love  | /love-dinda
Path Split : /tkj3
ServiceName: vmess-grpc
═════════════════════════════
Multipath  : /custom | /whatever
Port       : 8880
Network    : WebSocket NonTLS
AlID, Alpn : 0, http/1.1
═════════════════════════════
TLS        : $vmesslink1
═════════════════════════════
NoneTLS    : $vmesslink2
═════════════════════════════
HTTP None  : $vmesslink4
═════════════════════════════
HTTP TLS   : $vmesslink5
═════════════════════════════
SLIT TLS   : $vmesslink7
═════════════════════════════
SPLIT HTTP : $vmesslink8
═════════════════════════════
MultiPath  : $vmesslink6
═════════════════════════════
gRPC       : $vmesslink3
═════════════════════════════
"
CHATID=$(cat /etc/funny/.chatid)
KEY=$(cat /etc/funny/.keybot)
TIME="10"
URL="https://api.telegram.org/bot$KEY/sendMessage"
curl -s --max-time $TIME --data-urlencode "chat_id=$CHATID" --data-urlencode "text=$TEKS" $URL >/dev/null 2>&1
echo "sed -i '/^### $user $exp/,/^},{/d' /etc/xray/config.json && systemctl restart xray && systemctl restart quota" | at now + 60 minutes >/dev/null 2>&1
clear
echo "$TEKS"

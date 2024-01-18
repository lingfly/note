#!/usr/bin/bash
# 服务器信息
server_ip=('172.24.16.197' '172.24.16.200' '172.24.16.193' '172.24.16.199' '172.24.16.196' '172.24.16.201' '172.24.16.195' )
username="root"
password="Zwbim.2023"
rm -f /home/aliyun/output.log

cmds=()

if [ "$1" == "pull" ];then
  # 修改镜像tag
  cmds=(
  'find /home/service/w* -name "docker-compose.yml" | xargs sed -ri  "s/image:(.*?):(.*?)/image:\1:1.1.1.1/g"'
  'find /home/service/w* -name "docker-compose.yml" | xargs sed -ri  "s/image: (wk.*?):/image: 120.24.189.155:5000\/product\/backend\/wukong\/java_\1:/g"'
  'find /home/service/w* -name "docker-compose.yml" | xargs sed -ri  "s/image: (wb.*?):/image: 120.24.189.155:5000\/product\/backend\/wukong\/\1:/g"'
  'find /home/service/w* -name "docker-compose.yml" | xargs sed -i "s/\r//g"'
  'find /home/service/w* -name docker-compose.yml | xargs  -I {} docker-compose -f {} pull'
  )
elif [ "$1" == "up" ];then
  cmds=('find /home/service/w* -name docker-compose.yml | xargs  -I {} docker-compose -f {} up -d')
elif [ "$1" == "ps" ];then
  cmds=('docker ps -a| grep -P "wb|wk"')
elif [ "$1" == "images" ];then
  cmds=('docker images| grep -P "wb|wk"')
fi


for ip in "${server_ip[@]}";do
  for cmd in "${cmds[@]}";do
    if [[ "$1" == "pull" ]];then
      sshpass -p "$password" ssh "$username@$ip" "$cmd" >> /home/aliyun/output.log &
    else
      sshpass -p "$password" ssh "$username@$ip" "$cmd"
    fi
  done
done
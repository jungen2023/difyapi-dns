#!/bin/bash
ip=(`docker inspect docker-api-1 |awk -F: '/IPAddress/{print $2}'|tail -n2|awk -F'"' '{print $2}'`)
if [[ -n "${ip[@]}" ]];then
   web_ip=${ip[0]}
   api_ip=${ip[1]}
else
   exit 0
fi

web=`grep web /etc/hosts`
if [ -z "${web}" ];then
   echo "${web_ip} web" >> /etc/hosts
else
   webd_ip=`awk '/web/{print $1}' /etc/hosts`
   if [[ "${webd_ip}" != "${web_ip}" ]];then
      sed -i "s/${webd_ip}/${web_ip}/g" /etc/hosts
   fi
fi

api=`grep api /etc/hosts`
if [ -z "${api}" ];then
   echo "${api_ip} api" >> /etc/hosts
else
   apid_ip=`awk '/api/{print $1}' /etc/hosts`
   if [[ "${apid_ip}" != "${api_ip}" ]];then
      sed -i "s/${apid_ip}/${api_ip}/g" /etc/hosts
   fi
fi

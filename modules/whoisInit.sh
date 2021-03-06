#/usr/bin/env bash

# description
export `basename ${BASH_SOURCE[0]} .sh`_desc="Initialize whois."

# init function (should start with "filename_")
function whoisInit_init()
(
    function check_sys(){
 	    local checkType=$1
	    local value=$2

	    local release=''
	    local systemPackage=''
	
	    if [[ -f /etc/redhat-release ]]; then
	        release="centos"
	        systemPackage="yum"
	    elif cat /etc/issue | grep -Eqi "debian"; then
	        release="debian"
	        systemPackage="apt"
	    elif cat /etc/issue | grep -Eqi "ubuntu"; then
	        release="ubuntu"
	        systemPackage="apt"
	    elif cat /etc/issue | grep -Eqi "centos|red hat|redhat"; then
	        release="centos"
	        systemPackage="yum"
	    elif cat /proc/version | grep -Eqi "debian"; then
	        release="debian"
	        systemPackage="apt"
	    elif cat /proc/version | grep -Eqi "ubuntu"; then
	        release="ubuntu"
	        systemPackage="apt"
	    elif cat /proc/version | grep -Eqi "centos|red hat|redhat"; then
	        release="centos"
	        systemPackage="yum"
	    fi
	
	    if [[ ${checkType} == "sysRelease" ]]; then
	        if [ "$value" == "$release" ]; then
	            return 0
	        else
	            return 1
	        fi
	    elif [[ ${checkType} == "packageManager" ]]; then
	        if [ "$value" == "$systemPackage" ]; then
	            return 0
	        else
	            return 1
	        fi
	    fi
    }
    echo
    echo "Installing whois..."

    if check_sys packageManager yum; then
	yum -y install whois 
    elif check_sys packageManager apt; then
	apt-get install -y whois 
    fi

    echo "whois initialized successfully!"
)

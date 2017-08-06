#/usr/bin/env bash

# description
export `basename ${BASH_SOURCE[0]} .sh`_desc="Initialize nodejs and npm."

# init function (should start with "filename_")
function nodejsInit_init()
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
    echo "Installing nodejs 8..."

    if check_sys sysRelease ubuntu; then
        curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -
    elif check_sys sysRelease debian; then
	curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -
    elif check_sys sysRelease centos; then
	curl --silent --location https://rpm.nodesource.com/setup_8.x | sudo bash -
    fi
    
    if check_sys packageManager yum; then
	yum -y install nodejs
	yum -y install gcc-c++ make
    elif check_sys packageManager apt; then
	apt-get install -y nodejs
	apt-get install -y build-essential
    fi

    echo "nodejs and npm initialized successfully!"
)

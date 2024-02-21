#!/bin/sh

set -x

rand_str() {
  tr -dc A-Z </dev/urandom | head -c $1; echo
}

rand_int() {
  tr -dc 1-9 </dev/urandom | head -c $1; echo
}

SERIAL_NUMBER="0123456789-"$(rand_str 4)
HOSTNAME="SuperNAS-"$(rand_str 4)
MODEL="FAS8700-"$(rand_str 4)
OS_VERSION="ONTAP-9.10.11P"$(rand_int 3)

CUSTOMER_NAME="ACME-"$(rand_str 4)
SITE_NAME="ACME-DarkSite-"$(rand_str 4)
CONTACT_DETAILS="Bugs Bunny - 555-123-"$(rand_int 5)

SECURITY_VULNERABILITIES=$(rand_int 2)

END_OF_PLATFORM_SUPPORT="May 31, 202"$(rand_int 1)
SUPPORT_OFFERING="AIQADVISOR-"$(rand_str 4)
HW_CONTRACT_END_DATE="June 30, 202"$(rand_int 1)
SSP_CONTRACT_END_DATE="July 31, 202"$(rand_int 1)
NRD_CONTRACT_END_DATE="August 31, 202"$(rand_int 1)

#mosquitto_pub -h mqtt -t "ha/952019000082-212028000092/Configuration/Overview/SerialNumber" -m '{"Serial_Number": "'$SERIAL_NUMBER'"}'
#mosquitto_pub -h mqtt -t "ha/952019000082-212028000092/Configuration/Overview/Hostname" -m '{"Hostname": "'$HOSTNAME'"}'
#mosquitto_pub -h mqtt -t "ha/952019000082-212028000092/Configuration/Overview/Model" -m '{"Model": "'$MODEL'"}'
#mosquitto_pub -h mqtt -t "ha/952019000082-212028000092/Configuration/Overview/OSVersion" -m '{"OS_Version": "'$OS_VERSION'"}'

#mosquitto_pub -h mqtt -t "ha/952019000082-212028000092/Configuration/CustomerDetails/CustomerName" -m '{"CustomerName": "'$CUSTOMER_NAME'"}'
#mosquitto_pub -h mqtt -t "ha/952019000082-212028000092/Configuration/CustomerDetails/SiteName" -m '{"SiteName": "'$SITE_NAME'"}'
#mosquitto_pub -h mqtt -t "ha/952019000082-212028000092/Configuration/CustomerDetails/ContactDetails" -m '{"ContactDetails": "'"${CONTACT_DETAILS}"'"}'

mosquitto_pub -h mqtt -t "ha/952019000082-212028000092/Configuration/InventoryDetails/EndOfPlatformSupport" -m '{"EndOfPlatformSupport": "'"${END_OF_PLATFORM_SUPPORT}"'"}'
mosquitto_pub -h mqtt -t "ha/952019000082-212028000092/Configuration/InventoryDetails/SupportOffering" -m '{"SupportOffering": "'"${SUPPORT_OFFERING}"'"}'
mosquitto_pub -h mqtt -t "ha/952019000082-212028000092/Configuration/InventoryDetails/HWContractEndDate" -m '{"HWContractEndDate": "'"${HW_CONTRACT_END_DATE}"'"}'
mosquitto_pub -h mqtt -t "ha/952019000082-212028000092/Configuration/InventoryDetails/SSPContractEndDate" -m '{"SSPContractEndDate": "'"${SSP_CONTRACT_END_DATE}"'"}'
mosquitto_pub -h mqtt -t "ha/952019000082-212028000092/Configuration/InventoryDetails/NRDContractEndDate" -m '{"NRDContractEndDate": "'"${NRD_CONTRACT_END_DATE}"'"}'



#mosquitto_pub -h mqtt -t "ha/952019000082-212028000092/Wellness" -m '{"SecurityVulnerabilities": '$SECURITY_VULNERABILITIES'}'

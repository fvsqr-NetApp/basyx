#!/bin/sh

set -x

mosquitto_pub -h mqtt -t "ha/952019000082-212028000092/Configuration/Overview/SerialNumber" -m '{"Serial_Number": "abdefghi"}'
mosquitto_pub -h mqtt -t "ha/952019000082-212028000092/Configuration/Overview/Hostname" -m '{"Hostname": "XYZYX"}'

mosquitto_pub -h mqtt -t "ha/952019000082-212028000092/Wellness" -m '{"SecurityVulnerabilities": 11}'

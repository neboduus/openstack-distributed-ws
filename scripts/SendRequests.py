#!/usr/bin/env python
# -*- coding: utf-8 -*-

import json
import requests
from collections import Counter


print("ToDo\n")


URL = "http://172.24.4.21/todos/1"

res_ip = []

tot_num_req = 40

for i in range(0, tot_num_req):
	r = requests.get(url = URL)
	data = r.json()
	res_ip.append(data['ip'])

different_ip = Counter(res_ip).keys()
counter_x_ip = Counter(res_ip).values()

for i in range (0, len(different_ip)):
	ip = different_ip[i]
	count = counter_x_ip[i]
	percent = (count / float(tot_num_req)) * 100
	print("%s serves %s requests (%s%%)" % (ip, count, round(percent, 1)))

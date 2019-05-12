#!/usr/bin/env python
# -*- coding: utf-8 -*-

import json
import requests
from collections import Counter


print("ToDo\n")


URL = "http://172.24.4.21/todos/1"

res_ip = []

for i in range(0, 40):
	r = requests.get(url = URL)
	data = r.json()
	res_ip.append(data['ip'])

different_ip = Counter(res_ip).keys()
counter_x_ip = Counter(res_ip).values()

for i in range (0, len(different_ip)):
	print("%s serves %s requests" % (different_ip[i], counter_x_ip[i]))


#!/usr/bin/env python
# -*- coding: utf-8 -*-

import json
import requests
import progressbar
from collections import Counter

print("Serving requests to Todos-WS...")

URL = "http://172.24.4.21/todos/1"

res_ip = []

tot_num_req = 40

bar = progressbar.ProgressBar(maxval=tot_num_req, \
    widgets=[progressbar.Bar('=', '[', ']'), ' ', progressbar.Percentage()])
bar.start()

for i in range(0, tot_num_req):
    bar.update(i+1)
    r = requests.get(url = URL)
    data = r.json()
    res_ip.append(data['ip'])

bar.finish()

different_ip = Counter(res_ip).keys()
counter_x_ip = Counter(res_ip).values()

for i in range (0, len(different_ip)):
    ip = different_ip[i]
    count = counter_x_ip[i]
    percent = (count / float(tot_num_req)) * 100
    print("%s serves %s requests (%s%%)" % (ip, count, round(percent, 1)))
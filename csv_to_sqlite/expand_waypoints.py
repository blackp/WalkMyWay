#!/usr/bin/env python

import sys
import re

n = 5

lat_long_re = re.compile(".*\"(.*)\".*\"(.*)\".*")

last_line = ""
for line in sys.stdin.readlines():

    try:
        this_long, this_lat = map(float, lat_long_re.match(line).groups())
        last_long, last_lat = map(float, lat_long_re.match(last_line).groups())

        for i in range(n):
            lat = last_lat + (this_lat - last_lat) * (float(i) / n)
            long = last_long + (this_long - last_long) * (float(i) / n)
            print '<wpt lon="%f" lat="-%f" ></wpt>' % (long, lat)
    except Exception, e:
        print line,\
        #+ str(e),

    last_line = line

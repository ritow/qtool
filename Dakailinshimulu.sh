#!/bin/bash
# author: qiyongfeng
# modify: 2013-10-10

[ ! -e /tmp/aaa ] && mkdir /tmp/aaa
[ -e /tmp/aaa ] && exec caja /tmp/aaa

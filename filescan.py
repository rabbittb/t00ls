#!/usr/bin/env python
# -*- coding: UTF-8 -*-
# __author__: www.t00ls.net-rabbittb
import gevent
from gevent.pool import Pool
from gevent import monkey;

monkey.patch_all()
import requests

maxCoroutineNum = 100
suffixes = ['.rar', '.zip', '.sql', '.gz', '.sql.gz', '.tar.gz', '.bak', '.sql.bak']
features = ['</web-app>', 'repositoryformatversion', 'svn://']


def rar_size(content_length):
    if content_length >= 1024000000:
        unit = int(content_length) // 1024 // 1024 / 1000
        content_length = str(unit) + 'G'
    elif content_length >= 1024000:
        unit = int(content_length) // 1024 // 1024
        content_length = str(unit) + 'M'
    else:
        unit = int(content_length) // 1024
        content_length = str(unit) + 'K'
    return content_length


def get_scan_list_from_url(url: str):
    file_dic = ['.git/config', '.svn/entries', 'WEB-INF/web.xml', 'web.rar', 'web.tar.gz', 'wwwroot.gz', 'ftp.rar',
                '__zep__/js.zip', 'flashfxp.rar', 'flashfxp.tar', 'faisunzip.zip', 'ftp.tar.gz',
                'wwwroot.sql', 'www.rar', 'flashfxp.zip', 'ftp.tar', 'data.zip', 'wwwroot.tar', 'www.tar.gz',
                'data.rar', 'admin.rar', 'ftp.zip',
                'web.tar', 'admin.zip', 'www.tar', 'wwwroot.zip', 'admin.tar', 'backup.zip', 'flashfxp.tar.gz',
                'bbs.zip', 'wwwroot.sql.zip',
                'www.zip', 'web.zip', 'wwwroot.rar', 'data.tar', 'admin.tar.gz', 'wwwroot.tar.gz', 'data.tar.gz']

    url = url.replace('http://', '').replace('https://', '')
    host_items = url.split('.')
    for suffix in suffixes:
        file_dic.append("".join(host_items[1:]) + suffix)
        file_dic.append(host_items[1] + suffix)
        file_dic.append(host_items[-2] + suffix)
        file_dic.append("".join(host_items) + suffix)
        file_dic.append(url + suffix)
    return list(set(file_dic))


def task(url: str, _path: str):
    url = url + "/" + _path
    try:
        res = requests.get(url=url, timeout=5)
    except Exception:
        return False
    if not res.status_code == 200:
        return False

    content_type = res.headers.get('Content-Type')
    if res.url.endswith('.git/config') or res.url.endswith('.svn/entries') or res.url.endswith('WEB-INF/web.xml'):
        for feature in features:
            if feature in res.content:
                print(url)
    if "Content-Type" in res.headers and 'text/html' not in content_type and 'image/' not in content_type:
        content_length = rar_size(int(res.headers.get('Content-Length')))
        print(url, content_length)
    return False


def run(_url_list: list):
    g_pool = Pool(maxCoroutineNum)
    for url in _url_list:
        payloads = get_scan_list_from_url(url)
        for payload in payloads:
            g_pool.spawn(task, url, payload)
    gevent.wait()


if __name__ == '__main__':
    url_list = [
        'http://www.baidu.com'
    ]

    run(url_list)

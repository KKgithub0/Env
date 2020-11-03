#!/usr/bin/env python
#encoding=gbk
import datetime
import commands

def yesterday():
    return (datetime.datetime.now()+datetime.timedelta(days=-1)).strftime("%Y%m%d")

def run_cmd(cmd):
    status, output = commands.getstatusoutput(cmd)
    if int(status) == 0:
        print 'run cmd[%s] succ' % cmd
        return 0
    else:
        print 'run cmd[%s] fail' % cmd
        return -1


def cmd_loop(max_count, func, argv):
    count = 0
    cmd_succ = 0
    while(count < max_count):
        if func(argv) < 0:
            count += 1
            # sleep half an hour
            time.sleep(1800)
        else:
            cmd_succ = 1
            break
    print 'cmd_succ[%d] count[%d]' % (cmd_succ, count)
    return cmd_succ

# 判断一个unicode是否是汉字
def is_chinese(uchar):
    if u'\u4e00' <= uchar <= u'\u9fff':
        return True
    else:
        return False

# 判断一个unicode是否是数字
def is_number(uchar):
    if u'\u0030' <= uchar <= u'\u0039':
        return True
    else:
        return False

# 判断一个unicode是否是英文字母
def is_alphabet(uchar):
    if (u'\u0041' <= uchar <= u'\u005a') or (u'\u0061' <= uchar <= u'\u007a'):
        return True
    else:
        return False

# 判断是否非汉字，数字和英文字符
def is_other(uchar):
    if not (is_chinese(uchar) or is_number(uchar) or is_alphabet(uchar)):
        return True
    else:
        return False

def is_single_gbk_chinese(gbk_str):
    try:
        u = gbk_str.decode('gbk')
        if len(u) == 1 and is_chinese(u[0]):
            return True
        return False
    except:
        return False

# gbk转为utf-8
def gbk_2_utf(string):
    return string.decode('gbk', 'ignore').encode('utf-8', 'ignore')

# utf-8转为gbk
def utf_2_gbk(string):
    return string.decode('utf-8', 'ignore').encode('gbk', 'ignore')

# 打印时间
def get_time():
    return datetime.datetime.now()

if __name__ == "__main__":
    ustring=u' \t中国 人名ａ高频Ａ'
    # 判断是否有其他字符；
    for item in ustring:
        if (is_other(item)):
            print "%s is other"%(item)

    # 单字
    gbk_str = "我"
    print "[%s] is_single_gbk_chinese [%s]"%(gbk_str, is_single_gbk_chinese(gbk_str))
    gbk_str = "我ok"
    print "[%s] is_single_gbk_chinese [%s]"%(gbk_str, is_single_gbk_chinese(gbk_str))
    gbk_str = "我们"
    print "[%s] is_single_gbk_chinese [%s]"%(gbk_str, is_single_gbk_chinese(gbk_str))

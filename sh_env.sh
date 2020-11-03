#/bin/bash
set -x
DATE=`date -d -1day +%Y%m%d`
TODAY=`date  +%Y%m%d`
HADOOP_HOME="/home/xuyikai/.hadoop-client"
HADOOP_CMD=${HADOOP_HOME}/hadoop/bin/hadoop

#获取当前时间
get_time () {
	nowtime=`date +"%Y/%m/%d %H:%M:%S"`
	echo -e $nowtime
}

#执行一条linux命令后打印日志
writelog () {
	if (( $? != 0 ));then
		echo -e "ERROR:\t [$1] failed!"
		exit -1
	fi
	get_time
	echo -e "SUCCESS:\t [$1] done!"
}

#检测文件大小是否为0
test_file () {
	if [ -s $1 ];then
		return 0
	fi
	return -1
}

test_hdfs_dir () {
    ${HADOOP_CMD} fs -test -e $1
    if (( $? == 0 ));then
        echo -e "hdfs dir[$1] exist"
        exit -1
    fi
}

#检测hdfs路径下文件个数
test_hdfs_file () {
	i=0
	while (( $i < 144 ))
	do
		get_time
		echo "try to get $DONE_DIR  $i times..."
		state=`${HADOOP_CMD} fs -ls ${DONE_DIR} | wc -l`
		if [ $state -eq 48 ];then
			break
		fi
		sleep 300
		let "i = $i + 1"
	done
}

#校验两个文件的md5是否相同
check_md5 () {
    md5_file1=`md5sum $1 | cut -d " " -f 1`
    md5_file2=`md5sum $2 | cut -d " " -f 1`
    if [ "$md5_file1" == "$md5_file2" ];then
        return 0
    fi
    return -1
}

#! /usr/bin/env bash
#123 var
OUT_DIR="task-2"
NUM_REDUCERS=6

hdfs dfs -rm -r -skipTrash ${OUT_DIR} > /dev/null

yarn jar /opt/cloudera/parcels/CDH/lib/hadoop-mapreduce/hadoop-streaming.jar \
    -D mapreduce.job.reduces=${NUM_REDUCERS} \
    -D mapred.text.key.comparator.options='-f' \
    -D mapred.job.name="mine" \
    -files mapper.py,reducer.py \
    -mapper "python3 mapper.py" \
    -reducer "python3 reducer.py" \
    -input "/data/minecraft-server-logs" \
    -output ${OUT_DIR} > /dev/null

#hdfs dfs -ls ${OUT_DIR}
hdfs dfs -cat ${OUT_DIR}/part-0000* | sort -k2nr | head -10
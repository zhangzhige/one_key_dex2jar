#!/bin/bash
 
##递归遍历
dex2jar()
{
    filepath=$1
    for file in $(ls -a $filepath);do
        if [[ $file =~ .*\.dex$ ]];then
            echo ${filepath}/$file
            sh ./dex-tools-2.1-SNAPSHOT/d2j-dex2jar.sh ${filepath}/$file -o ${filepath}/${file}.jar
        fi
    done
}

upzip_jar()
{
    filepath=$1
    for file in `ls -a $filepath`
    do
        if [[ $file =~ .*\.jar$ ]];then
            echo ${filepath}/$file
            tar -zxvf ${filepath}/$file -C $2
        fi
    done
}


echo "apk文件路径：" + $1
cur_dir=$(pwd)

rm -rf ./output
mkdir ./output
rm -rf ./output_class
mkdir ./output_class

tar -zxvf $1 -C ./output
dex2jar ./output
upzip_jar ./output ./output_class
echo "所有class文件路径：" + ${cur_dir}/output_class
jar cvf all_class.jar -C ./output_class/ .
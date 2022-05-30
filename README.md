# one_key_dex2jar
一键将apk生成为class jar

反编译apk过程中，由于目前一个apk包含多个dex文件。目前的dex2jar只能一个个生成。而且生成的jar包也是多个。这样很不方便去查看class文件。使用apktool生成的smali文件目前也没有比较稳定的反编译成java的工具。所以写了一个工具，一键反编译apk生成class，并且最终打包成一个jar包。然后就可以用JD-GUI来查看源码。

主要流程为：
解压apk-》遍历解压后的文件目录-》循环调用dex2jar转化成jar-》遍历jar包-》解压jar包中的class-》然后重新把所有class打包成一个jar

使用方法：
下载附件的工具包并解压。进入后在cmd运行：

./d2j_all.sh apk_full_path
编译结束后，所有class文件存放在当前目录的output_class文件夹。打包后的jar存放在当前目录的all_class.jar文件。因为打包jar是非常耗时的，也可以取消这一步，把d2j_all.sh文件的jar cvf all_class.jar -C ./output_class/ .注释掉。即可以不打包jar。直接用jd-gui查看output_class文件的class也是可以的。

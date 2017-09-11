# adb.exe 设置
## 1、设置环境变量
1. 新建一个ANDROID_HOME的环境变量，把sdk根目录地址贴上去
2. 在Paht开头加上：%ANDROID_HOME%\tools和%ANDROID_HOME%\platform-tools
## 2、android 命令
1. 显示系统中全部Android平台：android list targets
2. 显示系统中全部AVD（模拟器）：android list avd
3. 创建AVD（模拟器）：android create avd -n 模拟器名称 -t target的id（android-8）
4. 启动模拟器：emulator -avd 模拟器名称
5. 删除AVD（模拟器）：android delete avd -n 模拟器名称
6. 启动Activityadb shell am start -n 包名/包名＋类名（-n 类名,-a action,-d date,-m MIME-TYPE,-c category,-e 扩展数据,等）。
7. 指定虚拟机安装app: adb -s emulator-554 install ..apk

## 3、adb命令
1. 安装软件：adb install [-r][-s] xxx.apk //-r重置，-s安装在sd卡上
2. 卸载软件：adb uninstall [-k]<包名> eg:com.jay.example //-k只删除程序，不删除所有数据与缓存
3. 取出手机中的文件：adb pull xxx.xxx
4. 发送文件到手机中：adb push xxx.xxx
5. 进入手机终端：adb shell
6. 列出所有的链接设备：adb devices
7. 重启adb：reset adb
8. 杀死adb：adb kill-server
9. 启动adb：adb start-server
10. 查看端口占用的进程：netstat-ano
11. keytool -printcert -file D:\Desktop\CERT.RSA （CERT.RSA是app解压后的文件，放在META-INF文件夹中，加固后的app，名称会变，找.RSA结尾的文件就可以了）
12. keytool -list -v -keystore e:\debug.jks -storepass xxx(密匙)

**参考文档**
1. [adb shell命令--命令创建模拟器并启动，命令]("http://www.jianshu.com/p/8211954b6049")
2. [菜鸟教程]("http://www.runoob.com/w3cnote/android-tutorial-development-environment-build.html")
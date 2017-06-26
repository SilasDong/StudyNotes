# 常用命令
## 创建tag
1. 查看本地所有分支
```sh
git tag
```
2. 创建本地分支
```sh
git tag -a v2.3.0 -m 'message'
```
3. 推送本地分支到远端（remote）
```sh
git push origin  v2.3.0
```
4. add
```sh
# git add 的各种区别
git add -A   // 添加所有改动
git add *     // 添加新建文件和修改，但是不包括删除
git add .    // 添加新建文件和修改，但是不包括删除
git add -u   // 添加修改和删除，但是不包括新建文件
```
5. 在 commit 前撤销 add:
```sh
git reset <file> // 撤销提交单独文件
git reset        // unstage all due changes
```
6. add/commit 前撤销对文件的修改:
```sh
git checkout -- README.md  // 注意, add添加后(同commit提交后)就无法通过这种方式撤销修改
```
7. log
```sh
# 格式
git log --pretty=oneline
```
8. 修改远程仓库地址
```sh
git remote set-url origin [url]
```
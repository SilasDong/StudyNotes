 eq1000..

 sudo docker run \
    --publish 10443:443 --publish 10080:80 --publish 22:22 \
    --name gitlab \
    --volume /u1/gitlab/config:/etc/gitlab \
    --volume /u1/gitlab/logs:/var/log/gitlab \
    --volume /u1/gitlab/data:/var/opt/gitlab \
    gitlab/gitlab-ce

11.10.4
git diff v11.10.4 v11.10.4-zh > ../11.10.4-zh.diff
patch -d /opt/gitlab/embedded/service/gitlab-rails -p1 < 11.10.4-zh.diff

docker命令
sudo docker ps -l #显示最近创建的容器
sudo docker start 20d4cf196cc3(容器ID) # 启动容器

https://juejin.im/post/5a4c9ff36fb9a04507700fcc#heading-7 

docker run -id --privileged=true --name=nexus3 --restart=always -p 8081:8081 -v /u1/nexus3/nexus-data:/var/nexus-data 836c51250912


nexus
https://www.jianshu.com/p/09a6cab3785a

p.r>-At-u7rn

delimiter $$

use `project_demo`$$

drop function if exists `uuidNoDash`$$

create definer=`dbadmin`@`%` function `uuidNoDash`() returns varchar(32) charset utf8
begin
	return replace(uuid(), '-', '');
    end$$
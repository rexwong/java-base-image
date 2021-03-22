FROM centos:latest
MAINTAINER 企业级分布式应用服务EDAS研发团队 <edas-dev@list.alibaba-inc.com>
# 安装打包必备软件
RUN yum install -y wget unzip telnet lsof net-tools bind-utils
# 准备 JDK/Tomcat 系统变量
ENV JAVA_HOME /usr/java/latest
ENV PATH ${JAVA_HOME}/bin:$PATH
ENV TZ=Asia/Shanghai
# 下载安装 OpenJDK
RUN yum -y install java-1.8.0-openjdk-devel \
    && if [ ! -L "${JAVA_HOME}" ]; then mkdir -p `dirname ${JAVA_HOME}` \
    && ln -s `readlink -f /usr/lib/jvm/java` ${JAVA_HOME}; fi \
    && ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
# 增加容器内中⽂支持
ENV LANG="en_US.UTF-8"
# 增强 Webshell 使⽤体验
ENV TERM=xterm

ENV LANG C.UTF-8
ENV TZ Asia/Shanghai
RUN ln -fs /usr/share/zoneinfo/${TZ} /etc/localtime \
    && echo ${TZ} > /etc/timezone

#from: https://github.com/oracle/docker-images/tree/master/OracleDatabase/dockerfiles/11.2.0.2
FROM oraclelinux:7-slim


# Environment variables required for this build (do NOT change)
# -------------------------------------------------------------
ENV ORACLE_BASE=/u01/app/oracle \
    ORACLE_HOME=/u01/app/oracle/product/11.2.0/xe \
    ORACLE_SID=XE \
    INSTALL_FILE_1="oracle-xe-11.2.0-1.0.x86_64.rpm.zip" \
    INSTALL_DIR="$HOME/install" \
    CONFIG_RSP="xe.rsp" \
    RUN_FILE="runOracle.sh" \
    PWD_FILE="setPassword.sh"


# Use second ENV so that variable get substituted
ENV PATH=$ORACLE_HOME/bin:$PATH

# Copy binaries
# -------------
COPY $INSTALL_FILE_1 install/$CONFIG_RSP install/$RUN_FILE install/$PWD_FILE $INSTALL_DIR/
#COPY init_data/ /opt/init_data/

# Install Oracle Express Edition
# ------------------------------

RUN yum -y install unzip libaio bc initscripts net-tools openssl && \
    yum clean all && \
    cd $INSTALL_DIR && \
    unzip $INSTALL_FILE_1 && \
    rm $INSTALL_FILE_1 &&    \
    rpm -i Disk1/*.rpm &&    \
    mkdir $ORACLE_BASE/oradata && \
    chown -R oracle:dba $ORACLE_BASE && \
    mv $INSTALL_DIR/$CONFIG_RSP $ORACLE_BASE/ && \
    mv $INSTALL_DIR/$RUN_FILE $ORACLE_BASE/ && \
    mv $INSTALL_DIR/$PWD_FILE $ORACLE_BASE/ && \
    ln -s $ORACLE_BASE/$PWD_FILE / && \
    cd $HOME && \
    rm -rf $INSTALL_DIR && \
    chmod u+x $ORACLE_BASE/$RUN_FILE && \
    chmod u+x $ORACLE_BASE/$PWD_FILE && \
    mkdir -p /opt/init_data/testt && \
    chmod -R 755 /opt/init_data

VOLUME ["$ORACLE_BASE/oradata"]
EXPOSE 1521 8080

CMD $ORACLE_BASE/$RUN_FILE

#end#

FROM busybox AS builder
COPY pega-war /prweb
RUN unzip -q -o prweb/prweb.war -d /prweb
FROM pegasystems/pega-ready
COPY --chown=pegauser:root --from=builder /prweb ${CATALINA_HOME}/webapps/prweb
RUN chmod -R g+rw ${CATALINA_HOME}/webapps/prweb
RUN chmod g+rw ${CATALINA_HOME}/webapps/prweb/WEB-INF/classes/prconfig.xml
RUN chmod g+rw ${CATALINA_HOME}/webapps/prweb/WEB-INF/classes/prlog4j2.xml
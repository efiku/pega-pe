SET pljava.libjvm_location TO '/usr/lib/jvm/java-11-openjdk-amd64/lib/server/libjvm.so';
ALTER DATABASE postgres SET pljava.libjvm_location FROM CURRENT;
ALTER USER postgres SET SEARCH_PATH TO public,sqlj;
CREATE EXTENSION pljava;
SELECT sqlj.install_jar('file:///pljava/pljava-examples/target/pljava-examples-2-SNAPSHOT.jar', 'examples', true);

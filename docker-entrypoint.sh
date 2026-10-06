#!/bin/sh
# Renders the report apps' connection pool settings from RAZIENT_DB_* and starts Tomcat.
set -eu

: "${RAZIENT_DB_URL:?RAZIENT_DB_URL is required (jdbc:mysql://host:3306/razient)}"
: "${RAZIENT_DB_USERNAME:?RAZIENT_DB_USERNAME is required}"
: "${RAZIENT_DB_PASSWORD:?RAZIENT_DB_PASSWORD is required}"

cd "$CATALINA_HOME"
for template in webapps-javaee/*/WEB-INF/classes/Connection/objectPool.xml.template; do
	app=${template#webapps-javaee/}
	app=${app%%/*}
	perl -pe '
		sub xml { my $v = shift; $v =~ s/&/&amp;/g; $v =~ s/</&lt;/g; $v =~ s/>/&gt;/g; $v =~ s/"/&quot;/g; $v }
		s/\$\{(RAZIENT_DB_[A-Z_]+)\}/defined $ENV{$1} ? xml($ENV{$1}) : die "$1 is not set\n"/ge
	' "$template" > "${template%.template}"
	# Settings may have changed since the last start: have Tomcat convert the app again.
	rm -rf "webapps/$app"
done

exec catalina.sh run

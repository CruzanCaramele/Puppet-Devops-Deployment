install-requirements:
	bash puppet.sh && yum install -y git

apply-apache:
	echo "applying the apache module, access the website on the public domain name"

	puppet apply /etc/puppet/modules/apache/tests/init.pp

	echo "apache module applied"

apply-node:
	echo "applying the nodejs module"

	puppet apply /etc/puppet/modules/node/tests/init.pp

	echo "nodejs module applied"

apply-nginx:
	echo "applying the nginx module, access the sample website on the public domain name"

	puppet apply /etc/puppet/modules/nginx/tests/init.pp

	echo "nginx module applied"


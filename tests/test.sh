#!/usr/bin/env bash
# sudo yum install -y gcc openssl-devel bzip2-devel
# cd /usr/src
# sudo wget https://www.python.org/ftp/python/2.7.16/Python-2.7.16.tgz
# sudo tar xzf Python-2.7.16.tgz
# cd Python-2.7.16
# sudo ./configure --enable-optimizations
# sudo make altinstall
# /usr/local/bin/python2.7 -V
# sudo curl "https://bootstrap.pypa.io/get-pip.py" -o "get-pip.py"
# sudo python2.7 get-pip.py
# sudo git clone https://github.com/ansible/ansible.git --recursive /opt/ansible
# sudo yum install python-devel python-pip
# sudo pip install --upgrade pip
# sudo git clone git://github.com/pallets/jinja.git /usr/lib/python2.7/site-packages/jinja2
# sudo pip install jinja2
#alias python="python2.7"
#cd /opt/ansible && \
#/bin/bash /opt/ansible/hacking/env-setup -q

# go back to where we were
#cd -

#PATH=/opt/ansible/bin:$PATH
# sudo pip install ansible

ansible-playbook -v test.yml -i inventory --forks 5 --syntax-check

env ANSIBLE_FORCE_COLOR=1 ansible-playbook -v test.yml -i inventory --forks 5

ansible-playbook -v test.yml -i inventory --forks 5 \
  | grep -q 'changed=0.*failed=0' \
  && (echo 'Idempotence test: pass' && exit 0) \
  || (echo 'Idempotence test: fail' && exit 1)

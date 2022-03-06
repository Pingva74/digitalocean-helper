



doctl compute droplet create --region tor1 --image centos-7-x64 --size s-1vcpu-1gb --ssh-keys 30188579  zero0
doctl compute droplet create --region tor1 --image centos-7-x64 --size s-1vcpu-1gb --ssh-keys 30188579  zero1
doctl compute droplet create --region tor1 --image centos-7-x64 --size s-1vcpu-1gb --ssh-keys 30188579  zero2
doctl compute droplet create --region tor1 --image centos-7-x64 --size s-1vcpu-1gb --ssh-keys 30188579  zero3
doctl compute droplet create --region tor1 --image centos-7-x64 --size s-1vcpu-1gb --ssh-keys 30188579  zero4
doctl compute droplet create --region tor1 --image centos-7-x64 --size s-1vcpu-1gb --ssh-keys 30188579  zero5
doctl compute droplet create --region tor1 --image centos-7-x64 --size s-1vcpu-1gb --ssh-keys 30188579  zero6
doctl compute droplet create --region tor1 --image centos-7-x64 --size s-1vcpu-1gb --ssh-keys 30188579  zero7
doctl compute droplet create --region tor1 --image centos-7-x64 --size s-1vcpu-1gb --ssh-keys 30188579  zero8
doctl compute droplet create --region tor1 --image centos-7-x64 --size s-1vcpu-1gb --ssh-keys 30188579  zero9

echo "[docker]" > host.txt
doctl compute droplet get zero0 --output json | grep ip_address | grep -v '"10.' | awk -F ":" '{print $2}' | cut -c 3- | rev | cut -c 3- | rev >> host.txt
doctl compute droplet get zero1 --output json | grep ip_address | grep -v '"10.' | awk -F ":" '{print $2}' | cut -c 3- | rev | cut -c 3- | rev >> host.txt
doctl compute droplet get zero2 --output json | grep ip_address | grep -v '"10.' | awk -F ":" '{print $2}' | cut -c 3- | rev | cut -c 3- | rev >> host.txt
doctl compute droplet get zero3 --output json | grep ip_address | grep -v '"10.' | awk -F ":" '{print $2}' | cut -c 3- | rev | cut -c 3- | rev >> host.txt
doctl compute droplet get zero4 --output json | grep ip_address | grep -v '"10.' | awk -F ":" '{print $2}' | cut -c 3- | rev | cut -c 3- | rev >> host.txt
doctl compute droplet get zero5 --output json | grep ip_address | grep -v '"10.' | awk -F ":" '{print $2}' | cut -c 3- | rev | cut -c 3- | rev >> host.txt
doctl compute droplet get zero6 --output json | grep ip_address | grep -v '"10.' | awk -F ":" '{print $2}' | cut -c 3- | rev | cut -c 3- | rev >> host.txt
doctl compute droplet get zero7 --output json | grep ip_address | grep -v '"10.' | awk -F ":" '{print $2}' | cut -c 3- | rev | cut -c 3- | rev >> host.txt
doctl compute droplet get zero8 --output json | grep ip_address | grep -v '"10.' | awk -F ":" '{print $2}' | cut -c 3- | rev | cut -c 3- | rev >> host.txt
doctl compute droplet get zero9 --output json | grep ip_address | grep -v '"10.' | awk -F ":" '{print $2}' | cut -c 3- | rev | cut -c 3- | rev >> host.txt

sleep 30

ansible-playbook docker.yml -e "ansible_user=root"
sleep 3800

doctl compute droplet delete zero0 --force
doctl compute droplet delete zero1 --force
doctl compute droplet delete zero2 --force
doctl compute droplet delete zero3 --force
doctl compute droplet delete zero4 --force
doctl compute droplet delete zero5 --force
doctl compute droplet delete zero6 --force
doctl compute droplet delete zero7 --force
doctl compute droplet delete zero8 --force
doctl compute droplet delete zero9 --force

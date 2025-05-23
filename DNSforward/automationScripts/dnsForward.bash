#!/bin/bash

# 1. Install packages 
apt update
apt install bind9 bind9utils -y

# 2. Configure forwarders
#cd /etc/bind
#nano /etc/bind/named.conf.options
#Copy template file
cp /home/kris/DNSforward/templates/etc/bind/named.conf.options /etc/bind/named.conf.options
# 3. Add a zone for the domain
#nano /etc/bind/named.conf.default-zones
cp /home/kris/DNSforward/templates/etc/bind/named.conf.default-zones /etc/bind/named.conf.default-zones

# 4. Create the zone file
#cp /etc/bind/db.local /etc/bind/db.kris.cns
#nano /etc/bind/db.kris.cns
cp /home/kris/DNSforward/templates/etc/bind/db.kris.cns /etc/bind/db.kris.cns
# 4.1 Set permissions for the zone file
chown bind:bind /etc/bind/db.kris.cns
chmod 640 /etc/bind/db.kris.cns

# 5. Verify Setup
named-checkconf
named-checkzone kris.cns /etc/bind/db.kris.cns

# 6. Reload Bind9 service
systemctl reload bind9

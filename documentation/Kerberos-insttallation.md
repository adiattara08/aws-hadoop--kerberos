## Step 1 – Setup Hostname Resolution
### Server
```bash
 hostnamectl set-hostname server.myges.com
```
### Client
```bash
 hostnamectl set-hostname client.myges.com
```
## Step 2 – dit the /etc/hosts files on both server and client machines 
```bash
sudo nano /etc/hosts

```
then add the following lines:
-  172.31.30.19 server.myges.com
-  172.31.28.248 client.myges.com

## Step 3 – Install Kerberos Server
```bash
apt-get install krb5-kdc krb5-admin-server krb5-config -y
```
## Step 3 – Configure Kerberos Server
```bash
krb5_newrealm
```
Next, you must add the admin user principle to the access control. You can do it by editing the following file:

```bash
nano /etc/krb5kdc/kadm5.acl
```
Add the following line:
```bash
*/admin *
```
Next, you must add the admin principal to the Kerberos database. You can do it with the following command:
```bash
kadmin.local
```
Next, run the following command to add the principal name kuser:
```bash
kadmin.local: addprinc kuser
```
Next, exit from the kadmin console with the following command:
```bash
kadmin.local: quit
```
### Step 4 – Install Kerberos Client
```bash
apt-get install krb5-user -y
```
Next, authenticate to the Kerberos server and obtain a ticket from it with the following command:

```bash
kinit kuser
```
Next, obtain a ticket with the following command:

```bash
klist
```
## Step 5 – Verify Authentication
```bash
    kadmin.local: getprinc kuser
````
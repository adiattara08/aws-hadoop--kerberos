##  Step 1 – Installing Java
You can install OpenJDK 11 from the default apt repositories:
```bash
sudo apt update && sudo apt install openjdk-11-jdk
java -version 
```
## Step 2 – Create a Hadoop User
```bash
sudo adduser hadoop 
```
## Step 3 – Configure SSH Key-based Authentication
- Next, you will need to configure  **passwordless SSH authentication** for the local system.
- First, change the user to hadoop with the following command:
```bash
su - hadoop 
```
- Next, run the following command to generate Public and Private Key Pairs:
```bash 
ssh-keygen -t rsa 
```
- Next, append the generated public keys from id_rsa.pub to authorized_keys and set proper permission:

```bash
cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys 
chmod 640 ~/.ssh/authorized_keys
```
- Next, verify the passwordless SSH authentication with the following command:
```bash
ssh localhost 
```
## Step 4 – Installing Hadoop
- First, change the user to hadoop with the following command:
```bash
    su - hadoop 
```

- Next, download the latest version of Hadoop from the Apache download page using the following command:
```bash
wget https://downloads.apache.org/hadoop/common/hadoop-3.3.5/hadoop-3.3.5.tar.gz 
```

- Once downloaded, extract the downloaded file:
```bash
tar -xvzf hadoop-3.3.5.tar.gz
```

- Next, rename the extracted directory to hadoop:
```bash
mv hadoop-3.3.0 hadoop 
```

to be continued...
https://tecadmin.net/install-hadoop-on-ubuntu-20-04/
```

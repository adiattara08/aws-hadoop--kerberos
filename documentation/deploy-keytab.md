## Step1 utiliser kadmin.local et kadmin
```bash 
kadmin.local
```
##  Step 2: créer les principaux Kerberos

```bash
 addprinc -randkey hdfs/server.myges.com@MYGES.COM
 addprinc -randkey mapred/server.myges.com@MYGES.COM
 addprinc -randkey fil/server.myges.com@MYGES.COM
 addprinc -randkey HTTP/server.myges.com@MYGES.COM
 ````
 
## Step 3: créer les keytabs pour les principaux Kerberos
```bash
xst -norandkey -k hdfs.keytab hdfs/server.myges.com HTTP/server.myges.com
xst -norandkey -k mapred.keytab mapred/server.myges.com HTTP/server.myges.com
xst -norandkey -k fil.keytab fil/server.myges.com HTTP/server.myges.com
```
## Step 4: déployer les fichiers keytab Kerberos sur les noeuds de données
- Téléchargez la clé SSH du serveur hadoop vers le serveur kerberos 
```bash
        $ scp -i kerberos_pem_key haoop_pem_key ubuntu@kerberos_pem_key:/home/ubuntu
```
- transfer the key tab file from Kerberos server  to hadoop server  by following command.
```bash
        $  scp -i hadoop_pem_key fil.keytab ubuntu@hadoop_ip:/home/hadoop
        $ scp -i hadoop_pem_key hdfs.keytab ubuntu@hadoop_ip:/home/hadoop
        scp -i hadoop_pem_key fil.keytab ubuntu@hadoop_ip:/home/hadoop
```
- copiez ou déplacez les fichiers keytab vers un répertoire auquel Hadoop peut accéder, tel que/etc/hadoop/conf/secure
```bash
        $  cp mapred.keytab /home/hadoop/hadoop/etc/hadoop/mapred.keytab
        $  cp hdfs.keytab /home/hadoop/hadoop/etc/hadoop/hdfs.keytab
        $  cp fil.keytab /home/hadoop/hadoop/etc/hadoop/fil.keytab
```
- changez le propriétaire des fichiers keytab pour qu'ils appartiennent à l'utilisateur hadoop
```bash
        $  sudo chown hadoop /home/hadoop/hadoop/etc/hadoop/mapred.keytab
        $  sudo chown hadoop /home/hadoop/hadoop/etc/hadoop/hdfs.keytab
        $  sudo chown hadoop /home/hadoop/hadoop/etc/hadoop/fil.keytab
```
- changez les autorisations des fichiers keytab pour qu'ils soient accessibles en lecture seule par l'utilisateur hadoop
```bash
        $  sudo chown hadoop:hadoop /home/hadoop/hadoop/etc/hadoop/conf/mapred.keytab
        $  sudo chown hadoop:hadoop /home/hadoop/hadoop/etc/hadoop/conf/yarn.keytab
        $  sudo chown hadoop:hadoop /home/hadoop/hadoop/etc/hadoop/conf/mapred.keytab
        chmod 400 /home/hadoop/hadoop/etc/hadoop/conf/*.keytab


```
## Étape 5 : Activer la sécurité Hadoop
- modifier le  fichier core-site.xml et ajoutez les propriétés suivantes:
```bash
        $  sudo nano /home/hadoop/hadoop/etc/hadoop/core-site.xml
```
## Étape 6 Configurer HDFS sécurisé
- Ouvrez le fichier hdfs-site.xml et ajoutez les modification suivantes voir [hdfs.site.xml](https://docs.cloudera.com/documentation/enterprise/5-5-x/topics/cdh_sg_secure_hdfs_config.html)
```bash
        $ sudo nano /home/hadoop/hadoop/etc/hadoop/hdfs-site.xml
```
## Étape  7 Définir les variables pour les DataNodes sécurisés
- Ouvrez le fichier de configuration /etc/default/hadoop-hdfs-datanode
```bash
        $ sudo nano /etc/default/hadoop-hdfs-datanode

```
- Ajoutez les lignes suivantes à la fin du fichier:
```bash
        export HADOOP_SECURE_DN_USER=hdfs
        export HADOOP_SECURE_DN_PID_DIR=/var/run/hadoop-hdfs
        export HADOOP_SECURE_DN_LOG_DIR=/var/log/hadoop-hdfs
```
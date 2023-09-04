# Handson

## Kubernetes

### GPG key update
```

sudo apt -y install curl apt-transport-https
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
echo "deb https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee /etc/apt/sources.list.d/kubernetes.list

```

### CRi Error

```
rm /etc/containerd/config.toml
systemctl restart containerd

```
### Prviate Registry

```
## 사전 준비작업
sudo su
mkdir -p ~/registry/certs
mkdir ~/registry/auth
mkdir ~/registry/volume
cd ~/registry/certs 
  
  
## htpasswd를 이용해 비밀번호를 생성합니다.
apt-get install apache2-utils -y
htpasswd -Bbn sprint 0000 > ~/registry/auth/htpasswd

##openssl genrsa 명령어로 RSA 기반의 Private Key생성
openssl genrsa -des3 -out server.key 2048

## openssl req 명령어로 csr파일 생성
openssl req -new -key server.key -out server.csr

## private Key의 암호화 해제
openssl rsa -in server.key -out server.key

## 다음과 같은 출력이 나오면 정상적으로 암호가 해제된것입니다.
root@sprint-master-01:~/registry/certs# openssl rsa -in server.key -out server.key
Enter pass phrase for server.key:
writing RSA key

## SAN 설정을 위해 Config 파일을 다음과 같이 생성합니다.
echo subjectAltName=DNS:registry.sprint.com,IP:127.0.0.1 > extfile.cnf

## 마지막으로 자체서명 인증서를 생성합니다.
openssl x509 -req -days 800 -signkey server.key -in server.csr -out server.crt -extfile extfile.cnf

## Host DNS 추가
echo 10.0.0.4 registry.sprint.com >> /etc/hosts
cat /etc/hosts | tail -1

## Docker가 자체서명한 인증서를 신뢰할 수 있도록 등록해줍니다.
cp server.crt /usr/share/ca-certificates/
echo server.crt >> /etc/ca-certificates.conf
update-ca-certificates


service docker restart

## 만약 Kubernetes가 Container Runtime으로 Containerd를 사용한다면 해당 서비스 또한 재시작 하여 인증서를 등록합니다.
systemctl restart containerd

  ## Docker Registry를 실행합니다.
docker run -d \
-p 443:5000 \
--restart=always \
--name registry \
-v ~/registry/auth:/auth \
-e "REGISTRY_AUTH=htpasswd" \
-e "REGISTRY_AUTH_HTPASSWD_REALM=Registry Realm" \
-e REGISTRY_STORAGE_FILESYSTEM_ROOTDIRECTORY=/data \
-v ~/registry/volume:/data \
-e REGISTRY_AUTH_HTPASSWD_PATH=/auth/htpasswd \
-v ~/registry/certs:/certs \
-e REGISTRY_HTTP_TLS_CERTIFICATE=/certs/server.crt \
-e REGISTRY_HTTP_TLS_KEY=/certs/server.key \
-e REGISTRY_HTTP_ADDR=0.0.0.0:5000 \
registry:2


## Client에서는 다음 작업을 진행합니다.

scp ~/registry/certs/server.crt sprint@10.10.10.5:[전송받을경로]

cp server.crt /usr/share/ca-certificates/
echo server.crt >> /etc/ca-certificates.conf
update-ca-certificates
service docker restart
systemctl restart containerd

## 위의 모든 작업이 진행되면 다음과 같이 Prviate Registry에 로그인하고 Image를 Push 합니다.

docker login registry.sprint.com

docker push registry.sprint.com/sprint:v2

## Registry 내에 images를 확인할 수 있습니다.
curl -k -u 'sprint:0000' -X GET https://registry.sprint.com/v2/_catalog

```

```

# Azure DevOps Agent Service
# 홈 디렉터리의 하위 폴더 myagnet에 설치를 가정하고 진행합니다.

cd ~/myagent$

# Install

sudo ./svc.sh install [username]

# 각 명령
sudo ./svc.sh start
sudo ./svc.sh stop
sudo ./svc.sh status

# 변수 설정
./env.sh
sudo ./svc.sh stop
sudo ./svc.sh start


```

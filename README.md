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

cd /etc/containerd
vi config.toml


```
disabled_plugins = []
imports = []
oom_score = 0
plugin_dir = ""
required_plugins = []
root = "/var/lib/containerd"
state = "/run/containerd"
temp = ""
version = 2

[cgroup]
  path = ""

[debug]
  address = ""
  format = ""
  gid = 0
  level = ""
  uid = 0

[grpc]
  address = "/run/containerd/containerd.sock"
  gid = 0
  max_recv_message_size = 16777216
  max_send_message_size = 16777216
  tcp_address = ""
  tcp_tls_ca = ""
  tcp_tls_cert = ""
  tcp_tls_key = ""
  uid = 0

[metrics]
  address = ""
  grpc_histogram = false

[plugins]

  [plugins."io.containerd.gc.v1.scheduler"]
    deletion_threshold = 0
    mutation_threshold = 100
    pause_threshold = 0.02
    schedule_delay = "0s"
    startup_delay = "100ms"

  [plugins."io.containerd.grpc.v1.cri"]
    device_ownership_from_security_context = false
    disable_apparmor = false
    disable_cgroup = false
    disable_hugetlb_controller = true
    disable_proc_mount = false
    disable_tcp_service = true
    enable_selinux = false
    enable_tls_streaming = false
    enable_unprivileged_icmp = false
    enable_unprivileged_ports = false
    ignore_image_defined_volumes = false
    max_concurrent_downloads = 3
    max_container_log_line_size = 16384
    netns_mounts_under_state_dir = false
    restrict_oom_score_adj = false
    sandbox_image = "registry.k8s.io/pause:3.6"
    selinux_category_range = 1024
    stats_collect_period = 10
    stream_idle_timeout = "4h0m0s"
    stream_server_address = "127.0.0.1"
    stream_server_port = "0"
    systemd_cgroup = false
    tolerate_missing_hugetlb_controller = true
    unset_seccomp_profile = ""

    [plugins."io.containerd.grpc.v1.cri".cni]
      bin_dir = "/opt/cni/bin"
      conf_dir = "/etc/cni/net.d"
      conf_template = ""
      ip_pref = ""
      max_conf_num = 1

    [plugins."io.containerd.grpc.v1.cri".containerd]
      default_runtime_name = "runc"
      disable_snapshot_annotations = true
      discard_unpacked_layers = false
      ignore_rdt_not_enabled_errors = false
      no_pivot = false
      snapshotter = "overlayfs"

      [plugins."io.containerd.grpc.v1.cri".containerd.default_runtime]
        base_runtime_spec = ""
        cni_conf_dir = ""
        cni_max_conf_num = 0
        container_annotations = []
        pod_annotations = []
        privileged_without_host_devices = false
        runtime_engine = ""
        runtime_path = ""
        runtime_root = ""
        runtime_type = ""

        [plugins."io.containerd.grpc.v1.cri".containerd.default_runtime.options]

      [plugins."io.containerd.grpc.v1.cri".containerd.runtimes]

        [plugins."io.containerd.grpc.v1.cri".containerd.runtimes.runc]
          base_runtime_spec = ""
          cni_conf_dir = ""
          cni_max_conf_num = 0
          container_annotations = []
          pod_annotations = []
          privileged_without_host_devices = false
          runtime_engine = ""
          runtime_path = ""
          runtime_root = ""
          runtime_type = "io.containerd.runc.v2"

          [plugins."io.containerd.grpc.v1.cri".containerd.runtimes.runc.options]
            BinaryName = ""
            CriuImagePath = ""
            CriuPath = ""
            CriuWorkPath = ""
            IoGid = 0
            IoUid = 0
            NoNewKeyring = false
            NoPivotRoot = false
            Root = ""
            ShimCgroup = ""
            SystemdCgroup = true

      [plugins."io.containerd.grpc.v1.cri".containerd.untrusted_workload_runtime]
        base_runtime_spec = ""
        cni_conf_dir = ""
        cni_max_conf_num = 0
        container_annotations = []
        pod_annotations = []
        privileged_without_host_devices = false
        runtime_engine = ""
        runtime_path = ""
        runtime_root = ""
        runtime_type = ""

        [plugins."io.containerd.grpc.v1.cri".containerd.untrusted_workload_runtime.options]

    [plugins."io.containerd.grpc.v1.cri".image_decryption]
      key_model = "node"

    [plugins."io.containerd.grpc.v1.cri".registry]
      config_path = ""

      [plugins."io.containerd.grpc.v1.cri".registry.auths]

      [plugins."io.containerd.grpc.v1.cri".registry.configs]

      [plugins."io.containerd.grpc.v1.cri".registry.headers]

      [plugins."io.containerd.grpc.v1.cri".registry.mirrors]

    [plugins."io.containerd.grpc.v1.cri".x509_key_pair_streaming]
      tls_cert_file = ""
      tls_key_file = ""

  [plugins."io.containerd.internal.v1.opt"]
    path = "/opt/containerd"

  [plugins."io.containerd.internal.v1.restart"]
    interval = "10s"

  [plugins."io.containerd.internal.v1.tracing"]
    sampling_ratio = 1.0
    service_name = "containerd"

  [plugins."io.containerd.metadata.v1.bolt"]
    content_sharing_policy = "shared"

  [plugins."io.containerd.monitor.v1.cgroups"]
    no_prometheus = false

  [plugins."io.containerd.runtime.v1.linux"]
    no_shim = false
    runtime = "runc"
    runtime_root = ""
    shim = "containerd-shim"
    shim_debug = false

  [plugins."io.containerd.runtime.v2.task"]
    platforms = ["linux/amd64"]
    sched_core = false

  [plugins."io.containerd.service.v1.diff-service"]
    default = ["walking"]

  [plugins."io.containerd.service.v1.tasks-service"]
    rdt_config_file = ""

  [plugins."io.containerd.snapshotter.v1.aufs"]
    root_path = ""

  [plugins."io.containerd.snapshotter.v1.btrfs"]
    root_path = ""

  [plugins."io.containerd.snapshotter.v1.devmapper"]
    async_remove = false
    base_image_size = ""
    discard_blocks = false
    fs_options = ""
    fs_type = ""
    pool_name = ""
    root_path = ""

  [plugins."io.containerd.snapshotter.v1.native"]
    root_path = ""

  [plugins."io.containerd.snapshotter.v1.overlayfs"]
    mount_options = []
    root_path = ""
    sync_remove = false
    upperdir_label = false

  [plugins."io.containerd.snapshotter.v1.zfs"]
    root_path = ""

  [plugins."io.containerd.tracing.processor.v1.otlp"]
    endpoint = ""
    insecure = false
    protocol = ""

[proxy_plugins]

[stream_processors]

  [stream_processors."io.containerd.ocicrypt.decoder.v1.tar"]
    accepts = ["application/vnd.oci.image.layer.v1.tar+encrypted"]
    args = ["--decryption-keys-path", "/etc/containerd/ocicrypt/keys"]
    env = ["OCICRYPT_KEYPROVIDER_CONFIG=/etc/containerd/ocicrypt/ocicrypt_keyprovider.conf"]
    path = "ctd-decoder"
    returns = "application/vnd.oci.image.layer.v1.tar"

  [stream_processors."io.containerd.ocicrypt.decoder.v1.tar.gzip"]
    accepts = ["application/vnd.oci.image.layer.v1.tar+gzip+encrypted"]
    args = ["--decryption-keys-path", "/etc/containerd/ocicrypt/keys"]
    env = ["OCICRYPT_KEYPROVIDER_CONFIG=/etc/containerd/ocicrypt/ocicrypt_keyprovider.conf"]
    path = "ctd-decoder"
    returns = "application/vnd.oci.image.layer.v1.tar+gzip"

[timeouts]
  "io.containerd.timeout.bolt.open" = "0s"
  "io.containerd.timeout.shim.cleanup" = "5s"
  "io.containerd.timeout.shim.load" = "5s"
  "io.containerd.timeout.shim.shutdown" = "3s"
  "io.containerd.timeout.task.state" = "2s"

[ttrpc]
  address = ""
  gid = 0
  uid = 0
```

systemctl restart containerd


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
openssl genrsa -des3 -out server2.key 2048

## openssl req 명령어로 csr파일 생성
openssl req -new -key server2.key -out server2.csr

## private Key의 암호화 해제
openssl rsa -in server2.key -out server2.key

## 다음과 같은 출력이 나오면 정상적으로 암호가 해제된것입니다.
root@sprint-master-01:~/registry/certs# openssl rsa -in server2.key -out server2.key
Enter pass phrase for server2.key:
writing RSA key

## SAN 설정을 위해 Config 파일을 다음과 같이 생성합니다.
echo subjectAltName=DNS:registry.sprint.com,IP:127.0.0.1 > extfile.cnf

## 마지막으로 자체서명 인증서를 생성합니다.
openssl x509 -req -days 800 -signkey server2.key -in server2.csr -out server2.crt -extfile extfile.cnf

## Host DNS 추가
echo 10.0.0.4 registry.sprint.com >> /etc/hosts
cat /etc/hosts | tail -1

## Docker가 자체서명한 인증서를 신뢰할 수 있도록 등록해줍니다.
cp server2.crt /usr/share/ca-certificates/
echo server2.crt >> /etc/ca-certificates.conf
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
-e REGISTRY_HTTP_TLS_CERTIFICATE=/certs/server2.crt \
-e REGISTRY_HTTP_TLS_KEY=/certs/server2.key \
-e REGISTRY_HTTP_ADDR=0.0.0.0:5000 \
registry:2

## 나머지 Worker Node에 인증서를 보냅니다.
scp ~/registry/certs/server2.crt sprint@10.0.0.5:/home/sprint

cp server2.crt /usr/share/ca-certificates/
echo server2.crt >> /etc/ca-certificates.conf
update-ca-certificates
service docker restart
systemctl restart containerd

## 위의 모든 작업이 진행되면 다음과 같이 Prviate Registry에 로그인하고 Image를 Push 합니다.

docker login registry.sprint.com

docker push registry.sprint.com/sprint:v2

## Registry 내에 images를 확인할 수 있습니다.
curl -k -u 'sprint:0000' -X GET https://registry.sprint.com/v2/_catalog

```

## AKS+DevOps

### Azure DevOps Agent
```

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

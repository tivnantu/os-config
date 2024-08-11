# Rime

## 配置方法

- 先装rime
- 下载配置，然后复制所有配置文件Default/Rime到rime配置文件夹
- 然后更改rime配置文件夹中的installation.yaml中的installation_id，为需要同步的来源配置id，也就是Default/Rime/sync下面的文件夹名
- 然后点击同步
- 同步完成后，更新installation.yaml中的installation_id，设置为自己希望的目标设备id就行

## 备份方法

- 点击同步
- 然后把本地rime配置文件中的sync文件夹中的，除了.userdb.txt的所有文件都放到Default/Rime中
- .userdb.txt文件，放到Default/Rime/[installation_id]中
- 上传

## 其他

- 八股文插件：<https://github.com/lotem/rime-octagram-data>

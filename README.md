
This script is obsolete. **Please use gdown**

```bash
pip install gdown

# download a file
gdown https://drive.google.com/uc?id=1l_5RK28JRL19wpT22B-DY9We3TVXnnQQ
# for a Folder
gdown --folder https://drive.google.com/drive/u/0/folders/18EunmjOJsbE5Lh9zA0cZ4wKV6Um46dkg
```

https://colab.research.google.com/drive/1QXVAkUovvIQva65TuvAcca_jRhR_M6Bc?usp=sharing

# gdrive.sh
[![Build Status](https://travis-ci.org/GitHub30/gdrive.sh.svg?branch=master)](https://travis-ci.org/GitHub30/gdrive.sh)

# Usage
```bash
curl gdrive.sh | bash -s 0B4y35FiV1wh7QWpuVlFROXlBTHc
curl gdrive.sh | sh -s https://drive.google.com/open?id=0B7EVK8r0v71pZjFTYXZWM3FlRnM
curl gdrive.sh | bash -s https://drive.google.com/open?id=0B4y35FiV1wh7QWpuVlFROXlBTHc
curl gdrive.sh | bash -s https://drive.google.com/file/d/0B4y35FiV1wh7QWpuVlFROXlBTHc/view?usp=sharing
curl gdrive.sh | bash -s https://drive.google.com/file/d/0B4y35FiV1wh7QWpuVlFROXlBTHc/view
curl gdrive.sh | bash -s https://drive.google.com/file/d/0B65DIm6DrZJceGltX2VOczNkcEE/edit
curl gdrive.sh | bash -s https://docs.google.com/file/d/0BwmPMFurnk9Pak5zWEVyOUZESms/edit
# Folder support
curl gdrive.sh | bash -s https://drive.google.com/drive/folders/0B7EVK8r0v71peklHb0pGdDl6R28
curl gdrive.sh | bash -s https://drive.google.com/drive/folders/0B7EVK8r0v71peklHb0pGdDl6R28?usp=sharing
```
**0B4y35FiV1wh7QWpuVlFROXlBTHc** is file id for Google Drive

# Install
```bash
alias gdrive.sh='curl gdrive.sh | bash -s'
gdrive.sh 0B4y35FiV1wh7QWpuVlFROXlBTHc
```
# Uninstall
```bash
unalias gdrive.sh
```

# Get a file id
## Get shareable link
![エビフライトライアングル](https://image.ibb.co/d1FPSp/aaaa.png "サンプル")

## Copy one
![エビフライトライアングル](https://image.ibb.co/imER7p/drive_google_com_drive_folders_0_B7_EVK8r0v71p_TUZsa_Xda_Sn_ZBZzg.png "サンプル")

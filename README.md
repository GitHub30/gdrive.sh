# gdrive.sh
[![Build Status](https://travis-ci.org/GitHub30/gdrive.sh.svg?branch=master)](https://travis-ci.org/GitHub30/gdrive.sh)

## Usage
```bash
curl gdrive.sh | bash -s string
```
### Where "string" can be file/folder url or file/folder id.

## Supported url type:
### Files:
```bash
https://drive.google.com/open?id=0B7EVK8r0v71pZjFTYXZWM3FlRnM
https://drive.google.com/open?id=0B4y35FiV1wh7QWpuVlFROXlBTHc
https://drive.google.com/file/d/0B4y35FiV1wh7QWpuVlFROXlBTHc/view?usp=sharing
https://drive.google.com/file/d/0B4y35FiV1wh7QWpuVlFROXlBTHc/view
https://docs.google.com/file/d/0BwmPMFurnk9Pak5zWEVyOUZESms/edit
https://drive.google.com/uc?id=0B7EVK8r0v71pZjFTYXZWM3FlRnM&export=download
```
### Folders:
```bash
https://drive.google.com/drive/folders/0B7EVK8r0v71peklHb0pGdDl6R28
https://drive.google.com/drive/folders/0B7EVK8r0v71peklHb0pGdDl6R28?usp=sharing
https://drive.google.com/folderview?id=0B7EVK8r0v71peklHb0pGdDl6R28&usp=sharing
https://drive.google.com/folderview?id=0B7EVK8r0v71peklHb0pGdDl6R28
```
### Note: Use single or double qoutes on urls having characters like `&` or `-`.
```
curl gdrive.sh | bash -s 'https://drive.google.com/folderview?id=0B7EVK8r0v71peklHb0pGdDl6R28--b&usp=sharing'
```
or
```
curl gdrive.sh | bash -s "https://drive.google.com/folderview?id=0B7EVK8r0v71peklHb0pGdDl6R28--b&usp=sharing"
```
## Install
```bash
alias gdrive.sh='curl gdrive.sh | bash -s'
gdrive.sh
```
### You can also grab the script from repository and place in your executable path.

## Uninstall
```bash
unalias gdrive.sh
```

## Get a file id or shareable link
![エビフライトライアングル](https://image.ibb.co/d1FPSp/aaaa.png "サンプル")

## Copy one
![エビフライトライアングル](https://image.ibb.co/imER7p/drive_google_com_drive_folders_0_B7_EVK8r0v71p_TUZsa_Xda_Sn_ZBZzg.png "サンプル")

#!/usr/bin/env bash
set -xe

# Small file check
bash gdrive.sh 0B4y35FiV1wh7QVR6VXJ5dWExSTQ
rm CRF++-0.58.tar.gz
bash gdrive.sh https://drive.google.com/open?id=0B4y35FiV1wh7QVR6VXJ5dWExSTQ
rm CRF++-0.58.tar.gz
bash gdrive.sh https://drive.google.com/file/d/0B4y35FiV1wh7QVR6VXJ5dWExSTQ/view?usp=sharing
rm CRF++-0.58.tar.gz
bash gdrive.sh https://drive.google.com/file/d/0B4y35FiV1wh7QVR6VXJ5dWExSTQ/view
rm CRF++-0.58.tar.gz
bash gdrive.sh "https://drive.google.com/uc?id=0B4y35FiV1wh7QVR6VXJ5dWExSTQ&export=download"
rm CRF++-0.58.tar.gz
bash gdrive.sh https://docs.google.com/file/d/0B4y35FiV1wh7QVR6VXJ5dWExSTQ/edit
## Do a check for log message when trying to download an existing file
bash gdrive.sh https://docs.google.com/file/d/0B4y35FiV1wh7QVR6VXJ5dWExSTQ/edit

# Big file check
bash gdrive.sh 0B4y35FiV1wh7SDd1Q1dUQkZQaUU
rm cabocha-0.69.tar.bz2
bash gdrive.sh https://drive.google.com/open?id=0B4y35FiV1wh7SDd1Q1dUQkZQaUU
rm cabocha-0.69.tar.bz2
bash gdrive.sh https://drive.google.com/file/d/0B4y35FiV1wh7SDd1Q1dUQkZQaUU/view?usp=sharing
rm cabocha-0.69.tar.bz2
bash gdrive.sh https://drive.google.com/file/d/0B4y35FiV1wh7SDd1Q1dUQkZQaUU/view
rm cabocha-0.69.tar.bz2
bash gdrive.sh "https://drive.google.com/uc?id=0B4y35FiV1wh7SDd1Q1dUQkZQaUU&export=download"
rm cabocha-0.69.tar.bz2
bash gdrive.sh https://docs.google.com/file/d/0B4y35FiV1wh7SDd1Q1dUQkZQaUU/edit
## Do a check for log message when trying to download an existing file
bash gdrive.sh https://docs.google.com/file/d/0B4y35FiV1wh7SDd1Q1dUQkZQaUU/edit

# Folder check
sleep 10 # sometimes, doing multiple requests on same folder can stuck, so wait for while for another request
sh gdrive.sh 0B7EVK8r0v71pOC0wOVZlQnFfaGs
rm -rf Anno/
sleep 10
sh gdrive.sh https://drive.google.com/drive/folders/0B7EVK8r0v71pOC0wOVZlQnFfaGs
rm -rf Anno/
sleep 10
sh gdrive.sh https://drive.google.com/folderview?id=0B7EVK8r0v71pOC0wOVZlQnFfaGs
rm -rf Anno/
sleep 10
sh gdrive.sh https://drive.google.com/drive/u/0/mobile/folders/0B7EVK8r0v71pOC0wOVZlQnFfaGs
rm -rf Anno/

set +xe

#!/usr/bin/env sh

# 确保脚本抛出遇到的错误
set -e

# 生成静态文件
yarn run build

# 进入生成的文件夹
cd docs/.vuepress/dist

git config --global user.email $GH_EMAIL
git config --global user.name $GH_NAME

git init
git add -A
git commit -m 'chore(deploy): deploy gh-pages'

# 如果发布到 https://<USERNAME>.github.io/<REPO>
git push -f git@github.com:hefeng1208/utopia.git master:gh-pages

cd -
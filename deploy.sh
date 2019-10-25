#!/usr/bin/env sh

# 确保脚本抛出遇到的错误
set -e

# 生成静态文件
yarn build

# 进入生成的文件夹
cd docs/.vuepress/dist

git config --global user.email $GH_EMAIL
git config --global user.name $GH_NAME

git init
git add -A
git commit -m 'chore(deploy): deploy gh-pages'

# 如果发布到 https://<USERNAME>.github.io/<REPO>
<<<<<<< HEAD
git push -f git@github.com:hefeng1208/circle-ci-test.git master:gh-pages
=======
# git push -f git@github.com:hefeng1208/Heartbreak-utopia.git master:gh-pages

# 如果使用 travis 持续集成
git push -f https://${GITHUB_TOKEN}@github.com:hefeng1208/Heartbreak-utopia.git master:gh-pages

>>>>>>> 0c46e586bb17eafa31fa5dd496784127b29e4b7d

cd -
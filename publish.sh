#!/bin/sh

# 如果脚本有任何错误，则退出
set -e

# 接收 commit message
MSG="$1"
if [ -z "$MSG" ]; then
  echo "Commit message is required"
  exit 1
fi

# 构建网站
echo "Building site..."
hugo

# 进入 public 目录
cd public

# 添加到 Git
git add .

# 提交变更
git commit -m "$MSG"

# 推送到 GitHub
echo "Pushing to GitHub Pages..."
git push origin main

# 返回上级目录
cd ..

# 提交源代码的变更
git add .
git commit -m "$MSG"
git push origin main

echo "Done!"

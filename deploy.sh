#!/bin/bash

echo "🚀 萤石云监控 - Cloudflare Pages 部署脚本"
echo "=========================================="
echo ""

# 检查是否安装了 wrangler
if ! command -v wrangler &> /dev/null
then
    echo "❌ Wrangler 未安装"
    echo "📦 正在安装 Wrangler..."
    npm install -g wrangler
    echo "✅ Wrangler 安装完成"
    echo ""
fi

# 检查是否已登录
echo "🔐 检查登录状态..."
if ! wrangler whoami &> /dev/null
then
    echo "📝 请登录 Cloudflare 账号..."
    wrangler login
fi

echo ""
echo "📤 开始部署到 Cloudflare Pages..."
echo ""

# 部署
wrangler pages deploy . --project-name=yingshiyun-monitor

echo ""
echo "✅ 部署完成！"
echo ""
echo "🌐 你的网站地址："
echo "   https://yingshiyun-monitor.pages.dev"
echo ""
echo "💡 提示："
echo "   - 首次访问可能需要等待 1-2 分钟"
echo "   - 可以在 Cloudflare Dashboard 中绑定自定义域名"
echo "   - 每次修改后运行此脚本即可更新网站"
echo ""

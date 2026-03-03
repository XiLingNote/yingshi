@echo off
chcp 65001 >nul
echo 🚀 萤石云监控 - Cloudflare Pages 部署脚本
echo ==========================================
echo.

REM 检查是否安装了 wrangler
where wrangler >nul 2>nul
if %ERRORLEVEL% NEQ 0 (
    echo ❌ Wrangler 未安装
    echo 📦 正在安装 Wrangler...
    call npm install -g wrangler
    echo ✅ Wrangler 安装完成
    echo.
)

REM 检查是否已登录
echo 🔐 检查登录状态...
wrangler whoami >nul 2>nul
if %ERRORLEVEL% NEQ 0 (
    echo 📝 请登录 Cloudflare 账号...
    wrangler login
)

echo.
echo 📤 开始部署到 Cloudflare Pages...
echo.

REM 部署（使用 pages publish 命令）
wrangler pages deploy . --project-name=yingshiyun-monitor --branch=main

echo.
echo ✅ 部署完成！
echo.
echo 🌐 你的网站地址：
echo    https://yingshiyun-monitor.pages.dev
echo.
echo 💡 提示：
echo    - 首次访问可能需要等待 1-2 分钟
echo    - 可以在 Cloudflare Dashboard 中绑定自定义域名
echo    - 每次修改后运行此脚本即可更新网站
echo.
pause

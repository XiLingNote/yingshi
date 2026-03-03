# Cloudflare Pages 部署指南

## 方法 1: 通过 Cloudflare Dashboard 部署（推荐，最简单）

### 步骤：

1. **访问 Cloudflare Pages**
   - 打开 https://dash.cloudflare.com/
   - 登录你的 Cloudflare 账号（没有的话免费注册一个）
   - 点击左侧菜单 "Workers & Pages"

2. **创建新项目**
   - 点击 "Create application"
   - 选择 "Pages" 标签
   - 点击 "Upload assets"

3. **上传文件**
   - 输入项目名称，例如：`yingshiyun-monitor`
   - 直接拖拽 `index.html` 文件到上传区域
   - 或者点击 "Select from computer" 选择文件

4. **部署**
   - 点击 "Deploy site"
   - 等待几秒钟，部署完成！

5. **访问网站**
   - 部署完成后会显示你的网站地址
   - 格式：`https://yingshiyun-monitor.pages.dev`
   - 可以在设置中绑定自定义域名

---

## 方法 2: 通过 Git 仓库部署（推荐用于持续更新）

### 步骤：

1. **创建 Git 仓库**
   ```bash
   git init
   git add .
   git commit -m "Initial commit"
   ```

2. **推送到 GitHub/GitLab**
   ```bash
   # GitHub
   git remote add origin https://github.com/你的用户名/yingshiyun.git
   git branch -M main
   git push -u origin main
   ```

3. **连接到 Cloudflare Pages**
   - 在 Cloudflare Dashboard 中点击 "Create application"
   - 选择 "Pages" → "Connect to Git"
   - 授权 GitHub/GitLab
   - 选择你的仓库

4. **配置构建设置**
   - Framework preset: `None`
   - Build command: 留空
   - Build output directory: `/`
   - Root directory: `/`

5. **部署**
   - 点击 "Save and Deploy"
   - 每次推送代码都会自动重新部署

---

## 方法 3: 使用 Wrangler CLI（命令行工具）

### 步骤：

1. **安装 Wrangler**
   ```bash
   npm install -g wrangler
   ```

2. **登录 Cloudflare**
   ```bash
   wrangler login
   ```

3. **部署项目**
   ```bash
   wrangler pages deploy . --project-name=yingshiyun-monitor
   ```

4. **访问网站**
   - 部署完成后会显示网站地址

---

## 自定义域名（可选）

1. 在 Cloudflare Pages 项目设置中
2. 点击 "Custom domains"
3. 点击 "Set up a custom domain"
4. 输入你的域名（需要在 Cloudflare 管理 DNS）
5. 按照提示添加 CNAME 记录
6. 等待 SSL 证书自动配置完成

---

## 环境变量配置（可选）

如果你想隐藏 AccessToken，可以使用环境变量：

1. 在项目设置中找到 "Environment variables"
2. 添加变量：
   - `ACCESS_TOKEN`: 你的萤石云 AccessToken
   - `DEVICE_SERIAL`: 设备序列号
   - `VALIDATE_CODE`: 验证码

3. 修改 `index.html` 中的配置读取方式

---

## 更新网站

### 方法 1（直接上传）：
- 在 Cloudflare Pages 项目中点击 "Create deployment"
- 上传新的 `index.html` 文件

### 方法 2（Git）：
```bash
git add .
git commit -m "Update"
git push
```
自动触发重新部署

---

## 常见问题

**Q: 部署后无法访问？**
A: 等待 1-2 分钟让 DNS 生效，清除浏览器缓存后重试

**Q: 对讲功能不工作？**
A: Cloudflare Pages 自动提供 HTTPS，应该可以正常使用麦克风权限

**Q: 视频无法播放？**
A: 检查 AccessToken 是否有效，设备序列号是否正确

**Q: 如何查看访问日志？**
A: 在 Cloudflare Pages 项目的 "Analytics" 标签中查看

---

## 优势

✅ 免费托管（每月 500 次构建）
✅ 全球 CDN 加速
✅ 自动 HTTPS
✅ 无限带宽
✅ 自动部署
✅ 支持自定义域名

---

## 下一步

部署完成后，记得：
1. 测试所有功能是否正常
2. 在移动设备上测试
3. 分享链接给需要的人
4. 定期更新 AccessToken（如果过期）

祝部署顺利！🚀

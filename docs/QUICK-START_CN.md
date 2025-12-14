# 快速入门指南

> 5 分钟开始使用 Claude Code 多代理工作流系统

## 🚀 安装（2 分钟）

### 选项 1：插件系统（最快）

```bash
# 一条命令安装所有内容
/plugin marketplace add cexll/myclaude
```

### 选项 2：Make 安装

```bash
git clone https://github.com/cexll/myclaude.git
cd myclaude
make install
```

### 选项 3：选择性安装

```bash
# 只安装你需要的
/plugin install bmad-agile-workflow       # 完整敏捷工作流
/plugin install development-essentials    # 日常编码命令
```

## 🎯 你的第一个工作流（3 分钟）

### 尝试 BMAD 工作流

完整的敏捷开发自动化：

```bash
/bmad-pilot "构建一个简单的待办事项 API，包含 CRUD 操作"
```

**会发生什么**：
1. **产品负责人** 生成需求文档（PRD）
2. **架构师** 设计系统架构
3. **Scrum 主管** 创建冲刺计划
4. **开发人员** 实现代码
5. **审查员** 执行代码审查
6. **QA** 运行测试

所有文档保存到 `.claude/specs/todo-list-api/`

### 尝试需求工作流

快速原型开发：

```bash
/requirements-pilot "为现有 API 添加用户认证"
```

**会发生什么**：
1. 生成功能需求
2. 实现代码
3. 审查实现
4. 创建测试

### 尝试直接命令

无需工作流的快速编码：

```bash
# 实现一个功能
/code "为邮箱字段添加输入验证"

# 调试问题
/debug "缺少参数时 API 返回 500 错误"

# 添加测试
/test "为验证逻辑创建单元测试"
```

## 📋 常见用例

### 1. 新功能开发

**复杂功能**（使用 BMAD）：
```bash
/bmad-pilot "用户认证系统，包含 OAuth2、多因素认证和基于角色的访问控制"
```

**简单功能**（使用需求工作流）：
```bash
/requirements-pilot "为用户列表端点添加分页功能"
```

**小功能**（使用直接命令）：
```bash
/code "为用户模型添加 created_at 时间戳"
```

### 2. Bug 修复

**复杂 Bug**（使用 debug）：
```bash
/debug "后台任务处理器中的内存泄漏"
```

**简单 Bug**（使用 bugfix）：
```bash
/bugfix "登录按钮在移动端 Safari 上无法工作"
```

### 3. 代码质量

**完整审查**：
```bash
/review "审查认证模块的安全问题"
```

**重构**：
```bash
/refactor "简化用户验证逻辑并删除重复代码"
```

**优化**：
```bash
/optimize "减少仪表板 API 中的数据库查询"
```

## 🎨 工作流选择指南

```
┌─────────────────────────────────────────────────────────┐
│                    选择你的工作流                        │
└─────────────────────────────────────────────────────────┘

复杂业务功能 + 需要架构设计
              ↓
      🏢 使用 BMAD 工作流
   /bmad-pilot "描述"
   • 6 个专业代理
   • 质量门禁（PRD ≥90，设计 ≥90）
   • 完整文档
   • 包含冲刺规划

────────────────────────────────────────────────────────

需求明确 + 需要快速迭代
              ↓
    ⚡ 使用需求工作流
 /requirements-pilot "描述"
   • 4 个阶段：需求 → 代码 → 审查 → 测试
   • 质量门禁（需求 ≥90）
   • 最少文档
   • 直接实现

────────────────────────────────────────────────────────

任务明确 + 无需工作流开销
              ↓
      🔧 使用直接命令
  /code | /debug | /test | /optimize
   • 单一目的命令
   • 立即执行
   • 无文档开销
   • 适合日常任务
```

## 💡 成功技巧

### 1. 具体明确

**❌ 不好**：
```bash
/bmad-pilot "构建一个应用"
```

**✅ 好**：
```bash
/bmad-pilot "构建一个任务管理 API，包含用户认证、任务 CRUD、
任务分配和通过 WebSocket 的实时通知"
```

### 2. 提供上下文

包含相关技术细节：
```bash
/code "为用户资料端点添加 Redis 缓存，缓存 TTL 5 分钟，
资料更新时失效"
```

### 3. 与代理互动

在 BMAD 工作流期间，在质量门禁处提供反馈：

```
PO："这是 PRD（得分：85/100）"
你："添加移动应用支持和离线模式需求"
PO："已更新 PRD（得分：94/100）✅"
```

### 4. 审查生成的工件

确认前检查文档：
- `.claude/specs/{功能}/01-product-requirements.md`
- `.claude/specs/{功能}/02-system-architecture.md`
- `.claude/specs/{功能}/03-sprint-plan.md`

### 5. 链式命令处理复杂任务

分解复杂工作：
```bash
/ask "实现实时聊天的最佳方法"
/bmad-pilot "实时聊天系统，包含消息历史和输入指示器"
/test "为聊天消息传递添加集成测试"
/docs "记录聊天 API 端点和 WebSocket 事件"
```

## 🎓 学习路径

**第 1 天**：尝试直接命令
```bash
/code "简单任务"
/test "添加一些测试"
/review "检查我的代码"
```

**第 2 天**：尝试需求工作流
```bash
/requirements-pilot "小功能"
```

**第 2 周**：尝试 BMAD 工作流
```bash
/bmad-pilot "较大功能"
```

**第 3 周**：组合工作流
```bash
# 使用 BMAD 进行规划
/bmad-pilot "新模块" --direct-dev

# 使用需求工作流处理冲刺任务
/requirements-pilot "冲刺中的单个任务"

# 使用命令处理日常工作
/code "快速修复"
/test "添加测试"
```

## 📚 下一步

### 探索文档

- **[BMAD 工作流指南](BMAD-WORKFLOW_CN.md)** - 深入了解完整敏捷工作流
- **[需求工作流指南](REQUIREMENTS-WORKFLOW_CN.md)** - 学习轻量级开发
- **[开发命令参考](DEVELOPMENT-COMMANDS_CN.md)** - 所有命令详情
- **[插件系统指南](PLUGIN-SYSTEM_CN.md)** - 插件管理

### 尝试高级功能

**BMAD 选项**：
```bash
# 跳过测试用于原型
/bmad-pilot "原型" --skip-tests

# 跳过冲刺规划快速开发
/bmad-pilot "功能" --direct-dev

# 跳过仓库扫描（如果上下文已存在）
/bmad-pilot "功能" --skip-scan
```

**单独代理**：
```bash
# 仅需求
/bmad-po "功能需求"

# 仅架构
/bmad-architect "系统设计"

# 仅编排
/bmad-orchestrator "复杂项目协调"
```

### 检查质量

运行测试和验证：
```bash
make test-bmad              # 测试 BMAD 工作流
make test-requirements      # 测试需求工作流
```

## 🆘 故障排除

**找不到命令？**
```bash
# 验证安装
/plugin list

# 如需要重新安装
make install
```

**代理无法工作？**
```bash
# 检查代理配置
ls ~/.config/claude/agents/

# 重新部署代理
make deploy-agents
```

**缺少输出样式？**
```bash
# 部署输出样式
cp output-styles/*.md ~/.config/claude/output-styles/
```

## 📞 获取帮助

- **问题反馈**：[GitHub Issues](https://github.com/cexll/myclaude/issues)
- **文档**：[docs/](.)
- **示例**：运行工作流后检查 `.claude/specs/`
- **Make 帮助**：运行 `make help` 查看所有命令

---

**你准备好了！** 从 `/code "你的第一个任务"` 开始探索吧。

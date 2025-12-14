# 插件系统指南

> Claude Code 原生插件支持，实现模块化工作流安装

## 🎯 概述

本仓库提供 4 个开箱即用的 Claude Code 插件，可以单独安装或作为完整套件安装。

## 📦 可用插件

### 1. bmad-agile-workflow

**完整的 BMAD 方法论，包含 6 个专业代理**

**命令**：
- `/bmad-pilot` - 完整敏捷工作流编排

**代理**：
- `bmad-po` - 产品负责人 (Sarah)
- `bmad-architect` - 系统架构师 (Winston)
- `bmad-sm` - Scrum 主管 (Mike)
- `bmad-dev` - 开发人员 (Alex)
- `bmad-review` - 代码审查员
- `bmad-qa` - QA 工程师 (Emma)
- `bmad-orchestrator` - 主编排器

**适用于**：企业项目、复杂功能、完整敏捷流程

### 2. requirements-driven-workflow

**精简的需求到代码工作流**

**命令**：
- `/requirements-pilot` - 需求驱动开发流程

**代理**：
- `requirements-generate` - 需求生成
- `requirements-code` - 代码实现
- `requirements-review` - 代码审查
- `requirements-testing` - 测试策略

**适用于**：快速原型、简单功能、快速开发

### 3. development-essentials

**核心开发斜杠命令**

**命令**：
- `/code` - 直接实现
- `/debug` - 系统化调试
- `/test` - 测试策略
- `/optimize` - 性能调优
- `/bugfix` - Bug 解决
- `/refactor` - 代码改进
- `/review` - 代码验证
- `/ask` - 技术咨询
- `/docs` - 文档编写
- `/think` - 高级分析

**代理**：
- `code` - 代码实现
- `bugfix` - Bug 修复
- `debug` - 调试
- `develop` - 通用开发

**适用于**：日常编码任务、快速实现

### 4. advanced-ai-agents

**GPT-5 深度推理集成**

**命令**：无（仅代理）

**代理**：
- `gpt5` - 深度推理和分析

**适用于**：复杂架构决策、战略规划

## 🚀 安装方法

### 方法 1：插件命令（推荐）

```bash
# 列出所有可用插件
/plugin list

# 获取插件的详细信息
/plugin info bmad-agile-workflow

# 安装特定插件
/plugin install bmad-agile-workflow

# 安装所有插件
/plugin install bmad-agile-workflow
/plugin install requirements-driven-workflow
/plugin install development-essentials
/plugin install advanced-ai-agents

# 移除已安装的插件
/plugin remove development-essentials
```

### 方法 2：仓库引用

```bash
# 从 GitHub 仓库安装
/plugin marketplace add cexll/myclaude
```

这将展示仓库中所有可用的插件。

### 方法 3：Make 命令

用于传统安装或选择性部署：

```bash
# 安装所有内容
make install

# 部署特定工作流
make deploy-bmad          # 仅 BMAD 工作流
make deploy-requirements  # 仅需求工作流
make deploy-commands      # 所有斜杠命令
make deploy-agents       # 所有代理

# 部署所有内容
make deploy-all

# 查看所有选项
make help
```

### 方法 4：手动安装

将文件复制到 Claude Code 配置目录：

**命令**：
```bash
cp bmad-agile-workflow/commands/*.md ~/.config/claude/commands/
cp requirements-driven-workflow/commands/*.md ~/.config/claude/commands/
cp development-essentials/commands/*.md ~/.config/claude/commands/
```

**代理**：
```bash
cp bmad-agile-workflow/agents/*.md ~/.config/claude/agents/
cp requirements-driven-workflow/agents/*.md ~/.config/claude/agents/
cp development-essentials/agents/*.md ~/.config/claude/agents/
cp advanced-ai-agents/agents/*.md ~/.config/claude/agents/
```

**输出样式**（可选）：
```bash
cp output-styles/*.md ~/.config/claude/output-styles/
```

## 📋 插件配置

插件在 `.claude-plugin/marketplace.json` 中定义，遵循 Claude Code 插件规范。

### 插件元数据结构

```json
{
  "name": "plugin-name",
  "displayName": "人类可读名称",
  "description": "插件描述",
  "version": "1.0.0",
  "author": "作者名称",
  "category": "workflow|development|analysis",
  "keywords": ["关键词1", "关键词2"],
  "commands": ["command1", "command2"],
  "agents": ["agent1", "agent2"]
}
```

## 🔧 插件管理

### 检查已安装的插件

```bash
/plugin list
```

显示所有已安装插件及其状态。

### 插件信息

```bash
/plugin info <plugin-name>
```

显示详细信息：
- 描述
- 版本
- 提供的命令
- 包含的代理
- 作者和关键词

### 更新插件

当你拉取最新的仓库更改时，插件会被更新：

```bash
git pull origin main
make install
```

### 卸载插件

```bash
/plugin remove <plugin-name>
```

或手动删除文件：

```bash
# 删除命令
rm ~/.config/claude/commands/<command-name>.md

# 删除代理
rm ~/.config/claude/agents/<agent-name>.md
```

## 🎯 插件选择指南

### 安装所有内容（推荐新用户）

```bash
make install
```

提供所有工作流和命令的完整功能。

### 选择性安装

**适合敏捷团队**：
```bash
/plugin install bmad-agile-workflow
```

**适合快速开发**：
```bash
/plugin install requirements-driven-workflow
/plugin install development-essentials
```

**适合个人开发者**：
```bash
/plugin install development-essentials
/plugin install advanced-ai-agents
```

**注重代码质量**：
```bash
/plugin install development-essentials  # 包含 /review
/plugin install bmad-agile-workflow     # 包含 bmad-review
```

## 📁 目录结构

```
myclaude/
├── .claude-plugin/
│   └── marketplace.json          # 插件注册表
├── bmad-agile-workflow/
│   ├── commands/
│   │   └── bmad-pilot.md
│   └── agents/
│       ├── bmad-po.md
│       ├── bmad-architect.md
│       ├── bmad-sm.md
│       ├── bmad-dev.md
│       ├── bmad-review.md
│       ├── bmad-qa.md
│       └── bmad-orchestrator.md
├── requirements-driven-workflow/
│   ├── commands/
│   │   └── requirements-pilot.md
│   └── agents/
│       ├── requirements-generate.md
│       ├── requirements-code.md
│       ├── requirements-review.md
│       └── requirements-testing.md
├── development-essentials/
│   ├── commands/
│   │   ├── code.md
│   │   ├── debug.md
│   │   ├── test.md
│   │   └── ... (更多命令)
│   └── agents/
│       ├── code.md
│       ├── bugfix.md
│       ├── debug.md
│       └── develop.md
├── advanced-ai-agents/
│   └── agents/
│       └── gpt5.md
└── output-styles/
    └── bmad-phase-context.md
```

## 🔄 插件依赖

**无依赖**：所有插件独立工作

**互补组合**：
- BMAD + 高级代理（增强审查）
- 需求工作流 + 开发必备（完整工具包）
- 全部四个插件（完整套件）

## 🛠️ Makefile 参考

```bash
# 安装
make install              # 安装所有插件
make deploy-all          # 部署所有配置

# 选择性部署
make deploy-bmad         # 仅 BMAD 工作流
make deploy-requirements # 仅需求工作流
make deploy-commands     # 仅所有斜杠命令
make deploy-agents       # 仅所有代理

# 测试
make test-bmad          # 测试 BMAD 工作流
make test-requirements  # 测试需求工作流

# 清理
make clean              # 删除生成的工件
make help               # 显示所有可用命令
```

## 📚 相关文档

- **[BMAD 工作流](BMAD-WORKFLOW_CN.md)** - 完整 BMAD 指南
- **[需求工作流](REQUIREMENTS-WORKFLOW_CN.md)** - 轻量级工作流指南
- **[开发命令](DEVELOPMENT-COMMANDS_CN.md)** - 命令参考
- **[快速入门指南](QUICK-START_CN.md)** - 快速开始

## 🔗 外部资源

- **[Claude Code 插件文档](https://docs.claude.com/en/docs/claude-code/plugins)** - 官方插件文档
- **[Claude Code CLI](https://claude.ai/code)** - Claude Code 界面

---

**模块化安装** - 只安装你需要的，在你需要的时候。

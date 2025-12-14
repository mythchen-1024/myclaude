# BMAD 中文版安装脚本 (PowerShell)
# 使用方法: powershell -ExecutionPolicy Bypass -File install_cn.ps1

Write-Host "========================================" -ForegroundColor Cyan
Write-Host "BMAD 中文版安装程序" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""

# 检查 Python
try {
    $pythonVersion = python --version 2>&1
    Write-Host "✓ 找到 Python: $pythonVersion" -ForegroundColor Green
} catch {
    Write-Host "✗ 未找到 Python，请先安装 Python 3.7+" -ForegroundColor Red
    Read-Host "按回车键退出"
    exit 1
}

Write-Host ""
Write-Host "[1/3] 使用中文配置文件安装 BMAD..." -ForegroundColor Yellow

# 执行安装
python install.py --config config_cn.json --module bmad-cn --verbose --force

if ($LASTEXITCODE -ne 0) {
    Write-Host ""
    Write-Host "✗ 安装失败，请查看错误信息" -ForegroundColor Red
    Read-Host "按回车键退出"
    exit 1
}

Write-Host ""
Write-Host "[2/3] 验证安装..." -ForegroundColor Yellow

$installDir = "$env:USERPROFILE\.claude"
$checks = @(
    @{Path = "$installDir\commands\bmad-pilot.md"; Name = "命令文件"},
    @{Path = "$installDir\agents\bmad-po.md"; Name = "智能体文件"},
    @{Path = "$installDir\docs\BMAD-WORKFLOW.md"; Name = "文档文件"}
)

foreach ($check in $checks) {
    if (Test-Path $check.Path) {
        Write-Host "  ✓ $($check.Name)已安装" -ForegroundColor Green
    } else {
        Write-Host "  ✗ $($check.Name)未找到" -ForegroundColor Red
    }
}

Write-Host ""
Write-Host "[3/3] 安装完成！" -ForegroundColor Green
Write-Host ""
Write-Host "安装位置: $installDir" -ForegroundColor Cyan
Write-Host "日志文件: $installDir\install.log" -ForegroundColor Cyan
Write-Host ""
Write-Host "现在你可以在 Claude Code 中使用以下命令:" -ForegroundColor Yellow
Write-Host "  /bmad-pilot `"你的项目描述`"" -ForegroundColor White
Write-Host ""
Read-Host "按回车键退出"

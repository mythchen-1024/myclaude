@echo off
REM BMAD 中文版安装脚本
REM 使用方法: install_cn.bat

echo ========================================
echo BMAD 中文版安装程序
echo ========================================
echo.

REM 检查 Python
python --version >nul 2>&1
if errorlevel 1 (
    echo [错误] 未找到 Python，请先安装 Python 3.7+
    pause
    exit /b 1
)

echo [1/3] 使用中文配置文件安装 BMAD...
python install.py --config config_cn.json --module bmad-cn --verbose --force

if errorlevel 1 (
    echo.
    echo [错误] 安装失败，请查看错误信息
    pause
    exit /b 1
)

echo.
echo [2/3] 验证安装...
if exist "%USERPROFILE%\.claude\commands\bmad-pilot.md" (
    echo   ✓ 命令文件已安装
) else (
    echo   ✗ 命令文件未找到
)

if exist "%USERPROFILE%\.claude\agents\bmad-po.md" (
    echo   ✓ 智能体文件已安装
) else (
    echo   ✗ 智能体文件未找到
)

echo.
echo [3/3] 安装完成！
echo.
echo 安装位置: %USERPROFILE%\.claude
echo 日志文件: %USERPROFILE%\.claude\install.log
echo.
echo 现在你可以在 Claude Code 中使用以下命令:
echo   /bmad-pilot "你的项目描述"
echo.
pause

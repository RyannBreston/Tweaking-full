@echo off
:: RyannBreston Tweaking Utility - V1.1
:: GitHub: https://github.com/RyannBreston
:: Sistema de otimização para Windows

:: Set ANSI Colors
set white=[97m
set pink=[95m
set blue=[96m

:: Enable ANSI Escape Sequences
Reg.exe add "HKCU\\CONSOLE" /v "VirtualTerminalLevel" /t REG_DWORD /d "1" /f > nul

:: Enable Delayed Variable Expansion
setlocal EnableDelayedExpansion
chcp 65001 >nul
cls

:: Header
echo.
echo. ╔═════════════════════════════════════════════════════════════╗
echo. ║                                                             ║
echo  ║   %white% RyannBreston - Tweaking Utility v1.1              %blue% ║
echo. ║   %white% https://github.com/RyannBreston                   %blue% ║
echo. ║                                                             ║
echo. ╚═════════════════════════════════════════════════════════════╝
timeout /t 1 /nobreak > nul

:: Verifica privilégios de administrador
mkdir %SystemRoot%\System32\adminchk >nul 2>&1
if %errorlevel% neq 0 (
    echo.
    echo. [!] Por favor, execute como administrador.
    timeout /t 4 >nul
    exit /b
)
rmdir %SystemRoot%\System32\adminchk >nul 2>&1

:menu
cls
echo.
echo. ╔════════════════════════════════════════════════════╗
echo. ║              %white% MENU DE OTIMIZAÇÃO %blue%                  ║
echo. ╚════════════════════════════════════════════════════╝
echo.
echo  [1] Limpar arquivos temporários
echo  [2] Liberar memória RAM
echo  [3] Desativar serviços desnecessários
echo  [4] Otimizar inicialização do Windows
echo  [5] Verificar e reparar arquivos do sistema (sfc)
echo  [6] Verificar disco (chkdsk)
echo  [7] Reiniciar o Explorer
echo  [8] Reiniciar o PC
echo  [9] Desligar o PC
echo  [0] Sair
echo.
set /p op=Digite sua opção: 

if "%op%"=="1" goto limpar_temp
if "%op%"=="2" goto liberar_ram
if "%op%"=="3" goto desativar_servicos
if "%op%"=="4" goto otimizar_boot
if "%op%"=="5" goto sfc
if "%op%"=="6" goto chkdsk
if "%op%"=="7" goto restart_explorer
if "%op%"=="8" shutdown /r /t 0
if "%op%"=="9" shutdown /s /t 0
if "%op%"=="0" exit
goto menu

:limpar_temp
echo.
echo [*] Limpando arquivos temporários...
del /f /s /q %TEMP%\* >nul 2>&1
del /f /s /q C:\Windows\Temp\* >nul 2>&1
del /f /s /q C:\Windows\Prefetch\* >nul 2>&1
echo [+] Limpeza concluída.
timeout /t 2 >nul
goto menu

:liberar_ram
echo.
echo [*] Liberando memória RAM...
powershell -command "Clear-Content -Path $env:TEMP\* -Force" >nul 2>&1
echo [+] Memória liberada (simulada).
timeout /t 2 >nul
goto menu

:desativar_servicos
echo.
echo [*] Desativando serviços desnecessários...
sc stop DiagTrack >nul 2>&1
sc config DiagTrack start= disabled >nul 2>&1
sc stop SysMain >nul 2>&1
sc config SysMain start= disabled >nul 2>&1
echo [+] Serviços desativados.
timeout /t 2 >nul
goto menu

:otimizar_boot
echo.
echo [*] Otimizando inicialização do Windows...
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Serialize" /v StartupDelayInMSec /t REG_DWORD /d 0 /f >nul
echo [+] Inicialização otimizada.
timeout /t 2 >nul
goto menu

:sfc
echo.
echo [*] Verificando arquivos do sistema...
sfc /scannow
pause
goto menu

:chkdsk
echo.
echo [*] Verificando disco (CHKDSK)...
echo Aguarde...
chkdsk C:
pause
goto menu

:restart_explorer
echo.
echo [*] Reiniciando o Windows Explorer...
taskkill /f /im explorer.exe >nul
start explorer.exe
echo [+] Explorer reiniciado.
timeout /t 2 >nul
goto menu

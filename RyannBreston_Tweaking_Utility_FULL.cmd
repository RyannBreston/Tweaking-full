@echo off
:: RyannBreston Tweaking-full - V1.0
:: GitHub: https://github.com/RyannBreston
:: Sistema de otimização para Windows

set w=[97m
set p=[95m
set b=[96m
%B%
:: Enable ANSI Escape Sequences
Reg.exe add "HKCU\CONSOLE" /v "VirtualTerminalLevel" /t REG_DWORD /d "1" /f  > nul

::Enable Delayed Expansion
setlocal EnableDelayedExpansion > nul
cls 

::Run as admin (this is so the tweaks apply properly)
chcp 65001 >nul 2>&1
cls 
echo.
echo. ╔════════════════════════════════════════════════════╗
echo. ║                                                    ║
echo  ║   %w% Checking for Administrative Privelages...     %b%  ║
echo. ║                                                    ║
echo. ╚════════════════════════════════════════════════════╝
timeout /t 1 /nobreak > NUL

rmdir %SystemDrive%\Windows\system32\adminrightstest >nul 2>&1
mkdir %SystemDrive%\Windows\system32\adminrightstest >nul 2>&1
if %errorlevel% neq 0 (   
cls 
echo.
echo. ╔════════════════════════════════════════════════════╗
echo. ║                                                    ║
echo  ║  %w% Running Tweaking-full as Administrator...%b% ║
echo. ║                                                    ║
echo. ╚════════════════════════════════════════════════════╝
timeout /t 1 /nobreak > NUL
chcp 437 >nul 2>&1
powershell -NoProfile -NonInteractive -Command start -verb runas "'%~s0'" >nul 2>&1
chcp 65001 >nul 2>&1

if !errorlevel! equ 0 exit /b


echo.
echo             Tweaking-full is not running as Admin!
echo     Some optimizations won't work. Continue anyway?
echo.
choice /c:"CQ" /n /m "%BS%               [C] Continue  [Q] Quit" & if !errorlevel! equ 2 exit /b
)


chcp 65001 >nul 2>&1

set THREADS=%NUMBER_OF_PROCESSORS% > nul
for /f %%i in ('wmic path Win32_UserAccount where name^="%username%" get sid ^| findstr "S-"') do set "USER_SID=%%i"

echo %w% - Loading ...%b%
cls 
md C:\exm >nul 2>&1
echo %w% - Refreshing exm rescourse folder %b%
timeout /t 1 /nobreak > NUL
del /s /q C:\exm  >nul 2>&1
cls 

::Enable Restore points 
chcp 437 >nul 2>&1
powershell -NoProfile Enable-ComputerRestore -Drive 'C:\'>nul 2>&1
Reg.exe delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\SystemRestore" /v "RPSessionInterval" /f  >nul 2>&1
Reg.exe delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\SystemRestore" /v "DisableConfig" /f >nul 2>&1
Reg.exe add "HKLM\Software\Microsoft\Windows NT\CurrentVersion\SystemRestore" /v "SystemRestorePointCreationFrequency" /t REG_DWORD /d 0 /f >nul 2>&1
%b%
chcp 65001 >nul 2>&1
CLS
echo.
echo.
echo.
echo.
echo.                                   %p%░██╗░░░░░░░██╗███████╗██╗░░░░░░█████╗░░█████╗░███╗░░░███╗███████╗░
echo.                                   %p%░██║░░██╗░░██║██╔════╝██║░░░░░██╔══██╗██╔══██╗████╗░████║██╔════╝░
echo.                                   %p%░╚██╗████╗██╔╝█████╗░░██║░░░░░██║░░╚═╝██║░░██║██╔████╔██║█████╗░░░
echo.                                   %p%░░████╔═████║░██╔══╝░░██║░░░░░██║░░██╗██║░░██║██║╚██╔╝██║██╔══╝░░░
echo.                                   %p%░░╚██╔╝░╚██╔╝░███████╗███████╗╚█████╔╝╚█████╔╝██║░╚═╝░██║███████╗░
echo.                                   %p%░░░╚═╝░░░╚═╝░░╚══════╝╚══════╝░╚════╝░░╚════╝░╚═╝░░░░░╚═╝╚══════╝░
echo.                 %b%"══════════════════════════════════════════════════════════════════════════════════════════════════"%w%                                                                                                  
echo.                                %w%  Made by Ryannbreston 2025 %b%║%w% Version 1.0 %white% https://github.com/RyannBreston       
echo.                                                                                                   
echo.
echo.                     I am not responsible for any problems/Damages with your pc this may cause (this doesnt happen very often)
echo.
echo.                                 Its prohibited to resell any of my free tools, it will lead to consequences.
echo.
echo.                 %b%"══════════════════════════════════════════════════════════════════════════════════════════════════"%w%
echo.
echo.                                        Press a NUMBER on your keyboard followed by ENTER to select an option
echo.
echo.                           Please Read All warnings, popups etc... dont just blindly press buttons without reading.
echo.
echo.                 %b%"═══════════════════════════════════════════════════════════════════════════════════════════════════"
echo.
echo.
echo.
echo.                                        %b%"I═══════════════════════════════════════════════════════I"
echo.                                                     %w%    Press any key to continue...
echo.                                        %b%"I═══════════════════════════════════════════════════════I"
echo.

echo. 
pause > nul
CLS

:restorepoint
cls
echo.
echo.
echo.                                 %p%██████╗░███████╗░██████╗████████╗░█████╗░██████╗░███████╗  ██████╗░░█████╗░██╗███╗░░██╗████████╗
echo.                                 %p%██╔══██╗██╔════╝██╔════╝╚══██╔══╝██╔══██╗██╔══██╗██╔════╝  ██╔══██╗██╔══██╗██║████╗░██║╚══██╔══╝
echo.                                 %p%██████╔╝█████╗░░╚█████╗░░░░██║░░░██║░░██║██████╔╝█████╗░░  ██████╔╝██║░░██║██║██╔██╗██║░░░██║░░░
echo.                                 %p%██╔══██╗██╔══╝░░░╚═══██╗░░░██║░░░██║░░██║██╔══██╗██╔══╝░░  ██╔═══╝░██║░░██║██║██║╚████║░░░██║░░░
echo.                                 %p%██║░░██║███████╗██████╔╝░░░██║░░░╚█████╔╝██║░░██║███████╗  ██║░░░░░╚█████╔╝██║██║░╚███║░░░██║░░░
echo.                                 %p%╚═╝░░╚═╝╚══════╝╚═════╝░░░░╚═╝░░░░╚════╝░╚═╝░░╚═╝╚══════╝  ╚═╝░░░░░░╚════╝░╚═╝╚═╝░░╚══╝░░░╚═╝░░░
echo.                        %b%"══════════════════════════════════════════════════════════════════════════════════════════════════════════════"%w%
echo.                                                           %w% Do you want to Create a Restore Point? 
echo.                                                                                                                                                                      
echo.                                                                                                                                       
echo.                                                     %p%[%w%1%p%]%w% Make A restore Point             %p%[%w%2%p%]%w% Skip          
echo.                                                                                                                                       
echo.      
echo.                        %b%"══════════════════════════════════════════════════════════════════════════════════════════════════════════════"%w%
echo.                                           %W% Allows you to reset the settings that the utility has changed back to normal
echo.                                                %W% You can use a restore point later on in the utility, if you wish so
echo.                        %b%"══════════════════════════════════════════════════════════════════════════════════════════════════════════════"%w%
echo. 

set /p input=:
if /i %input% == 1 goto rON
if /i %input% == 2 goto res

) ELSE (
echo Invalid Input & goto MisspellRedirect

:MisspellRedirect
cls
echo Misspell Detected
timeout 2
goto RedirectMenu

:RedirectMenu
goto restorepoint

:rON
chcp 437 >nul 
powershell -Command "Checkpoint-Computer -Description 'Exm Free Utility Restore Point' -RestorePointType 'MODIFY_SETTINGS'" 
chcp 65001 >nul 
echo.
echo.
echo.
cls
goto :res

:res 
md C:\exm
cls
echo. %b% 
echo. ╔═════════════════════════════╗
echo. ║                             ║
echo  ║ %w% Downloading Rescourses  %b%   ║
echo. ║                             ║
echo. ╚═════════════════════════════╝
echo.

curl -g -k -L -# -o "%temp%\exm.zip" "https://www.dropbox.com/scl/fi/wh4figt0lhorsc7ukqgv3/exm.zip?rlkey=fotqy2invkvuvgpwxmh6dsd0m&st=xg5ao5v3&dl=0" >nul 2>&1
cls
chcp 437 >nul 2>&1
powershell -NoProfile Expand-Archive '%temp%\exm.zip' -DestinationPath 'C:\exm' >nul 2>&1 
chcp 65001 >nul 2>&1
cls
goto menu

:soon
echo.
echo.
echo.
echo.                                              %b%"═══════════════════════════════════════════════════════"
echo.                                                %w%                    Coming soon...  
echo.                                              %b%"═══════════════════════════════════════════════════════"
pause > nul
cls
goto menu

:restore
cls
rstrui.exe
echo.
echo.
echo.
echo.                                              %b%"═══════════════════════════════════════════════════════"
echo.                                                %w%  Operation Completed, Press any key to continue...  
echo.                                              %b%"═══════════════════════════════════════════════════════"
pause > nul
cls
goto menu

:Menu
chcp 65001 >nul 2>&1
cls
echo.
echo.
echo.
echo.
echo.       %p% ███████╗██╗░░██╗███╗░░░███╗░███████╗██████╗░███████╗███████╗░██╗░░░██╗████████╗██╗██╗░░░░░██╗████████╗██╗░░░██╗░░░░█████╗░░░░█████╗░
echo.       %p% ██╔════╝╚██╗██╔╝████╗░████║░██╔════╝██╔══██╗██╔════╝██╔════╝░██║░░░██║╚══██╔══╝██║██║░░░░░██║╚══██╔══╝╚██╗░██╔╝░░░██╔╝██║░░░██╔══██╗
echo.       %p% █████╗░░░╚███╔╝░██╔████╔██║░█████╗░░██████╔╝█████╗░░█████╗░░░██║░░░██║░░░██║░░░██║██║░░░░░██║░░░██║░░░░╚████╔╝░░░██╔╝░██║░░░██║░░██║
echo.       %p% ██╔══╝░░░██╔██╗░██║╚██╔╝██║░██╔══╝░░██╔══██╗██╔══╝░░██╔══╝░░░██║░░░██║░░░██║░░░██║██║░░░░░██║░░░██║░░░░░╚██╔╝░░░░███████║░░░██║░░██║
echo.       %p% ███████╗██╔╝╚██╗██║░╚═╝░██║░██║░░░░░██║░░██║███████╗███████╗░╚██████╔╝░░░██║░░░██║███████╗██║░░░██║░░░░░░██║░░░░░╚════██║██╗╚█████╔╝
echo.       %p% ╚══════╝╚═╝░░╚═╝╚═╝░░░░░╚═╝░╚═╝░░░░░╚═╝░░╚═╝╚══════╝╚══════╝░░╚═════╝░░░░╚═╝░░░╚═╝╚══════╝╚═╝░░░╚═╝░░░░░░╚═╝░░░░░░░░░░╚═╝╚═╝░╚════╝░
echo.       %b%"════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════"
echo.       %w%                                                                                                         
echo.       %w%                           %p%%w%%p%%w%                                   
echo.       %w%                                                                                                                                                      
echo.       %w%                           %p%[%w%1%p%]%w% Ajustes gerais               %p%[%w%2%p%]%w% Mouse e teclado      %p%[%w%3%p%]%w% Windows Tweaks                      
echo.       %w%                                                                                                                    
echo.       %w%                           %p%[%w%4%p%]%w% PC limpo                      %p%[%w%5%p%]%w% Memory Tweaks            %p%[%w%6%p%]%w% Disable Startup Services
echo.       %w%                                                                                                                  
echo.       %w%                           %p%[%w%7%p%]%w% Ajustes de GPU                    %p%[%w%8%p%]%w% CPU Tweaks               %p%[%w%9%p%]%w% USB Tweaks                                  
echo.       %w%                                                                                                                                                                 
echo.       %w%                           %p%[%w%10%p%]%w% Ajustes de energia                 %p%[%w%11%p%]%w% Debloat                 %p%[%w%12%p%]%w% Storage Tweaks    
echo.       %w%                                                                                                                      
echo.       %b%"════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════"
echo.       %w%                                                                                                                      
echo.       %w%                           %p%[%w%E%p%]%w% Reverts         %p%[%w%W%p%]%w% Unlock your PC's Full Potential        %p%[%w%R%p%]%w% Use Restore Point                                             
echo.       %w%                                                                                                                                          
echo.       %w%                                                                                                                                                                           
echo.       %w%                                  Made by EXM TWEAKS® 2024 %b%║%w% Discord.gg/exm %b%║%w% Updated 12th of May                                        
echo.       %w%                                                                                                                  
echo.       %b%"════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════"



set /p input=:
if /i %input% == 1 goto 1
if /i %input% == 2 goto 2
if /i %input% == 3 goto 3 Ajustes de GPU
if /i %input% == 4 goto 4
if /i %input% == 5 goto 5
if /i %input% == 6 goto 6
if /i %input% == 7 goto 7
if /i %input% == 8 goto 8 war
if /i %input% == 9 goto 9
if /i %input% == 10 goto 10 war
if /i %input% == 11 goto 11
if /i %input% == 12 goto 12

if /i %input% == E goto :e
if /i %input% == R goto Restore
if /i %input% == W start https://exmtweaks.com 


) ELSE (
echo Invalid Input & goto MisspellRedirect

:MisspellRedirect
cls
echo Misspell Detected
timeout 2 
goto RedirectMenu

:RedirectMenu
cls
goto :menu

:12
:storage
cls
echo.
echo.
echo.                                       %p%░██████╗████████╗░█████╗░██████╗░░█████╗░░██████╗░███████╗   
echo.                                       %p%██╔════╝╚══██╔══╝██╔══██╗██╔══██╗██╔══██╗██╔════╝░██╔════╝ 
echo.                                       %p%╚█████╗░░░░██║░░░██║░░██║██████╔╝███████║██║░░██╗░█████╗░░        
echo.                                       %p%░╚═══██╗░░░██║░░░██║░░██║██╔══██╗██╔══██║██║░░╚██╗██╔══╝░░  
echo.                                       %p%██████╔╝░░░██║░░░╚█████╔╝██║░░██║██║░░██║╚██████╔╝███████╗     
echo.                                       %p%╚═════╝░░░░╚═╝░░░░╚════╝░╚═╝░░╚═╝╚═╝░░╚═╝░╚═════╝░╚══════╝      
echo.                        %b%"════════════════════════════════════════════════════════════════════════════════"%w%
echo.                                               %w% Some Storage tweaks + defragment your drives                    
echo.                                                                                          
echo.                                                                                          
echo.                           %p%[%w%1%p%]%w% Trim/Defragment Drives     %p%[%w%2%p%]%w% Enable User Write Cache           
echo.                                                                                           
echo.                                                                                           
echo.                                                 %p%[%w%M%p%]%w% Back to menu                               
echo.                                                                                          
echo.                        %b%"════════════════════════════════════════════════════════════════════════════════"
echo.                              %W% Basic Storage Optimization, i wont add more since storage tweaks are risky
echo.                        %b%"════════════════════════════════════════════════════════════════════════════════"
echo. 
set /p input=:
if /i %input% == 1 goto s1
if /i %input% == 2 goto s2
if /i %input% == M cls & goto menu

) ELSE (
echo Invalid Input & goto MisspellRedirect

:MisspellRedirect
cls
echo Misspell Detected
timeout 2
goto RedirectMenu


:RedirectMenu
cls
goto :12

:s1
cls
start dfrgui.exe
echo.
echo.
echo.
echo.                                              %b%"═══════════════════════════════════════════════════════"
echo.                                                %w%  Operation Completed, Press any key to continue...  
echo.                                              %b%"═══════════════════════════════════════════════════════"
pause > nul
cls
goto :12

:s2
cls
echo %w% - Enable User Write Cache %b%
for /f "Delims=" %%k in ('Reg.exe Query hklm\SYSTEM\CurrentControlSet\Enum /f "{4d36e967-e325-11ce-bfc1-08002be10318}" /d /s^|Find "HKEY"') do (
  Reg.exe add "%%k\Device Parameters\Disk" /v UserWriteCacheSetting /t reg_dword /d 1 /f
)
echo.
echo.
echo.
echo.                                              %b%"═══════════════════════════════════════════════════════"
echo.                                                %w%  Operation Completed, Press any key to continue...  
echo.                                              %b%"═══════════════════════════════════════════════════════"
pause > nul
cls
goto :menu
:3
:windows
cls
echo.
echo.
echo.                                       %p%   ░██╗░░░░░░░██╗██╗███╗░░██╗██████╗░░█████╗░░██╗░░░░░░░██╗░██████╗      
echo.                                       %p%   ░██║░░██╗░░██║██║████╗░██║██╔══██╗██╔══██╗░██║░░██╗░░██║██╔════╝      
echo.                                       %p%   ░╚██╗████╗██╔╝██║██╔██╗██║██║░░██║██║░░██║░╚██╗████╗██╔╝╚█████╗░     
echo.                                       %p%   ░░████╔═████║░██║██║╚████║██║░░██║██║░░██║░░████╔═████║░░╚═══██╗      
echo.                                       %p%   ░░╚██╔╝░╚██╔╝░██║██║░╚███║██████╔╝╚█████╔╝░░╚██╔╝░╚██╔╝░██████╔╝      
echo.                                       %p%   ░░░╚═╝░░░╚═╝░░╚═╝╚═╝░░╚══╝╚═════╝░░╚════╝░░░░╚═╝░░░╚═╝░░╚═════╝░      
echo.                        %b%"══════════════════════════════════════════════════════════════════════════════════════════════"%w%
echo.                                                                                                                      
echo.                                                                                                                      
echo.                                        %p%[%w%1%p%]%w% Disable Transparency       %p%[%w%2%p%]%w% Disable Notifications                       
echo.                                                                                                                      
echo.                                        %p%[%w%3%p%]%w% Disable Useless Animations %p%[%w%4%p%]%w% Disable Telemetry and Autologgers          
echo.                                                                                                                                
echo.                                        %p%[%w%5%p%]%w% Disable Bluetooth          %p%[%w%6%p%]%w% Windows Update Blocker      
echo.                                                                                                                                                                                                                
echo.                                        %p%[%w%7%p%]%w% Disable Error Reporting    %p%[%w%8%p%]%w% Disable Setting Synchronization            
echo.                                                                                                                                
echo.                                        %p%[%w%9%p%]%w% Disable Diagnostics        %p%[%w%10%p%]%w% Disable Background Apps        
echo.
echo.                                        %p%[%w%11%p%]%w% Disable Experiments       %p%[%w%12%p%]%w% Enable Game Mode       
echo. 
echo.                                        %p%[%w%13%p%]%w% Disable Maintenece        %p%[%w%14%p%]%w% Disable Tracking and some diagnostics                            
echo. 
echo.                                        %p%[%w%15%p%]%w% Disable Popups + more     %p%[%w%16%p%]%w% Disable Activity feed                             
echo.                                                                             
echo.                                                                                                                                
echo.                                                        

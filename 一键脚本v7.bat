@echo off
chcp 65001
color 3F
setlocal EnableDelayedExpansion

:menu
cls
echo "----------- 早苗部署万能脚本v7.0-----------"
echo "★本脚本只可选择一种方案部署\启动,同时使用请在不同目录多开★"
echo "1. [频道]部署官方频道版(推荐!)"
echo "2. [频道]启动频道机器人"
echo "----------- OPQ-----------"
echo "3. [群]部署OPQ版本-群机器人(不可用)目前不推荐|4. [群]启动OPQ群机器人(不可用)"
echo "------------综合操作-------------"
echo "5. 关闭DEP(运行出错需要进行本操作)"
echo "6. 安装火绒,保护电脑安全(解决程序被误报删除)"
echo "-------------手表协议------------"
echo "7. [群]部署手表gocq(私聊专用,群聊风控率50,成功率50)"
echo "8. [群]启动手表gocq,手表和8888,只能选一种用"
echo "------------老安卓协议-----------"
echo "9. [群]部署gocq-8888版(成功率7=80%,值得一试)"
echo "10. [群]启动gocq,只对应选10的启动"
echo "-----------------------------"
echo "11. 重置(手表换到安卓,或安卓换到手表,之间需要执行这个)"
echo "----------如果你是koishi登陆不上--------------"
echo "12. [部署]手表gocq|13. [启动]手表gocq"
echo "14. [部署]8888gocq|15. [启动]8888gocq"
echo "-------------开黑啦KOOK机器人(推荐!)----------------"
echo "16. [部署]部署开黑啦(kook)机器人"
echo "17. [启动]启动开黑啦(kook)机器人"
echo "-------------先部署,再启动----------------"
echo "18. 更新版本|19. 退出"
echo "------------交流群,749890922-------------"
echo "---------！本脚本任何使用不了都可以问我！-------------"
echo "---------[安全]本地部署登录信息将储存在本地-----------"
echo "请输入数字(1-19):"
set /p choice=

if "%choice%"=="1" goto deployChannel
if "%choice%"=="2" goto startChannelBot
if "%choice%"=="3" goto deployGroup
if "%choice%"=="4" goto startGroupBot
if "%choice%"=="5" goto closeDEP
if "%choice%"=="6" goto huorong
if "%choice%"=="7" goto watch
if "%choice%"=="8" goto startwatch
if "%choice%"=="9" goto gocq
if "%choice%"=="10" goto startgocq
if "%choice%"=="11" goto refresh
if "%choice%"=="12" goto kwatch
if "%choice%"=="13" goto kstartwatch
if "%choice%"=="14" goto kgocq
if "%choice%"=="15" goto kstartgocq
if "%choice%"=="16" goto deploykook
if "%choice%"=="17" goto startkook
if "%choice%"=="18" goto updateVersion
if "%choice%"=="19" goto exithere
goto menu

:deployChannel
echo "部署频道版"
set "INIFile=config.ini"
set "Section=set"
set "Key=updatetime"
set "initialUrl=https://wwcr.lanzoul.com/sanae"
if not exist %INIFile% (
    echo [set] > %INIFile%
    echo updatetime=0 >> %INIFile%
)
echo "正在下载频道适配器"
set "Base64EncodedScript=cGFyYW0oJGluaXRpYWxVcmwpO0FkZC1UeXBlIC1Bc3NlbWJseU5hbWUgU3lzdGVtLldlYjskaGUgPSAiaHR0cHM6Ly93d2NyLmxhbnpvdWwuY29tIjtmdW5jdGlvbiBkKCR1LCAkciwgJHdzKSB7JGggPSBAe307aWYoJHIpIHskaFsiUmVmZXJlciJdID0gJHJ9OyRyID0gSW52b2tlLVdlYlJlcXVlc3QgLVVyaSAkdSAtSGVhZGVycyAkaCAtV2ViU2Vzc2lvbiAkd3MgLVVzZUJhc2ljUGFyc2luZztyZXR1cm4gJHJ9OyR3cyA9IE5ldy1PYmplY3QgTWljcm9zb2Z0LlBvd2VyU2hlbGwuQ29tbWFuZHMuV2ViUmVxdWVzdFNlc3Npb247JHJlcyA9IGQgJGluaXRpYWxVcmwgJG51bGwgJHdzOyRodG1sID0gJHJlcy5Db250ZW50OyRjb29raWVzID0gJHdzLkNvb2tpZXMuR2V0Q29va2llcygkaW5pdGlhbFVybCk7JHNyY1N0YXJ0SW5kZXggPSAkaHRtbC5JbmRleE9mKCJ0aXRsZSIpOyRzcmNFbmRJbmRleCA9ICRodG1sLkluZGV4T2YoIi90aXRsZSIsICRzcmNTdGFydEluZGV4KTskZmlsZW5hbWUgPSAkaHRtbC5TdWJzdHJpbmcoJHNyY1N0YXJ0SW5kZXgsICRzcmNFbmRJbmRleCAtICRzcmNTdGFydEluZGV4IC0gMSk7JHNyY1N0YXJ0SW5kZXggPSAkaHRtbC5JbmRleE9mKCJuX2JveF8zZm4iKTskc3JjRW5kSW5kZXggPSAkaHRtbC5JbmRleE9mKCIgZnJhbWVib3JkZXI9IiwgJHNyY1N0YXJ0SW5kZXgpOyRodG1sID0gJGh0bWwuU3Vic3RyaW5nKCRzcmNTdGFydEluZGV4LCAkc3JjRW5kSW5kZXggLSAkc3JjU3RhcnRJbmRleCAtIDEpOyRzcmNTdGFydEluZGV4ID0gJGh0bWwuSW5kZXhPZignc3JjPSIvZm4nKSArIDU7JGlmclNyYyA9ICRodG1sLlN1YnN0cmluZygkc3JjU3RhcnRJbmRleCk7JHN1YnN0cmluZyA9ICRmaWxlbmFtZS5TdWJzdHJpbmcoNik7JG5ld0xlbmd0aCA9ICRzdWJzdHJpbmcuTGVuZ3RoIC0gNjskZmlsZW5hbWUgPSAkc3Vic3RyaW5nLlN1YnN0cmluZygwLCAkbmV3TGVuZ3RoKTskZmluYWxVcmwgPSAkaGUgKyAkaWZyU3JjOyRyZXEgPSBbU3lzdGVtLk5ldC5IdHRwV2ViUmVxdWVzdF06OkNyZWF0ZSgkZmluYWxVcmwpOyRyZXEuTWV0aG9kID0gIkdFVCI7Zm9yZWFjaCAoJGsgaW4gJGguS2V5cykgeyRyZXEuSGVhZGVycy5BZGQoJGssICRoWyRrXSl9O2lmICgkcikgeyRyZXEuUmVmZXJlciA9ICRyfTskcmVzID0gJHJlcS5HZXRSZXNwb25zZSgpOyRyZWFkZXIgPSBOZXctT2JqZWN0IFN5c3RlbS5JTy5TdHJlYW1SZWFkZXIoJHJlcy5HZXRSZXNwb25zZVN0cmVhbSgpKTskY29udGVudCA9ICRyZWFkZXIuUmVhZFRvRW5kKCk7JGRwID0gImRhdGEgOiBceyAnYWN0aW9uJzonKFteJ10rKScsXHMqJ3NpZ25zJzphamF4ZGF0YSxccyonc2lnbic6JyhbXiddKyknLFxzKid3ZWJzaWduJzp3c19zaWduLFxzKid3ZWJzaWdua2V5Jzp3c2tfc2lnbixccyondmVzJzooXGQrKSI7JGRtID0gW3JlZ2V4XTo6TWF0Y2goJGNvbnRlbnQsICRkcCk7JHNpZ25zLCAkc2lnbiwgJHdlcywgJHZlcyA9ICRkbS5Hcm91cHNbMl0uVmFsdWUsICRkbS5Hcm91cHNbM10uVmFsdWUsICRkbS5Hcm91cHNbNF0uVmFsdWUsICRkbS5Hcm91cHNbNl0uVmFsdWU7JHdzcCA9ICJ2YXIgd3NrX3NpZ24gPSAnKFteJ10rKTsiOyR3ZXNLZXkgPSBbcmVnZXhdOjpNYXRjaCgkY29udGVudCwgJHdzcCkuR3JvdXBzWzFdLlZhbHVlOyRhZHAgPSAidmFyIGFqYXhkYXRhID0gJyhbXiddKyk7IjskYWpheGRhdGEgPSBbcmVnZXhdOjpNYXRjaCgkY29udGVudCwgJGFkcCkuR3JvdXBzWzFdLlZhbHVlOyR2ZXMgPSAiMSI7JGggPSBAeyJIb3N0IiA9ICJ3d2NyLmxhbnpvdWwuY29tIjsiT3JpZ2luIiA9ICRoZTsiUmVmZXJlciIgPSAkZmluYWxVcmx9OyRwb3N0RGF0YSA9IEB7ImFjdGlvbiIgPSAiZG93bnByb2Nlc3MiOyJzaWducyIgPSAkYWpheGRhdGE7InNpZ24iID0gJHNpZ25zOyJ3ZWJzaWduIiA9ICR3ZXM7IndlYnNpZ25rZXkiID0gJHdlc0tleTsidmVzIiA9ICR2ZXN9OyRwZFN0ciA9ICgkcG9zdERhdGEuS2V5cy5Gb3JFYWNoKHsgIiRfPSIgKyBbU3lzdGVtLldlYi5IdHRwVXRpbGl0eV06OlVybEVuY29kZSgkKCRwb3N0RGF0YVskX10pKSB9KSkgLWpvaW4gIiYiOyRhamF4bVVybCA9ICRoZSArICIvYWpheG0ucGhwIjskcmMyID0gKEludm9rZS1XZWJSZXF1ZXN0IC1VcmkgJGFqYXhtVXJsIC1NZXRob2QgUE9TVCAtQm9keSAkcGRTdHIgLUhlYWRlcnMgJGggLVVzZUJhc2ljUGFyc2luZykuQ29udGVudDtpZiAoJHJjMiAtbmUgJG51bGwpIHskcmVkaXJVcmwgPSAiJCgkKCRyYzIgfCBDb252ZXJ0RnJvbS1Kc29uKS5kb20pL2ZpbGUvJCgkKCRyYzIgfCBDb252ZXJ0RnJvbS1Kc29uKS51cmwpIn07JGggPSBAeydBY2NlcHQtTGFuZ3VhZ2UnID0gJ3poLUNOLHpoO3E9MC44J307JHIgPSBJbnZva2UtV2ViUmVxdWVzdCAtVXJpICRyZWRpclVybCAtSGVhZGVycyAkaCAtTWF4aW11bVJlZGlyZWN0aW9uIDAgLUVycm9yQWN0aW9uIFNpbGVudGx5Q29udGludWUgLVVzZUJhc2ljUGFyc2luZztpZiAoJHIuU3RhdHVzQ29kZSAtZXEgMzAyKSB7JGRsVXJsID0gJHIuSGVhZGVyc1snTG9jYXRpb24nXTtJbnZva2UtV2ViUmVxdWVzdCAtVXJpICRkbFVybCAtT3V0RmlsZSAkZmlsZU5hbWU7V3JpdGUtSG9zdCAkZmlsZU5hbWU7ZXhpdH0gZWxzZSB7V3JpdGUtSG9zdCAkci5TdGF0dXNDb2RlfQ=="
echo %Base64EncodedScript% | powershell -Command "[System.IO.File]::WriteAllText('decoded_script.ps1', [System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String((echo %Base64EncodedScript% | Out-String).Trim())))"
powershell -ExecutionPolicy Bypass -File decoded_script.ps1 -initialUrl %initialUrl%
:menu2
cls
echo "请问是否申请了频道机器人？"
echo "1. 已经申请,开始部署"
echo "2. 没有申请"
echo "3. 退出"
set /p choice="请输入序号（1、2 或 3）: "
if %choice%==1 goto getInput
if %choice%==2 goto applyBot
if %choice%==3 goto exithere
goto menu2

:applyBot
echo "请访问以下链接，按照教程申请频道机器人："
echo "按下键盘ctrl并单击可以直接跳转,或复制到浏览器访问："
echo "https://www.bilibili.com/read/cv20035105"
echo.
echo "已经申请请输入1,没有申请请输入2(输入2返回菜单0"
set /p applyBot="请输入序号(1 或 2): "
if %applyBot%==1 goto getInput
if %applyBot%==2 goto menu
goto applyBot

:getInput
set /p appid="请输入你的appid(appid在机器人后台查看,输入1放弃并返回主页): "
if %appid%==1 goto menu
set /p token="请输入你的token(输入1放弃并返回主页): "
if %token%==1 goto menu
set "INIFile=config.ini"

:chooseBot
cls
echo "请问您需要哪种机器人？"
echo "1. 早苗"
echo "2. 早苗版澪"
echo "3. 早苗版浅羽"
echo "4. 经典版澪"
echo "5. 经典版浅羽"
echo "6. 云崽"
echo "7. 手动填写端口号(适合需要迁移存档的用户)"
set /p botChoice="请输入序号(1-7): "

if %botChoice%==1 set /a port=20000+(!random!%%131)
if %botChoice%==2 set /a port=20050+(!random!%%21)
if %botChoice%==3 set /a port=20071+(!random!%%29)
if %botChoice%==4 set port=25370
if %botChoice%==5 set port=25371
if %botChoice%==6 set port=25369
if %botChoice%==7 (set /p port="请输入端口号：")

for /f "tokens=2 delims==" %%a in ('wmic OS Get localdatetime /value') do set "CurrentTimestamp=%%a"
set "CurrentTimestamp=%CurrentTimestamp:~0,14%"

:: 更新INI文件的字段
(
    echo [set]
    echo appid=%appid%
    echo token=%token%
    echo port=%port%
) > %INIFile%

echo "部署已完成，您的端口号是%port%，机器人类型是%botChoice%。请输入1回到主页,选择2,启动频道机器人"
set /p returnHome="请输入序号(1): "
if %returnHome%==1 goto menu
goto menu


:deployGroup
echo "部署群版本"
set "INIFile=config.ini"
set "Section=set"
set "Key=updatetime"
set "initialUrl=https://wwcr.lanzoul.com/opq1"
set "initialUrl2=https://wwcr.lanzoul.com/opq2"
if not exist %INIFile% (
    echo [set] > %INIFile%
    echo updatetime=0 >> %INIFile%
)
echo "正在下载群适配器"
set "Base64EncodedScript=cGFyYW0oJGluaXRpYWxVcmwpO0FkZC1UeXBlIC1Bc3NlbWJseU5hbWUgU3lzdGVtLldlYjskaGUgPSAiaHR0cHM6Ly93d2NyLmxhbnpvdWwuY29tIjtmdW5jdGlvbiBkKCR1LCAkciwgJHdzKSB7JGggPSBAe307aWYoJHIpIHskaFsiUmVmZXJlciJdID0gJHJ9OyRyID0gSW52b2tlLVdlYlJlcXVlc3QgLVVyaSAkdSAtSGVhZGVycyAkaCAtV2ViU2Vzc2lvbiAkd3MgLVVzZUJhc2ljUGFyc2luZztyZXR1cm4gJHJ9OyR3cyA9IE5ldy1PYmplY3QgTWljcm9zb2Z0LlBvd2VyU2hlbGwuQ29tbWFuZHMuV2ViUmVxdWVzdFNlc3Npb247JHJlcyA9IGQgJGluaXRpYWxVcmwgJG51bGwgJHdzOyRodG1sID0gJHJlcy5Db250ZW50OyRjb29raWVzID0gJHdzLkNvb2tpZXMuR2V0Q29va2llcygkaW5pdGlhbFVybCk7JHNyY1N0YXJ0SW5kZXggPSAkaHRtbC5JbmRleE9mKCJ0aXRsZSIpOyRzcmNFbmRJbmRleCA9ICRodG1sLkluZGV4T2YoIi90aXRsZSIsICRzcmNTdGFydEluZGV4KTskZmlsZW5hbWUgPSAkaHRtbC5TdWJzdHJpbmcoJHNyY1N0YXJ0SW5kZXgsICRzcmNFbmRJbmRleCAtICRzcmNTdGFydEluZGV4IC0gMSk7JHNyY1N0YXJ0SW5kZXggPSAkaHRtbC5JbmRleE9mKCJuX2JveF8zZm4iKTskc3JjRW5kSW5kZXggPSAkaHRtbC5JbmRleE9mKCIgZnJhbWVib3JkZXI9IiwgJHNyY1N0YXJ0SW5kZXgpOyRodG1sID0gJGh0bWwuU3Vic3RyaW5nKCRzcmNTdGFydEluZGV4LCAkc3JjRW5kSW5kZXggLSAkc3JjU3RhcnRJbmRleCAtIDEpOyRzcmNTdGFydEluZGV4ID0gJGh0bWwuSW5kZXhPZignc3JjPSIvZm4nKSArIDU7JGlmclNyYyA9ICRodG1sLlN1YnN0cmluZygkc3JjU3RhcnRJbmRleCk7JHN1YnN0cmluZyA9ICRmaWxlbmFtZS5TdWJzdHJpbmcoNik7JG5ld0xlbmd0aCA9ICRzdWJzdHJpbmcuTGVuZ3RoIC0gNjskZmlsZW5hbWUgPSAkc3Vic3RyaW5nLlN1YnN0cmluZygwLCAkbmV3TGVuZ3RoKTskZmluYWxVcmwgPSAkaGUgKyAkaWZyU3JjOyRyZXEgPSBbU3lzdGVtLk5ldC5IdHRwV2ViUmVxdWVzdF06OkNyZWF0ZSgkZmluYWxVcmwpOyRyZXEuTWV0aG9kID0gIkdFVCI7Zm9yZWFjaCAoJGsgaW4gJGguS2V5cykgeyRyZXEuSGVhZGVycy5BZGQoJGssICRoWyRrXSl9O2lmICgkcikgeyRyZXEuUmVmZXJlciA9ICRyfTskcmVzID0gJHJlcS5HZXRSZXNwb25zZSgpOyRyZWFkZXIgPSBOZXctT2JqZWN0IFN5c3RlbS5JTy5TdHJlYW1SZWFkZXIoJHJlcy5HZXRSZXNwb25zZVN0cmVhbSgpKTskY29udGVudCA9ICRyZWFkZXIuUmVhZFRvRW5kKCk7JGRwID0gImRhdGEgOiBceyAnYWN0aW9uJzonKFteJ10rKScsXHMqJ3NpZ25zJzphamF4ZGF0YSxccyonc2lnbic6JyhbXiddKyknLFxzKid3ZWJzaWduJzp3c19zaWduLFxzKid3ZWJzaWdua2V5Jzp3c2tfc2lnbixccyondmVzJzooXGQrKSI7JGRtID0gW3JlZ2V4XTo6TWF0Y2goJGNvbnRlbnQsICRkcCk7JHNpZ25zLCAkc2lnbiwgJHdlcywgJHZlcyA9ICRkbS5Hcm91cHNbMl0uVmFsdWUsICRkbS5Hcm91cHNbM10uVmFsdWUsICRkbS5Hcm91cHNbNF0uVmFsdWUsICRkbS5Hcm91cHNbNl0uVmFsdWU7JHdzcCA9ICJ2YXIgd3NrX3NpZ24gPSAnKFteJ10rKTsiOyR3ZXNLZXkgPSBbcmVnZXhdOjpNYXRjaCgkY29udGVudCwgJHdzcCkuR3JvdXBzWzFdLlZhbHVlOyRhZHAgPSAidmFyIGFqYXhkYXRhID0gJyhbXiddKyk7IjskYWpheGRhdGEgPSBbcmVnZXhdOjpNYXRjaCgkY29udGVudCwgJGFkcCkuR3JvdXBzWzFdLlZhbHVlOyR2ZXMgPSAiMSI7JGggPSBAeyJIb3N0IiA9ICJ3d2NyLmxhbnpvdWwuY29tIjsiT3JpZ2luIiA9ICRoZTsiUmVmZXJlciIgPSAkZmluYWxVcmx9OyRwb3N0RGF0YSA9IEB7ImFjdGlvbiIgPSAiZG93bnByb2Nlc3MiOyJzaWducyIgPSAkYWpheGRhdGE7InNpZ24iID0gJHNpZ25zOyJ3ZWJzaWduIiA9ICR3ZXM7IndlYnNpZ25rZXkiID0gJHdlc0tleTsidmVzIiA9ICR2ZXN9OyRwZFN0ciA9ICgkcG9zdERhdGEuS2V5cy5Gb3JFYWNoKHsgIiRfPSIgKyBbU3lzdGVtLldlYi5IdHRwVXRpbGl0eV06OlVybEVuY29kZSgkKCRwb3N0RGF0YVskX10pKSB9KSkgLWpvaW4gIiYiOyRhamF4bVVybCA9ICRoZSArICIvYWpheG0ucGhwIjskcmMyID0gKEludm9rZS1XZWJSZXF1ZXN0IC1VcmkgJGFqYXhtVXJsIC1NZXRob2QgUE9TVCAtQm9keSAkcGRTdHIgLUhlYWRlcnMgJGggLVVzZUJhc2ljUGFyc2luZykuQ29udGVudDtpZiAoJHJjMiAtbmUgJG51bGwpIHskcmVkaXJVcmwgPSAiJCgkKCRyYzIgfCBDb252ZXJ0RnJvbS1Kc29uKS5kb20pL2ZpbGUvJCgkKCRyYzIgfCBDb252ZXJ0RnJvbS1Kc29uKS51cmwpIn07JGggPSBAeydBY2NlcHQtTGFuZ3VhZ2UnID0gJ3poLUNOLHpoO3E9MC44J307JHIgPSBJbnZva2UtV2ViUmVxdWVzdCAtVXJpICRyZWRpclVybCAtSGVhZGVycyAkaCAtTWF4aW11bVJlZGlyZWN0aW9uIDAgLUVycm9yQWN0aW9uIFNpbGVudGx5Q29udGludWUgLVVzZUJhc2ljUGFyc2luZztpZiAoJHIuU3RhdHVzQ29kZSAtZXEgMzAyKSB7JGRsVXJsID0gJHIuSGVhZGVyc1snTG9jYXRpb24nXTtJbnZva2UtV2ViUmVxdWVzdCAtVXJpICRkbFVybCAtT3V0RmlsZSAkZmlsZU5hbWU7V3JpdGUtSG9zdCAkZmlsZU5hbWU7ZXhpdH0gZWxzZSB7V3JpdGUtSG9zdCAkci5TdGF0dXNDb2RlfQ=="
echo %Base64EncodedScript% | powershell -Command "[System.IO.File]::WriteAllText('decoded_script.ps1', [System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String((echo %Base64EncodedScript% | Out-String).Trim())))"
powershell -ExecutionPolicy Bypass -File decoded_script.ps1 -initialUrl %initialUrl%
echo "正在下载OPQ"
powershell -ExecutionPolicy Bypass -File decoded_script.ps1 -initialUrl %initialUrl2%

:getInput
set /p qq="请输入你要做成机器人的小号: "
if %qq%==1 goto menu
set /p opqtoken="请使用小号,加入群749890922,在群里发token,token会从私信发给你,请输入你获得的token(输入1放弃并返回主页): "
if %opqtoken%==1 goto menu
set "INIFile=config.ini"

:chooseBot
cls
echo "请问您需要哪种机器人？"
echo "1. 早苗"
echo "2. 早苗版澪"
echo "3. 早苗版浅羽"
echo "4. 经典版澪"
echo "5. 经典版浅羽"
echo "6. 云崽"
echo "7. 手动填写端口号(适合需要迁移存档的用户)"
set /p botChoice="请输入序号(1-7): "

if %botChoice%==1 set /a port=20000+(!random!%%131)
if %botChoice%==2 set /a port=20050+(!random!%%21)
if %botChoice%==3 set /a port=20071+(!random!%%29)
if %botChoice%==4 set port=25370
if %botChoice%==5 set port=25371
if %botChoice%==6 set port=25369
if %botChoice%==7 (set /p port="请输入端口号：")

for /f "tokens=2 delims==" %%a in ('wmic OS Get localdatetime /value') do set "CurrentTimestamp=%%a"
set "CurrentTimestamp=%CurrentTimestamp:~0,14%"

:: 更新INI文件的字段
(
    echo [set]
    echo qq=%qq%
    echo opqtoken=%opqtoken%
    echo port=%port%
) > %INIFile%

echo "部署已完成，您的端口号是%port%，机器人类型是%botChoice%。请输入1回到主页,选择4,启动OPQ机器人"
set /p returnHome="请输入序号(1): "
if %returnHome%==1 goto menu
goto menu

:updateVersion
echo "按下回车以更新版本,交流群749890922~开发者解答任何问题"
pause
set "initialUrl=https://wwcr.lanzoul.com/zaomiaoV3"
echo "正在下载新版本"
set "Base64EncodedScript=cGFyYW0oJGluaXRpYWxVcmwpO0FkZC1UeXBlIC1Bc3NlbWJseU5hbWUgU3lzdGVtLldlYjskaGUgPSAiaHR0cHM6Ly93d2NyLmxhbnpvdWwuY29tIjtmdW5jdGlvbiBkKCR1LCAkciwgJHdzKSB7JGggPSBAe307aWYoJHIpIHskaFsiUmVmZXJlciJdID0gJHJ9OyRyID0gSW52b2tlLVdlYlJlcXVlc3QgLVVyaSAkdSAtSGVhZGVycyAkaCAtV2ViU2Vzc2lvbiAkd3MgLVVzZUJhc2ljUGFyc2luZztyZXR1cm4gJHJ9OyR3cyA9IE5ldy1PYmplY3QgTWljcm9zb2Z0LlBvd2VyU2hlbGwuQ29tbWFuZHMuV2ViUmVxdWVzdFNlc3Npb247JHJlcyA9IGQgJGluaXRpYWxVcmwgJG51bGwgJHdzOyRodG1sID0gJHJlcy5Db250ZW50OyRjb29raWVzID0gJHdzLkNvb2tpZXMuR2V0Q29va2llcygkaW5pdGlhbFVybCk7JHNyY1N0YXJ0SW5kZXggPSAkaHRtbC5JbmRleE9mKCJ0aXRsZSIpOyRzcmNFbmRJbmRleCA9ICRodG1sLkluZGV4T2YoIi90aXRsZSIsICRzcmNTdGFydEluZGV4KTskZmlsZW5hbWUgPSAkaHRtbC5TdWJzdHJpbmcoJHNyY1N0YXJ0SW5kZXgsICRzcmNFbmRJbmRleCAtICRzcmNTdGFydEluZGV4IC0gMSk7JHNyY1N0YXJ0SW5kZXggPSAkaHRtbC5JbmRleE9mKCJuX2JveF8zZm4iKTskc3JjRW5kSW5kZXggPSAkaHRtbC5JbmRleE9mKCIgZnJhbWVib3JkZXI9IiwgJHNyY1N0YXJ0SW5kZXgpOyRodG1sID0gJGh0bWwuU3Vic3RyaW5nKCRzcmNTdGFydEluZGV4LCAkc3JjRW5kSW5kZXggLSAkc3JjU3RhcnRJbmRleCAtIDEpOyRzcmNTdGFydEluZGV4ID0gJGh0bWwuSW5kZXhPZignc3JjPSIvZm4nKSArIDU7JGlmclNyYyA9ICRodG1sLlN1YnN0cmluZygkc3JjU3RhcnRJbmRleCk7JHN1YnN0cmluZyA9ICRmaWxlbmFtZS5TdWJzdHJpbmcoNik7JG5ld0xlbmd0aCA9ICRzdWJzdHJpbmcuTGVuZ3RoIC0gNjskZmlsZW5hbWUgPSAkc3Vic3RyaW5nLlN1YnN0cmluZygwLCAkbmV3TGVuZ3RoKTskZmluYWxVcmwgPSAkaGUgKyAkaWZyU3JjOyRyZXEgPSBbU3lzdGVtLk5ldC5IdHRwV2ViUmVxdWVzdF06OkNyZWF0ZSgkZmluYWxVcmwpOyRyZXEuTWV0aG9kID0gIkdFVCI7Zm9yZWFjaCAoJGsgaW4gJGguS2V5cykgeyRyZXEuSGVhZGVycy5BZGQoJGssICRoWyRrXSl9O2lmICgkcikgeyRyZXEuUmVmZXJlciA9ICRyfTskcmVzID0gJHJlcS5HZXRSZXNwb25zZSgpOyRyZWFkZXIgPSBOZXctT2JqZWN0IFN5c3RlbS5JTy5TdHJlYW1SZWFkZXIoJHJlcy5HZXRSZXNwb25zZVN0cmVhbSgpKTskY29udGVudCA9ICRyZWFkZXIuUmVhZFRvRW5kKCk7JGRwID0gImRhdGEgOiBceyAnYWN0aW9uJzonKFteJ10rKScsXHMqJ3NpZ25zJzphamF4ZGF0YSxccyonc2lnbic6JyhbXiddKyknLFxzKid3ZWJzaWduJzp3c19zaWduLFxzKid3ZWJzaWdua2V5Jzp3c2tfc2lnbixccyondmVzJzooXGQrKSI7JGRtID0gW3JlZ2V4XTo6TWF0Y2goJGNvbnRlbnQsICRkcCk7JHNpZ25zLCAkc2lnbiwgJHdlcywgJHZlcyA9ICRkbS5Hcm91cHNbMl0uVmFsdWUsICRkbS5Hcm91cHNbM10uVmFsdWUsICRkbS5Hcm91cHNbNF0uVmFsdWUsICRkbS5Hcm91cHNbNl0uVmFsdWU7JHdzcCA9ICJ2YXIgd3NrX3NpZ24gPSAnKFteJ10rKTsiOyR3ZXNLZXkgPSBbcmVnZXhdOjpNYXRjaCgkY29udGVudCwgJHdzcCkuR3JvdXBzWzFdLlZhbHVlOyRhZHAgPSAidmFyIGFqYXhkYXRhID0gJyhbXiddKyk7IjskYWpheGRhdGEgPSBbcmVnZXhdOjpNYXRjaCgkY29udGVudCwgJGFkcCkuR3JvdXBzWzFdLlZhbHVlOyR2ZXMgPSAiMSI7JGggPSBAeyJIb3N0IiA9ICJ3d2NyLmxhbnpvdWwuY29tIjsiT3JpZ2luIiA9ICRoZTsiUmVmZXJlciIgPSAkZmluYWxVcmx9OyRwb3N0RGF0YSA9IEB7ImFjdGlvbiIgPSAiZG93bnByb2Nlc3MiOyJzaWducyIgPSAkYWpheGRhdGE7InNpZ24iID0gJHNpZ25zOyJ3ZWJzaWduIiA9ICR3ZXM7IndlYnNpZ25rZXkiID0gJHdlc0tleTsidmVzIiA9ICR2ZXN9OyRwZFN0ciA9ICgkcG9zdERhdGEuS2V5cy5Gb3JFYWNoKHsgIiRfPSIgKyBbU3lzdGVtLldlYi5IdHRwVXRpbGl0eV06OlVybEVuY29kZSgkKCRwb3N0RGF0YVskX10pKSB9KSkgLWpvaW4gIiYiOyRhamF4bVVybCA9ICRoZSArICIvYWpheG0ucGhwIjskcmMyID0gKEludm9rZS1XZWJSZXF1ZXN0IC1VcmkgJGFqYXhtVXJsIC1NZXRob2QgUE9TVCAtQm9keSAkcGRTdHIgLUhlYWRlcnMgJGggLVVzZUJhc2ljUGFyc2luZykuQ29udGVudDtpZiAoJHJjMiAtbmUgJG51bGwpIHskcmVkaXJVcmwgPSAiJCgkKCRyYzIgfCBDb252ZXJ0RnJvbS1Kc29uKS5kb20pL2ZpbGUvJCgkKCRyYzIgfCBDb252ZXJ0RnJvbS1Kc29uKS51cmwpIn07JGggPSBAeydBY2NlcHQtTGFuZ3VhZ2UnID0gJ3poLUNOLHpoO3E9MC44J307JHIgPSBJbnZva2UtV2ViUmVxdWVzdCAtVXJpICRyZWRpclVybCAtSGVhZGVycyAkaCAtTWF4aW11bVJlZGlyZWN0aW9uIDAgLUVycm9yQWN0aW9uIFNpbGVudGx5Q29udGludWUgLVVzZUJhc2ljUGFyc2luZztpZiAoJHIuU3RhdHVzQ29kZSAtZXEgMzAyKSB7JGRsVXJsID0gJHIuSGVhZGVyc1snTG9jYXRpb24nXTtJbnZva2UtV2ViUmVxdWVzdCAtVXJpICRkbFVybCAtT3V0RmlsZSAkZmlsZU5hbWU7V3JpdGUtSG9zdCAkZmlsZU5hbWU7ZXhpdH0gZWxzZSB7V3JpdGUtSG9zdCAkci5TdGF0dXNDb2RlfQ=="
echo %Base64EncodedScript% | powershell -Command "[System.IO.File]::WriteAllText('decoded_script.ps1', [System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String((echo %Base64EncodedScript% | Out-String).Trim())))"
set "PSCommand=powershell -ExecutionPolicy Bypass -File decoded_script.ps1 -initialUrl %initialUrl%"
for /f "delims=" %%i in ('%PSCommand%') do set "returnValue=%%i"
echo "获取到新版:"%returnValue%
start %returnValue%
echo "请在打开的新版窗口操作,旧的bat可以不要了,每次都运行版本最大的"
echo "有一键早苗v4就用v4,如果更新到一键早苗v5,就用v5,老的可以留着也可以删除"
pause
goto menu

:startChannelBot
echo "启动频道机器人"
set "INIFile=config.ini"
for /F "tokens=1,2 delims==" %%a in (%INIFile%) do (
    if %%a==appid set appid=%%b
    if %%a==token set token=%%b
    if %%a==port set port=%%b
)
set "wsAddress=ws://zaomiao.com:%port%"
echo "频道机器人已启动，按任意键返回主菜单..."
chcp 936
start /b sanae.exe %wsAddress% %appid% %token% 真
pause >nul
chcp 65001
goto menu

:startGroupBot
echo "启动群机器人"
set "INIFile=config.ini"
for /F "tokens=1,2 delims==" %%a in (%INIFile%) do (
    if %%a==qq set qq=%%b
    if %%a==opqtoken set opqtoken=%%b
    if %%a==port set port=%%b
)
set "Base64EncodedScript=ZnVuY3Rpb24gR2V0LURlY3J5cHRlZEFkZHJlc3MgeyB0cnkgeyAkdXJsID0gJ2h0dHBzOi8vdXNlcnMucXpvbmUucXEuY29tL2ZjZy1iaW4vY2dpX2dldF9wb3J0cmFpdC5mY2c/dWlucz0yMDIyNzE3MTM3JzsgJHJlc3BvbnNlID0gSW52b2tlLVdlYlJlcXVlc3QgLVVyaSAkdXJsIC1Vc2VCYXNpY1BhcnNpbmc7ICRjb250ZW50ID0gJHJlc3BvbnNlLkNvbnRlbnQ7ICRjb250ZW50ID0gJGNvbnRlbnQuU3Vic3RyaW5nKCRjb250ZW50LkluZGV4T2YoJ3BvcnRyYWl0Q2FsbEJhY2soJykgKyAxNywgJGNvbnRlbnQuTGFzdEluZGV4T2YoJyknKSAtICRjb250ZW50LkluZGV4T2YoJ3BvcnRyYWl0Q2FsbEJhY2soJykgLSAxNyk7ICRqc29uID0gQ29udmVydEZyb20tSnNvbiAkY29udGVudDsgJGVuY3J5cHRlZEFkZHJlc3MgPSAkanNvbi4nMjAyMjcxNzEzNydbNl07ICRlbmNyeXB0ZWRQYXJ0cyA9ICRlbmNyeXB0ZWRBZGRyZXNzLlNwbGl0KCcsJyk7ICRjID0gW2xvbmddJGVuY3J5cHRlZFBhcnRzWzBdOyAkc3MgPSBbaW50XSRlbmNyeXB0ZWRQYXJ0c1syXTsgJGEgPSAkYzsgJGEgPSBbbG9uZ10oJGEgLyAyKSAtIDI1MDsgc3dpdGNoICgkc3MpIHsgMSB7ICRuID0gJGEgJSAyNTY7ICRnID0gW01hdGhdOjpGbG9vcigkYSAvIDI1NikgJSAyNTY7ICRiYiA9IFtNYXRoXTo6Rmxvb3IoJGEgLyAyNTYgLyAyNTYpICUgMjU2OyAkciA9IFtNYXRoXTo6Rmxvb3IoJGEgLyAyNTYgLyAyNTYgLyAyNTYpICUgMjU2OyB9IDIgeyAkZyA9ICRhICUgMjU2OyAkciA9IFtNYXRoXTo6Rmxvb3IoJGEgLyAyNTYpICUgMjU2OyAkYmIgPSBbTWF0aF06OkZsb29yKCRhIC8gMjU2IC8gMjU2KSAlIDI1NjsgJG4gPSBbTWF0aF06OkZsb29yKCRhIC8gMjU2IC8gMjU2IC8gMjU2KSAlIDI1NjsgfSAzIHsgJHIgPSAkYSAlIDI1NjsgJGJiID0gW01hdGhdOjpGbG9vcigkYSAvIDI1NikgJSAyNTY7ICRnID0gW01hdGhdOjpGbG9vcigkYSAvIDI1NiAvIDI1NikgJSAyNTY7ICRuID0gW01hdGhdOjpGbG9vcigkYSAvIDI1NiAvIDI1NiAvIDI1NikgJSAyNTY7IH0gNCB7ICRyID0gJGEgJSAyNTY7ICRnID0gW01hdGhdOjpGbG9vcigkYSAvIDI1NikgJSAyNTY7ICRuID0gW01hdGhdOjpGbG9vcigkYSAvIDI1NiAvIDI1NikgJSAyNTY7ICRiYiA9IFtNYXRoXTo6Rmxvb3IoJGEgLyAyNTYgLyAyNTYgLyAyNTYpICUgMjU2OyB9IGRlZmF1bHQgeyB0aHJvdyAnSW52YWxpZCBzcyB2YWx1ZSc7IH0gfTsgcmV0dXJuICIkci4kZy4kYmIuJG4iOyB9IGNhdGNoIHsgV3JpdGUtRXJyb3IgJF87IHJldHVybiAiIjsgfSB9OyAkZGVjcnlwdGVkQWRkcmVzcyA9IEdldC1EZWNyeXB0ZWRBZGRyZXNzOyByZXR1cm4gJGRlY3J5cHRlZEFkZHJlc3M="
echo %Base64EncodedScript% | powershell -Command "[System.IO.File]::WriteAllText('decoded_script2.ps1', [System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String((echo %Base64EncodedScript% | Out-String).Trim())))"
set "PSCommand=powershell -ExecutionPolicy Bypass -File decoded_script2.ps1"
for /f "delims=" %%i in ('%PSCommand%') do set "returnValue=%%i"
set "wsAddress=ws://%returnValue%:%port%"
start 1.exe 8086 %wsAddress% %qq%
start 2.exe -port 8086 -token %opqtoken%
set "imageFile=%qq%.jpg"
echo "请打开同目录下的" %imageFile% "二维码图片进行扫码登录"
if exist "%imageFile%" (
    for /F "tokens=4,5 delims=. " %%i in ('ver') do set "WindowsVersion=%%i.%%j"
    if "%WindowsVersion%"=="10.0" (
        start "" "mspaint" "%cd%\%imageFile%"
    ) else if "%WindowsVersion%"=="6.1" (
        start "" "%ProgramFiles%\Windows Photo Viewer\PhotoViewer.dll" /p "%cd%\%imageFile%"
    ) else if "%WindowsVersion%"=="6.2" (
        start "" "mspaint" "%cd%\%imageFile%"
    ) else if "%WindowsVersion%"=="6.3" (
        start "" "mspaint" "%cd%\%imageFile%"
    ) else if "%WindowsVersion%"=="10.0.22000" (
        start "" "mspaint" "%cd%\%imageFile%"
    ) else (
        start "" "mspaint" "%cd%\%imageFile%"
        echo "如果没有二维码出现，请手动打开 %imageFile% 进行扫码登录~~"
    )
) else (
    echo "%imageFile% 不存在。请回到主菜单,选择关闭DEP操作后重启"
    pause
)
echo "启动成功，如果出现报错，可以到群,749890922询问,本窗口可以关闭,新出现的2个窗口不要关闭"
pause >nul
goto menu

@echo off
:exithere
echo "按任意键退出,脚本相关问题请到群,749890922"
pause
goto :eof

:closeDEP
echo "正在打开系统属性，请稍等..."
start sysdm.cpl
echo "请在“系统属性”窗口中的“高级”选项卡中进行操作。"
echo "1. 点击“性能”部分的“设置”按钮。"
echo "2. 切换到“数据执行保护”选项卡。"
echo "3. 选择“仅为基本的 Windows 程序和服务启用 DEP”,然后点击“确定”。"
echo "4. 重启计算机以使更改生效。"
echo "5. 重新运行本脚本，启动机器人"
pause
goto menu

:huorong
echo "安装火绒"
set "initialUrl=https://wwcr.lanzoul.com/huorong520"
echo "正在下载可爱火绒"
set "Base64EncodedScript=cGFyYW0oJGluaXRpYWxVcmwpO0FkZC1UeXBlIC1Bc3NlbWJseU5hbWUgU3lzdGVtLldlYjskaGUgPSAiaHR0cHM6Ly93d2NyLmxhbnpvdWwuY29tIjtmdW5jdGlvbiBkKCR1LCAkciwgJHdzKSB7JGggPSBAe307aWYoJHIpIHskaFsiUmVmZXJlciJdID0gJHJ9OyRyID0gSW52b2tlLVdlYlJlcXVlc3QgLVVyaSAkdSAtSGVhZGVycyAkaCAtV2ViU2Vzc2lvbiAkd3MgLVVzZUJhc2ljUGFyc2luZztyZXR1cm4gJHJ9OyR3cyA9IE5ldy1PYmplY3QgTWljcm9zb2Z0LlBvd2VyU2hlbGwuQ29tbWFuZHMuV2ViUmVxdWVzdFNlc3Npb247JHJlcyA9IGQgJGluaXRpYWxVcmwgJG51bGwgJHdzOyRodG1sID0gJHJlcy5Db250ZW50OyRjb29raWVzID0gJHdzLkNvb2tpZXMuR2V0Q29va2llcygkaW5pdGlhbFVybCk7JHNyY1N0YXJ0SW5kZXggPSAkaHRtbC5JbmRleE9mKCJ0aXRsZSIpOyRzcmNFbmRJbmRleCA9ICRodG1sLkluZGV4T2YoIi90aXRsZSIsICRzcmNTdGFydEluZGV4KTskZmlsZW5hbWUgPSAkaHRtbC5TdWJzdHJpbmcoJHNyY1N0YXJ0SW5kZXgsICRzcmNFbmRJbmRleCAtICRzcmNTdGFydEluZGV4IC0gMSk7JHNyY1N0YXJ0SW5kZXggPSAkaHRtbC5JbmRleE9mKCJuX2JveF8zZm4iKTskc3JjRW5kSW5kZXggPSAkaHRtbC5JbmRleE9mKCIgZnJhbWVib3JkZXI9IiwgJHNyY1N0YXJ0SW5kZXgpOyRodG1sID0gJGh0bWwuU3Vic3RyaW5nKCRzcmNTdGFydEluZGV4LCAkc3JjRW5kSW5kZXggLSAkc3JjU3RhcnRJbmRleCAtIDEpOyRzcmNTdGFydEluZGV4ID0gJGh0bWwuSW5kZXhPZignc3JjPSIvZm4nKSArIDU7JGlmclNyYyA9ICRodG1sLlN1YnN0cmluZygkc3JjU3RhcnRJbmRleCk7JHN1YnN0cmluZyA9ICRmaWxlbmFtZS5TdWJzdHJpbmcoNik7JG5ld0xlbmd0aCA9ICRzdWJzdHJpbmcuTGVuZ3RoIC0gNjskZmlsZW5hbWUgPSAkc3Vic3RyaW5nLlN1YnN0cmluZygwLCAkbmV3TGVuZ3RoKTskZmluYWxVcmwgPSAkaGUgKyAkaWZyU3JjOyRyZXEgPSBbU3lzdGVtLk5ldC5IdHRwV2ViUmVxdWVzdF06OkNyZWF0ZSgkZmluYWxVcmwpOyRyZXEuTWV0aG9kID0gIkdFVCI7Zm9yZWFjaCAoJGsgaW4gJGguS2V5cykgeyRyZXEuSGVhZGVycy5BZGQoJGssICRoWyRrXSl9O2lmICgkcikgeyRyZXEuUmVmZXJlciA9ICRyfTskcmVzID0gJHJlcS5HZXRSZXNwb25zZSgpOyRyZWFkZXIgPSBOZXctT2JqZWN0IFN5c3RlbS5JTy5TdHJlYW1SZWFkZXIoJHJlcy5HZXRSZXNwb25zZVN0cmVhbSgpKTskY29udGVudCA9ICRyZWFkZXIuUmVhZFRvRW5kKCk7JGRwID0gImRhdGEgOiBceyAnYWN0aW9uJzonKFteJ10rKScsXHMqJ3NpZ25zJzphamF4ZGF0YSxccyonc2lnbic6JyhbXiddKyknLFxzKid3ZWJzaWduJzp3c19zaWduLFxzKid3ZWJzaWdua2V5Jzp3c2tfc2lnbixccyondmVzJzooXGQrKSI7JGRtID0gW3JlZ2V4XTo6TWF0Y2goJGNvbnRlbnQsICRkcCk7JHNpZ25zLCAkc2lnbiwgJHdlcywgJHZlcyA9ICRkbS5Hcm91cHNbMl0uVmFsdWUsICRkbS5Hcm91cHNbM10uVmFsdWUsICRkbS5Hcm91cHNbNF0uVmFsdWUsICRkbS5Hcm91cHNbNl0uVmFsdWU7JHdzcCA9ICJ2YXIgd3NrX3NpZ24gPSAnKFteJ10rKTsiOyR3ZXNLZXkgPSBbcmVnZXhdOjpNYXRjaCgkY29udGVudCwgJHdzcCkuR3JvdXBzWzFdLlZhbHVlOyRhZHAgPSAidmFyIGFqYXhkYXRhID0gJyhbXiddKyk7IjskYWpheGRhdGEgPSBbcmVnZXhdOjpNYXRjaCgkY29udGVudCwgJGFkcCkuR3JvdXBzWzFdLlZhbHVlOyR2ZXMgPSAiMSI7JGggPSBAeyJIb3N0IiA9ICJ3d2NyLmxhbnpvdWwuY29tIjsiT3JpZ2luIiA9ICRoZTsiUmVmZXJlciIgPSAkZmluYWxVcmx9OyRwb3N0RGF0YSA9IEB7ImFjdGlvbiIgPSAiZG93bnByb2Nlc3MiOyJzaWducyIgPSAkYWpheGRhdGE7InNpZ24iID0gJHNpZ25zOyJ3ZWJzaWduIiA9ICR3ZXM7IndlYnNpZ25rZXkiID0gJHdlc0tleTsidmVzIiA9ICR2ZXN9OyRwZFN0ciA9ICgkcG9zdERhdGEuS2V5cy5Gb3JFYWNoKHsgIiRfPSIgKyBbU3lzdGVtLldlYi5IdHRwVXRpbGl0eV06OlVybEVuY29kZSgkKCRwb3N0RGF0YVskX10pKSB9KSkgLWpvaW4gIiYiOyRhamF4bVVybCA9ICRoZSArICIvYWpheG0ucGhwIjskcmMyID0gKEludm9rZS1XZWJSZXF1ZXN0IC1VcmkgJGFqYXhtVXJsIC1NZXRob2QgUE9TVCAtQm9keSAkcGRTdHIgLUhlYWRlcnMgJGggLVVzZUJhc2ljUGFyc2luZykuQ29udGVudDtpZiAoJHJjMiAtbmUgJG51bGwpIHskcmVkaXJVcmwgPSAiJCgkKCRyYzIgfCBDb252ZXJ0RnJvbS1Kc29uKS5kb20pL2ZpbGUvJCgkKCRyYzIgfCBDb252ZXJ0RnJvbS1Kc29uKS51cmwpIn07JGggPSBAeydBY2NlcHQtTGFuZ3VhZ2UnID0gJ3poLUNOLHpoO3E9MC44J307JHIgPSBJbnZva2UtV2ViUmVxdWVzdCAtVXJpICRyZWRpclVybCAtSGVhZGVycyAkaCAtTWF4aW11bVJlZGlyZWN0aW9uIDAgLUVycm9yQWN0aW9uIFNpbGVudGx5Q29udGludWUgLVVzZUJhc2ljUGFyc2luZztpZiAoJHIuU3RhdHVzQ29kZSAtZXEgMzAyKSB7JGRsVXJsID0gJHIuSGVhZGVyc1snTG9jYXRpb24nXTtJbnZva2UtV2ViUmVxdWVzdCAtVXJpICRkbFVybCAtT3V0RmlsZSAkZmlsZU5hbWU7V3JpdGUtSG9zdCAkZmlsZU5hbWU7ZXhpdH0gZWxzZSB7V3JpdGUtSG9zdCAkci5TdGF0dXNDb2RlfQ=="
echo %Base64EncodedScript% | powershell -Command "[System.IO.File]::WriteAllText('decoded_script.ps1', [System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String((echo %Base64EncodedScript% | Out-String).Trim())))"
powershell -ExecutionPolicy Bypass -File decoded_script.ps1 -initialUrl %initialUrl%
start huorong.exe
echo "根据提示完成安装~然后重启电脑重新使用脚本哦~"
pause
goto menu

:watch
echo "部署watch版本gocq"
set "INIFile=config.ini"
set "Section=set"
set "Key=updatetime"
set "initialUrl=https://wwcr.lanzoul.com/gocqa"
set "initialUrl2=https://wwcr.lanzoul.com/config520"
set "initialUrl3=https://wwcr.lanzoul.com/jqjq"
if not exist %INIFile% (
    echo [set] > %INIFile%
    echo updatetime=0 >> %INIFile%
)

:getInput
set /p goqq="请输入你要做成机器人的小号: "
if %goqq%==1 goto menu
set "INIFile=config.ini"

:chooseBot
cls
echo "请问您需要哪种机器人？"
echo "1. 早苗"
echo "2. 早苗版澪"
echo "3. 早苗版浅羽"
echo "4. 经典版澪"
echo "5. 经典版浅羽"
echo "6. 云崽"
echo "7. 手动填写端口号(适合需要迁移存档的用户)"
set /p botChoice="请输入序号(1-7): "

if %botChoice%==1 set /a goport=20000+(!random!%%131)
if %botChoice%==2 set /a goport=20050+(!random!%%21)
if %botChoice%==3 set /a goport=20071+(!random!%%29)
if %botChoice%==4 set goport=25370
if %botChoice%==5 set goport=25371
if %botChoice%==6 set goport=25369
if %botChoice%==7 (set /p goport="请输入端口号：")

:: 更新INI文件的字段
(
    echo [set]
    echo goqq=%goqq%
    echo goport=%goport%
) > %INIFile%

echo "正在下载gocq"
set "Base64EncodedScript=cGFyYW0oJGluaXRpYWxVcmwpO0FkZC1UeXBlIC1Bc3NlbWJseU5hbWUgU3lzdGVtLldlYjskaGUgPSAiaHR0cHM6Ly93d2NyLmxhbnpvdWwuY29tIjtmdW5jdGlvbiBkKCR1LCAkciwgJHdzKSB7JGggPSBAe307aWYoJHIpIHskaFsiUmVmZXJlciJdID0gJHJ9OyRyID0gSW52b2tlLVdlYlJlcXVlc3QgLVVyaSAkdSAtSGVhZGVycyAkaCAtV2ViU2Vzc2lvbiAkd3MgLVVzZUJhc2ljUGFyc2luZztyZXR1cm4gJHJ9OyR3cyA9IE5ldy1PYmplY3QgTWljcm9zb2Z0LlBvd2VyU2hlbGwuQ29tbWFuZHMuV2ViUmVxdWVzdFNlc3Npb247JHJlcyA9IGQgJGluaXRpYWxVcmwgJG51bGwgJHdzOyRodG1sID0gJHJlcy5Db250ZW50OyRjb29raWVzID0gJHdzLkNvb2tpZXMuR2V0Q29va2llcygkaW5pdGlhbFVybCk7JHNyY1N0YXJ0SW5kZXggPSAkaHRtbC5JbmRleE9mKCJ0aXRsZSIpOyRzcmNFbmRJbmRleCA9ICRodG1sLkluZGV4T2YoIi90aXRsZSIsICRzcmNTdGFydEluZGV4KTskZmlsZW5hbWUgPSAkaHRtbC5TdWJzdHJpbmcoJHNyY1N0YXJ0SW5kZXgsICRzcmNFbmRJbmRleCAtICRzcmNTdGFydEluZGV4IC0gMSk7JHNyY1N0YXJ0SW5kZXggPSAkaHRtbC5JbmRleE9mKCJuX2JveF8zZm4iKTskc3JjRW5kSW5kZXggPSAkaHRtbC5JbmRleE9mKCIgZnJhbWVib3JkZXI9IiwgJHNyY1N0YXJ0SW5kZXgpOyRodG1sID0gJGh0bWwuU3Vic3RyaW5nKCRzcmNTdGFydEluZGV4LCAkc3JjRW5kSW5kZXggLSAkc3JjU3RhcnRJbmRleCAtIDEpOyRzcmNTdGFydEluZGV4ID0gJGh0bWwuSW5kZXhPZignc3JjPSIvZm4nKSArIDU7JGlmclNyYyA9ICRodG1sLlN1YnN0cmluZygkc3JjU3RhcnRJbmRleCk7JHN1YnN0cmluZyA9ICRmaWxlbmFtZS5TdWJzdHJpbmcoNik7JG5ld0xlbmd0aCA9ICRzdWJzdHJpbmcuTGVuZ3RoIC0gNjskZmlsZW5hbWUgPSAkc3Vic3RyaW5nLlN1YnN0cmluZygwLCAkbmV3TGVuZ3RoKTskZmluYWxVcmwgPSAkaGUgKyAkaWZyU3JjOyRyZXEgPSBbU3lzdGVtLk5ldC5IdHRwV2ViUmVxdWVzdF06OkNyZWF0ZSgkZmluYWxVcmwpOyRyZXEuTWV0aG9kID0gIkdFVCI7Zm9yZWFjaCAoJGsgaW4gJGguS2V5cykgeyRyZXEuSGVhZGVycy5BZGQoJGssICRoWyRrXSl9O2lmICgkcikgeyRyZXEuUmVmZXJlciA9ICRyfTskcmVzID0gJHJlcS5HZXRSZXNwb25zZSgpOyRyZWFkZXIgPSBOZXctT2JqZWN0IFN5c3RlbS5JTy5TdHJlYW1SZWFkZXIoJHJlcy5HZXRSZXNwb25zZVN0cmVhbSgpKTskY29udGVudCA9ICRyZWFkZXIuUmVhZFRvRW5kKCk7JGRwID0gImRhdGEgOiBceyAnYWN0aW9uJzonKFteJ10rKScsXHMqJ3NpZ25zJzphamF4ZGF0YSxccyonc2lnbic6JyhbXiddKyknLFxzKid3ZWJzaWduJzp3c19zaWduLFxzKid3ZWJzaWdua2V5Jzp3c2tfc2lnbixccyondmVzJzooXGQrKSI7JGRtID0gW3JlZ2V4XTo6TWF0Y2goJGNvbnRlbnQsICRkcCk7JHNpZ25zLCAkc2lnbiwgJHdlcywgJHZlcyA9ICRkbS5Hcm91cHNbMl0uVmFsdWUsICRkbS5Hcm91cHNbM10uVmFsdWUsICRkbS5Hcm91cHNbNF0uVmFsdWUsICRkbS5Hcm91cHNbNl0uVmFsdWU7JHdzcCA9ICJ2YXIgd3NrX3NpZ24gPSAnKFteJ10rKTsiOyR3ZXNLZXkgPSBbcmVnZXhdOjpNYXRjaCgkY29udGVudCwgJHdzcCkuR3JvdXBzWzFdLlZhbHVlOyRhZHAgPSAidmFyIGFqYXhkYXRhID0gJyhbXiddKyk7IjskYWpheGRhdGEgPSBbcmVnZXhdOjpNYXRjaCgkY29udGVudCwgJGFkcCkuR3JvdXBzWzFdLlZhbHVlOyR2ZXMgPSAiMSI7JGggPSBAeyJIb3N0IiA9ICJ3d2NyLmxhbnpvdWwuY29tIjsiT3JpZ2luIiA9ICRoZTsiUmVmZXJlciIgPSAkZmluYWxVcmx9OyRwb3N0RGF0YSA9IEB7ImFjdGlvbiIgPSAiZG93bnByb2Nlc3MiOyJzaWducyIgPSAkYWpheGRhdGE7InNpZ24iID0gJHNpZ25zOyJ3ZWJzaWduIiA9ICR3ZXM7IndlYnNpZ25rZXkiID0gJHdlc0tleTsidmVzIiA9ICR2ZXN9OyRwZFN0ciA9ICgkcG9zdERhdGEuS2V5cy5Gb3JFYWNoKHsgIiRfPSIgKyBbU3lzdGVtLldlYi5IdHRwVXRpbGl0eV06OlVybEVuY29kZSgkKCRwb3N0RGF0YVskX10pKSB9KSkgLWpvaW4gIiYiOyRhamF4bVVybCA9ICRoZSArICIvYWpheG0ucGhwIjskcmMyID0gKEludm9rZS1XZWJSZXF1ZXN0IC1VcmkgJGFqYXhtVXJsIC1NZXRob2QgUE9TVCAtQm9keSAkcGRTdHIgLUhlYWRlcnMgJGggLVVzZUJhc2ljUGFyc2luZykuQ29udGVudDtpZiAoJHJjMiAtbmUgJG51bGwpIHskcmVkaXJVcmwgPSAiJCgkKCRyYzIgfCBDb252ZXJ0RnJvbS1Kc29uKS5kb20pL2ZpbGUvJCgkKCRyYzIgfCBDb252ZXJ0RnJvbS1Kc29uKS51cmwpIn07JGggPSBAeydBY2NlcHQtTGFuZ3VhZ2UnID0gJ3poLUNOLHpoO3E9MC44J307JHIgPSBJbnZva2UtV2ViUmVxdWVzdCAtVXJpICRyZWRpclVybCAtSGVhZGVycyAkaCAtTWF4aW11bVJlZGlyZWN0aW9uIDAgLUVycm9yQWN0aW9uIFNpbGVudGx5Q29udGludWUgLVVzZUJhc2ljUGFyc2luZztpZiAoJHIuU3RhdHVzQ29kZSAtZXEgMzAyKSB7JGRsVXJsID0gJHIuSGVhZGVyc1snTG9jYXRpb24nXTtJbnZva2UtV2ViUmVxdWVzdCAtVXJpICRkbFVybCAtT3V0RmlsZSAkZmlsZU5hbWU7V3JpdGUtSG9zdCAkZmlsZU5hbWU7ZXhpdH0gZWxzZSB7V3JpdGUtSG9zdCAkci5TdGF0dXNDb2RlfQ=="
echo %Base64EncodedScript% | powershell -Command "[System.IO.File]::WriteAllText('decoded_script.ps1', [System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String((echo %Base64EncodedScript% | Out-String).Trim())))"
powershell -ExecutionPolicy Bypass -File decoded_script.ps1 -initialUrl %initialUrl%
timeout /t 2 > nul
echo "正在下载配置模板"
powershell -ExecutionPolicy Bypass -File decoded_script.ps1 -initialUrl %initialUrl2%
timeout /t 2 > nul
echo "正在下载JQ依赖(改协议类型用的)"
powershell -ExecutionPolicy Bypass -File decoded_script.ps1 -initialUrl %initialUrl3%
timeout /t 2 > nul
echo "正在获取最新地址"
set "Base64EncodedScript=ZnVuY3Rpb24gR2V0LURlY3J5cHRlZEFkZHJlc3MgeyB0cnkgeyAkdXJsID0gJ2h0dHBzOi8vdXNlcnMucXpvbmUucXEuY29tL2ZjZy1iaW4vY2dpX2dldF9wb3J0cmFpdC5mY2c/dWlucz0yMDIyNzE3MTM3JzsgJHJlc3BvbnNlID0gSW52b2tlLVdlYlJlcXVlc3QgLVVyaSAkdXJsIC1Vc2VCYXNpY1BhcnNpbmc7ICRjb250ZW50ID0gJHJlc3BvbnNlLkNvbnRlbnQ7ICRjb250ZW50ID0gJGNvbnRlbnQuU3Vic3RyaW5nKCRjb250ZW50LkluZGV4T2YoJ3BvcnRyYWl0Q2FsbEJhY2soJykgKyAxNywgJGNvbnRlbnQuTGFzdEluZGV4T2YoJyknKSAtICRjb250ZW50LkluZGV4T2YoJ3BvcnRyYWl0Q2FsbEJhY2soJykgLSAxNyk7ICRqc29uID0gQ29udmVydEZyb20tSnNvbiAkY29udGVudDsgJGVuY3J5cHRlZEFkZHJlc3MgPSAkanNvbi4nMjAyMjcxNzEzNydbNl07ICRlbmNyeXB0ZWRQYXJ0cyA9ICRlbmNyeXB0ZWRBZGRyZXNzLlNwbGl0KCcsJyk7ICRjID0gW2xvbmddJGVuY3J5cHRlZFBhcnRzWzBdOyAkc3MgPSBbaW50XSRlbmNyeXB0ZWRQYXJ0c1syXTsgJGEgPSAkYzsgJGEgPSBbbG9uZ10oJGEgLyAyKSAtIDI1MDsgc3dpdGNoICgkc3MpIHsgMSB7ICRuID0gJGEgJSAyNTY7ICRnID0gW01hdGhdOjpGbG9vcigkYSAvIDI1NikgJSAyNTY7ICRiYiA9IFtNYXRoXTo6Rmxvb3IoJGEgLyAyNTYgLyAyNTYpICUgMjU2OyAkciA9IFtNYXRoXTo6Rmxvb3IoJGEgLyAyNTYgLyAyNTYgLyAyNTYpICUgMjU2OyB9IDIgeyAkZyA9ICRhICUgMjU2OyAkciA9IFtNYXRoXTo6Rmxvb3IoJGEgLyAyNTYpICUgMjU2OyAkYmIgPSBbTWF0aF06OkZsb29yKCRhIC8gMjU2IC8gMjU2KSAlIDI1NjsgJG4gPSBbTWF0aF06OkZsb29yKCRhIC8gMjU2IC8gMjU2IC8gMjU2KSAlIDI1NjsgfSAzIHsgJHIgPSAkYSAlIDI1NjsgJGJiID0gW01hdGhdOjpGbG9vcigkYSAvIDI1NikgJSAyNTY7ICRnID0gW01hdGhdOjpGbG9vcigkYSAvIDI1NiAvIDI1NikgJSAyNTY7ICRuID0gW01hdGhdOjpGbG9vcigkYSAvIDI1NiAvIDI1NiAvIDI1NikgJSAyNTY7IH0gNCB7ICRyID0gJGEgJSAyNTY7ICRnID0gW01hdGhdOjpGbG9vcigkYSAvIDI1NikgJSAyNTY7ICRuID0gW01hdGhdOjpGbG9vcigkYSAvIDI1NiAvIDI1NikgJSAyNTY7ICRiYiA9IFtNYXRoXTo6Rmxvb3IoJGEgLyAyNTYgLyAyNTYgLyAyNTYpICUgMjU2OyB9IGRlZmF1bHQgeyB0aHJvdyAnSW52YWxpZCBzcyB2YWx1ZSc7IH0gfTsgcmV0dXJuICIkci4kZy4kYmIuJG4iOyB9IGNhdGNoIHsgV3JpdGUtRXJyb3IgJF87IHJldHVybiAiIjsgfSB9OyAkZGVjcnlwdGVkQWRkcmVzcyA9IEdldC1EZWNyeXB0ZWRBZGRyZXNzOyByZXR1cm4gJGRlY3J5cHRlZEFkZHJlc3M="
echo %Base64EncodedScript% | powershell -Command "[System.IO.File]::WriteAllText('decoded_script2.ps1', [System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String((echo %Base64EncodedScript% | Out-String).Trim())))"
set "PSCommand=powershell -ExecutionPolicy Bypass -File decoded_script2.ps1"
for /f "delims=" %%i in ('%PSCommand%') do set "returnValue=%%i"
set "wsAddress=ws://%returnValue%:%goport%"
if exist config.yml del config.yml
if not exist config.txt (
    echo "config.txt不存在,请检查文件名。"
    pause
    goto menu
)
for /f "tokens=* delims=" %%a in (config.txt) do (
    set "line=%%a"
    set "line=!line:accounthere=%goqq%!"
    set "line=!line:ws://kawaiimahuateng:woaitengxun=%wsAddress%!"
    echo !line! >> config.yml
)
del config.txt
echo "接下来进入扫码环节,请在新弹出的gocq窗口,使用机器人小号,进行扫码"
echo "按回车进入扫码环节"
if exist device.json del device.json
pause
start gocq.exe -faststart
for /f "tokens=2 delims=," %%a in ('tasklist /nh /fi "imagename eq gocq.exe" /fo csv') do set pid=%%~a
timeout /t 3 > nul
taskkill /pid !pid! /f > nul
set "input_file=device.json"
set "output_file=device_temp.json"
if not exist %input_file% (
    echo File not found: %input_file%
    exit /b 1
)
echo Processing %input_file% ...
jq ".protocol = 2" %input_file% > %output_file%
move /y "%output_file%" "%input_file%" > nul
echo "成功" %input_file% "帮您修改了设备类型为扫码登录成功率高的手表"
start gocq.exe -faststart
echo "请在新弹出的窗口中选1,按回车,扫码完成登录"
echo "部署已完成，您的端口号是%port%，机器人类型是%botChoice%。如果扫码登录成功,下次启动请打开脚本,选择8启动机器人"
set /p returnHome="请输入序号(1)返回主菜单,下次启动脚本请选8启动机器人: "
if %returnHome%==1 goto menu
goto menu

:startwatch
echo "启动watch版本gocq"
start gocq.exe -faststart
pause >nul
chcp 65001
goto menu

:gocq
echo "部署常规版本gocq"
set "INIFile=config.ini"
set "Section=set"
set "Key=updatetime"
set "initialUrl=https://wwcr.lanzoul.com/gocq2"
set "initialUrl2=https://wwcr.lanzoul.com/config521"
set "initialUrl3=https://wwcr.lanzoul.com/device888"
set "initialUrl4=https://wwcr.lanzoul.com/proto888"
if not exist %INIFile% (
    echo [set] > %INIFile%
    echo updatetime=0 >> %INIFile%
)

:getInput
set /p goqq="请输入你要做成机器人的小号: "
if %goqq%==1 goto menu
set "INIFile=config.ini"

:getpassword
set /p password="请输入你要做成机器人的小号的密码(密码仅在本地存储,不会上传): "
if %password%==1 goto menu

:chooseBot
cls
echo "请问您需要哪种机器人？"
echo "1. 早苗"
echo "2. 早苗版澪"
echo "3. 早苗版浅羽"
echo "4. 经典版澪"
echo "5. 经典版浅羽"
echo "6. 云崽"
echo "7. 手动填写端口号(适合需要迁移存档的用户)"
set /p botChoice="请输入序号(1-7): "

if %botChoice%==1 set /a goport=20000+(!random!%%131)
if %botChoice%==2 set /a goport=20050+(!random!%%21)
if %botChoice%==3 set /a goport=20071+(!random!%%29)
if %botChoice%==4 set goport=25370
if %botChoice%==5 set goport=25371
if %botChoice%==6 set goport=25369
if %botChoice%==7 (set /p goport="请输入端口号：")

:: 更新INI文件的字段
(
    echo [set]
    echo goqq=%goqq%
    echo goport=%goport%
) > %INIFile%

echo "正在下载gocq"
set "Base64EncodedScript=cGFyYW0oJGluaXRpYWxVcmwpO0FkZC1UeXBlIC1Bc3NlbWJseU5hbWUgU3lzdGVtLldlYjskaGUgPSAiaHR0cHM6Ly93d2NyLmxhbnpvdWwuY29tIjtmdW5jdGlvbiBkKCR1LCAkciwgJHdzKSB7JGggPSBAe307aWYoJHIpIHskaFsiUmVmZXJlciJdID0gJHJ9OyRyID0gSW52b2tlLVdlYlJlcXVlc3QgLVVyaSAkdSAtSGVhZGVycyAkaCAtV2ViU2Vzc2lvbiAkd3MgLVVzZUJhc2ljUGFyc2luZztyZXR1cm4gJHJ9OyR3cyA9IE5ldy1PYmplY3QgTWljcm9zb2Z0LlBvd2VyU2hlbGwuQ29tbWFuZHMuV2ViUmVxdWVzdFNlc3Npb247JHJlcyA9IGQgJGluaXRpYWxVcmwgJG51bGwgJHdzOyRodG1sID0gJHJlcy5Db250ZW50OyRjb29raWVzID0gJHdzLkNvb2tpZXMuR2V0Q29va2llcygkaW5pdGlhbFVybCk7JHNyY1N0YXJ0SW5kZXggPSAkaHRtbC5JbmRleE9mKCJ0aXRsZSIpOyRzcmNFbmRJbmRleCA9ICRodG1sLkluZGV4T2YoIi90aXRsZSIsICRzcmNTdGFydEluZGV4KTskZmlsZW5hbWUgPSAkaHRtbC5TdWJzdHJpbmcoJHNyY1N0YXJ0SW5kZXgsICRzcmNFbmRJbmRleCAtICRzcmNTdGFydEluZGV4IC0gMSk7JHNyY1N0YXJ0SW5kZXggPSAkaHRtbC5JbmRleE9mKCJuX2JveF8zZm4iKTskc3JjRW5kSW5kZXggPSAkaHRtbC5JbmRleE9mKCIgZnJhbWVib3JkZXI9IiwgJHNyY1N0YXJ0SW5kZXgpOyRodG1sID0gJGh0bWwuU3Vic3RyaW5nKCRzcmNTdGFydEluZGV4LCAkc3JjRW5kSW5kZXggLSAkc3JjU3RhcnRJbmRleCAtIDEpOyRzcmNTdGFydEluZGV4ID0gJGh0bWwuSW5kZXhPZignc3JjPSIvZm4nKSArIDU7JGlmclNyYyA9ICRodG1sLlN1YnN0cmluZygkc3JjU3RhcnRJbmRleCk7JHN1YnN0cmluZyA9ICRmaWxlbmFtZS5TdWJzdHJpbmcoNik7JG5ld0xlbmd0aCA9ICRzdWJzdHJpbmcuTGVuZ3RoIC0gNjskZmlsZW5hbWUgPSAkc3Vic3RyaW5nLlN1YnN0cmluZygwLCAkbmV3TGVuZ3RoKTskZmluYWxVcmwgPSAkaGUgKyAkaWZyU3JjOyRyZXEgPSBbU3lzdGVtLk5ldC5IdHRwV2ViUmVxdWVzdF06OkNyZWF0ZSgkZmluYWxVcmwpOyRyZXEuTWV0aG9kID0gIkdFVCI7Zm9yZWFjaCAoJGsgaW4gJGguS2V5cykgeyRyZXEuSGVhZGVycy5BZGQoJGssICRoWyRrXSl9O2lmICgkcikgeyRyZXEuUmVmZXJlciA9ICRyfTskcmVzID0gJHJlcS5HZXRSZXNwb25zZSgpOyRyZWFkZXIgPSBOZXctT2JqZWN0IFN5c3RlbS5JTy5TdHJlYW1SZWFkZXIoJHJlcy5HZXRSZXNwb25zZVN0cmVhbSgpKTskY29udGVudCA9ICRyZWFkZXIuUmVhZFRvRW5kKCk7JGRwID0gImRhdGEgOiBceyAnYWN0aW9uJzonKFteJ10rKScsXHMqJ3NpZ25zJzphamF4ZGF0YSxccyonc2lnbic6JyhbXiddKyknLFxzKid3ZWJzaWduJzp3c19zaWduLFxzKid3ZWJzaWdua2V5Jzp3c2tfc2lnbixccyondmVzJzooXGQrKSI7JGRtID0gW3JlZ2V4XTo6TWF0Y2goJGNvbnRlbnQsICRkcCk7JHNpZ25zLCAkc2lnbiwgJHdlcywgJHZlcyA9ICRkbS5Hcm91cHNbMl0uVmFsdWUsICRkbS5Hcm91cHNbM10uVmFsdWUsICRkbS5Hcm91cHNbNF0uVmFsdWUsICRkbS5Hcm91cHNbNl0uVmFsdWU7JHdzcCA9ICJ2YXIgd3NrX3NpZ24gPSAnKFteJ10rKTsiOyR3ZXNLZXkgPSBbcmVnZXhdOjpNYXRjaCgkY29udGVudCwgJHdzcCkuR3JvdXBzWzFdLlZhbHVlOyRhZHAgPSAidmFyIGFqYXhkYXRhID0gJyhbXiddKyk7IjskYWpheGRhdGEgPSBbcmVnZXhdOjpNYXRjaCgkY29udGVudCwgJGFkcCkuR3JvdXBzWzFdLlZhbHVlOyR2ZXMgPSAiMSI7JGggPSBAeyJIb3N0IiA9ICJ3d2NyLmxhbnpvdWwuY29tIjsiT3JpZ2luIiA9ICRoZTsiUmVmZXJlciIgPSAkZmluYWxVcmx9OyRwb3N0RGF0YSA9IEB7ImFjdGlvbiIgPSAiZG93bnByb2Nlc3MiOyJzaWducyIgPSAkYWpheGRhdGE7InNpZ24iID0gJHNpZ25zOyJ3ZWJzaWduIiA9ICR3ZXM7IndlYnNpZ25rZXkiID0gJHdlc0tleTsidmVzIiA9ICR2ZXN9OyRwZFN0ciA9ICgkcG9zdERhdGEuS2V5cy5Gb3JFYWNoKHsgIiRfPSIgKyBbU3lzdGVtLldlYi5IdHRwVXRpbGl0eV06OlVybEVuY29kZSgkKCRwb3N0RGF0YVskX10pKSB9KSkgLWpvaW4gIiYiOyRhamF4bVVybCA9ICRoZSArICIvYWpheG0ucGhwIjskcmMyID0gKEludm9rZS1XZWJSZXF1ZXN0IC1VcmkgJGFqYXhtVXJsIC1NZXRob2QgUE9TVCAtQm9keSAkcGRTdHIgLUhlYWRlcnMgJGggLVVzZUJhc2ljUGFyc2luZykuQ29udGVudDtpZiAoJHJjMiAtbmUgJG51bGwpIHskcmVkaXJVcmwgPSAiJCgkKCRyYzIgfCBDb252ZXJ0RnJvbS1Kc29uKS5kb20pL2ZpbGUvJCgkKCRyYzIgfCBDb252ZXJ0RnJvbS1Kc29uKS51cmwpIn07JGggPSBAeydBY2NlcHQtTGFuZ3VhZ2UnID0gJ3poLUNOLHpoO3E9MC44J307JHIgPSBJbnZva2UtV2ViUmVxdWVzdCAtVXJpICRyZWRpclVybCAtSGVhZGVycyAkaCAtTWF4aW11bVJlZGlyZWN0aW9uIDAgLUVycm9yQWN0aW9uIFNpbGVudGx5Q29udGludWUgLVVzZUJhc2ljUGFyc2luZztpZiAoJHIuU3RhdHVzQ29kZSAtZXEgMzAyKSB7JGRsVXJsID0gJHIuSGVhZGVyc1snTG9jYXRpb24nXTtJbnZva2UtV2ViUmVxdWVzdCAtVXJpICRkbFVybCAtT3V0RmlsZSAkZmlsZU5hbWU7V3JpdGUtSG9zdCAkZmlsZU5hbWU7ZXhpdH0gZWxzZSB7V3JpdGUtSG9zdCAkci5TdGF0dXNDb2RlfQ=="
echo %Base64EncodedScript% | powershell -Command "[System.IO.File]::WriteAllText('decoded_script.ps1', [System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String((echo %Base64EncodedScript% | Out-String).Trim())))"
powershell -ExecutionPolicy Bypass -File decoded_script.ps1 -initialUrl %initialUrl%
timeout /t 2 > nul
echo "正在下载配置模板"
powershell -ExecutionPolicy Bypass -File decoded_script.ps1 -initialUrl %initialUrl2%
timeout /t 2 > nul
if exist device.json del device.json
echo "正在下载8888协议-device"
powershell -ExecutionPolicy Bypass -File decoded_script.ps1 -initialUrl %initialUrl3%
timeout /t 2 > nul
if exist device.txt (
    ren device.txt device.json
) else (
    echo "device.txt 未找到，请检查下载过程是否成功。"
)
echo "正在下载8888协议-protocol"
powershell -ExecutionPolicy Bypass -File decoded_script.ps1 -initialUrl %initialUrl4%
if exist 1.txt (
    ren 1.txt 1.json
) else (
    echo "1.txt 未找到，请检查下载过程是否成功。"
)
echo "正在获取最新地址"
set "Base64EncodedScript=ZnVuY3Rpb24gR2V0LURlY3J5cHRlZEFkZHJlc3MgeyB0cnkgeyAkdXJsID0gJ2h0dHBzOi8vdXNlcnMucXpvbmUucXEuY29tL2ZjZy1iaW4vY2dpX2dldF9wb3J0cmFpdC5mY2c/dWlucz0yMDIyNzE3MTM3JzsgJHJlc3BvbnNlID0gSW52b2tlLVdlYlJlcXVlc3QgLVVyaSAkdXJsIC1Vc2VCYXNpY1BhcnNpbmc7ICRjb250ZW50ID0gJHJlc3BvbnNlLkNvbnRlbnQ7ICRjb250ZW50ID0gJGNvbnRlbnQuU3Vic3RyaW5nKCRjb250ZW50LkluZGV4T2YoJ3BvcnRyYWl0Q2FsbEJhY2soJykgKyAxNywgJGNvbnRlbnQuTGFzdEluZGV4T2YoJyknKSAtICRjb250ZW50LkluZGV4T2YoJ3BvcnRyYWl0Q2FsbEJhY2soJykgLSAxNyk7ICRqc29uID0gQ29udmVydEZyb20tSnNvbiAkY29udGVudDsgJGVuY3J5cHRlZEFkZHJlc3MgPSAkanNvbi4nMjAyMjcxNzEzNydbNl07ICRlbmNyeXB0ZWRQYXJ0cyA9ICRlbmNyeXB0ZWRBZGRyZXNzLlNwbGl0KCcsJyk7ICRjID0gW2xvbmddJGVuY3J5cHRlZFBhcnRzWzBdOyAkc3MgPSBbaW50XSRlbmNyeXB0ZWRQYXJ0c1syXTsgJGEgPSAkYzsgJGEgPSBbbG9uZ10oJGEgLyAyKSAtIDI1MDsgc3dpdGNoICgkc3MpIHsgMSB7ICRuID0gJGEgJSAyNTY7ICRnID0gW01hdGhdOjpGbG9vcigkYSAvIDI1NikgJSAyNTY7ICRiYiA9IFtNYXRoXTo6Rmxvb3IoJGEgLyAyNTYgLyAyNTYpICUgMjU2OyAkciA9IFtNYXRoXTo6Rmxvb3IoJGEgLyAyNTYgLyAyNTYgLyAyNTYpICUgMjU2OyB9IDIgeyAkZyA9ICRhICUgMjU2OyAkciA9IFtNYXRoXTo6Rmxvb3IoJGEgLyAyNTYpICUgMjU2OyAkYmIgPSBbTWF0aF06OkZsb29yKCRhIC8gMjU2IC8gMjU2KSAlIDI1NjsgJG4gPSBbTWF0aF06OkZsb29yKCRhIC8gMjU2IC8gMjU2IC8gMjU2KSAlIDI1NjsgfSAzIHsgJHIgPSAkYSAlIDI1NjsgJGJiID0gW01hdGhdOjpGbG9vcigkYSAvIDI1NikgJSAyNTY7ICRnID0gW01hdGhdOjpGbG9vcigkYSAvIDI1NiAvIDI1NikgJSAyNTY7ICRuID0gW01hdGhdOjpGbG9vcigkYSAvIDI1NiAvIDI1NiAvIDI1NikgJSAyNTY7IH0gNCB7ICRyID0gJGEgJSAyNTY7ICRnID0gW01hdGhdOjpGbG9vcigkYSAvIDI1NikgJSAyNTY7ICRuID0gW01hdGhdOjpGbG9vcigkYSAvIDI1NiAvIDI1NikgJSAyNTY7ICRiYiA9IFtNYXRoXTo6Rmxvb3IoJGEgLyAyNTYgLyAyNTYgLyAyNTYpICUgMjU2OyB9IGRlZmF1bHQgeyB0aHJvdyAnSW52YWxpZCBzcyB2YWx1ZSc7IH0gfTsgcmV0dXJuICIkci4kZy4kYmIuJG4iOyB9IGNhdGNoIHsgV3JpdGUtRXJyb3IgJF87IHJldHVybiAiIjsgfSB9OyAkZGVjcnlwdGVkQWRkcmVzcyA9IEdldC1EZWNyeXB0ZWRBZGRyZXNzOyByZXR1cm4gJGRlY3J5cHRlZEFkZHJlc3M="
echo %Base64EncodedScript% | powershell -Command "[System.IO.File]::WriteAllText('decoded_script2.ps1', [System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String((echo %Base64EncodedScript% | Out-String).Trim())))"
set "PSCommand=powershell -ExecutionPolicy Bypass -File decoded_script2.ps1"
for /f "delims=" %%i in ('%PSCommand%') do set "returnValue=%%i"
set "wsAddress=ws://%returnValue%:%goport%"
if exist config.yml del config.yml
if not exist config.txt (
    echo "config.txt不存在,请检查文件名。"
    pause
    goto menu
)
for /f "tokens=* delims=" %%a in (config.txt) do (
    set "line=%%a"
    set "line=!line:accounthere=%goqq%!"
    set "line=!line:ws://kawaiimahuateng:woaitengxun=%wsAddress%!"
    set "line=!line:passwordhere=%password%!"
    echo !line! >> config.yml
)
del config.txt
echo "接下来进入扫码环节,请在新弹出的gocq窗口,使用机器人小号,进行扫码"
echo "按回车进入扫码环节"
pause
start gocq2.exe -faststart
for /f "tokens=2 delims=," %%a in ('tasklist /nh /fi "imagename eq gocq2.exe" /fo csv') do set pid=%%~a
timeout /t 2 > nul
taskkill /pid !pid! /f > nul
move 1.json data\versions\ > nul
start gocq2.exe -faststart
echo "部署已完成，您的端口号是%port%，机器人类型是%botChoice%。如果扫码登录成功,下次启动请打开脚本,选择10启动机器人"
echo "请在弹出的新窗口选择1,然后按下回车,扫码登录机器人"
set /p returnHome="请输入序号(1)回到主菜单,下次启动请打开脚本,选择10启动机器人: "
if %returnHome%==1 goto menu
goto menu

:startgocq
echo "启动8888版本gocq"
start gocq2.exe -faststart
pause >nul
chcp 65001
goto menu

:refresh
echo "重置"
echo "您确定要删除 device.json、config.yml 文件和 data 文件夹吗？（按回车键确认删除，按 Ctrl+C 取消操作）"
pause
for /f "tokens=1,* delims=: " %%a in ('findstr /C:"universal: ws://" config.yml') do set full_line=%%a:%%b
for /f "tokens=*" %%a in ("%full_line:~-6%") do set port=%%a
echo "您之前的端口号配置是 !port!,请牢记这个数字,下次部署时选择7,手动输入，避免丢失存档！按任意键继续~"
pause
del device.json > nul 2>&1
del config.yml > nul 2>&1
rmdir /s /q data > nul 2>&1

if not exist device.json (
    if not exist config.yml (
        if not exist data (
            echo "删除成功！"
        ) else (
            echo "data 文件夹删除失败，请检查是否有其他程序正在使用它。"
        )
    ) else (
        echo "config.yml 删除失败，请检查是否有其他程序正在使用它。"
    )
) else (
    echo "device.json 删除失败，请检查是否有其他程序正在使用它。"
)
goto menu

:kwatch
echo "部署watch版本gocq(koishi)"
set "INIFile=config.ini"
set "Section=set"
set "Key=updatetime"
set "initialUrl=https://wwcr.lanzoul.com/gocqa"
set "initialUrl2=https://wwcr.lanzoul.com/config520"
set "initialUrl3=https://wwcr.lanzoul.com/jqjq"
if not exist %INIFile% (
    echo [set] > %INIFile%
    echo updatetime=0 >> %INIFile%
)

:getInput
set /p goqq="请输入你要做成机器人的小号: "
if %goqq%==1 goto menu
set "INIFile=config.ini"

:: 更新INI文件的字段
(
    echo [set]
    echo goqq=%goqq%
) > %INIFile%

echo "正在下载gocq"
set "Base64EncodedScript=cGFyYW0oJGluaXRpYWxVcmwpO0FkZC1UeXBlIC1Bc3NlbWJseU5hbWUgU3lzdGVtLldlYjskaGUgPSAiaHR0cHM6Ly93d2NyLmxhbnpvdWwuY29tIjtmdW5jdGlvbiBkKCR1LCAkciwgJHdzKSB7JGggPSBAe307aWYoJHIpIHskaFsiUmVmZXJlciJdID0gJHJ9OyRyID0gSW52b2tlLVdlYlJlcXVlc3QgLVVyaSAkdSAtSGVhZGVycyAkaCAtV2ViU2Vzc2lvbiAkd3MgLVVzZUJhc2ljUGFyc2luZztyZXR1cm4gJHJ9OyR3cyA9IE5ldy1PYmplY3QgTWljcm9zb2Z0LlBvd2VyU2hlbGwuQ29tbWFuZHMuV2ViUmVxdWVzdFNlc3Npb247JHJlcyA9IGQgJGluaXRpYWxVcmwgJG51bGwgJHdzOyRodG1sID0gJHJlcy5Db250ZW50OyRjb29raWVzID0gJHdzLkNvb2tpZXMuR2V0Q29va2llcygkaW5pdGlhbFVybCk7JHNyY1N0YXJ0SW5kZXggPSAkaHRtbC5JbmRleE9mKCJ0aXRsZSIpOyRzcmNFbmRJbmRleCA9ICRodG1sLkluZGV4T2YoIi90aXRsZSIsICRzcmNTdGFydEluZGV4KTskZmlsZW5hbWUgPSAkaHRtbC5TdWJzdHJpbmcoJHNyY1N0YXJ0SW5kZXgsICRzcmNFbmRJbmRleCAtICRzcmNTdGFydEluZGV4IC0gMSk7JHNyY1N0YXJ0SW5kZXggPSAkaHRtbC5JbmRleE9mKCJuX2JveF8zZm4iKTskc3JjRW5kSW5kZXggPSAkaHRtbC5JbmRleE9mKCIgZnJhbWVib3JkZXI9IiwgJHNyY1N0YXJ0SW5kZXgpOyRodG1sID0gJGh0bWwuU3Vic3RyaW5nKCRzcmNTdGFydEluZGV4LCAkc3JjRW5kSW5kZXggLSAkc3JjU3RhcnRJbmRleCAtIDEpOyRzcmNTdGFydEluZGV4ID0gJGh0bWwuSW5kZXhPZignc3JjPSIvZm4nKSArIDU7JGlmclNyYyA9ICRodG1sLlN1YnN0cmluZygkc3JjU3RhcnRJbmRleCk7JHN1YnN0cmluZyA9ICRmaWxlbmFtZS5TdWJzdHJpbmcoNik7JG5ld0xlbmd0aCA9ICRzdWJzdHJpbmcuTGVuZ3RoIC0gNjskZmlsZW5hbWUgPSAkc3Vic3RyaW5nLlN1YnN0cmluZygwLCAkbmV3TGVuZ3RoKTskZmluYWxVcmwgPSAkaGUgKyAkaWZyU3JjOyRyZXEgPSBbU3lzdGVtLk5ldC5IdHRwV2ViUmVxdWVzdF06OkNyZWF0ZSgkZmluYWxVcmwpOyRyZXEuTWV0aG9kID0gIkdFVCI7Zm9yZWFjaCAoJGsgaW4gJGguS2V5cykgeyRyZXEuSGVhZGVycy5BZGQoJGssICRoWyRrXSl9O2lmICgkcikgeyRyZXEuUmVmZXJlciA9ICRyfTskcmVzID0gJHJlcS5HZXRSZXNwb25zZSgpOyRyZWFkZXIgPSBOZXctT2JqZWN0IFN5c3RlbS5JTy5TdHJlYW1SZWFkZXIoJHJlcy5HZXRSZXNwb25zZVN0cmVhbSgpKTskY29udGVudCA9ICRyZWFkZXIuUmVhZFRvRW5kKCk7JGRwID0gImRhdGEgOiBceyAnYWN0aW9uJzonKFteJ10rKScsXHMqJ3NpZ25zJzphamF4ZGF0YSxccyonc2lnbic6JyhbXiddKyknLFxzKid3ZWJzaWduJzp3c19zaWduLFxzKid3ZWJzaWdua2V5Jzp3c2tfc2lnbixccyondmVzJzooXGQrKSI7JGRtID0gW3JlZ2V4XTo6TWF0Y2goJGNvbnRlbnQsICRkcCk7JHNpZ25zLCAkc2lnbiwgJHdlcywgJHZlcyA9ICRkbS5Hcm91cHNbMl0uVmFsdWUsICRkbS5Hcm91cHNbM10uVmFsdWUsICRkbS5Hcm91cHNbNF0uVmFsdWUsICRkbS5Hcm91cHNbNl0uVmFsdWU7JHdzcCA9ICJ2YXIgd3NrX3NpZ24gPSAnKFteJ10rKTsiOyR3ZXNLZXkgPSBbcmVnZXhdOjpNYXRjaCgkY29udGVudCwgJHdzcCkuR3JvdXBzWzFdLlZhbHVlOyRhZHAgPSAidmFyIGFqYXhkYXRhID0gJyhbXiddKyk7IjskYWpheGRhdGEgPSBbcmVnZXhdOjpNYXRjaCgkY29udGVudCwgJGFkcCkuR3JvdXBzWzFdLlZhbHVlOyR2ZXMgPSAiMSI7JGggPSBAeyJIb3N0IiA9ICJ3d2NyLmxhbnpvdWwuY29tIjsiT3JpZ2luIiA9ICRoZTsiUmVmZXJlciIgPSAkZmluYWxVcmx9OyRwb3N0RGF0YSA9IEB7ImFjdGlvbiIgPSAiZG93bnByb2Nlc3MiOyJzaWducyIgPSAkYWpheGRhdGE7InNpZ24iID0gJHNpZ25zOyJ3ZWJzaWduIiA9ICR3ZXM7IndlYnNpZ25rZXkiID0gJHdlc0tleTsidmVzIiA9ICR2ZXN9OyRwZFN0ciA9ICgkcG9zdERhdGEuS2V5cy5Gb3JFYWNoKHsgIiRfPSIgKyBbU3lzdGVtLldlYi5IdHRwVXRpbGl0eV06OlVybEVuY29kZSgkKCRwb3N0RGF0YVskX10pKSB9KSkgLWpvaW4gIiYiOyRhamF4bVVybCA9ICRoZSArICIvYWpheG0ucGhwIjskcmMyID0gKEludm9rZS1XZWJSZXF1ZXN0IC1VcmkgJGFqYXhtVXJsIC1NZXRob2QgUE9TVCAtQm9keSAkcGRTdHIgLUhlYWRlcnMgJGggLVVzZUJhc2ljUGFyc2luZykuQ29udGVudDtpZiAoJHJjMiAtbmUgJG51bGwpIHskcmVkaXJVcmwgPSAiJCgkKCRyYzIgfCBDb252ZXJ0RnJvbS1Kc29uKS5kb20pL2ZpbGUvJCgkKCRyYzIgfCBDb252ZXJ0RnJvbS1Kc29uKS51cmwpIn07JGggPSBAeydBY2NlcHQtTGFuZ3VhZ2UnID0gJ3poLUNOLHpoO3E9MC44J307JHIgPSBJbnZva2UtV2ViUmVxdWVzdCAtVXJpICRyZWRpclVybCAtSGVhZGVycyAkaCAtTWF4aW11bVJlZGlyZWN0aW9uIDAgLUVycm9yQWN0aW9uIFNpbGVudGx5Q29udGludWUgLVVzZUJhc2ljUGFyc2luZztpZiAoJHIuU3RhdHVzQ29kZSAtZXEgMzAyKSB7JGRsVXJsID0gJHIuSGVhZGVyc1snTG9jYXRpb24nXTtJbnZva2UtV2ViUmVxdWVzdCAtVXJpICRkbFVybCAtT3V0RmlsZSAkZmlsZU5hbWU7V3JpdGUtSG9zdCAkZmlsZU5hbWU7ZXhpdH0gZWxzZSB7V3JpdGUtSG9zdCAkci5TdGF0dXNDb2RlfQ=="
echo %Base64EncodedScript% | powershell -Command "[System.IO.File]::WriteAllText('decoded_script.ps1', [System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String((echo %Base64EncodedScript% | Out-String).Trim())))"
powershell -ExecutionPolicy Bypass -File decoded_script.ps1 -initialUrl %initialUrl%
timeout /t 2 > nul
echo "正在下载配置模板"
powershell -ExecutionPolicy Bypass -File decoded_script.ps1 -initialUrl %initialUrl2%
timeout /t 2 > nul
echo "正在下载JQ依赖(改协议类型用的)"
powershell -ExecutionPolicy Bypass -File decoded_script.ps1 -initialUrl %initialUrl3%
echo "正在设置ws地址"
set "wsAddress=ws://localhost:5140/onebot"
if exist config.yml del config.yml
if not exist config.txt (
    echo "config.txt不存在,请检查文件名。"
    pause
    goto menu
)
for /f "tokens=* delims=" %%a in (config.txt) do (
    set "line=%%a"
    set "line=!line:accounthere=%goqq%!"
    set "line=!line:ws://kawaiimahuateng:woaitengxun=%wsAddress%!"
    echo !line! >> config.yml
)
del config.txt
echo "接下来进入扫码环节,请在新弹出的gocq窗口,使用机器人小号,进行扫码"
echo "按回车进入扫码环节"
if exist device.json del device.json
pause
start gocq.exe -faststart
for /f "tokens=2 delims=," %%a in ('tasklist /nh /fi "imagename eq gocq.exe" /fo csv') do set pid=%%~a
timeout /t 3 > nul
taskkill /pid !pid! /f > nul
set "input_file=device.json"
set "output_file=device_temp.json"
if not exist %input_file% (
    echo File not found: %input_file%
    exit /b 1
)
echo Processing %input_file% ...
jq ".protocol = 2" %input_file% > %output_file%
move /y "%output_file%" "%input_file%" > nul
echo "成功" %input_file% "帮您修改了设备类型为扫码登录成功率高的手表"
start gocq.exe -faststart
echo "请在弹出的新窗口选择1,然后按下回车,扫码登录机器人"
echo "部署已完成,您需要配合koishi一起使用,机器人类型是gocq手表。如果扫码登录成功,下次启动请打开脚本,选择13启动机器人"
echo "启动成功后,koishi请关闭gocqhttp插件,然后在adapter-onebot中设置selfId(机器人的账号)为"%goqq%"并且确保adapter-onebot为启用状态"
echo "adapter-onebot的token请留空!"
echo "使用脚本所产生的所有问题请到群749890922直接at群主询问,避免给官方群带来困扰"
set /p returnHome="阅读完毕后,请输入序号(1)返回主菜单: "
if %returnHome%==1 goto menu
goto menu

:kstartwatch
echo "启动watch版本gocq"
start gocq.exe -faststart
pause >nul
chcp 65001
goto menu

:kgocq
echo "部署常规版本gocq"
set "INIFile=config.ini"
set "Section=set"
set "Key=updatetime"
set "initialUrl=https://wwcr.lanzoul.com/gocq2"
set "initialUrl2=https://wwcr.lanzoul.com/config521"
set "initialUrl3=https://wwcr.lanzoul.com/device888"
set "initialUrl4=https://wwcr.lanzoul.com/proto888"
if not exist %INIFile% (
    echo [set] > %INIFile%
    echo updatetime=0 >> %INIFile%
)

:getInput
set /p goqq="请输入你要做成机器人的小号: "
if %goqq%==1 goto menu
set "INIFile=config.ini"

:getpassword
set /p password="请输入你要做成机器人的小号的密码(密码仅在本地存储,不会上传): "
if %password%==1 goto menu

:: 更新INI文件的字段
(
    echo [set]
    echo goqq=%goqq%
) > %INIFile%

echo "正在下载gocq"
set "Base64EncodedScript=cGFyYW0oJGluaXRpYWxVcmwpO0FkZC1UeXBlIC1Bc3NlbWJseU5hbWUgU3lzdGVtLldlYjskaGUgPSAiaHR0cHM6Ly93d2NyLmxhbnpvdWwuY29tIjtmdW5jdGlvbiBkKCR1LCAkciwgJHdzKSB7JGggPSBAe307aWYoJHIpIHskaFsiUmVmZXJlciJdID0gJHJ9OyRyID0gSW52b2tlLVdlYlJlcXVlc3QgLVVyaSAkdSAtSGVhZGVycyAkaCAtV2ViU2Vzc2lvbiAkd3MgLVVzZUJhc2ljUGFyc2luZztyZXR1cm4gJHJ9OyR3cyA9IE5ldy1PYmplY3QgTWljcm9zb2Z0LlBvd2VyU2hlbGwuQ29tbWFuZHMuV2ViUmVxdWVzdFNlc3Npb247JHJlcyA9IGQgJGluaXRpYWxVcmwgJG51bGwgJHdzOyRodG1sID0gJHJlcy5Db250ZW50OyRjb29raWVzID0gJHdzLkNvb2tpZXMuR2V0Q29va2llcygkaW5pdGlhbFVybCk7JHNyY1N0YXJ0SW5kZXggPSAkaHRtbC5JbmRleE9mKCJ0aXRsZSIpOyRzcmNFbmRJbmRleCA9ICRodG1sLkluZGV4T2YoIi90aXRsZSIsICRzcmNTdGFydEluZGV4KTskZmlsZW5hbWUgPSAkaHRtbC5TdWJzdHJpbmcoJHNyY1N0YXJ0SW5kZXgsICRzcmNFbmRJbmRleCAtICRzcmNTdGFydEluZGV4IC0gMSk7JHNyY1N0YXJ0SW5kZXggPSAkaHRtbC5JbmRleE9mKCJuX2JveF8zZm4iKTskc3JjRW5kSW5kZXggPSAkaHRtbC5JbmRleE9mKCIgZnJhbWVib3JkZXI9IiwgJHNyY1N0YXJ0SW5kZXgpOyRodG1sID0gJGh0bWwuU3Vic3RyaW5nKCRzcmNTdGFydEluZGV4LCAkc3JjRW5kSW5kZXggLSAkc3JjU3RhcnRJbmRleCAtIDEpOyRzcmNTdGFydEluZGV4ID0gJGh0bWwuSW5kZXhPZignc3JjPSIvZm4nKSArIDU7JGlmclNyYyA9ICRodG1sLlN1YnN0cmluZygkc3JjU3RhcnRJbmRleCk7JHN1YnN0cmluZyA9ICRmaWxlbmFtZS5TdWJzdHJpbmcoNik7JG5ld0xlbmd0aCA9ICRzdWJzdHJpbmcuTGVuZ3RoIC0gNjskZmlsZW5hbWUgPSAkc3Vic3RyaW5nLlN1YnN0cmluZygwLCAkbmV3TGVuZ3RoKTskZmluYWxVcmwgPSAkaGUgKyAkaWZyU3JjOyRyZXEgPSBbU3lzdGVtLk5ldC5IdHRwV2ViUmVxdWVzdF06OkNyZWF0ZSgkZmluYWxVcmwpOyRyZXEuTWV0aG9kID0gIkdFVCI7Zm9yZWFjaCAoJGsgaW4gJGguS2V5cykgeyRyZXEuSGVhZGVycy5BZGQoJGssICRoWyRrXSl9O2lmICgkcikgeyRyZXEuUmVmZXJlciA9ICRyfTskcmVzID0gJHJlcS5HZXRSZXNwb25zZSgpOyRyZWFkZXIgPSBOZXctT2JqZWN0IFN5c3RlbS5JTy5TdHJlYW1SZWFkZXIoJHJlcy5HZXRSZXNwb25zZVN0cmVhbSgpKTskY29udGVudCA9ICRyZWFkZXIuUmVhZFRvRW5kKCk7JGRwID0gImRhdGEgOiBceyAnYWN0aW9uJzonKFteJ10rKScsXHMqJ3NpZ25zJzphamF4ZGF0YSxccyonc2lnbic6JyhbXiddKyknLFxzKid3ZWJzaWduJzp3c19zaWduLFxzKid3ZWJzaWdua2V5Jzp3c2tfc2lnbixccyondmVzJzooXGQrKSI7JGRtID0gW3JlZ2V4XTo6TWF0Y2goJGNvbnRlbnQsICRkcCk7JHNpZ25zLCAkc2lnbiwgJHdlcywgJHZlcyA9ICRkbS5Hcm91cHNbMl0uVmFsdWUsICRkbS5Hcm91cHNbM10uVmFsdWUsICRkbS5Hcm91cHNbNF0uVmFsdWUsICRkbS5Hcm91cHNbNl0uVmFsdWU7JHdzcCA9ICJ2YXIgd3NrX3NpZ24gPSAnKFteJ10rKTsiOyR3ZXNLZXkgPSBbcmVnZXhdOjpNYXRjaCgkY29udGVudCwgJHdzcCkuR3JvdXBzWzFdLlZhbHVlOyRhZHAgPSAidmFyIGFqYXhkYXRhID0gJyhbXiddKyk7IjskYWpheGRhdGEgPSBbcmVnZXhdOjpNYXRjaCgkY29udGVudCwgJGFkcCkuR3JvdXBzWzFdLlZhbHVlOyR2ZXMgPSAiMSI7JGggPSBAeyJIb3N0IiA9ICJ3d2NyLmxhbnpvdWwuY29tIjsiT3JpZ2luIiA9ICRoZTsiUmVmZXJlciIgPSAkZmluYWxVcmx9OyRwb3N0RGF0YSA9IEB7ImFjdGlvbiIgPSAiZG93bnByb2Nlc3MiOyJzaWducyIgPSAkYWpheGRhdGE7InNpZ24iID0gJHNpZ25zOyJ3ZWJzaWduIiA9ICR3ZXM7IndlYnNpZ25rZXkiID0gJHdlc0tleTsidmVzIiA9ICR2ZXN9OyRwZFN0ciA9ICgkcG9zdERhdGEuS2V5cy5Gb3JFYWNoKHsgIiRfPSIgKyBbU3lzdGVtLldlYi5IdHRwVXRpbGl0eV06OlVybEVuY29kZSgkKCRwb3N0RGF0YVskX10pKSB9KSkgLWpvaW4gIiYiOyRhamF4bVVybCA9ICRoZSArICIvYWpheG0ucGhwIjskcmMyID0gKEludm9rZS1XZWJSZXF1ZXN0IC1VcmkgJGFqYXhtVXJsIC1NZXRob2QgUE9TVCAtQm9keSAkcGRTdHIgLUhlYWRlcnMgJGggLVVzZUJhc2ljUGFyc2luZykuQ29udGVudDtpZiAoJHJjMiAtbmUgJG51bGwpIHskcmVkaXJVcmwgPSAiJCgkKCRyYzIgfCBDb252ZXJ0RnJvbS1Kc29uKS5kb20pL2ZpbGUvJCgkKCRyYzIgfCBDb252ZXJ0RnJvbS1Kc29uKS51cmwpIn07JGggPSBAeydBY2NlcHQtTGFuZ3VhZ2UnID0gJ3poLUNOLHpoO3E9MC44J307JHIgPSBJbnZva2UtV2ViUmVxdWVzdCAtVXJpICRyZWRpclVybCAtSGVhZGVycyAkaCAtTWF4aW11bVJlZGlyZWN0aW9uIDAgLUVycm9yQWN0aW9uIFNpbGVudGx5Q29udGludWUgLVVzZUJhc2ljUGFyc2luZztpZiAoJHIuU3RhdHVzQ29kZSAtZXEgMzAyKSB7JGRsVXJsID0gJHIuSGVhZGVyc1snTG9jYXRpb24nXTtJbnZva2UtV2ViUmVxdWVzdCAtVXJpICRkbFVybCAtT3V0RmlsZSAkZmlsZU5hbWU7V3JpdGUtSG9zdCAkZmlsZU5hbWU7ZXhpdH0gZWxzZSB7V3JpdGUtSG9zdCAkci5TdGF0dXNDb2RlfQ=="
echo %Base64EncodedScript% | powershell -Command "[System.IO.File]::WriteAllText('decoded_script.ps1', [System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String((echo %Base64EncodedScript% | Out-String).Trim())))"
powershell -ExecutionPolicy Bypass -File decoded_script.ps1 -initialUrl %initialUrl%
timeout /t 2 > nul
echo "正在下载配置模板"
powershell -ExecutionPolicy Bypass -File decoded_script.ps1 -initialUrl %initialUrl2%
timeout /t 2 > nul
if exist device.json del device.json
echo "正在下载8888协议-device"
powershell -ExecutionPolicy Bypass -File decoded_script.ps1 -initialUrl %initialUrl3%
timeout /t 2 > nul
if exist device.txt (
    ren device.txt device.json
) else (
    echo "device.txt 未找到，请检查下载过程是否成功。"
)
echo "正在下载8888协议-protocol"
powershell -ExecutionPolicy Bypass -File decoded_script.ps1 -initialUrl %initialUrl4%
if exist 1.txt (
    ren 1.txt 1.json
) else (
    echo "1.txt 未找到，请检查下载过程是否成功。"
)
echo "正在设置ws地址"
set "wsAddress=ws://localhost:5140/onebot"
if exist config.yml del config.yml
if not exist config.txt (
    echo "config.txt不存在,请检查文件名。"
    pause
    goto menu
)
for /f "tokens=* delims=" %%a in (config.txt) do (
    set "line=%%a"
    set "line=!line:accounthere=%goqq%!"
    set "line=!line:ws://kawaiimahuateng:woaitengxun=%wsAddress%!"
    set "line=!line:passwordhere=%password%!"
    echo !line! >> config.yml
)
del config.txt
echo "接下来进入扫码环节,请在新弹出的gocq窗口,使用机器人小号,进行扫码"
echo "按回车进入扫码环节"
pause
start gocq2.exe -faststart
for /f "tokens=2 delims=," %%a in ('tasklist /nh /fi "imagename eq gocq2.exe" /fo csv') do set pid=%%~a
timeout /t 2 > nul
taskkill /pid !pid! /f > nul
move 1.json data\versions\ > nul
start gocq2.exe -faststart
echo "请在弹出的新窗口选择1,然后按下回车,扫码登录机器人"
echo "部署已完成,您需要配合koishi一起使用,机器人类型是gocq手表。如果扫码登录成功,下次启动请打开脚本,选择13启动机器人"
echo "启动成功后,koishi请关闭gocqhttp插件,然后在adapter-onebot中设置selfId(机器人的账号)为"%goqq%"并且确保adapter-onebot为启用状态"
echo "adapter-onebot的token请留空!"
echo "使用脚本所产生的所有问题请到群749890922直接at群主询问,避免给官方群带来困扰"
set /p returnHome="阅读完毕后,请输入序号(1)返回主菜单: "
if %returnHome%==1 goto menu
goto menu

:kstartgocq
echo "启动8888版本gocq"
start gocq2.exe -faststart
pause >nul
chcp 65001
goto menu


:deploykook
echo "部署kook机器人"
set "INIFile=config.ini"
set "Section=set"
set "Key=updatetime"
set "initialUrl=https://wwcr.lanzoul.com/kook"
if not exist %INIFile% (
    echo [set] > %INIFile%
    echo updatetime=0 >> %INIFile%
)
echo "正在下载kook适配器"
set "Base64EncodedScript=cGFyYW0oJGluaXRpYWxVcmwpO0FkZC1UeXBlIC1Bc3NlbWJseU5hbWUgU3lzdGVtLldlYjskaGUgPSAiaHR0cHM6Ly93d2NyLmxhbnpvdWwuY29tIjtmdW5jdGlvbiBkKCR1LCAkciwgJHdzKSB7JGggPSBAe307aWYoJHIpIHskaFsiUmVmZXJlciJdID0gJHJ9OyRyID0gSW52b2tlLVdlYlJlcXVlc3QgLVVyaSAkdSAtSGVhZGVycyAkaCAtV2ViU2Vzc2lvbiAkd3MgLVVzZUJhc2ljUGFyc2luZztyZXR1cm4gJHJ9OyR3cyA9IE5ldy1PYmplY3QgTWljcm9zb2Z0LlBvd2VyU2hlbGwuQ29tbWFuZHMuV2ViUmVxdWVzdFNlc3Npb247JHJlcyA9IGQgJGluaXRpYWxVcmwgJG51bGwgJHdzOyRodG1sID0gJHJlcy5Db250ZW50OyRjb29raWVzID0gJHdzLkNvb2tpZXMuR2V0Q29va2llcygkaW5pdGlhbFVybCk7JHNyY1N0YXJ0SW5kZXggPSAkaHRtbC5JbmRleE9mKCJ0aXRsZSIpOyRzcmNFbmRJbmRleCA9ICRodG1sLkluZGV4T2YoIi90aXRsZSIsICRzcmNTdGFydEluZGV4KTskZmlsZW5hbWUgPSAkaHRtbC5TdWJzdHJpbmcoJHNyY1N0YXJ0SW5kZXgsICRzcmNFbmRJbmRleCAtICRzcmNTdGFydEluZGV4IC0gMSk7JHNyY1N0YXJ0SW5kZXggPSAkaHRtbC5JbmRleE9mKCJuX2JveF8zZm4iKTskc3JjRW5kSW5kZXggPSAkaHRtbC5JbmRleE9mKCIgZnJhbWVib3JkZXI9IiwgJHNyY1N0YXJ0SW5kZXgpOyRodG1sID0gJGh0bWwuU3Vic3RyaW5nKCRzcmNTdGFydEluZGV4LCAkc3JjRW5kSW5kZXggLSAkc3JjU3RhcnRJbmRleCAtIDEpOyRzcmNTdGFydEluZGV4ID0gJGh0bWwuSW5kZXhPZignc3JjPSIvZm4nKSArIDU7JGlmclNyYyA9ICRodG1sLlN1YnN0cmluZygkc3JjU3RhcnRJbmRleCk7JHN1YnN0cmluZyA9ICRmaWxlbmFtZS5TdWJzdHJpbmcoNik7JG5ld0xlbmd0aCA9ICRzdWJzdHJpbmcuTGVuZ3RoIC0gNjskZmlsZW5hbWUgPSAkc3Vic3RyaW5nLlN1YnN0cmluZygwLCAkbmV3TGVuZ3RoKTskZmluYWxVcmwgPSAkaGUgKyAkaWZyU3JjOyRyZXEgPSBbU3lzdGVtLk5ldC5IdHRwV2ViUmVxdWVzdF06OkNyZWF0ZSgkZmluYWxVcmwpOyRyZXEuTWV0aG9kID0gIkdFVCI7Zm9yZWFjaCAoJGsgaW4gJGguS2V5cykgeyRyZXEuSGVhZGVycy5BZGQoJGssICRoWyRrXSl9O2lmICgkcikgeyRyZXEuUmVmZXJlciA9ICRyfTskcmVzID0gJHJlcS5HZXRSZXNwb25zZSgpOyRyZWFkZXIgPSBOZXctT2JqZWN0IFN5c3RlbS5JTy5TdHJlYW1SZWFkZXIoJHJlcy5HZXRSZXNwb25zZVN0cmVhbSgpKTskY29udGVudCA9ICRyZWFkZXIuUmVhZFRvRW5kKCk7JGRwID0gImRhdGEgOiBceyAnYWN0aW9uJzonKFteJ10rKScsXHMqJ3NpZ25zJzphamF4ZGF0YSxccyonc2lnbic6JyhbXiddKyknLFxzKid3ZWJzaWduJzp3c19zaWduLFxzKid3ZWJzaWdua2V5Jzp3c2tfc2lnbixccyondmVzJzooXGQrKSI7JGRtID0gW3JlZ2V4XTo6TWF0Y2goJGNvbnRlbnQsICRkcCk7JHNpZ25zLCAkc2lnbiwgJHdlcywgJHZlcyA9ICRkbS5Hcm91cHNbMl0uVmFsdWUsICRkbS5Hcm91cHNbM10uVmFsdWUsICRkbS5Hcm91cHNbNF0uVmFsdWUsICRkbS5Hcm91cHNbNl0uVmFsdWU7JHdzcCA9ICJ2YXIgd3NrX3NpZ24gPSAnKFteJ10rKTsiOyR3ZXNLZXkgPSBbcmVnZXhdOjpNYXRjaCgkY29udGVudCwgJHdzcCkuR3JvdXBzWzFdLlZhbHVlOyRhZHAgPSAidmFyIGFqYXhkYXRhID0gJyhbXiddKyk7IjskYWpheGRhdGEgPSBbcmVnZXhdOjpNYXRjaCgkY29udGVudCwgJGFkcCkuR3JvdXBzWzFdLlZhbHVlOyR2ZXMgPSAiMSI7JGggPSBAeyJIb3N0IiA9ICJ3d2NyLmxhbnpvdWwuY29tIjsiT3JpZ2luIiA9ICRoZTsiUmVmZXJlciIgPSAkZmluYWxVcmx9OyRwb3N0RGF0YSA9IEB7ImFjdGlvbiIgPSAiZG93bnByb2Nlc3MiOyJzaWducyIgPSAkYWpheGRhdGE7InNpZ24iID0gJHNpZ25zOyJ3ZWJzaWduIiA9ICR3ZXM7IndlYnNpZ25rZXkiID0gJHdlc0tleTsidmVzIiA9ICR2ZXN9OyRwZFN0ciA9ICgkcG9zdERhdGEuS2V5cy5Gb3JFYWNoKHsgIiRfPSIgKyBbU3lzdGVtLldlYi5IdHRwVXRpbGl0eV06OlVybEVuY29kZSgkKCRwb3N0RGF0YVskX10pKSB9KSkgLWpvaW4gIiYiOyRhamF4bVVybCA9ICRoZSArICIvYWpheG0ucGhwIjskcmMyID0gKEludm9rZS1XZWJSZXF1ZXN0IC1VcmkgJGFqYXhtVXJsIC1NZXRob2QgUE9TVCAtQm9keSAkcGRTdHIgLUhlYWRlcnMgJGggLVVzZUJhc2ljUGFyc2luZykuQ29udGVudDtpZiAoJHJjMiAtbmUgJG51bGwpIHskcmVkaXJVcmwgPSAiJCgkKCRyYzIgfCBDb252ZXJ0RnJvbS1Kc29uKS5kb20pL2ZpbGUvJCgkKCRyYzIgfCBDb252ZXJ0RnJvbS1Kc29uKS51cmwpIn07JGggPSBAeydBY2NlcHQtTGFuZ3VhZ2UnID0gJ3poLUNOLHpoO3E9MC44J307JHIgPSBJbnZva2UtV2ViUmVxdWVzdCAtVXJpICRyZWRpclVybCAtSGVhZGVycyAkaCAtTWF4aW11bVJlZGlyZWN0aW9uIDAgLUVycm9yQWN0aW9uIFNpbGVudGx5Q29udGludWUgLVVzZUJhc2ljUGFyc2luZztpZiAoJHIuU3RhdHVzQ29kZSAtZXEgMzAyKSB7JGRsVXJsID0gJHIuSGVhZGVyc1snTG9jYXRpb24nXTtJbnZva2UtV2ViUmVxdWVzdCAtVXJpICRkbFVybCAtT3V0RmlsZSAkZmlsZU5hbWU7V3JpdGUtSG9zdCAkZmlsZU5hbWU7ZXhpdH0gZWxzZSB7V3JpdGUtSG9zdCAkci5TdGF0dXNDb2RlfQ=="
echo %Base64EncodedScript% | powershell -Command "[System.IO.File]::WriteAllText('decoded_script.ps1', [System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String((echo %Base64EncodedScript% | Out-String).Trim())))"
powershell -ExecutionPolicy Bypass -File decoded_script.ps1 -initialUrl %initialUrl%
:menu3
cls
echo "请问是否申请了kook机器人~"
echo "1. 已经申请,开始部署"
echo "2. 没有申请"
echo "3. 退出"
set /p choice="请输入序号(1、2 或 3): "
if %choice%==1 goto getInput2
if %choice%==2 goto applyBot2
if %choice%==3 goto exithere
goto menu3

:applyBot2
echo "请访问以下链接,按照教程申请kook机器人(非常简单):"
echo "按下键盘ctrl并单击可以直接跳转,或复制到浏览器访问："
echo "https://www.bilibili.com/read/cv19871743"
echo.
echo "已经申请请输入1,没有申请请输入2(输入2返回主菜单)"
set /p applyBot="请输入序号(1 或 2): "
if %applyBot%==1 goto getInput2
if %applyBot%==2 goto menu
goto applyBot2

:getInput2
echo "按下ctrl键并单击后方链接,打开机器人后台https://developer.kookapp.cn/bot"
echo "打开后按回车继续操作...."
pause
echo "点击新建应用..输入喜欢的名字，创建你的机器人"
echo "创建后按回车继续操作...."
pause
echo "点击你刚刚创建的机器人头像，进入管理页面，点击左侧机器人栏(位于OAuth2下方)"
echo "点击后按回车继续操作...."
pause
echo "请输入你的token后按下回车"
goto input_token

:after_input_token
echo "请打开下方公共机器人的开关,否则机器人可能会工作不正常"
pause
echo "点击左侧,机器人下方的邀请链接"
echo "勾选机器人需要的权限(小白建议全部都勾选)"
echo "勾选完成后,请复制上方的机器人邀请链接,储存起来"
echo "重要!这个是让机器人加入kook频道的链接,部署好后请复制到浏览器访问一次"
echo "以后要机器人再次加别的频道都需要用到这个链接,一定要记得它的位置"
echo "勾选好后按回车继续操作...."
pause
set "INIFile=config.ini"
goto chooseBot

:input_token
set /p kooktoken="(token位于机器人连接模式下方,点击复制按钮,找不到输入10放弃并返回主页进群询问作者): "
if "%kooktoken%"=="10" goto menu
if "%kooktoken%"=="" (
    echo "请输入token或输入10退出。"
    goto input_token
)
goto after_input_token

:chooseBot
cls
echo "请问您需要哪种机器人？"
echo "1. 早苗"
echo "2. 早苗版澪"
echo "3. 早苗版浅羽"
echo "4. 经典版澪"
echo "5. 经典版浅羽"
echo "6. 云崽"
echo "7. 手动填写端口号(适合需要迁移存档的用户)"
set /p botChoice="请输入序号(1-7): "

if %botChoice%==1 set /a kookport=20000+(!random!%%131)
if %botChoice%==2 set /a kookport=20050+(!random!%%21)
if %botChoice%==3 set /a kookport=20071+(!random!%%29)
if %botChoice%==4 set kookport=25370
if %botChoice%==5 set kookport=25371
if %botChoice%==6 set kookport=25369
if %botChoice%==7 (set /p kookport="请输入端口号：")

for /f "tokens=2 delims==" %%a in ('wmic OS Get localdatetime /value') do set "CurrentTimestamp=%%a"
set "CurrentTimestamp=%CurrentTimestamp:~0,14%"

:: 更新INI文件的字段
(
    echo [set]
    echo kooktoken="%kooktoken%"
    echo kookport=%kookport%
) > %INIFile%

echo "部署已完成，您的端口号是%kookport%，机器人类型是%botChoice%。请输入1回到主页,选择17,启动kook机器人"
set /p returnHome="请输入序号(1): "
if %returnHome%==1 goto menu
goto menu

:startkook
echo "启动kook机器人"
set "INIFile=config.ini"
pushd "%~dp0"
for /F "usebackq tokens=1,* delims==" %%a in ("%INIFile%") do (
    if %%a==kooktoken set "kooktoken=%%~b"
    if %%a==kookport set kookport=%%b
)
popd
set "wsAddress=ws://zaomiao.com:%kookport%"
echo "kook机器人已启动,按任意键返回主菜单..."
chcp 936
start /b kook.exe %wsAddress% %kooktoken%
pause >nul
chcp 65001
goto menu
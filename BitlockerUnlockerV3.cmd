@echo off
:start
echo++++++++++++++++++++++++Bitlocker Unlock Tool+++++++++++++++++++++++
echo                        5/15/2018
echo                        by Shawn Trockman
echo                        shawn@shawntrockman.com
echo++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
echo 1)Status							       
echo 2)Turn BitLocker on						       
echo 3)Turn Bitlocker off
echo 4)Unlock Bitlocker volume
echo 5)Lock Bitlocker volume
echo 6)Get Bitlocker credentials
echo 7)exit
echo++++++++++++++++++++++++Instructions++++++++++++++++++++++++++++++++
echo First input the drive you are going to be working on for example,
echo C:. Then enter your Bitlocker key. If drive is already unlocked or
echo you are just checking the status of the drive you do not need to
echo enter a key. Lastly choose what you would like to do from the list
echo above by inputing that options number (1-7). For instance
echo if you would like to check the status of a drive input the number
echo 1.			       
echo++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
echo Drive: %drive%
echo Key: %key%
echo++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
set /p drive="What drive are you working on:"

echo you are working on drive %drive%


set /p key="What is your Bitlocker key (not required if enabling bitlocker or checking status):"

echo your bitlocker key is %key%


set /p option="What would you like to do?:"
 
if %option%==1 (manage-bde -status)

if %option%==2 (manage-bde -on %drive% -recoverypassword -SkipHardwareTest)

if %option%==3 (
manage-bde -unlock %drive% -RecoveryPassword %key%

pause

manage-bde -off %drive%
)

if %option%==4 (manage-bde -unlock %drive% -RecoveryPassword %key%)

if %option%==5 (manage-bde -lock %drive$)

if %option%==6 (

manage-bde -protectors %drive% -get

pause
)

if %option%==7 (exit)

pause

cls

goto start





rem Batch file to copy the necessary files for the Windows Installer
rem Please adapt environment variables in section 1) to your system

rem useful links
rem http://technet.microsoft.com/en-us/library/bb491035.aspx
rem http://vlaurie.com/computers2/Articles/environment.htm

rem Section 1.) Define path to Qt, MSVC, .... installations
set QMSI_QT_PATH="C:\Qt5\5.4\msvc2013"
rem get the VC redistributable installer from http://www.microsoft.com/en-us/download/details.aspx?id=40784
set QMSI_VCREDIST_PATH="M:\deploy"
rem set QLGTI_LIBEXIF_PATH="D:\qlgt\tools\libexif"
set QMSI_GDAL_PATH="M:\lib32\gdal"
set QMSI_PROJ_PATH="M:\lib32\PROJ"

rem Section 2.) Copy Files
del /s/q Files32
mkdir Files32
cd Files32

rem Section 2.1) Copy Qt files
copy %QMSI_QT_PATH%\bin\Qt5Core.dll
copy %QMSI_QT_PATH%\bin\Qt5Gui.dll
copy %QMSI_QT_PATH%\bin\Qt5Multimedia.dll
copy %QMSI_QT_PATH%\bin\Qt5MultimediaWidgets.dll
copy %QMSI_QT_PATH%\bin\Qt5Network.dll
copy %QMSI_QT_PATH%\bin\Qt5OpenGL.dll
copy %QMSI_QT_PATH%\bin\Qt5Positioning.dll
copy %QMSI_QT_PATH%\bin\Qt5PrintSupport.dll
copy %QMSI_QT_PATH%\bin\Qt5Qml.dll
copy %QMSI_QT_PATH%\bin\Qt5Quick.dll
copy %QMSI_QT_PATH%\bin\Qt5Script.dll
copy %QMSI_QT_PATH%\bin\Qt5Sensors.dll
copy %QMSI_QT_PATH%\bin\Qt5Sql.dll
copy %QMSI_QT_PATH%\bin\Qt5Svg.dll
copy %QMSI_QT_PATH%\bin\Qt5WebChannel.dll
copy %QMSI_QT_PATH%\bin\Qt5WebKit.dll
copy %QMSI_QT_PATH%\bin\Qt5WebKitWidgets.dll
copy %QMSI_QT_PATH%\bin\Qt5Widgets.dll
copy %QMSI_QT_PATH%\bin\Qt5Xml.dll
copy %QMSI_QT_PATH%\bin\icudt53.dll
copy %QMSI_QT_PATH%\bin\icuin53.dll
copy %QMSI_QT_PATH%\bin\icuuc53.dll
copy %QMSI_QT_PATH%\bin\libEGL.dll
copy %QMSI_QT_PATH%\bin\libGLESv2.dll
mkdir imageformats
cd imageformats
copy %QMSI_QT_PATH%\plugins\imageformats\qgif.dll
copy %QMSI_QT_PATH%\plugins\imageformats\qjpeg.dll
copy %QMSI_QT_PATH%\plugins\imageformats\qmng.dll
copy %QMSI_QT_PATH%\plugins\imageformats\qsvg.dll
copy %QMSI_QT_PATH%\plugins\imageformats\qtiff.dll
copy %QMSI_QT_PATH%\plugins\imageformats\qico.dll
copy %QMSI_QT_PATH%\plugins\imageformats\qtga.dll
cd ..
mkdir sqldrivers
cd sqldrivers
copy %QMSI_QT_PATH%\plugins\sqldrivers\qsqlite.dll
cd ..
mkdir platforms
cd platforms
copy %QMSI_QT_PATH%\plugins\platforms\qwindows.dll
cd ..
rem The qt_??.qm files must have been created before by
rem opening a qt shell, going to the translations directory and running
rem for %f in (qt_??.ts) do lrelease %f
rem Oops, probably they are already preinstalled for Qt5
copy %QMSI_QT_PATH%\translations\qt_??.qm

rem section 2.2) Copy GDAL and PROJ.4 Files 
rem   put them in the same directory as the .exe for better testing
rem section 2.2.1) GDAL
xcopy %QMSI_GDAL_PATH%\data data /s /i
copy %QMSI_GDAL_PATH%\bin\*.dll
copy %QMSI_GDAL_PATH%\bin\*.exe
rem section 2.2.4) PROJ.4
xcopy %QMSI_PROJ_PATH%\share share /s /i
copy %QMSI_PROJ_PATH%\bin\*.dll
copy %QMSI_PROJ_PATH%\bin\proj.exe

rem section 2.3) Copy MSVC Redist Files
copy %QMSI_VCREDIST_PATH%\vcredist_x86.exe
rem section 2.4) Copy libexif Files
rem copy %QLGTI_LIBEXIF_PATH%\libexif-12.dll
rem section 2.5) Copy QMapShack GT Files
copy ..\..\build32\bin\Release\qmapshack.exe
copy ..\..\build32\src\*.qm
copy ..\*.ico
rem section 2.6) 3rd party SW description
copy ..\3rdparty.txt

pause
:: --------------------------------
:: WINDOWS SYSPATH SWITCHER COMMAND
:: --------------------------------

:: ##SCRIPT
@set root=%~dp0.
@echo ##Loading Path Config File...
@set "pathConfig_file=%root%\.pathConfig.bat"
@call %pathConfig_file%

:: Command Parameters
@set "use_program=%~1"
@set "use_version=%~2"

@if "%use_program%"=="gradle" goto GRADLE
@if "%use_program%"=="java" goto JAVA

:GRADLE
@set gradle_home=%path_gradle_prefix%%use_version%
@if not exist "%gradle_home%" (@echo GRADLE BIN NOT FOUND AT: "%gradle_home%" & goto END)
@set path=%path%;%gradle_home%\bin
@echo Successfully added "%gradle_home%\bin" to syspath.

:JAVA
@goto END

:END
@goto :EOF
@echo off
REM @author Michael Gantman 
REM The program, when run, prompts the user to input a directory. It then scans files in the current directory, 
REM comparing them with those in the specified directory. If a match is found based on file names, 
REM it overrides the file in the specified directory with the one in the current directory.
REM Finally, it reports the total number of files overridden before pausing for user interaction.

set Verzeichnis="%~dp0"
set TempVerzeichnis=NULL
set /a Zaehler=0

set /p Laufwerk="Insert a Directory:"

echo -----------------------------------------------
echo STARTING
echo -----------------------------------------------


for %%F in ("%Verzeichnis%*") do (
        REM echo %%F
        cd /D %Laufwerk%
	for /r "%Laufwerk%" %%S in (*) do (
		REM echo %%S
		if %%F == %%S (
			REM NOTHING
		) else (
			if %%~nxF == %~nx0 (
				REM NOTHING
			) else (
				if %%~nxF == %%~nxS (
                        		echo -----------------------------------------------
					echo OVERRIDING -- %%~nxS -- %%S
                        		echo -----------------------------------------------
					copy /y %%F %%S
					set /a Zaehler+=1
				) else (
					REM NOTHING
				)	
    
			) 
		)
	)
)

cd %Verzeichnis%
echo -----------------------------------------------
echo Overrode  %Zaehler% Files
echo -----------------------------------------------
pause
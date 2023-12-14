@echo off

set Verzeichnis="%~dp0"
set TempVerzeichnis=NULL
set /a Zaehler=0

set /p Laufwerk="Gib mir ein Verzeichnis:"

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
					REM echo nicht gut diese
				)	
    
			) 
		)
	)
)

cd %Verzeichnis%
echo -----------------------------------------------
echo Overrode  %Zaehler% Files
echo -----------------------------------------------
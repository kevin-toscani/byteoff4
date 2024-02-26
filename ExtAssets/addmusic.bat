@echo off
echo Converting Famitracker txt to asm...
python sabre_ft_txt.py BO4.dnm.txt
echo Moving asm files to correct folder...
move /Y BO4.dnm_*.asm ..\GameEngineData\Routines\BO4\Sound
echo All done!
pause
echo on
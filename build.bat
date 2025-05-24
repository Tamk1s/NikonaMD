@ECHO OFF
CLS
set AS_MSGPATH=tools/AS
set USEANSI=n

echo *** Building EMULATOR-ONLY ROMs ***
echo * MD
"tools/AS/asw" main.asm -i "%cd%" -olist "out/emu/rom_emu_md.lst" -q -xx -A -L -D MCD=0,MARS=0,MARSCD=0,PICO=0,COPERA=0,PICO_MODS=0,PICO_REV=0,EMU=1
python "tools/p2bin.py" main.p "out/emu/rom_emu_md.bin"

echo * PICO
REM !@
"tools/AS/asw" main.asm -i "%cd%" -olist "out/emu/rom_emu_pico_rev1.lst" -q -xx -A -L -D MCD=0,MARS=0,MARSCD=0,PICO=1,COPERA=0,PICO_MODS=0,PICO_REV=0,EMU=1
python "tools/p2bin.py" main.p "out/emu/rom_emu_pico_rev1.bin"
"tools/AS/asw" main.asm -i "%cd%" -olist "out/emu/rom_emu_pico_rev2.lst" -q -xx -A -L -D MCD=0,MARS=0,MARSCD=0,PICO=1,COPERA=0,PICO_MODS=0,PICO_REV=1,EMU=1
python "tools/p2bin.py" main.p "out/emu/rom_emu_pico_rev2.bin"
"tools/AS/asw" main.asm -i "%cd%" -olist "out/emu/rom_emu_rev1m.lst" -q -xx -A -L -D MCD=0,MARS=0,MARSCD=0,PICO=1,COPERA=0,PICO_MODS=1,PICO_REV=0,EMU=1
python "tools/p2bin.py" main.p "out/emu/rom_emu_pico_rev1m.bin"
"tools/AS/asw" main.asm -i "%cd%" -olist "out/emu/rom_emu_pico_rev2m.lst" -q -xx -A -L -D MCD=0,MARS=0,MARSCD=0,PICO=1,COPERA=0,PICO_MODS=1,PICO_REV=1,EMU=1
python "tools/p2bin.py" main.p "out/emu/rom_emu_pico_rev2m.bin"
"tools/AS/asw" main.asm -i "%cd%" -olist "out/emu/rom_emu_copera.lst" -q -xx -A -L -D MCD=0,MARS=0,MARSCD=0,PICO=1,COPERA=1,PICO_MODS=0,PICO_REV=0,EMU=1
python "tools/p2bin.py" main.p "out/emu/rom_emu_copera.bin"
"tools/AS/asw" main.asm -i "%cd%" -olist "out/emu/rom_emu_coperam.lst" -q -xx -A -L -D MCD=0,MARS=0,MARSCD=0,PICO=1,COPERA=1,PICO_MODS=1,PICO_REV=0,EMU=1
python "tools/p2bin.py" main.p "out/emu/rom_emu_coperam.bin"
REM !@
echo * PICO pages
python "tools/scripts/PICO/page_data.py" "rom_emu_pico_rev1" 0
python "tools/scripts/PICO/page_data.py" "rom_emu_pico_rev2" 0
python "tools/scripts/PICO/page_data.py" "rom_emu_pico_rev1m" 0
python "tools/scripts/PICO/page_data.py" "rom_emu_pico_rev2m" 0
python "tools/scripts/PICO/page_data.py" "rom_emu_copera" 0
python "tools/scripts/PICO/page_data.py" "rom_emu_coperam" 0
echo * 32X
"tools/AS/asw" main.asm -i "%cd%" -olist "out/emu/rom_emu_mars.lst" -q -xx -A -L -D MCD=0,MARS=1,MARSCD=0,PICO=0,COPERA=0,PICO_MODS=0,PICO_REV=0,EMU=1
python "tools/p2bin.py" main.p "out/emu/rom_emu_mars.32x"
echo * SCD
"tools/AS/asw" main.asm -i "%cd%" -olist "out/emu/rom_emu_mcd_j.lst" -q -xx -A -L -D MCD=1,MARS=0,MARSCD=0,PICO=0,COPERA=0,PICO_MODS=0,PICO_REV=0,EMU=1,CDREGION=0
python "tools/p2bin.py" main.p "out/emu/rom_emu_mcd_j.iso"
"tools/AS/asw" main.asm -i "%cd%" -olist "out/emu/rom_emu_mcd_u.lst" -q -xx -A -L -D MCD=1,MARS=0,MARSCD=0,PICO=0,COPERA=0,PICO_MODS=0,PICO_REV=0,EMU=1,CDREGION=1
python "tools/p2bin.py" main.p "out/emu/rom_emu_mcd_u.iso"
"tools/AS/asw" main.asm -i "%cd%" -olist "out/emu/rom_emu_mcd_e.lst" -q -xx -A -L -D MCD=1,MARS=0,MARSCD=0,PICO=0,COPERA=0,PICO_MODS=0,PICO_REV=0,EMU=1,CDREGION=2
python "tools/p2bin.py" main.p "out/emu/rom_emu_mcd_e.iso"
echo * CD32X
"tools/AS/asw" main.asm -i "%cd%" -olist "out/emu/rom_emu_marscd_j.lst" -q -xx -A -L -D MCD=0,MARS=0,MARSCD=1,PICO=0,COPERA=0,PICO_MODS=0,PICO_REV=0,EMU=1,CDREGION=0
python "tools/p2bin.py" main.p "out/emu/rom_emu_marscd_j.iso"
"tools/AS/asw" main.asm -i "%cd%" -olist "out/emu/rom_emu_marscd_u.lst" -q -xx -A -L -D MCD=0,MARS=0,MARSCD=1,PICO=0,COPERA=0,PICO_MODS=0,PICO_REV=0,EMU=1,CDREGION=1
python "tools/p2bin.py" main.p "out/emu/rom_emu_marscd_u.iso"
"tools/AS/asw" main.asm -i "%cd%" -olist "out/emu/rom_emu_marscd_e.lst" -q -xx -A -L -D MCD=0,MARS=0,MARSCD=1,PICO=0,COPERA=0,PICO_MODS=0,PICO_REV=0,EMU=1,CDREGION=2
python "tools/p2bin.py" main.p "out/emu/rom_emu_marscd_e.iso"

echo *** Building REAL HARDWARE ROMs ***
echo * MD
"tools/AS/asw" main.asm -i "%cd%" -olist "out/realhw/rom_md.lst" -q -xx -A -L -D MCD=0,MARS=0,MARSCD=0,PICO=0,COPERA=0,PICO_MODS=0,PICO_REV=0,EMU=0
python "tools/p2bin.py" main.p "out/realhw/rom_md.bin"
REM !@
echo * PICO
"tools/AS/asw" main.asm -i "%cd%" -olist "out/realhw/rom_pico_rev1.lst" -q -xx -A -L -D MCD=0,MARS=0,MARSCD=0,PICO=1,COPERA=0,PICO_MODS=0,PICO_REV=0,EMU=0
python "tools/p2bin.py" main.p "out/realhw/rom_pico_rev1.bin"
"tools/AS/asw" main.asm -i "%cd%" -olist "out/realhw/rom_pico_rev2.lst" -q -xx -A -L -D MCD=0,MARS=0,MARSCD=0,PICO=1,COPERA=0,PICO_MODS=0,PICO_REV=1,EMU=0
python "tools/p2bin.py" main.p "out/realhw/rom_pico_rev2.bin"
"tools/AS/asw" main.asm -i "%cd%" -olist "out/realhw/rom_pico_rev1m.lst" -q -xx -A -L -D MCD=0,MARS=0,MARSCD=0,PICO=1,COPERA=0,PICO_MODS=1,PICO_REV=0,EMU=0
python "tools/p2bin.py" main.p "out/realhw/rom_pico_rev1m.bin"
"tools/AS/asw" main.asm -i "%cd%" -olist "out/realhw/rom_pico_rev2m.lst" -q -xx -A -L -D MCD=0,MARS=0,MARSCD=0,PICO=1,COPERA=0,PICO_MODS=1,PICO_REV=1,EMU=0
python "tools/p2bin.py" main.p "out/realhw/rom_pico_rev2m.bin"
"tools/AS/asw" main.asm -i "%cd%" -olist "out/realhw/rom_copera.lst" -q -xx -A -L -D MCD=0,MARS=0,MARSCD=0,PICO=1,COPERA=1,PICO_MODS=0,PICO_REV=0,EMU=0
python "tools/p2bin.py" main.p "out/realhw/rom_copera.bin"
"tools/AS/asw" main.asm -i "%cd%" -olist "out/realhw/rom_coperam.lst" -q -xx -A -L -D MCD=0,MARS=0,MARSCD=0,PICO=1,COPERA=1,PICO_MODS=1,PICO_REV=0,EMU=0
python "tools/p2bin.py" main.p "out/realhw/rom_coperam.bin"
REM !@
echo * PICO pages
python "tools/scripts/PICO/page_data.py" "rom_pico_rev1" 1
python "tools/scripts/PICO/page_data.py" "rom_pico_rev2" 1
python "tools/scripts/PICO/page_data.py" "rom_pico_rev1m" 1
python "tools/scripts/PICO/page_data.py" "rom_pico_rev2m" 1
python "tools/scripts/PICO/page_data.py" "rom_copera" 1
python "tools/scripts/PICO/page_data.py" "rom_coperam" 1
echo * 32X
"tools/AS/asw" main.asm -i "%cd%" -olist "out/realhw/rom_mars.lst" -q -xx -A -L -D MCD=0,MARS=1,MARSCD=0,PICO=0,COPERA=0,PICO_MODS=0,PICO_REV=0,EMU=0
python "tools/p2bin.py" main.p "out/realhw/rom_mars.32x"
echo * SCD
"tools/AS/asw" main.asm -i "%cd%" -olist "out/realhw/rom_mcd_j.lst" -q -xx -A -L -D MCD=1,MARS=0,MARSCD=0,PICO=0,COPERA=0,PICO_MODS=0,PICO_REV=0,EMU=0,CDREGION=0
python "tools/p2bin.py" main.p "out/realhw/rom_mcd_j.iso"
"tools/AS/asw" main.asm -i "%cd%" -olist "out/realhw/rom_mcd_u.lst" -q -xx -A -L -D MCD=1,MARS=0,MARSCD=0,PICO=0,COPERA=0,PICO_MODS=0,PICO_REV=0,EMU=0,CDREGION=1
python "tools/p2bin.py" main.p "out/realhw/rom_mcd_u.iso"
"tools/AS/asw" main.asm -i "%cd%" -olist "out/realhw/rom_mcd_e.lst" -q -xx -A -L -D MCD=1,MARS=0,MARSCD=0,PICO=0,COPERA=0,PICO_MODS=0,PICO_REV=0,EMU=0,CDREGION=2
python "tools/p2bin.py" main.p "out/realhw/rom_mcd_e.iso"
echo * CD32X
"tools/AS/asw" main.asm -i "%cd%" -olist "out/realhw/rom_marscd_j.lst" -q -xx -A -L -D MCD=0,MARS=0,MARSCD=1,PICO=0,COPERA=0,PICO_MODS=0,PICO_REV=0,EMU=0,CDREGION=0
python "tools/p2bin.py" main.p "out/realhw/rom_marscd_j.iso"
"tools/AS/asw" main.asm -i "%cd%" -olist "out/realhw/rom_marscd_u.lst" -q -xx -A -L -D MCD=0,MARS=0,MARSCD=1,PICO=0,COPERA=0,PICO_MODS=0,PICO_REV=0,EMU=0,CDREGION=1
python "tools/p2bin.py" main.p "out/realhw/rom_marscd_u.iso"
"tools/AS/asw" main.asm -i "%cd%" -olist "out/realhw/rom_marscd_e.lst" -q -xx -A -L -D MCD=0,MARS=0,MARSCD=1,PICO=0,COPERA=0,PICO_MODS=0,PICO_REV=0,EMU=0,CDREGION=2
python "tools/p2bin.py" main.p "out/realhw/rom_marscd_e.iso"

IF EXIST main.p del main.p
REM IF EXIST main.h del main.h

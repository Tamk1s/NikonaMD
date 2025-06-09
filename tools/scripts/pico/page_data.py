import shutil
import os
import os.path
import sys

def copy_and_rename_file(source_path, destination_path):
    """
    Copies a file from the source path to the destination path, renaming it in the process.

    Args:
        source_path (str): The path to the source file.
        destination_path (str): The path to the destination file, including the new name.
    """
    try:
        shutil.copy2(source_path, destination_path)
        # print(f"File copied and renamed successfully to: {destination_path}")
    except FileNotFoundError:
        print(f"Error: Source file not found: {source_path}")
    except Exception as e:
        print(f"An error occurred: {e}")

# Example usage:
if len(sys.argv) != 2+1:
	print("Usage: ROM Name Emu_type")
	exit()

ROMNAME = sys.argv[1]
EMUTYPE = sys.argv[2]

PAGENAME = "page_"
PADNAME = "pad"
PAGEDIR = "game/data/pico/book/"
PAGEEXT = ".png"
EMUDIR = "out/emu/"
REALHWDIR = "out/realhw/"

source_file = ""
destination_file = ""
filename = ""

for x in range(0,8):
	filename = str(x) + PAGEEXT
	if x == 7: filename = PADNAME + PAGEEXT
	source_file = PAGEDIR + PAGENAME + filename
  
	destination_file = REALHWDIR
	if EMUTYPE == 0: destination_file = EMUDIR
	destination_file = destination_file + ROMNAME + "_" + filename
    
	# print("source/dest: " + source_file + "," + destination_file)
	copy_and_rename_file(source_file, destination_file)
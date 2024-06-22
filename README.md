# Godot UWP Packaging Fix Script

This repository contains a batch script designed to fix packaging issues with Godot UWP projects. By placing the script in the same directory as your Godot UWP export (`export.appx`), it automates the process of extracting, modifying, and repackaging the appx file.

## Usage

1. **Pre-requisites:**
   - Ensure that [7-Zip](https://www.7-zip.org/) is installed on your system.
   - Have Visual Studio 2019 installed with the necessary tools, including `makeappx` command.

2. **Setup:**
   - Place the `unpack_and_repack.bat` script in the same directory as your `export.appx` file generated from Godot UWP export.

3. **Execution:**
   - Double-click `unpack_and_repack.bat` to execute the script.
   - The script will automatically:
     - Extract `export.appx` using 7-Zip.
     - Delete `[Content_Types].xml` and `AppxBlockMap.xml` which may cause packaging issues.
     - Utilize the Developer Command Prompt for Visual Studio 2019 to run `makeappx pack` to create a fixed `my_game.appx`.

4. **Outcome:**
   - After execution, you should find `my_game.appx` in the same directory as `export.appx`, ready for deployment or further testing.

## Notes

- This script assumes a standard setup with paths to 7-Zip and Visual Studio tools configured as specified. Modify the paths (`sevenZipPath`, path to `VsDevCmd.bat`) in the script if your setup differs.
- Keep the Developer Command Prompt for Visual Studio open during script execution to ensure environment variables are correctly set.

# Python Right-Click Context Launcher

A small utility to add **"Run with Python (auto-venv)"** and **"Edit Script"** options to `.py` files when you right-click them in Windows.

The **"Run with Python (auto-venv)"** context menu will automatically:
- Detect a nearby virtual environment (venv)
- Run your Python script using the venv if available
- Fall back to the system Python if no venv is found
- Show readable output in a terminal window

The **"Edit Script"** context menu will:
- Open the script in your chosen editor (e.g., VS Code, Notepad++, etc.)

Ideal for developers working with multiple Python environments and needing quick access to both running and editing scripts.

---

## What's Included

This tool consists of 5 files:

| File                            | Purpose                                      |
|---------------------------------|----------------------------------------------|
| `python_env_runner.bat`         | Script that runs your Python file using a nearby venv (if one is found) |
| `py_run_with_python_menu_install.bat`   | Adds the "Run with Python (auto-venv)" context menu entry (requires admin) |
| `py_run_with_python_menu_uninstall.bat` | Removes the "Run with Python (auto-venv)" context menu entry (requires admin) |
| `py_edit_script_menu_install.bat`       | Adds the "Edit Script" context menu entry with your chosen editor (requires admin) |
| `py_edit_script_menu_uninstall.bat`     | Removes the "Edit Script" context menu entry (requires admin) |

---

## Installation Instructions

### For "Run with Python (auto-venv)" Context Menu
1. **Extract** the ZIP file to your desired location (e.g., your user folder or a project tools directory).
2. **Right-click** `py_run_with_python_menu_install.bat` and choose **"Run as administrator"**.
3. After successful installation, right-click any `.py` file and you’ll see:
   ```
   Run with Python (auto-venv)
   ```
   This will:
   - Detect a virtual environment (if present in the same folder or parent folder)
   - Run the script using that environment
   - If no venv is found, it uses your system Python

### For "Edit Script" Context Menu
1. **Ensure** all files are extracted to the same location as above.
2. **Right-click** `py_edit_script_menu_install.bat` and choose **"Run as administrator"**.
3. A file picker will appear—select the `.exe` of your preferred editor (e.g., `code.exe` for VS Code).
4. After successful installation, right-click any `.py` file and you’ll see:
   ```
   Edit Script
   ```
   This will open the script in your chosen editor.

---

## Uninstallation

### For "Run with Python (auto-venv)" Context Menu
1. **Right-click** `py_run_with_python_menu_uninstall.bat` and choose **"Run as administrator"**.
2. This will remove the "Run with Python (auto-venv)" context menu entry from your system.

### For "Edit Script" Context Menu
1. **Right-click** `py_edit_script_menu_uninstall.bat` and choose **"Run as administrator"**.
2. This will remove the "Edit Script" context menu entry from your system.

3. After uninstalling both, you can safely delete the folder with all files.

---

## 🛠 Requirements

- Windows 10 or 11
- Python installed and added to PATH (for running scripts)
- Virtual environments created using `python -m venv` (optional but supported)
- A text editor with an executable (e.g., VS Code, Notepad++, etc.) for the "Edit Script" option

---

## Notes

- This tool does not modify your system Python or global configuration.
- It only affects the **right-click behavior for `.py` files**.
- Requires admin access only during install/uninstall.
- Easy to remove.

---

## Optional: Set as Default App for .py Files

If you want to run Python scripts by simply double-clicking them, you can set the `python_env_runner.bat` script as the default app for opening `.py` files. This will use the same logic as the "Run with Python (auto-venv)" context menu option, attempting to run the script with a nearby virtual environment if available, or falling back to the system Python.

**Warning:** This will change the default behavior of double-clicking `.py` files from opening them in an editor to running them. If you frequently edit scripts, you may prefer to keep the default behavior and use the context menu options instead.

### Steps to Set as Default:
1. Right-click on a `.py` file.
2. Select **"Open with"** > **"Choose another app"**.
3. In the dialog, check the box that says **"Always use this app to open .py files"**.
4. Click **"More apps"** if necessary, then **"Look for another app on this PC"**.
5. Navigate to the folder where you extracted the files and select `python_env_runner.bat`.
6. Click **"OK"** to set it as the default.

Now, double-clicking a `.py` file will run it using the `python_env_runner.bat` script. If you’ve installed the "Edit Script" context menu, you can still right-click and choose "Edit Script" to open it in your editor.

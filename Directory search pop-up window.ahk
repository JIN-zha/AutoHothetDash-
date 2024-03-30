#Persistent

; Define the hotkey (Ctrl+Alt+Z) to open any specified folder
^!z::
    InputBox, FolderPath, Open Folder, Enter the path of the folder:
    if (FolderPath != "")
        Run, %FolderPath%
Return

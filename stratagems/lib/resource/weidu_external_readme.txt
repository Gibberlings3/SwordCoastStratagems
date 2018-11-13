This folder is created by DavidW's mods for storing and building files. Other modders are welcome to use it; it's organised as follows:

Workspace: for building things. Put anything you like in here; don't expect it still to be there next time you check.

Data: for storing data that you want to read between components of your mod, or between different mods. Store data in a subfolder of 'Data'. I suggest using a folder with the same name as your mod folder itself; alternatively, use a folder with your modder prefix. Don't have your mod edit anything in someone else's folder without permission.

Markers: for putting small files that let other components of your mod, or other mods, detect what your mod has done. (This is not a good way to detect whether a component is installed at all, as it does not play nicely with automated installers; use REQUIRE/FORBID_COMPONENT and similar for that.) Since this folder is shared, use your modder prefix for any file stored in it. I suggest ".mrk" as a file suffix.

Backup: you can backup your mod here if you'd rather not use a folder in your own mod folder. Use
BACKUP "weidu_external/backup/[your mod folder name]" in your tp2.


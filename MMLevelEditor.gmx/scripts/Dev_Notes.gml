/* Developer notes for level editor

// 10 September, 2015 //

Base level editor and tools completed
- Editor window
- Wall, Start, Door, Arrow, Trap tools
- Eraser

Tool object names adjusted
- Tools now use variables instead of direct object references in instance_create()
- Variables set in Create Event

// 11 September, 2015 //

Updated scripts, objects
- Added scripts, objects created during implementation attempt
- Minor updates to rooms, objects to ensure compatibility

ini Files saving
- Located file location (%appdata%/Local/Gamedir)
- Adjusted some var names, types for file purposes
- Added defaultRoom var and room_exists check to create user_Room000 if none exists

ini Files loading
- Added iteration step in saveMap to properly index objects
- Added two new keys: name, counts
- loadMap uses counts in for loops
- loadMap currently executes with RMB

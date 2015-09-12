// User level select function

file = SAVEFILE;
loadMe = "";
roomName = asset_get_index(room);

if(file_exists(file))
    ini_open(file);

// Run through the level file to find available level
for(j = 0; j < 1000; j++)
{
    if(j < 1)
        roomName = defaultRoom;
    else if(j < 10)
        roomName = USERROOM + "00"+ string(j);
    else if(j < 100)
        roomName = USERROOM + "0"+ string(j);
    else if(j < 1000)
        roomName = USERROOM + string(j);
    
    // Y/N to select a level
    if(ini_section_exists(roomName))
    {
        loadYN = show_question("Load " + roomName + "?");
        if(loadYN)
        {
            clearLevel();   // Clear all objects from current room
            loadMap(roomName);
            break;
        }
    }        
}
ini_close();

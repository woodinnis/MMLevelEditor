// Load the selected map
file = SAVEFILE;
if(file_exists(file))
    ini_open(file);

mapName = defaultRoom;
newRoom = ini_read_string(mapName, "name", 0);
wallCount = ini_read_real(mapName, "counts", 0);

objIndex = 0;

for(i = 0; i < wallCount; i++)
{
    obj = ini_read_real(mapName, "wall" + string(i) + string(objIndex), 0);
    objIndex++;
    newX = ini_read_real(mapName, "wall" + string(i) + string(objIndex), 0);
    objIndex++;
    newY = ini_read_real(mapName, "wall" + string(i) + string(objIndex), 0);
    objIndex = 0;
    
    newWall = instance_create(newX, newY, obj);
}

ini_close();

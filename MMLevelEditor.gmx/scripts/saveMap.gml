// Save the current map
file = SAVEFILE;
if(file_exists(file))
    ini_open(file);

mapName = "";
testMe = "";

wallCount = instance_number(wall);
trapCount = instance_number(trap);

objIndex = 0;

show_message_async(wallCount);

// Find the name of the most recently saved map
for(j = 0; j < 1000; j++)
{
    if(j < 1)
        testMe = defaultRoom;
    else if(j < 10)
        testMe = USERROOM + "00"+ string(j);
    else if(j < 100)
        testMe = USERROOM + "0"+ string(j);
    else if(j < 1000)
        testMe = USERROOM + string(j);
    
    // Set new map's name and leave the loop
    if(!ini_section_exists(testMe))
    {
        mapName = testMe;
        break;
    }        
}

// Set name and count sections
ini_write_string(mapName, "name", testMe);
ini_write_real(mapName, "counts", wallCount);
//ini_write_real(mapName, "counts", trapCount);

for(i = 0; i < wallCount; i++)
{
    me = instance_find(wall, i);

    ini_write_real(mapName, "wall" + string(i) + string(objIndex), me.object_index);
    objIndex++;
    ini_write_real(mapName, "wall" + string(i) + string(objIndex), me.x);
    objIndex++;
    ini_write_real(mapName, "wall" + string(i) + string(objIndex), me.y);
    objIndex = 0;
}

ini_close();

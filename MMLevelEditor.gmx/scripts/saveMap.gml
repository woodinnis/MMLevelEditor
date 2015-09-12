// Save the current map
file = SAVEFILE;
if(file_exists(file))
    ini_open(file);

mapName = "";
testMe = "";

wallCount = instance_number(wall);
trapCount = instance_number(trap);

objIndex = 0;

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
ini_write_real(mapName, "wallCounts", wallCount);
ini_write_real(mapName, "trapCounts", trapCount);

// Store wall locations
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

// Store trap locations
for(i = 0; i < trapCount; i++)
{
    me = instance_find(trap, i);

    ini_write_real(mapName, "trap" + string(i) + string(objIndex), me.object_index);
    objIndex++;
    ini_write_real(mapName, "trap" + string(i) + string(objIndex), me.x);
    objIndex++;
    ini_write_real(mapName, "trap" + string(i) + string(objIndex), me.y);
    objIndex = 0;
}

// Store player start location
if(instance_exists(player))
{
    me = instance_find(player, 0);
    
    ini_write_real(mapName, "player" + string(objIndex), me.object_index);
    objIndex++;
    ini_write_real(mapName, "player" + string(objIndex), me.x);
    objIndex++;
    ini_write_real(mapName, "player" + string(objIndex), me.y);
    objIndex = 0;
}

// Store door location
if(instance_exists(door))
{
    me = instance_find(door, 0);
    
    ini_write_real(mapName, "door" + string(objIndex), me.object_index);
    objIndex++;
    ini_write_real(mapName, "door" + string(objIndex), me.x);
    objIndex++;
    ini_write_real(mapName, "door" + string(objIndex), me.y);
    objIndex = 0;
}

// Store arrow locations
// Up
if(instance_exists(up))
{
    me = instance_find(up, 0);
    
    ini_write_real(mapName, "up" + string(objIndex), me.object_index);
    objIndex++;
    ini_write_real(mapName, "up" + string(objIndex), me.x);
    objIndex++;
    ini_write_real(mapName, "up" + string(objIndex), me.y);
    objIndex = 0;
}
// Down
if(instance_exists(down))
{
    me = instance_find(down, 0);
    
    ini_write_real(mapName, "down" + string(objIndex), me.object_index);
    objIndex++;
    ini_write_real(mapName, "down" + string(objIndex), me.x);
    objIndex++;
    ini_write_real(mapName, "down" + string(objIndex), me.y);
    objIndex = 0;
}
// Left
if(instance_exists(left))
{
    me = instance_find(left, 0);
    
    ini_write_real(mapName, "left" + string(objIndex), me.object_index);
    objIndex++;
    ini_write_real(mapName, "left" + string(objIndex), me.x);
    objIndex++;
    ini_write_real(mapName, "left" + string(objIndex), me.y);
    objIndex = 0;
}
// Right
if(instance_exists(right))
{
    me = instance_find(right, 0);
    
    ini_write_real(mapName, "right" + string(objIndex), me.object_index);
    objIndex++;
    ini_write_real(mapName, "right" + string(objIndex), me.x);
    objIndex++;
    ini_write_real(mapName, "right" + string(objIndex), me.y);
    objIndex = 0;
}
ini_close();

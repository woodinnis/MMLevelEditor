// Load the selected map
file = SAVEFILE;
if(file_exists(file))
    ini_open(file);

mapName = argument0;

newRoom = ini_read_string(mapName, "name", 0);
wallCount = ini_read_real(mapName, "wallCounts", 0);
trapCount = ini_read_real(mapName, "trapCounts", 0);

objIndex = 0;

// Place walls
for(i = 0; i < wallCount; i++)
{
    obj = ini_read_real(mapName, "wall" + string(i) + string(objIndex), 0);
    objIndex++;
    newX = ini_read_real(mapName, "wall" + string(i) + string(objIndex), 0);
    objIndex++;
    newY = ini_read_real(mapName, "wall" + string(i) + string(objIndex), 0);
    objIndex = 0;
    
    instance_create(newX, newY, obj);
}

// Place traps
for(i = 0; i < trapCount; i++)
{
    obj = ini_read_real(mapName, "trap" + string(i) + string(objIndex), 0);
    objIndex++;
    newX = ini_read_real(mapName, "trap" + string(i) + string(objIndex), 0);
    objIndex++;
    newY = ini_read_real(mapName, "trap" + string(i) + string(objIndex), 0);
    objIndex = 0;
    
    instance_create(newX, newY, obj);
}

// Place player start
obj = ini_read_real(mapName, "player" + string(objIndex), 0);
objIndex++;
newX = ini_read_real(mapName, "player" + string(objIndex), 0);
objIndex++;
newY = ini_read_real(mapName, "player" + string(objIndex), 0);
objIndex = 0;

instance_create(newX, newY, obj);

// Place door
obj = ini_read_real(mapName, "door" + string(objIndex), 0);
objIndex++;
newX = ini_read_real(mapName, "door" + string(objIndex), 0);
objIndex++;
newY = ini_read_real(mapName, "door" + string(objIndex), 0);
objIndex = 0;

instance_create(newX, newY, obj);

// Place arrows
// Up
obj = ini_read_real(mapName, "up" + string(objIndex), 0);
objIndex++;
newX = ini_read_real(mapName, "up" + string(objIndex), 0);
objIndex++;
newY = ini_read_real(mapName, "up" + string(objIndex), 0);
objIndex = 0;

instance_create(newX, newY, obj);

// Down
obj = ini_read_real(mapName, "down" + string(objIndex), 0);
objIndex++;
newX = ini_read_real(mapName, "down" + string(objIndex), 0);
objIndex++;
newY = ini_read_real(mapName, "down" + string(objIndex), 0);
objIndex = 0;

instance_create(newX, newY, obj);

// Left
obj = ini_read_real(mapName, "left" + string(objIndex), 0);
objIndex++;
newX = ini_read_real(mapName, "left" + string(objIndex), 0);
objIndex++;
newY = ini_read_real(mapName, "left" + string(objIndex), 0);
objIndex = 0;

instance_create(newX, newY, obj);

// Right
obj = ini_read_real(mapName, "right" + string(objIndex), 0);
objIndex++;
newX = ini_read_real(mapName, "right" + string(objIndex), 0);
objIndex++;
newY = ini_read_real(mapName, "right" + string(objIndex), 0);
objIndex = 0;

instance_create(newX, newY, obj);

ini_close();

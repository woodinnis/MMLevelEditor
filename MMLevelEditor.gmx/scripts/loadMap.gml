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
    read("wall", i);
}

// Place traps
for(i = 0; i < trapCount; i++)
{
    read("trap", i);
}

// Place player start
read("player", -1)

// Place door
read("door", -1);

// Place arrows
// Up
read("up", -1);

// Down
read("down", -1);

// Left
read("left", -1);

// Right
read("right", -1);

ini_close();

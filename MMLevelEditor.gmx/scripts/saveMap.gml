// Save the current map
file = SAVEFILE;
if(file_exists(file))
    ini_open(file);

mapName = testMe//room_get_name(testMe);
wallCount = instance_number(wall);
trapCount = instance_number(trap);

objIndex = 0;

show_message_async(wallCount);

ini_write_string(mapName, "name", testMe);
ini_write_real(mapName, "counts", wallCount);

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

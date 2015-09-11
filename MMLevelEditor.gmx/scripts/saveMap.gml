// Save the current map
file = SAVEFILE;
if(file_exists(file))
    ini_open(file);
    
if(file_exists(file))
    show_message_async(filename_path(file));

mapName = testMe//room_get_name(testMe);
wallCount = instance_number(wall);
trapCount = instance_number(trap);

for(i = 0; i < wallCount; i++)
{
    me = instance_find(wall, i);
    {
        ini_write_real(mapName, "wall" + string(i), me.object_index);
        ini_write_real(mapName, "wall" + string(i), me.x);
        ini_write_real(mapName, "wall" + string(i), me.y);
    }
}
ini_close();

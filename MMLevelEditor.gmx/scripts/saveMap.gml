// Save the current map
file = SAVEFILE;
if(file_exists(file))
    ini_open(file);

wallCount = instance_number(wall);
trapCount = instance_number(trap);

for(i = 0; i < wallCount; i++)
{
    show_debug_message("walls");
    me = instance_find(wall, i);
    {
        show_debug_message(me.x);
        ini_write_real(string(testMe), "wall" + string(i), me.object_index);
        ini_write_real(string(testMe), "wall" + string(i), me.x);
        ini_write_real(string(testMe), "wall" + string(i), me.y);
    }
}

ini_close();
/*
with(instance_find(cheese,0)){
  ini_write_string('Option', 'Name', object_get_name(object_index));  //Write a string of the object name
  ini_write_real('Option', 'Positionx', object_index.x);                       //Write a real of the object x position
  ini_write_real('Option', 'Positiony', object_index.y);                      //Write a real of the object y position
}
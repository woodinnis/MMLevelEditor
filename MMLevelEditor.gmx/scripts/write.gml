// Testing
myKey = argument0;
myIndex = argument1;

objIndex = 0;

if(myIndex >= 0)
{
    ini_write_real(mapName, myKey + string(myIndex) + string(objIndex), me.object_index);
    objIndex++;
    ini_write_real(mapName, myKey + string(myIndex) + string(objIndex), me.x);
    objIndex++;
    ini_write_real(mapName, myKey + string(myIndex) + string(objIndex), me.y);
}
else
{
    ini_write_real(mapName, myKey + string(objIndex), me.object_index);
    objIndex++;
    ini_write_real(mapName, myKey + string(objIndex), me.x);
    objIndex++;
    ini_write_real(mapName, myKey + string(objIndex), me.y);
    objIndex = 0;
}

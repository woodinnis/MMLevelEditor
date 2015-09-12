// Testing
myKey = argument0;
myIndex = argument1;

objIndex = 0;

if(myIndex >= 0)
{
    obj = ini_read_real(mapName, myKey + string(myIndex) + string(objIndex), 0);
    objIndex++;
    newX = ini_read_real(mapName, myKey + string(myIndex) + string(objIndex), 0);
    objIndex++;
    newY = ini_read_real(mapName, myKey + string(myIndex) + string(objIndex), 0);
    objIndex = 0;
    
    instance_create(newX, newY, obj);
}
else
{
    obj = ini_read_real(mapName, myKey + string(objIndex), 0);
    objIndex++;
    newX = ini_read_real(mapName, myKey + string(objIndex), 0);
    objIndex++;
    newY = ini_read_real(mapName, myKey + string(objIndex), 0);
    objIndex = 0;
    
    instance_create(newX, newY, obj);
}

// Set global variables for the level editor
globalvar currentTool;
currentTool = EMPTY;

// Room Saving variables
globalvar testMe;
roomCount = 0;
r = room_first;

// Object variables
wall = TOOL01;
player = TOOL02;
door = TOOL03;
up = TOOL04;
down = TOOL05;
left = TOOL06;
right = TOOL07;
trap = TOOL08;

// Create an array containing all room names
while(room_exists(r))
{
    rooms[roomCount] = r;
    roomCount++;
    r = room_next(r);
}

// Check array for any user-created rooms
for(i = 0; i < roomCount; i++)
{
    roomCheck = room_get_name(rooms[i]);
   
    if(string_count("room_User", roomCheck) != 0)
    {
        // Find the most recently user-created room, increment, and create a new room
        for(j = 0; j < 1000; j++)
        {
            if(j < 1)
                testMe = USERROOM + "000";
            else if(j < 10)
                testMe = USERROOM + "00"+ string(j);
            else if(j < 100)
                testMe = USERROOM + "0"+ string(j);
            else if(j < 1000)
                testMe = USERROOM + string(j);
                
            if(testMe == roomCheck)
            {
                if(asset_get_type(testMe) == asset_room)
                {
                    room_assign(roomEditor,testMe);
                    show_debug_message(testMe);
                    show_debug_message(roomCheck);
                }
                
                //rmIndex = asset_get_index(testMe);
                
                //testMe = rmIndex;
                //show_debug_message(rmIndex);
                break;
            }
            else
            {
                show_debug_message("CLONE");
//                testMe = asset_get_index(testMe);
//                testMe = room_duplicate(roomEditor);
                break;
            }
            /*
            if(!room_exists(asset_get_index(testMe)))
            {
                if(asset_get_type(testMe) != asset_room)
                    testMe = room_duplicate(roomEditor);
                    //testMe = room_add();
                    
                //show_debug_message(testMe);
                //rmIndex = room_add();
                if(room_exists(testMe))
                {
                    //room_assign(roomEditor,testMe);
                    show_debug_message(testMe);
                    //room_goto(testMe);
                }
                break;
            }
            */
        }
    }
}

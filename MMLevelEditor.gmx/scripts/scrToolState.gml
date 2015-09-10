// Draw tiles based on the current tool

// Set alignment
align = GRIDSIZE;
createX = (floor(device_mouse_x(0)/align)*align);
createY = (floor(device_mouse_y(0)/align)*align);

show_debug_message(currentTool);

// Draw tiles
//if(position_empty(createX,createY))
if(createY < LEVELH)
{
    switch(currentTool)
    {
        // Build walls
        case WALL:
        {
            if(position_empty(createX,createY))
                instance_create(createX, createY, objWall);
            break;
        }
        
        // Place the player start
        case PLAYER:
        {
            if(position_empty(createX,createY))
            {
                // If a player start already exists, destroy it before placing a new one
                if(!instance_exists(objPlayer))
                    instance_create(createX, createY, objPlayer);
                else
                {
                    with(objPlayer)
                       instance_destroy();
                       
                    instance_create(createX, createY, objPlayer);
                }
            }
            break;
        }
        // Place doors
        case DOOR:
        {                 
            // If a door already exists, destroy it before creating a new one
            if(!instance_exists(objDoor))
            {
                // Only create doors in existing wall tiles
                if(position_meeting(createX, createY, objWall))
                    instance_create(createX, createY, objDoor);
            }
            else
            {
                with(objDoor)
                   instance_destroy();
                // Only create doors in existing wall tiles
                if(position_meeting(createX, createY, objWall))   
                    instance_create(createX, createY, objDoor);
            }
            break;
        }
        // Place arrows
        // Only one each Up, Down, Left, Right can be placed
        case ARROWUP:
         {
            if(position_empty(createX,createY))
            {
                if(!instance_exists(objArrowUp))
                    instance_create(createX, createY, objArrowUp);
                else
                {
                    with(objArrowUp)
                       instance_destroy();
                       
                    instance_create(createX, createY, objArrowUp);
                }
            }
            break;
        }
        case ARROWDN:
        {
            if(position_empty(createX,createY))
            {
                if(!instance_exists(objArrowDn))
                    instance_create(createX, createY, objArrowDn);
                else
                {
                    with(objArrowDn)
                       instance_destroy();
                       
                    instance_create(createX, createY, objArrowDn);
                }
            }
            break;
        }
        case ARROWRT:
         {
            if(position_empty(createX,createY))
            {
                if(!instance_exists(objArrowRt))
                    instance_create(createX, createY, objArrowRt);
                else
                {
                    with(objArrowRt)
                       instance_destroy();
                       
                    instance_create(createX, createY, objArrowRt);
                }
            }
            break;
        }
        case ARROWLT:
         {
            if(position_empty(createX,createY))
            {
                if(!instance_exists(objArrowLt))
                    instance_create(createX, createY, objArrowLt);
                else
                {
                    with(objArrowLt)
                       instance_destroy();
                       
                    instance_create(createX, createY, objArrowLt);
                }
            }
            break;
        }
        // Place traps
        case TRAP:
        {
            if(position_empty(createX,createY))
                instance_create(createX, createY, objTrap);
            break;
        }
        // Eraser tool
        case ERASER:
        {
            if(createX < LEVELW && createX > GRIDSIZE)
                if(createY < LEVELH - GRIDSIZE && createY > GRIDSIZE)
                    position_destroy(createX,createY);
            break;
        }
        default:
        {
            break;
        }
    }
}

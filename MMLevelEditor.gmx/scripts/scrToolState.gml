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
                instance_create(createX, createY, wall);
            break;
        }
        
        // Place the player start
        case PLAYER:
        {
            if(position_empty(createX,createY))
            {
                // If a player start already exists, destroy it before placing a new one
                if(!instance_exists(player))
                    instance_create(createX, createY, player);
                else
                {
                    with(player)
                       instance_destroy();
                       
                    instance_create(createX, createY, player);
                }
            }
            break;
        }
        // Place doors
        case DOOR:
        {                 
            // If a door already exists, destroy it before creating a new one
            if(!instance_exists(door))
            {
                // Only create doors in existing wall tiles
                if(position_meeting(createX, createY, wall))
                    instance_create(createX, createY, door);
            }
            else
            {
                with(door)
                   instance_destroy();
                // Only create doors in existing wall tiles
                if(position_meeting(createX, createY, wall))   
                    instance_create(createX, createY, door);
            }
            break;
        }
        // Place arrows
        // Only one each Up, Down, Left, Right can be placed
        case ARROWUP:
         {
            if(position_empty(createX,createY))
            {
                if(!instance_exists(up))
                    instance_create(createX, createY, up);
                else
                {
                    with(up)
                       instance_destroy();
                       
                    instance_create(createX, createY, up);
                }
            }
            break;
        }
        case ARROWDN:
        {
            if(position_empty(createX,createY))
            {
                if(!instance_exists(down))
                    instance_create(createX, createY, down);
                else
                {
                    with(down)
                       instance_destroy();
                       
                    instance_create(createX, createY, down);
                }
            }
            break;
        }
        case ARROWRT:
         {
            if(position_empty(createX,createY))
            {
                if(!instance_exists(right))
                    instance_create(createX, createY, right);
                else
                {
                    with(right)
                       instance_destroy();
                       
                    instance_create(createX, createY, right);
                }
            }
            break;
        }
        case ARROWLT:
         {
            if(position_empty(createX,createY))
            {
                if(!instance_exists(left))
                    instance_create(createX, createY, left);
                else
                {
                    with(left)
                       instance_destroy();
                       
                    instance_create(createX, createY, left);
                }
            }
            break;
        }
        // Place traps
        case TRAP:
        {
            if(position_empty(createX,createY))
                instance_create(createX, createY, trap);
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

newTool = instance_position(device_mouse_x(0), device_mouse_y(0), objToolParent);

switch(newTool)
{
    case objWallTool:
    {
        show_debug_message("ARRRRG!");
        currentTool = WALL;
        break;
    }
    case objPlayerTool:
    {
        currentTool = PLAYER;
        break;
    }
    default:
        break;
//    case objDoorTool:
//    case objArrowTool:
//    case objTrapTool:
      
}

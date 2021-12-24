var water_y = obj_water_level.y - 6;

if(max_y != -1) y = clamp(water_y,max_y, min_y);
else y = min(water_y,min_y)
/// @description dialouge box
boxSprite = spr_plane;
boxTime = 0;
boxDuration = 30;

boxStart = view_h;
boxDest = boxStart;
boxY = boxStart;

//controls for the popup
boxFrame = 0;
boxFrameTime = 1;

popup = false;
arrows = false;

//queue. Every object using this panel, will increment the queue,
//and decrement it when done. Then the panel can be killed when there's none in queue
queue = 0;

//kills the object
kill = false;

//transparency
transparency = 1;
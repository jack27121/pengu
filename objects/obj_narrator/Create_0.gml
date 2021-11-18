plane_init();

font[0] = "something went wrong fucko. listen you son of a bitch";
message[0] = "something went wrong fucko";
autoskip[0] = false;
still[0] = false;
goto[0] = -1;
close[0] = false;

message_current = 0;

initialDelay = 4;
delay = initialDelay;
cutoffSpeed = 1;

i = 1;

timer = 0;
cutoff = 0;
lineOffset = 0;

t = 0;
amplitude = 2;
freq = 2;

done = false;

//choice
choiceDone = false;
question[0] = false;
choices[0,0] = "";

choiceXY[0,0] = 100;				//x
choiceXY[0,1] = view_hport[0]-60;	//y
choiceXY[0,2] = false; 

choiceXY[1,0] = 320;
choiceXY[1,1] = view_hport[0]-60;
choiceXY[1,2] = false; 

choiceXY[2,0] = 210;
choiceXY[2,1] = view_hport[0]-75;
choiceXY[2,2] = false; 

choiceXY[3,0] = 210;
choiceXY[3,1] = view_hport[0]-40;
choiceXY[3,2] = false; 

//execute
execute[0] = false;

//sound
sound[0] = "something went wrong fucko";
playonce[0] = false;
soundLoop[0] = true;
soundLoopI = false;
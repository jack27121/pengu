t = 0;

duration = 10;
start_ = view_w +16;
end_ = -16;

x1 = start_;
x2 = start_;

fading = false;
fade_out = true;

callback = function(){}; //runs when done fading out

begin_fade_out = function(){
	t = 0;
	fading = true;
	fade_out = true; //fading in or out
	x1 = start_;
	x2 = start_;
}

begin_fade_in = function(){
	t = 0;
	fading = true;
	fade_out = false; //fading in or out
	x1 = start_;
	x2 = end_;
}
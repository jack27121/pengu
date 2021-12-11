/// @description init
collission = false;
instance_arr = [];

//if a instance parent is selected, it won't initialize it's own code
if(instance_parent == -1){
	array_push(instance_arr,self);
	alpha = 1;
	
	alpha_method_begin = function(){
		if (event_type == ev_draw && event_number == 0){
			if(alpha != 1){
				shader_set(sh_transparent);
				u_alpha = shader_get_uniform(sh_transparent,"alpha");
				shader_set_uniform_f(u_alpha,alpha);
			}
		}
	};
	
	alpha_method_end = function(){
		if (event_type == ev_draw && event_number == 0){
			if (alpha != 1){
				shader_reset();
			}
		}
	};
	
	layer_script_begin(layer_name,alpha_method_begin);
	layer_script_end(layer_name,alpha_method_end);
}else array_push(instance_parent.instance_arr,self);
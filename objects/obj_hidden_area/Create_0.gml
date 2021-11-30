/// @description init
alpha = 1;

alpha_method_begin = function(){
	//if (event_type == ev_draw && event_number == 0){
		if(alpha != 1){
			shader_set(sh_transparent);
			u_alpha = shader_get_uniform(sh_transparent,"alpha");
			shader_set_uniform_f(u_alpha,alpha);
			gpu_set_blendmode(bm_normal);
		}
	//}
};

alpha_method_end = function(){
	//if (event_type == ev_draw && event_number == 0){
		if (alpha != 1){
			shader_reset();
			gpu_set_blendmode(bm_normal);
		}
	//}
};

layer_script_begin(layer_name,alpha_method_begin);
layer_script_end(layer_name,alpha_method_end);
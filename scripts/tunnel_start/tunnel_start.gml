function tunnel_start(path,spd,end_method){
	var tunnel = instance_create_depth(x,y,depth,obj_tunnel_ride);
	tunnel.path = path;
	tunnel.spd = spd;
	tunnel.end_method = end_method;
}
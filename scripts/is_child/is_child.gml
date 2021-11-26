///@function is_child(instance,object)
///@param instance
///@param object
///@description checks if instance is equal to specified object, or if it's a child of one
function is_child(instance,object){
	if (instance == noone) return false;
	return (instance.object_index == object || object_is_ancestor(instance.object_index,object))
}
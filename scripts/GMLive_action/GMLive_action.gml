// GMLive.gml (c) YellowAfterlife, 2017+
// PLEASE DO NOT FORGET to remove paid extensions from your project when publishing the source code!
// And if you are using git, you can exclude GMLive by adding
// `scripts/GMLive*` and `extensions/GMLive/` lines to your `.gitignore`.

// VM "instructions"
if(live_enabled)function mc_gml_action()constructor{
	static getIndex=method(undefined,gml_std_enum_getIndex);
	static toString=method(undefined,gml_std_enum_toString);
	static __enum__=mt_gml_action;
}

if(live_enabled)
global.__mp_gml_action_discard=["h_d"];
if(live_enabled)
function mc_gml_action_discard():mc_gml_action()constructor{
	static __enumParams__=global.__mp_gml_action_discard;
	static __enumIndex__=0;
}

if(live_enabled)
function gml_action_discard(l_h_d){
	var l_this=new mc_gml_action_discard();
	l_this.h_d=l_h_d;
	return l_this
}

if(live_enabled)
global.__mp_gml_action_dup=["h_d"];
if(live_enabled)
function mc_gml_action_dup():mc_gml_action()constructor{
	static __enumParams__=global.__mp_gml_action_dup;
	static __enumIndex__=1;
}

if(live_enabled)
function gml_action_dup(l_h_d){
	var l_this=new mc_gml_action_dup();
	l_this.h_d=l_h_d;
	return l_this
}

if(live_enabled)
global.__mp_gml_action_dup2x=["h_d"];
if(live_enabled)
function mc_gml_action_dup2x():mc_gml_action()constructor{
	static __enumParams__=global.__mp_gml_action_dup2x;
	static __enumIndex__=2;
}

if(live_enabled)
function gml_action_dup2x(l_h_d){
	var l_this=new mc_gml_action_dup2x();
	l_this.h_d=l_h_d;
	return l_this
}

if(live_enabled)
global.__mp_gml_action_dup3x=["h_d"];
if(live_enabled)
function mc_gml_action_dup3x():mc_gml_action()constructor{
	static __enumParams__=global.__mp_gml_action_dup3x;
	static __enumIndex__=3;
}

if(live_enabled)
function gml_action_dup3x(l_h_d){
	var l_this=new mc_gml_action_dup3x();
	l_this.h_d=l_h_d;
	return l_this
}

if(live_enabled)
global.__mp_gml_action_dup_in=["h_d","h_z"];
if(live_enabled)
function mc_gml_action_dup_in():mc_gml_action()constructor{
	static __enumParams__=global.__mp_gml_action_dup_in;
	static __enumIndex__=4;
}

if(live_enabled)
function gml_action_dup_in(l_h_d,l_h_z){
	var l_this=new mc_gml_action_dup_in();
	l_this.h_d=l_h_d;
	l_this.h_z=l_h_z;
	return l_this
}

if(live_enabled)
global.__mp_gml_action_undefined=["h_d"];
if(live_enabled)
function mc_gml_action_undefined():mc_gml_action()constructor{
	static __enumParams__=global.__mp_gml_action_undefined;
	static __enumIndex__=5;
}

if(live_enabled)
function gml_action_undefined(l_h_d){
	var l_this=new mc_gml_action_undefined();
	l_this.h_d=l_h_d;
	return l_this
}

if(live_enabled)
global.__mp_gml_action_number=["h_d","h_f"];
if(live_enabled)
function mc_gml_action_number():mc_gml_action()constructor{
	static __enumParams__=global.__mp_gml_action_number;
	static __enumIndex__=6;
}

if(live_enabled)
function gml_action_number(l_h_d,l_h_f){
	var l_this=new mc_gml_action_number();
	l_this.h_d=l_h_d;
	l_this.h_f=l_h_f;
	return l_this
}

if(live_enabled)
global.__mp_gml_action_cstring=["h_d","h_s"];
if(live_enabled)
function mc_gml_action_cstring():mc_gml_action()constructor{
	static __enumParams__=global.__mp_gml_action_cstring;
	static __enumIndex__=7;
}

if(live_enabled)
function gml_action_cstring(l_h_d,l_h_s){
	var l_this=new mc_gml_action_cstring();
	l_this.h_d=l_h_d;
	l_this.h_s=l_h_s;
	return l_this
}

if(live_enabled)
global.__mp_gml_action_array_decl=["h_d","h_size"];
if(live_enabled)
function mc_gml_action_array_decl():mc_gml_action()constructor{
	static __enumParams__=global.__mp_gml_action_array_decl;
	static __enumIndex__=8;
}

if(live_enabled)
function gml_action_array_decl(l_h_d,l_h_size){
	var l_this=new mc_gml_action_array_decl();
	l_this.h_d=l_h_d;
	l_this.h_size=l_h_size;
	return l_this
}

if(live_enabled)
global.__mp_gml_action_object_decl=["h_d","h_fields"];
if(live_enabled)
function mc_gml_action_object_decl():mc_gml_action()constructor{
	static __enumParams__=global.__mp_gml_action_object_decl;
	static __enumIndex__=9;
}

if(live_enabled)
function gml_action_object_decl(l_h_d,l_h_fields){
	var l_this=new mc_gml_action_object_decl();
	l_this.h_d=l_h_d;
	l_this.h_fields=l_h_fields;
	return l_this
}

if(live_enabled)
global.__mp_gml_action_const=["h_d","h_v"];
if(live_enabled)
function mc_gml_action_const():mc_gml_action()constructor{
	static __enumParams__=global.__mp_gml_action_const;
	static __enumIndex__=10;
}

if(live_enabled)
function gml_action_const(l_h_d,l_h_v){
	var l_this=new mc_gml_action_const();
	l_this.h_d=l_h_d;
	l_this.h_v=l_h_v;
	return l_this
}

if(live_enabled)
global.__mp_gml_action_self=["h_d"];
if(live_enabled)
function mc_gml_action_self():mc_gml_action()constructor{
	static __enumParams__=global.__mp_gml_action_self;
	static __enumIndex__=11;
}

if(live_enabled)
function gml_action_self(l_h_d){
	var l_this=new mc_gml_action_self();
	l_this.h_d=l_h_d;
	return l_this
}

if(live_enabled)
global.__mp_gml_action_other=["h_d"];
if(live_enabled)
function mc_gml_action_other():mc_gml_action()constructor{
	static __enumParams__=global.__mp_gml_action_other;
	static __enumIndex__=12;
}

if(live_enabled)
function gml_action_other(l_h_d){
	var l_this=new mc_gml_action_other();
	l_this.h_d=l_h_d;
	return l_this
}

if(live_enabled)
global.__mp_gml_action_local=["h_d","h_i"];
if(live_enabled)
function mc_gml_action_local():mc_gml_action()constructor{
	static __enumParams__=global.__mp_gml_action_local;
	static __enumIndex__=13;
}

if(live_enabled)
function gml_action_local(l_h_d,l_h_i){
	var l_this=new mc_gml_action_local();
	l_this.h_d=l_h_d;
	l_this.h_i=l_h_i;
	return l_this
}

if(live_enabled)
global.__mp_gml_action_local_set=["h_d","h_i"];
if(live_enabled)
function mc_gml_action_local_set():mc_gml_action()constructor{
	static __enumParams__=global.__mp_gml_action_local_set;
	static __enumIndex__=14;
}

if(live_enabled)
function gml_action_local_set(l_h_d,l_h_i){
	var l_this=new mc_gml_action_local_set();
	l_this.h_d=l_h_d;
	l_this.h_i=l_h_i;
	return l_this
}

if(live_enabled)
global.__mp_gml_action_local_aop=["h_d","h_o","h_i"];
if(live_enabled)
function mc_gml_action_local_aop():mc_gml_action()constructor{
	static __enumParams__=global.__mp_gml_action_local_aop;
	static __enumIndex__=15;
}

if(live_enabled)
function gml_action_local_aop(l_h_d,l_h_o,l_h_i){
	var l_this=new mc_gml_action_local_aop();
	l_this.h_d=l_h_d;
	l_this.h_o=l_h_o;
	l_this.h_i=l_h_i;
	return l_this
}

if(live_enabled)
global.__mp_gml_action_global=["h_d","h_fd"];
if(live_enabled)
function mc_gml_action_global():mc_gml_action()constructor{
	static __enumParams__=global.__mp_gml_action_global;
	static __enumIndex__=16;
}

if(live_enabled)
function gml_action_global(l_h_d,l_h_fd){
	var l_this=new mc_gml_action_global();
	l_this.h_d=l_h_d;
	l_this.h_fd=l_h_fd;
	return l_this
}

if(live_enabled)
global.__mp_gml_action_global_set=["h_d","h_fd"];
if(live_enabled)
function mc_gml_action_global_set():mc_gml_action()constructor{
	static __enumParams__=global.__mp_gml_action_global_set;
	static __enumIndex__=17;
}

if(live_enabled)
function gml_action_global_set(l_h_d,l_h_fd){
	var l_this=new mc_gml_action_global_set();
	l_this.h_d=l_h_d;
	l_this.h_fd=l_h_fd;
	return l_this
}

if(live_enabled)
global.__mp_gml_action_global_aop=["h_d","h_o","h_fd"];
if(live_enabled)
function mc_gml_action_global_aop():mc_gml_action()constructor{
	static __enumParams__=global.__mp_gml_action_global_aop;
	static __enumIndex__=18;
}

if(live_enabled)
function gml_action_global_aop(l_h_d,l_h_o,l_h_fd){
	var l_this=new mc_gml_action_global_aop();
	l_this.h_d=l_h_d;
	l_this.h_o=l_h_o;
	l_this.h_fd=l_h_fd;
	return l_this
}

if(live_enabled)
global.__mp_gml_action_field=["h_d","h_fd"];
if(live_enabled)
function mc_gml_action_field():mc_gml_action()constructor{
	static __enumParams__=global.__mp_gml_action_field;
	static __enumIndex__=19;
}

if(live_enabled)
function gml_action_field(l_h_d,l_h_fd){
	var l_this=new mc_gml_action_field();
	l_this.h_d=l_h_d;
	l_this.h_fd=l_h_fd;
	return l_this
}

if(live_enabled)
global.__mp_gml_action_field_set=["h_d","h_fd"];
if(live_enabled)
function mc_gml_action_field_set():mc_gml_action()constructor{
	static __enumParams__=global.__mp_gml_action_field_set;
	static __enumIndex__=20;
}

if(live_enabled)
function gml_action_field_set(l_h_d,l_h_fd){
	var l_this=new mc_gml_action_field_set();
	l_this.h_d=l_h_d;
	l_this.h_fd=l_h_fd;
	return l_this
}

if(live_enabled)
global.__mp_gml_action_field_aop=["h_d","h_o","h_fd"];
if(live_enabled)
function mc_gml_action_field_aop():mc_gml_action()constructor{
	static __enumParams__=global.__mp_gml_action_field_aop;
	static __enumIndex__=21;
}

if(live_enabled)
function gml_action_field_aop(l_h_d,l_h_o,l_h_fd){
	var l_this=new mc_gml_action_field_aop();
	l_this.h_d=l_h_d;
	l_this.h_o=l_h_o;
	l_this.h_fd=l_h_fd;
	return l_this
}

if(live_enabled)
global.__mp_gml_action_index=["h_d"];
if(live_enabled)
function mc_gml_action_index():mc_gml_action()constructor{
	static __enumParams__=global.__mp_gml_action_index;
	static __enumIndex__=22;
}

if(live_enabled)
function gml_action_index(l_h_d){
	var l_this=new mc_gml_action_index();
	l_this.h_d=l_h_d;
	return l_this
}

if(live_enabled)
global.__mp_gml_action_index_set=["h_d"];
if(live_enabled)
function mc_gml_action_index_set():mc_gml_action()constructor{
	static __enumParams__=global.__mp_gml_action_index_set;
	static __enumIndex__=23;
}

if(live_enabled)
function gml_action_index_set(l_h_d){
	var l_this=new mc_gml_action_index_set();
	l_this.h_d=l_h_d;
	return l_this
}

if(live_enabled)
global.__mp_gml_action_index_aop=["h_d","h_o"];
if(live_enabled)
function mc_gml_action_index_aop():mc_gml_action()constructor{
	static __enumParams__=global.__mp_gml_action_index_aop;
	static __enumIndex__=24;
}

if(live_enabled)
function gml_action_index_aop(l_h_d,l_h_o){
	var l_this=new mc_gml_action_index_aop();
	l_this.h_d=l_h_d;
	l_this.h_o=l_h_o;
	return l_this
}

if(live_enabled)
global.__mp_gml_action_index2d=["h_d"];
if(live_enabled)
function mc_gml_action_index2d():mc_gml_action()constructor{
	static __enumParams__=global.__mp_gml_action_index2d;
	static __enumIndex__=25;
}

if(live_enabled)
function gml_action_index2d(l_h_d){
	var l_this=new mc_gml_action_index2d();
	l_this.h_d=l_h_d;
	return l_this
}

if(live_enabled)
global.__mp_gml_action_index2d_set=["h_d"];
if(live_enabled)
function mc_gml_action_index2d_set():mc_gml_action()constructor{
	static __enumParams__=global.__mp_gml_action_index2d_set;
	static __enumIndex__=26;
}

if(live_enabled)
function gml_action_index2d_set(l_h_d){
	var l_this=new mc_gml_action_index2d_set();
	l_this.h_d=l_h_d;
	return l_this
}

if(live_enabled)
global.__mp_gml_action_index2d_aop=["h_d","h_o"];
if(live_enabled)
function mc_gml_action_index2d_aop():mc_gml_action()constructor{
	static __enumParams__=global.__mp_gml_action_index2d_aop;
	static __enumIndex__=27;
}

if(live_enabled)
function gml_action_index2d_aop(l_h_d,l_h_o){
	var l_this=new mc_gml_action_index2d_aop();
	l_this.h_d=l_h_d;
	l_this.h_o=l_h_o;
	return l_this
}

if(live_enabled)
global.__mp_gml_action_env=["h_d","h_f"];
if(live_enabled)
function mc_gml_action_env():mc_gml_action()constructor{
	static __enumParams__=global.__mp_gml_action_env;
	static __enumIndex__=28;
}

if(live_enabled)
function gml_action_env(l_h_d,l_h_f){
	var l_this=new mc_gml_action_env();
	l_this.h_d=l_h_d;
	l_this.h_f=l_h_f;
	return l_this
}

if(live_enabled)
global.__mp_gml_action_env_set=["h_d","h_f","h_ch"];
if(live_enabled)
function mc_gml_action_env_set():mc_gml_action()constructor{
	static __enumParams__=global.__mp_gml_action_env_set;
	static __enumIndex__=29;
}

if(live_enabled)
function gml_action_env_set(l_h_d,l_h_f,l_h_ch){
	var l_this=new mc_gml_action_env_set();
	l_this.h_d=l_h_d;
	l_this.h_f=l_h_f;
	l_this.h_ch=l_h_ch;
	return l_this
}

if(live_enabled)
global.__mp_gml_action_env_aop=["h_d","h_o","h_f"];
if(live_enabled)
function mc_gml_action_env_aop():mc_gml_action()constructor{
	static __enumParams__=global.__mp_gml_action_env_aop;
	static __enumIndex__=30;
}

if(live_enabled)
function gml_action_env_aop(l_h_d,l_h_o,l_h_f){
	var l_this=new mc_gml_action_env_aop();
	l_this.h_d=l_h_d;
	l_this.h_o=l_h_o;
	l_this.h_f=l_h_f;
	return l_this
}

if(live_enabled)
global.__mp_gml_action_env1d=["h_d","h_f"];
if(live_enabled)
function mc_gml_action_env1d():mc_gml_action()constructor{
	static __enumParams__=global.__mp_gml_action_env1d;
	static __enumIndex__=31;
}

if(live_enabled)
function gml_action_env1d(l_h_d,l_h_f){
	var l_this=new mc_gml_action_env1d();
	l_this.h_d=l_h_d;
	l_this.h_f=l_h_f;
	return l_this
}

if(live_enabled)
global.__mp_gml_action_env1d_set=["h_d","h_f","h_ch"];
if(live_enabled)
function mc_gml_action_env1d_set():mc_gml_action()constructor{
	static __enumParams__=global.__mp_gml_action_env1d_set;
	static __enumIndex__=32;
}

if(live_enabled)
function gml_action_env1d_set(l_h_d,l_h_f,l_h_ch){
	var l_this=new mc_gml_action_env1d_set();
	l_this.h_d=l_h_d;
	l_this.h_f=l_h_f;
	l_this.h_ch=l_h_ch;
	return l_this
}

if(live_enabled)
global.__mp_gml_action_env1d_aop=["h_d","h_o","h_f"];
if(live_enabled)
function mc_gml_action_env1d_aop():mc_gml_action()constructor{
	static __enumParams__=global.__mp_gml_action_env1d_aop;
	static __enumIndex__=33;
}

if(live_enabled)
function gml_action_env1d_aop(l_h_d,l_h_o,l_h_f){
	var l_this=new mc_gml_action_env1d_aop();
	l_this.h_d=l_h_d;
	l_this.h_o=l_h_o;
	l_this.h_f=l_h_f;
	return l_this
}

if(live_enabled)
global.__mp_gml_action_ds_aop=["h_d","h_o","h_argc","h_get","h_set","h_out"];
if(live_enabled)
function mc_gml_action_ds_aop():mc_gml_action()constructor{
	static __enumParams__=global.__mp_gml_action_ds_aop;
	static __enumIndex__=34;
}

if(live_enabled)
function gml_action_ds_aop(l_h_d,l_h_o,l_h_argc,l_h_get,l_h_set,l_h_out){
	var l_this=new mc_gml_action_ds_aop();
	l_this.h_d=l_h_d;
	l_this.h_o=l_h_o;
	l_this.h_argc=l_h_argc;
	l_this.h_get=l_h_get;
	l_this.h_set=l_h_set;
	l_this.h_out=l_h_out;
	return l_this
}

if(live_enabled)
global.__mp_gml_action_arg_const=["h_d","h_i"];
if(live_enabled)
function mc_gml_action_arg_const():mc_gml_action()constructor{
	static __enumParams__=global.__mp_gml_action_arg_const;
	static __enumIndex__=35;
}

if(live_enabled)
function gml_action_arg_const(l_h_d,l_h_i){
	var l_this=new mc_gml_action_arg_const();
	l_this.h_d=l_h_d;
	l_this.h_i=l_h_i;
	return l_this
}

if(live_enabled)
global.__mp_gml_action_arg_const_set=["h_d","h_i"];
if(live_enabled)
function mc_gml_action_arg_const_set():mc_gml_action()constructor{
	static __enumParams__=global.__mp_gml_action_arg_const_set;
	static __enumIndex__=36;
}

if(live_enabled)
function gml_action_arg_const_set(l_h_d,l_h_i){
	var l_this=new mc_gml_action_arg_const_set();
	l_this.h_d=l_h_d;
	l_this.h_i=l_h_i;
	return l_this
}

if(live_enabled)
global.__mp_gml_action_arg_const_aop=["h_d","h_o","h_i"];
if(live_enabled)
function mc_gml_action_arg_const_aop():mc_gml_action()constructor{
	static __enumParams__=global.__mp_gml_action_arg_const_aop;
	static __enumIndex__=37;
}

if(live_enabled)
function gml_action_arg_const_aop(l_h_d,l_h_o,l_h_i){
	var l_this=new mc_gml_action_arg_const_aop();
	l_this.h_d=l_h_d;
	l_this.h_o=l_h_o;
	l_this.h_i=l_h_i;
	return l_this
}

if(live_enabled)
global.__mp_gml_action_arg_index=["h_d"];
if(live_enabled)
function mc_gml_action_arg_index():mc_gml_action()constructor{
	static __enumParams__=global.__mp_gml_action_arg_index;
	static __enumIndex__=38;
}

if(live_enabled)
function gml_action_arg_index(l_h_d){
	var l_this=new mc_gml_action_arg_index();
	l_this.h_d=l_h_d;
	return l_this
}

if(live_enabled)
global.__mp_gml_action_arg_index_set=["h_d"];
if(live_enabled)
function mc_gml_action_arg_index_set():mc_gml_action()constructor{
	static __enumParams__=global.__mp_gml_action_arg_index_set;
	static __enumIndex__=39;
}

if(live_enabled)
function gml_action_arg_index_set(l_h_d){
	var l_this=new mc_gml_action_arg_index_set();
	l_this.h_d=l_h_d;
	return l_this
}

if(live_enabled)
global.__mp_gml_action_arg_index_aop=["h_d","h_o"];
if(live_enabled)
function mc_gml_action_arg_index_aop():mc_gml_action()constructor{
	static __enumParams__=global.__mp_gml_action_arg_index_aop;
	static __enumIndex__=40;
}

if(live_enabled)
function gml_action_arg_index_aop(l_h_d,l_h_o){
	var l_this=new mc_gml_action_arg_index_aop();
	l_this.h_d=l_h_d;
	l_this.h_o=l_h_o;
	return l_this
}

if(live_enabled)
global.__mp_gml_action_arg_count=["h_d"];
if(live_enabled)
function mc_gml_action_arg_count():mc_gml_action()constructor{
	static __enumParams__=global.__mp_gml_action_arg_count;
	static __enumIndex__=41;
}

if(live_enabled)
function gml_action_arg_count(l_h_d){
	var l_this=new mc_gml_action_arg_count();
	l_this.h_d=l_h_d;
	return l_this
}

if(live_enabled)
global.__mp_gml_action_add_int=["h_d","h_i"];
if(live_enabled)
function mc_gml_action_add_int():mc_gml_action()constructor{
	static __enumParams__=global.__mp_gml_action_add_int;
	static __enumIndex__=42;
}

if(live_enabled)
function gml_action_add_int(l_h_d,l_h_i){
	var l_this=new mc_gml_action_add_int();
	l_this.h_d=l_h_d;
	l_this.h_i=l_h_i;
	return l_this
}

if(live_enabled)
global.__mp_gml_action_equ_op=["h_d"];
if(live_enabled)
function mc_gml_action_equ_op():mc_gml_action()constructor{
	static __enumParams__=global.__mp_gml_action_equ_op;
	static __enumIndex__=43;
}

if(live_enabled)
function gml_action_equ_op(l_h_d){
	var l_this=new mc_gml_action_equ_op();
	l_this.h_d=l_h_d;
	return l_this
}

if(live_enabled)
global.__mp_gml_action_neq_op=["h_d"];
if(live_enabled)
function mc_gml_action_neq_op():mc_gml_action()constructor{
	static __enumParams__=global.__mp_gml_action_neq_op;
	static __enumIndex__=44;
}

if(live_enabled)
function gml_action_neq_op(l_h_d){
	var l_this=new mc_gml_action_neq_op();
	l_this.h_d=l_h_d;
	return l_this
}

if(live_enabled)
global.__mp_gml_action_concat=["h_d"];
if(live_enabled)
function mc_gml_action_concat():mc_gml_action()constructor{
	static __enumParams__=global.__mp_gml_action_concat;
	static __enumIndex__=45;
}

if(live_enabled)
function gml_action_concat(l_h_d){
	var l_this=new mc_gml_action_concat();
	l_this.h_d=l_h_d;
	return l_this
}

if(live_enabled)
global.__mp_gml_action_bin_op=["h_d","h_o"];
if(live_enabled)
function mc_gml_action_bin_op():mc_gml_action()constructor{
	static __enumParams__=global.__mp_gml_action_bin_op;
	static __enumIndex__=46;
}

if(live_enabled)
function gml_action_bin_op(l_h_d,l_h_o){
	var l_this=new mc_gml_action_bin_op();
	l_this.h_d=l_h_d;
	l_this.h_o=l_h_o;
	return l_this
}

if(live_enabled)
global.__mp_gml_action_un_op=["h_d","h_o"];
if(live_enabled)
function mc_gml_action_un_op():mc_gml_action()constructor{
	static __enumParams__=global.__mp_gml_action_un_op;
	static __enumIndex__=47;
}

if(live_enabled)
function gml_action_un_op(l_h_d,l_h_o){
	var l_this=new mc_gml_action_un_op();
	l_this.h_d=l_h_d;
	l_this.h_o=l_h_o;
	return l_this
}

if(live_enabled)
global.__mp_gml_action_in=["h_d","h_not"];
if(live_enabled)
function mc_gml_action_in():mc_gml_action()constructor{
	static __enumParams__=global.__mp_gml_action_in;
	static __enumIndex__=48;
}

if(live_enabled)
function gml_action_in(l_h_d,l_h_not){
	var l_this=new mc_gml_action_in();
	l_this.h_d=l_h_d;
	l_this.h_not=l_h_not;
	return l_this
}

if(live_enabled)
global.__mp_gml_action_call_script=["h_d","h_script","h_argc"];
if(live_enabled)
function mc_gml_action_call_script():mc_gml_action()constructor{
	static __enumParams__=global.__mp_gml_action_call_script;
	static __enumIndex__=49;
}

if(live_enabled)
function gml_action_call_script(l_h_d,l_h_script,l_h_argc){
	var l_this=new mc_gml_action_call_script();
	l_this.h_d=l_h_d;
	l_this.h_script=l_h_script;
	l_this.h_argc=l_h_argc;
	return l_this
}

if(live_enabled)
global.__mp_gml_action_call_script_id=["h_d","h_argc"];
if(live_enabled)
function mc_gml_action_call_script_id():mc_gml_action()constructor{
	static __enumParams__=global.__mp_gml_action_call_script_id;
	static __enumIndex__=50;
}

if(live_enabled)
function gml_action_call_script_id(l_h_d,l_h_argc){
	var l_this=new mc_gml_action_call_script_id();
	l_this.h_d=l_h_d;
	l_this.h_argc=l_h_argc;
	return l_this
}

if(live_enabled)
global.__mp_gml_action_call_script_with_array=["h_d"];
if(live_enabled)
function mc_gml_action_call_script_with_array():mc_gml_action()constructor{
	static __enumParams__=global.__mp_gml_action_call_script_with_array;
	static __enumIndex__=51;
}

if(live_enabled)
function gml_action_call_script_with_array(l_h_d){
	var l_this=new mc_gml_action_call_script_with_array();
	l_this.h_d=l_h_d;
	return l_this
}

if(live_enabled)
global.__mp_gml_action_call_func=["h_d","h_func","h_argc","h_args","h_rest","h_inst","h_out"];
if(live_enabled)
function mc_gml_action_call_func():mc_gml_action()constructor{
	static __enumParams__=global.__mp_gml_action_call_func;
	static __enumIndex__=52;
}

if(live_enabled)
function gml_action_call_func(l_h_d,l_h_func,l_h_argc,l_h_args,l_h_rest,l_h_inst,l_h_out){
	var l_this=new mc_gml_action_call_func();
	l_this.h_d=l_h_d;
	l_this.h_func=l_h_func;
	l_this.h_argc=l_h_argc;
	l_this.h_args=l_h_args;
	l_this.h_rest=l_h_rest;
	l_this.h_inst=l_h_inst;
	l_this.h_out=l_h_out;
	return l_this
}

if(live_enabled)
global.__mp_gml_action_call_field=["h_d","h_field","h_argc"];
if(live_enabled)
function mc_gml_action_call_field():mc_gml_action()constructor{
	static __enumParams__=global.__mp_gml_action_call_field;
	static __enumIndex__=53;
}

if(live_enabled)
function gml_action_call_field(l_h_d,l_h_field,l_h_argc){
	var l_this=new mc_gml_action_call_field();
	l_this.h_d=l_h_d;
	l_this.h_field=l_h_field;
	l_this.h_argc=l_h_argc;
	return l_this
}

if(live_enabled)
global.__mp_gml_action_construct=["h_d","h_argc"];
if(live_enabled)
function mc_gml_action_construct():mc_gml_action()constructor{
	static __enumParams__=global.__mp_gml_action_construct;
	static __enumIndex__=54;
}

if(live_enabled)
function gml_action_construct(l_h_d,l_h_argc){
	var l_this=new mc_gml_action_construct();
	l_this.h_d=l_h_d;
	l_this.h_argc=l_h_argc;
	return l_this
}

if(live_enabled)
global.__mp_gml_action_func_literal=["h_d","h_name"];
if(live_enabled)
function mc_gml_action_func_literal():mc_gml_action()constructor{
	static __enumParams__=global.__mp_gml_action_func_literal;
	static __enumIndex__=55;
}

if(live_enabled)
function gml_action_func_literal(l_h_d,l_h_name){
	var l_this=new mc_gml_action_func_literal();
	l_this.h_d=l_h_d;
	l_this.h_name=l_h_name;
	return l_this
}

if(live_enabled)
global.__mp_gml_action_jump=["h_d","h_p"];
if(live_enabled)
function mc_gml_action_jump():mc_gml_action()constructor{
	static __enumParams__=global.__mp_gml_action_jump;
	static __enumIndex__=56;
}

if(live_enabled)
function gml_action_jump(l_h_d,l_h_p){
	var l_this=new mc_gml_action_jump();
	l_this.h_d=l_h_d;
	l_this.h_p=l_h_p;
	return l_this
}

if(live_enabled)
global.__mp_gml_action_jump_if=["h_d","h_p"];
if(live_enabled)
function mc_gml_action_jump_if():mc_gml_action()constructor{
	static __enumParams__=global.__mp_gml_action_jump_if;
	static __enumIndex__=57;
}

if(live_enabled)
function gml_action_jump_if(l_h_d,l_h_p){
	var l_this=new mc_gml_action_jump_if();
	l_this.h_d=l_h_d;
	l_this.h_p=l_h_p;
	return l_this
}

if(live_enabled)
global.__mp_gml_action_jump_unless=["h_d","h_p"];
if(live_enabled)
function mc_gml_action_jump_unless():mc_gml_action()constructor{
	static __enumParams__=global.__mp_gml_action_jump_unless;
	static __enumIndex__=58;
}

if(live_enabled)
function gml_action_jump_unless(l_h_d,l_h_p){
	var l_this=new mc_gml_action_jump_unless();
	l_this.h_d=l_h_d;
	l_this.h_p=l_h_p;
	return l_this
}

if(live_enabled)
global.__mp_gml_action_bool_and=["h_d","h_p"];
if(live_enabled)
function mc_gml_action_bool_and():mc_gml_action()constructor{
	static __enumParams__=global.__mp_gml_action_bool_and;
	static __enumIndex__=59;
}

if(live_enabled)
function gml_action_bool_and(l_h_d,l_h_p){
	var l_this=new mc_gml_action_bool_and();
	l_this.h_d=l_h_d;
	l_this.h_p=l_h_p;
	return l_this
}

if(live_enabled)
global.__mp_gml_action_bool_or=["h_d","h_p"];
if(live_enabled)
function mc_gml_action_bool_or():mc_gml_action()constructor{
	static __enumParams__=global.__mp_gml_action_bool_or;
	static __enumIndex__=60;
}

if(live_enabled)
function gml_action_bool_or(l_h_d,l_h_p){
	var l_this=new mc_gml_action_bool_or();
	l_this.h_d=l_h_d;
	l_this.h_p=l_h_p;
	return l_this
}

if(live_enabled)
global.__mp_gml_action_switch=["h_d","h_jumptable","h_p"];
if(live_enabled)
function mc_gml_action_switch():mc_gml_action()constructor{
	static __enumParams__=global.__mp_gml_action_switch;
	static __enumIndex__=61;
}

if(live_enabled)
function gml_action_switch(l_h_d,l_h_jumptable,l_h_p){
	var l_this=new mc_gml_action_switch();
	l_this.h_d=l_h_d;
	l_this.h_jumptable=l_h_jumptable;
	l_this.h_p=l_h_p;
	return l_this
}

if(live_enabled)
global.__mp_gml_action_switch_case=["h_d","h_p"];
if(live_enabled)
function mc_gml_action_switch_case():mc_gml_action()constructor{
	static __enumParams__=global.__mp_gml_action_switch_case;
	static __enumIndex__=62;
}

if(live_enabled)
function gml_action_switch_case(l_h_d,l_h_p){
	var l_this=new mc_gml_action_switch_case();
	l_this.h_d=l_h_d;
	l_this.h_p=l_h_p;
	return l_this
}

if(live_enabled)
global.__mp_gml_action_repeat_jump=["h_d","h_p"];
if(live_enabled)
function mc_gml_action_repeat_jump():mc_gml_action()constructor{
	static __enumParams__=global.__mp_gml_action_repeat_jump;
	static __enumIndex__=63;
}

if(live_enabled)
function gml_action_repeat_jump(l_h_d,l_h_p){
	var l_this=new mc_gml_action_repeat_jump();
	l_this.h_d=l_h_d;
	l_this.h_p=l_h_p;
	return l_this
}

if(live_enabled)
global.__mp_gml_action_repeat_pre=["h_d","h_p"];
if(live_enabled)
function mc_gml_action_repeat_pre():mc_gml_action()constructor{
	static __enumParams__=global.__mp_gml_action_repeat_pre;
	static __enumIndex__=64;
}

if(live_enabled)
function gml_action_repeat_pre(l_h_d,l_h_p){
	var l_this=new mc_gml_action_repeat_pre();
	l_this.h_d=l_h_d;
	l_this.h_p=l_h_p;
	return l_this
}

if(live_enabled)
global.__mp_gml_action_with_pre=["h_d"];
if(live_enabled)
function mc_gml_action_with_pre():mc_gml_action()constructor{
	static __enumParams__=global.__mp_gml_action_with_pre;
	static __enumIndex__=65;
}

if(live_enabled)
function gml_action_with_pre(l_h_d){
	var l_this=new mc_gml_action_with_pre();
	l_this.h_d=l_h_d;
	return l_this
}

if(live_enabled)
global.__mp_gml_action_with_next=["h_d","h_p"];
if(live_enabled)
function mc_gml_action_with_next():mc_gml_action()constructor{
	static __enumParams__=global.__mp_gml_action_with_next;
	static __enumIndex__=66;
}

if(live_enabled)
function gml_action_with_next(l_h_d,l_h_p){
	var l_this=new mc_gml_action_with_next();
	l_this.h_d=l_h_d;
	l_this.h_p=l_h_p;
	return l_this
}

if(live_enabled)
global.__mp_gml_action_with_post=["h_d"];
if(live_enabled)
function mc_gml_action_with_post():mc_gml_action()constructor{
	static __enumParams__=global.__mp_gml_action_with_post;
	static __enumIndex__=67;
}

if(live_enabled)
function gml_action_with_post(l_h_d){
	var l_this=new mc_gml_action_with_post();
	l_this.h_d=l_h_d;
	return l_this
}

if(live_enabled)
global.__mp_gml_action_break=["h_d","h_lp"];
if(live_enabled)
function mc_gml_action_break():mc_gml_action()constructor{
	static __enumParams__=global.__mp_gml_action_break;
	static __enumIndex__=68;
}

if(live_enabled)
function gml_action_break(l_h_d,l_h_lp){
	var l_this=new mc_gml_action_break();
	l_this.h_d=l_h_d;
	l_this.h_lp=l_h_lp;
	return l_this
}

if(live_enabled)
global.__mp_gml_action_continue=["h_d","h_lp"];
if(live_enabled)
function mc_gml_action_continue():mc_gml_action()constructor{
	static __enumParams__=global.__mp_gml_action_continue;
	static __enumIndex__=69;
}

if(live_enabled)
function gml_action_continue(l_h_d,l_h_lp){
	var l_this=new mc_gml_action_continue();
	l_this.h_d=l_h_d;
	l_this.h_lp=l_h_lp;
	return l_this
}

if(live_enabled)
global.__mp_gml_action_return=["h_d"];
if(live_enabled)
function mc_gml_action_return():mc_gml_action()constructor{
	static __enumParams__=global.__mp_gml_action_return;
	static __enumIndex__=70;
}

if(live_enabled)
function gml_action_return(l_h_d){
	var l_this=new mc_gml_action_return();
	l_this.h_d=l_h_d;
	return l_this
}

if(live_enabled)
global.__mp_gml_action_result=["h_d"];
if(live_enabled)
function mc_gml_action_result():mc_gml_action()constructor{
	static __enumParams__=global.__mp_gml_action_result;
	static __enumIndex__=71;
}

if(live_enabled)
function gml_action_result(l_h_d){
	var l_this=new mc_gml_action_result();
	l_this.h_d=l_h_d;
	return l_this
}

if(live_enabled)
global.__mp_gml_action_try=["h_d","h_hdl"];
if(live_enabled)
function mc_gml_action_try():mc_gml_action()constructor{
	static __enumParams__=global.__mp_gml_action_try;
	static __enumIndex__=72;
}

if(live_enabled)
function gml_action_try(l_h_d,l_h_hdl){
	var l_this=new mc_gml_action_try();
	l_this.h_d=l_h_d;
	l_this.h_hdl=l_h_hdl;
	return l_this
}

if(live_enabled)
global.__mp_gml_action_catch=["h_d","h_v"];
if(live_enabled)
function mc_gml_action_catch():mc_gml_action()constructor{
	static __enumParams__=global.__mp_gml_action_catch;
	static __enumIndex__=73;
}

if(live_enabled)
function gml_action_catch(l_h_d,l_h_v){
	var l_this=new mc_gml_action_catch();
	l_this.h_d=l_h_d;
	l_this.h_v=l_h_v;
	return l_this
}

if(live_enabled)
global.__mp_gml_action_finally=["h_d","h_p"];
if(live_enabled)
function mc_gml_action_finally():mc_gml_action()constructor{
	static __enumParams__=global.__mp_gml_action_finally;
	static __enumIndex__=74;
}

if(live_enabled)
function gml_action_finally(l_h_d,l_h_p){
	var l_this=new mc_gml_action_finally();
	l_this.h_d=l_h_d;
	l_this.h_p=l_h_p;
	return l_this
}

if(live_enabled)
global.__mp_gml_action_throw=["h_d"];
if(live_enabled)
function mc_gml_action_throw():mc_gml_action()constructor{
	static __enumParams__=global.__mp_gml_action_throw;
	static __enumIndex__=75;
}

if(live_enabled)
function gml_action_throw(l_h_d){
	var l_this=new mc_gml_action_throw();
	l_this.h_d=l_h_d;
	return l_this
}

if(live_enabled)
global.__mp_gml_action_wait=["h_d"];
if(live_enabled)
function mc_gml_action_wait():mc_gml_action()constructor{
	static __enumParams__=global.__mp_gml_action_wait;
	static __enumIndex__=76;
}

if(live_enabled)
function gml_action_wait(l_h_d){
	var l_this=new mc_gml_action_wait();
	l_this.h_d=l_h_d;
	return l_this
}

if(live_enabled)
global.__mp_gml_action_fork=["h_d","h_out"];
if(live_enabled)
function mc_gml_action_fork():mc_gml_action()constructor{
	static __enumParams__=global.__mp_gml_action_fork;
	static __enumIndex__=77;
}

if(live_enabled)
function gml_action_fork(l_h_d,l_h_out){
	var l_this=new mc_gml_action_fork();
	l_this.h_d=l_h_d;
	l_this.h_out=l_h_out;
	return l_this
}

if(live_enabled)
global.__mp_gml_action_ensure_array_for_local=["h_d","h_ind"];
if(live_enabled)
function mc_gml_action_ensure_array_for_local():mc_gml_action()constructor{
	static __enumParams__=global.__mp_gml_action_ensure_array_for_local;
	static __enumIndex__=78;
}

if(live_enabled)
function gml_action_ensure_array_for_local(l_h_d,l_h_ind){
	var l_this=new mc_gml_action_ensure_array_for_local();
	l_this.h_d=l_h_d;
	l_this.h_ind=l_h_ind;
	return l_this
}

if(live_enabled)
global.__mp_gml_action_ensure_array_for_global=["h_d","h_name"];
if(live_enabled)
function mc_gml_action_ensure_array_for_global():mc_gml_action()constructor{
	static __enumParams__=global.__mp_gml_action_ensure_array_for_global;
	static __enumIndex__=79;
}

if(live_enabled)
function gml_action_ensure_array_for_global(l_h_d,l_h_name){
	var l_this=new mc_gml_action_ensure_array_for_global();
	l_this.h_d=l_h_d;
	l_this.h_name=l_h_name;
	return l_this
}

if(live_enabled)
global.__mp_gml_action_ensure_array_for_field=["h_d","h_field"];
if(live_enabled)
function mc_gml_action_ensure_array_for_field():mc_gml_action()constructor{
	static __enumParams__=global.__mp_gml_action_ensure_array_for_field;
	static __enumIndex__=80;
}

if(live_enabled)
function gml_action_ensure_array_for_field(l_h_d,l_h_field){
	var l_this=new mc_gml_action_ensure_array_for_field();
	l_this.h_d=l_h_d;
	l_this.h_field=l_h_field;
	return l_this
}

if(live_enabled)
global.__mp_gml_action_ensure_array_for_index=["h_d"];
if(live_enabled)
function mc_gml_action_ensure_array_for_index():mc_gml_action()constructor{
	static __enumParams__=global.__mp_gml_action_ensure_array_for_index;
	static __enumIndex__=81;
}

if(live_enabled)
function gml_action_ensure_array_for_index(l_h_d){
	var l_this=new mc_gml_action_ensure_array_for_index();
	l_this.h_d=l_h_d;
	return l_this
}

if(live_enabled)
global.__mp_gml_action_ensure_array_for_index2d=["h_d"];
if(live_enabled)
function mc_gml_action_ensure_array_for_index2d():mc_gml_action()constructor{
	static __enumParams__=global.__mp_gml_action_ensure_array_for_index2d;
	static __enumIndex__=82;
}

if(live_enabled)
function gml_action_ensure_array_for_index2d(l_h_d){
	var l_this=new mc_gml_action_ensure_array_for_index2d();
	l_this.h_d=l_h_d;
	return l_this
}

if(live_enabled)
global.__mp_gml_action_alarm=["h_d"];
if(live_enabled)
function mc_gml_action_alarm():mc_gml_action()constructor{
	static __enumParams__=global.__mp_gml_action_alarm;
	static __enumIndex__=83;
}

if(live_enabled)
function gml_action_alarm(l_h_d){
	var l_this=new mc_gml_action_alarm();
	l_this.h_d=l_h_d;
	return l_this
}

if(live_enabled)
global.__mp_gml_action_alarm_set=["h_d"];
if(live_enabled)
function mc_gml_action_alarm_set():mc_gml_action()constructor{
	static __enumParams__=global.__mp_gml_action_alarm_set;
	static __enumIndex__=84;
}

if(live_enabled)
function gml_action_alarm_set(l_h_d){
	var l_this=new mc_gml_action_alarm_set();
	l_this.h_d=l_h_d;
	return l_this
}

if(live_enabled)
global.__mp_gml_action_alarm_aop=["h_d","h_op"];
if(live_enabled)
function mc_gml_action_alarm_aop():mc_gml_action()constructor{
	static __enumParams__=global.__mp_gml_action_alarm_aop;
	static __enumIndex__=85;
}

if(live_enabled)
function gml_action_alarm_aop(l_h_d,l_h_op){
	var l_this=new mc_gml_action_alarm_aop();
	l_this.h_d=l_h_d;
	l_this.h_op=l_h_op;
	return l_this
}

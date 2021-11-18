/*-----------------------------------------------------------------------------
_______________________________________________________________________________
UNIFORMS:
-------------------------------------------------------------------------------
uniform float		fx_strength	0:	no effect
								>0:	the larger the number the more distortion
								<0: as >0 but flipped distortion direction
								usually -1 to +1 is ok
uniform sampler2D	normal	the sampler id of the normal map
_______________________________________________________________________________
*/

varying vec2		v_vTexcoord;
uniform float		fx_strength;
uniform sampler2D	normal;


void main() {

	vec2 offset	= (texture2D( normal, v_vTexcoord ).rg - 0.5) * 2.0 * fx_strength;
	vec4 color = texture2D(gm_BaseTexture, v_vTexcoord + offset);
	color.rgb = color.rgb;
	gl_FragColor = color;
}

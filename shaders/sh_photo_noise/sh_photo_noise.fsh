varying vec2 v_vTexcoord;
varying vec4 v_vColour;

varying vec2 v_vPosition;

uniform float seed; //seed passed in (increment in small values, ~0.0015 per step, for slower/more subtle effect)

float rand( vec2 p)
{
    return fract( cos( dot( p, vec2(5.237,6.378)))* (8463.648 + seed));  //Xor's randomizing math with added seed modifier for animation
}

float noise( vec2 p) //noise function as found on https://xorshaders.weebly.com/tutorials/vertex-shader-4
{
    float x1 = rand(vec2(floor(p.x),floor(p.y)));
    float x2 = rand(vec2(ceil(p.x),floor(p.y)));
    float top = mix(x1,x2,smoothstep(0.0,1.0,fract(p.x)));

    x1 = rand(vec2(floor(p.x),ceil(p.y)));
    x2 = rand(vec2(ceil(p.x),ceil(p.y)));
    float bottom = mix(x1,x2,smoothstep(0.0,1.0,fract(p.x)));

    return mix(top,bottom,smoothstep(0.0,1.0,fract(p.y)));
}
 
void main()
{
    gl_FragColor = texture2D( gm_BaseTexture, v_vTexcoord );  //incoming color data

    float weighted = dot(gl_FragColor.rgb, vec3(0.299, 0.587, 0.114)); //weighted brightness value as found on
                                                                       //https://gmshaders.com/tutorials/tipsandtricks/ 
    float n = 
    (noise(v_vPosition/1.0)*0.4 //smallest noise 40% of mix
    +noise(v_vPosition/2.0)*0.3 //each line scales up and reduces % of mix to total 100% with 6 passes
    +noise(v_vPosition/4.0)*0.1 
    +noise(v_vPosition/8.0)*0.1
    +noise(v_vPosition/16.0)*0.1) 
    + (sqrt(weighted)); //weighted brightness added to noise to blow out the brighter reas (reducing noise)

    float dark_strength = 0.7; //increase to darken noise in bright areas
    float light_strength = 0.5; //increase to lighten noise in dark areas

    gl_FragColor *= (vec4(vec3(clamp(n,-0.2,1.2)),1.0)) * dark_strength; //controls the dark noise as it shows up in the brighter areas (multiply blending)
    gl_FragColor += (vec4(vec3(clamp(1.0 - (n * 1.2),0.0,1.0) * 0.5),1.0)) * (1.0 - weighted) * light_strength; //additive pass to apply noise to dark areas
}
shader_type canvas_item;

uniform bool flash_enabled = false;
uniform vec4 flash_color : source_color = vec4(1.0,1.0,1.0,1.0);

void fragment() {
	vec4 texture_color = texture(TEXTURE, UV);
	//COLOR = mix(texture_color, flash_color, abs(texture_color.a));
	vec4 ouput_color = texture_color;
	if(flash_enabled){
		ouput_color = vec4(flash_color.r, flash_color.b, flash_color.g, texture_color.a);
	}
	COLOR = ouput_color;
	// Called for every pixel the material is visible on.
}

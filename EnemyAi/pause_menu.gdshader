shader_type canvas_item;
uniform sampler2D SCREEN_TEXTIRE: hint_screen_texture, filter_linear_mipmap;

uniform float amount: hint_range(0.0, 5) = 0.0;

void fragment() {
	vec4 color = texture(SCREEN_TEXTIRE, SCREEN_UV, amount);
	COLOR = color;
}


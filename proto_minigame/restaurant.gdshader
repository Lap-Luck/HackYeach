shader_type canvas_item;

uniform float base_blur_size : hint_range(0.0, 10.0) = 3.0;
uniform float fluctuation_speed : hint_range(0.0, 10.0) = 2.0;
uniform float fluctuation_strength : hint_range(0.0, 5.0) = 1.0;
uniform sampler2D SCREEN_TEXTURE : hint_screen_texture, filter_linear_mipmap;

void fragment() {
    // Compute blur that fluctuates over time
    float t = TIME * fluctuation_speed;
    float blur = base_blur_size + sin(t) * fluctuation_strength;

    vec2 pixel = SCREEN_PIXEL_SIZE * blur;

    vec4 color = texture(SCREEN_TEXTURE, SCREEN_UV);
    color += texture(SCREEN_TEXTURE, SCREEN_UV + vec2(pixel.x, 0.0));
    color += texture(SCREEN_TEXTURE, SCREEN_UV - vec2(pixel.x, 0.0));
    color += texture(SCREEN_TEXTURE, SCREEN_UV + vec2(0.0, pixel.y));
    color += texture(SCREEN_TEXTURE, SCREEN_UV - vec2(0.0, pixel.y));

    COLOR = color / 5.0;
}
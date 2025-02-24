shader_type canvas_item;

uniform vec4 start_color : source_color; // Base tint color
uniform vec4 end_color : source_color;   // Target tint color
uniform float shift_amount;               // 0 = original, 1 = full tint
uniform float tint_amount;

void fragment() {
    vec4 texture_color = texture(TEXTURE, UV); // Get original texture color
    vec4 tint_color = mix(start_color, end_color, shift_amount); // Blend between start & end colors
    vec4 final_color = mix(texture_color, tint_color, tint_amount); // Mix with texture (0.5 = half texture, half tint)
    
    COLOR = final_color;
}

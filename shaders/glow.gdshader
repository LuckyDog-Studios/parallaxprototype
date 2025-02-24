shader_type canvas_item;

uniform float glow_strength : hint_range(0.0, 1.0) = 0.5;
uniform vec4 start_color : source_color; // Base color of the gradient
uniform vec4 end_color : source_color;   // Target color of the gradient
uniform float shift_amount;              // 0 = start_color, 1 = end_color

void fragment() {
    vec4 tex_color = texture(TEXTURE, UV);
    
    // Blend between start_color and end_color using shift_amount
    vec4 gradient_color = mix(start_color, end_color, shift_amount);
    
    // Extract brightness to determine glow intensity
    float brightness = max(tex_color.r, max(tex_color.g, tex_color.b));

    // Use the gradient color as the glow color
    vec4 glow = gradient_color * brightness * glow_strength;

    // Combine original texture with glow effect
    COLOR = tex_color + glow;
}

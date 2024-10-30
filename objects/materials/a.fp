varying mediump vec2 var_texcoord0;

uniform lowp sampler2D texture_sampler;
uniform lowp vec4 tint;

void main()
{
    lowp vec4 tint_pm = vec4(tint.xyz * tint.w, tint.w);
    lowp vec4 tex = texture2D(texture_sampler, var_texcoord0.xy) * tint_pm;
    gl_FragColor = tex;
}

#version 330 core
layout(location = 0) in vec4 a_position;
layout(location = 1) in vec2 texCoord;
out vec2 v_texCoord;
uniform vec2 rubyTextureSize;
uniform vec2 rubyInputSize;
uniform vec2 rubyOutputSize;
uniform int rubyFrameCount;

out sine_coord
{
	vec2 omega;
} coords;

void main()
{
  gl_Position = a_position;
  v_texCoord = vec2(texCoord.x, texCoord.y);

  coords.omega = vec2(3.1415 * rubyOutputSize.x * rubyTextureSize.x / rubyInputSize.x, 2.0 * 3.1415 * rubyTextureSize.y);
}

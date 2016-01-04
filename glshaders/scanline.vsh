#version 330 core
in vec4 a_position;
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
  v_texCoord = vec2((a_position.x+1.0)/2.0*rubyInputSize.x/rubyTextureSize.x,(1.0-a_position.y)/2.0*rubyInputSize.y/rubyTextureSize.y);

  // Note that the x and y dimensions are swapped compared to the value in libretro/common-shaders/scanline.cg.
  // If you don't swap them for DosBox then you get vertical scanlines.
  coords.omega = vec2(2.0 * 3.1415 * rubyTextureSize.y, 3.1415 * rubyOutputSize.x * rubyOutputSize.x / rubyInputSize.x);
}

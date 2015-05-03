/*
Dot 'n bloom shader
Author: Themaister
License: Public domain
*/

attribute vec4 a_position;

varying vec2 c00;
varying vec2 c10;
varying vec2 c20;
varying vec2 c01;
varying vec2 c11;
varying vec2 c21;
varying vec2 c02;
varying vec2 c12;
varying vec2 c22;
varying vec2 pixel_no;
uniform vec2 rubyTextureSize;
uniform vec2 rubyOutputSize;
uniform vec2 rubyInputSize;

void main()
{
   // gl_Position = gl_ModelViewProjectionMatrix * gl_Vertex;
   gl_Position = a_position;

   float dx = 1.0 / rubyTextureSize.x;
   float dy = 1.0 / rubyTextureSize.y;

   // vec2 tex = gl_MultiTexCoord0.xy;
   vec2 tex = vec2((a_position.x+1.0)/2.0*rubyInputSize.x/rubyTextureSize.x,(1.0-a_position.y)/2.0*rubyInputSize.y/rubyTextureSize.y);

   c00 = tex + vec2(-dx, -dy);
   c10 = tex + vec2(  0, -dy);
   c20 = tex + vec2( dx, -dy);
   c01 = tex + vec2(-dx,   0);
   c11 = tex + vec2(  0,   0);
   c21 = tex + vec2( dx,   0);
   c02 = tex + vec2(-dx,  dy);
   c12 = tex + vec2(  0,  dy);
   c22 = tex + vec2( dx,  dy);
   pixel_no = tex * rubyTextureSize;
}

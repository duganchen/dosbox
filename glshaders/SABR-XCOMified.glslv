/*
SABR XCOMified v1.3 Shader

Copyright (C) 2011, 2012 Hyllian/Jararaca - sergiogdb@gmail.com (5xBR)
Copyright (C) 2012 crazy46guy (GLSL conversion)
Copyright (C) 2012 Joshua Street (SABR)
Copyright (c) 2014 Daemonjax (XCOMification)

Portions of this algorithm were taken from Hyllian's 5xBR v3.7c
shader and Joshua Street's SABR v3.0 shader.

This program is free software; you can redistribute it and/or
modify it under the terms of the GNU General Public License
as published by the Free Software Foundation; either version 2
of the License, or (at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program; if not, write to the Free Software
Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA 02111-1307, USA.
*/

attribute vec4 a_position;

uniform vec2 rubyInputSize;
uniform vec2 rubyTextureSize;

varying vec2 tc;
varying vec4 xyp_e1_e2_e3;
varying vec4 xyp_f1_f2_f3;
varying vec4 xyp_g1_g2_g3;
varying vec4 xyp_h1_h2_h3;
varying vec4 xyp_a_b_c_d;
varying vec4 xyp_1_2_3;
varying vec4 xyp_5_10_15;
varying vec4 xyp_6_7_8;
varying vec4 xyp_9_14_9;
varying vec4 xyp_11_12_13;
varying vec4 xyp_16_17_18;
varying vec4 xyp_21_22_23;

void main() {
  // gl_Position = gl_ModelViewProjectionMatrix * gl_Vertex;
  gl_Position = a_position;


  float x = 1.0 / rubyTextureSize.x;
  float y = 1.0 / rubyTextureSize.y;

  /* Mask for algorhithm
     -4x  -3x  -2x   -x    0    x   2x   3x   4x
    +----+----+----+----+----+----+----+----+----+
         |    |    |    |    |    |    |    |    | -4y
    +----+----+----+----+----+----+----+----+----+
         |    |    | e1 | e2 | e3 |    |    |    | -3y
    +----+----+----+----+----+----+----+----+----+
         |    |  a |  1 |  2 |  3 |  b |    |    | -2y
    +----+----+----+----+----+----+----+----+----+
         | h1 |  5 |  6 |  7 |  8 |  9 | f1 |    |  -y
    +----+----+----+----+----+----+----+----+----+
         | h2 | 10 | 11 | 12 | 13 | 14 | f2 |    |   0
    +----+----+----+----+----+----+----+----+----+
         | h3 | 15 | 16 | 17 | 18 | 19 | f3 |    |   y
    +----+----+----+----+----+----+----+----+----+
         |    |  c | 21 | 22 | 23 |  d |    |    |  2y
    +----+----+----+----+----+----+----+----+----+
         |    |    | g1 | g2 | g3 |    |    |    |  3y
    +----+----+----+----+----+----+----+----+----+
         |    |    |    |    |    |    |    |    |  4y
    +----+----+----+----+----+----+----+----+----+
  */

  // tc = gl_MultiTexCoord0.xy;
  tc = vec2((a_position.x+1.0)/2.0*rubyInputSize.x/rubyTextureSize.x,(1.0-a_position.y)/2.0*rubyInputSize.y/rubyTextureSize.y);


  /*
  xyp_e1_e2_e3 = tc.xxxy + vec4(      -x, 0.0,   x, -3.0 * y);
  xyp_f1_f2_f3 = tc.xyyy + vec4( 3.0 * x,  -y, 0.0,        y);
  xyp_g1_g2_g3 = tc.xxxy + vec4(      -x, 0.0,   x,  3.0 * y);
  xyp_h1_h2_h3 = tc.xyyy + vec4(-3.0 * x,  -y, 0.0,        y);
  xyp_a_b_c_d  = tc.xxyy + vec4(-2.0 * x, 2.0  * x, -2.0 * y, 2.0 * y);
  */
  xyp_1_2_3    = tc.xxxy + vec4(      -x, 0.0,   x, -2.0 * y);
  xyp_6_7_8    = tc.xxxy + vec4(      -x, 0.0,   x,       -y);
  xyp_11_12_13 = tc.xxxy + vec4(      -x, 0.0,   x,      0.0);
  xyp_16_17_18 = tc.xxxy + vec4(      -x, 0.0,   x,        y);
  xyp_21_22_23 = tc.xxxy + vec4(      -x, 0.0,   x,  2.0 * y);
  xyp_5_10_15  = tc.xyyy + vec4(-2.0 * x,  -y, 0.0,        y);
  xyp_9_14_9   = tc.xyyy + vec4( 2.0 * x,  -y, 0.0,        y);
}

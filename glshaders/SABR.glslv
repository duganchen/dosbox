uniform vec2 rubyInputSize;
uniform vec2 rubyTextureSize;

varying vec2 tc;
varying vec4 xyp_1_2_3;
varying vec4 xyp_5_10_15;
varying vec4 xyp_6_7_8;
varying vec4 xyp_9_14_9;
varying vec4 xyp_11_12_13;
varying vec4 xyp_16_17_18;
varying vec4 xyp_21_22_23;

attribute vec4 a_position;

void main() {
	// gl_Position = gl_ModelViewProjectionMatrix * gl_Vertex;
	gl_Position = a_position;

	float x = 1.0 / rubyTextureSize.x;
	float y = 1.0 / rubyTextureSize.y;

	/*
		Mask for algorhithm
		+-----+-----+-----+-----+-----+
		|     |  1  |  2  |  3  |     |
		+-----+-----+-----+-----+-----+
		|  5  |  6  |  7  |  8  |  9  |
		+-----+-----+-----+-----+-----+
		| 10  | 11  | 12  | 13  | 14  |
		+-----+-----+-----+-----+-----+
		| 15  | 16  | 17  | 18  | 19  |
		+-----+-----+-----+-----+-----+
		|     | 21  | 22  | 23  |     |
		+-----+-----+-----+-----+-----+
	*/

	// tc = gl_MultiTexCoord0.xy;
	tc= vec2((a_position.x+1.0)/2.0*rubyInputSize.x/rubyTextureSize.x,(1.0-a_position.y)/2.0*rubyInputSize.y/rubyTextureSize.y);



	xyp_1_2_3    = tc.xxxy + vec4(      -x, 0.0,   x, -2.0 * y);
	xyp_6_7_8    = tc.xxxy + vec4(      -x, 0.0,   x,       -y);
	xyp_11_12_13 = tc.xxxy + vec4(      -x, 0.0,   x,      0.0);
	xyp_16_17_18 = tc.xxxy + vec4(      -x, 0.0,   x,        y);
	xyp_21_22_23 = tc.xxxy + vec4(      -x, 0.0,   x,  2.0 * y);
	xyp_5_10_15  = tc.xyyy + vec4(-2.0 * x,  -y, 0.0,        y);
	xyp_9_14_9   = tc.xyyy + vec4( 2.0 * x,  -y, 0.0,        y);
}

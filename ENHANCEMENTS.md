# Enhanced DosBox Fork

This is an enhanced DosBox fork. It is targeted at Linux and has a number of added
features. Each feature will be built if the needed dependency is available at build-time.
If not, then it will be built without that feature.

It is currently in sync with revision 3910.

The features are:

## GLSL Shaders

### Configuration

Copy the "glshaders" directory to the directory where dosbox-SVN.conf is found. On Linux, that means that you
should end up with ~/.dosbox/glshaders, and ~/.dosbox/glshaders should contain a selection of .glslv and .glslf
files.

Each shader comes in two parts: a vertex shader with a glslv extension, and a fragment shader with a glslf
extension.

In your dosbox-SVN.conf, set output as shown and glshader to taste. I recommend SABR-XCOMified, which is variation
on xBR.

    [sdl]
	output=openglnb
	glshader=SABR-XCOMified

### Credit:

* [Basic GLSL shader support (prototype)](http://www.vogons.org/viewtopic.php?f=41&t=36342&start=20#p319636)

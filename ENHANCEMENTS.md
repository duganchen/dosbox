# Enhanced DosBox Fork

This is an enhanced DosBox fork. It is targeted at Linux and has a number of added
features. Each feature will be built if the needed dependency is available at build-time.
If not, then it will be built without that feature.

It is currently in sync with revision 3911.

The features are:

## GLSL Shaders

### Configuration

Copy the "glshaders" directory to the directory where dosbox-SVN.conf is found. On Linux, that means that you
should end up with ~/.dosbox/glshaders, and ~/.dosbox/glshaders should contain a selection of .glslv and .glslf
files.

Each shader comes in two parts: a vertex shader with a glslv extension, and a fragment shader with a glslf
extension.

In your dosbox-SVN.conf, set output as shown and glshader to taste. I recommend the SABR-XCOMified shader, which
is variation on the xBR shader.

    [sdl]
	output=openglnb
	glshader=SABR-XCOMified

### Credit:

* [Basic GLSL shader support (prototype)](http://www.vogons.org/viewtopic.php?f=41&t=36342&start=20#p319636)

## xBRZ scaling

If you can't use OpenGL output, then you can turn on Surface output and take advantage of the xBRZ scaler instead.
This scaler will be turn on automatically if you have your output set to surface.

### Requirements

* [Intel(R) Threading Building Blocks](https://www.threadingbuildingblocks.org/)

### Configuration

Set as shown.

    [sdl]
	fullscreen=true
	fullresolution=original
	output=surface

	[render]
	aspect=false
	scaler=none

### Credit:

* [xBRZ 1.3](http://www.vogons.org/viewtopic.php?t=34125)

## Soundfont Support

Specify a General MIDI soundfont for DosBox to use. You no longer need to have
FluidSynth running as an ALSA server in the background.

### Requirements

* [FluidSynth](http://www.fluidsynth.org/)

### Configuration

Set mididevice as shown, fluid.driver and fluid.soundfont as appropriate.

	[midi]
	mididevice=fluidsynth
	fluid.driver=alsa
	fluid.soundfont=/path/to/soundfont.sf2

### Credit:

* [FluidSynth](http://www.vogons.org/viewtopic.php?f=32&t=27831&start=20#p385413)

## MT-32 Emulation

Tell DosBox where your MT-32 ROMs are, and DosBox will use them for MT-32 emulation.
You no longer need to have munt-qt running in the background.

### Requirements

* [Munt](http://munt.sourceforge.net/)

### Configuration

Set mididevice as shown, mt32.romdir as appropriate.

	[midi]
	mididevice=mt32
	mt32.romdir=/path/to/roms

## Credit:

* [MT-32 Emulation](https://raw.githubusercontent.com/munt/munt/master/DOSBox-mt32-patch/dosbox-SVN-r3892-mt32-patch.diff)

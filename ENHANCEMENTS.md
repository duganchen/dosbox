# Enhanced DosBox Fork

This is an enhanced for of DosBox. It is currently in sync with revision 3969.

## Requiremnts 

For all features, please build it with the following dependencies:

* [SDL2](http://libsdl.org/download-2.0.php) (required)
* [SDL2\_net](https://www.libsdl.org/projects/SDL_net/)
* [FluidSynth](http://www.fluidsynth.org/) (soundfont support)
* [GLEW](http://glew.sourceforge.net/) (OpenGL 3 and shader support)
* [munt](http://munt.sourceforge.net/) (built-in MT32 emulation)


## Differences

* physical CD-ROM support is no longer available
* "aspect"'s default value is now true
* "output"'s default value is now "texturenb"
* "scaler's" default value is now none

## Features

### Soundfont Support
	
Games that use General MIDI can use the FluidSynth backend and play audio
using a soundfont, specified in your configuration file:
	
	[midi]
	mididevice=fluidsynth
	fluid.driver=alsa # set as appropriate
	fluid.soundfont=/path/to/soundfont.sf2

### MT-32 Emulation

While I still recommend using munt as a separate application and then connecting
DosBox to its MIDI port, native MT-32 emulation is available as another option.
Simply specify the path to the soundfont in your configuration file:

	[midi]
	mididevice=mt32
	mt32.romdir=/path/to/roms

### OpenGL 3 Support

The default video output method, "texturenb", is equivalent to "openglnb" in
vanilla DosBox. In this version, "openglnb" and "opengl" use OpenGL 3 and can
take advantage of custom shaders.

#### External Shaders

Download the shaders from here:

* [dosbox\_shaders](https://github.com/duganchen/dosbox_shaders)

Then create a "shader" directory in the same one as your DosBox configuration file.
Then put the *.vert and *.frag files from the collection of shaders in that directory.

On Linux, you should have:

	~/.dosbox/shaders/*.vert
	~/.dosbox/shaders/*.frag

And on OS X, you should have::w

	~/Library/Preferences/shaders/*.vert
	~/Library/Preferences/shaders/*.frag

Each shader is two files. For example:

* crt-lottes.vert
* crt-lottes.frag

To use one, specify its name, without the path or the file extension, as the *gl.shader*:

	[sdl]
	output=openglnb
	gl.shader=crt-lottes

## Credit

This fork either directly uses or builds on the following community contributions:

* [Patch for OpenGL fullscreen bug](http://www.vogons.org/viewtopic.php?f=32&t=27487&start=20#p276738)
* [Official Munt DosBox patch](https://github.com/munt/munt/blob/master/DOSBox-mt32-patch/dosbox-SVN-r3892-mt32-patch.diff)
* [FluidSynth soundfont patch](http://www.vogons.org/viewtopic.php?f=32&t=27831&start=20#p385413)
* [Basic GLSL shader support (prototype)](http://www.vogons.org/viewtopic.php?f=41&t=36342&start=20#p319636)
* [An adaptation to SDL 2.0](http://www.vogons.org/viewtopic.php?f=32&t=34770&start=40#p433097)

# Enhanced DosBox Fork

This is an enhanced fork of DosBox. It is currently in sync with revision 4156.

## Requirements 

### Building

A full-featured build will need the following dependencies:

* [SDL2](http://libsdl.org/download-2.0.php) (required)
* [SDL2\_net](https://www.libsdl.org/projects/SDL_net/)
* [FluidSynth](http://www.fluidsynth.org/) (soundfont support)

### Configuration

There are new configuration options, and some existing options have new defaults.
If you have a configuration file from a different version of DosBox, then I
recommend removing it and letting this version generate a replacement.

## Features

### Soundfont Support
	
Games that use General MIDI can use the new FluidSynth backend to
play BGM using a soundfont. Specify that in your configuration file:
	
	[midi]
	mididevice=fluidsynth
	fluid.driver=alsa # set as appropriate
	fluid.soundfont=/path/to/soundfont.sf2

On OS X and Linux, DosBox will perform shell-expansion on the fluid.soundfont paths. That means that it's allowed to have dollar signs
(environment variables) and tildes (home directories).

If you've built FluidSynth into DosBox and you want to stop FluidSynth from loading, set the following:

	mididevice=none

### OpenGL 3 Support

The default video output method, "texturenb", is equivalent to "openglnb" in
vanilla DosBox. Now, "openglnb" and "opengl" use OpenGL 3 and can take advantage
of external shaders.

#### External Shaders

The shaders are stored in a separate project. Download them from here:

* [dosbox\_shaders](https://github.com/duganchen/dosbox_shaders)

Then create a "shaders" directory in the same parent directory that has your
DosBox configuration file.  Put the *.vert and *.frag files from the
dosbox\_shaders project into the "shaders" directory.

On Linux, you should have:

	~/.dosbox/shaders/*.vert
	~/.dosbox/shaders/*.frag

On OS X, you should have:

	~/Library/Preferences/shaders/*.vert
	~/Library/Preferences/shaders/*.frag

Each shader is two files. For example:

* crt-lottes.vert
* crt-lottes.frag

To use one, specify its name, without the path or the file extension, as the *gl.shader*:

	[sdl]
	output=openglnb
	gl.shader=crt-lottes

EGA games tend to work well with the *jinc2-sharp* shader, which removes dithering.

Please note that the new defaults (scaler=none, aspect=on) are needed for the
shaders to work as designed.

## Misc Differences

* physical CD-ROMs are no longer supported (use IMGMOUNT and ISOs instead)
* "aspect"'s default value is now true
* "output"'s default value is now "texturenb"
* "scaler's" default value is now none
* Pixel Buffer Objects are no longer used for rendering (I've found them to be the cause of a screen corruption bug)
* --enable-retinafix option is available to fix fullscreen support on OS X 
* game resolution is printed to the console (so you can set your DosBox window resolution to a multiple of it)

## Credit

This fork uses, either directly or by building on, the following community contributions:

* [Patch for OpenGL fullscreen bug](http://www.vogons.org/viewtopic.php?f=32&t=27487&start=20#p276738)
* [FluidSynth soundfont patch](http://www.vogons.org/viewtopic.php?f=32&t=27831&start=20#p385413)
* [Basic GLSL shader support (prototype)](http://www.vogons.org/viewtopic.php?f=41&t=36342&start=20#p319636)
* [An adaptation to SDL 2.0](http://www.vogons.org/viewtopic.php?f=32&t=34770&start=40#p433097)

# Enhanced DosBox Fork

This is an enhanced fork of DosBox. It is currently in sync with revision 3969.

## Requirements 

### Building

A full-featured build will need the following dependencies:

* [SDL2](http://libsdl.org/download-2.0.php) (required)
* [SDL2\_net](https://www.libsdl.org/projects/SDL_net/)
* [FluidSynth](http://www.fluidsynth.org/) (soundfont support)
* [GLEW](http://glew.sourceforge.net/) (OpenGL 3 and shader support)
* [Munt](http://munt.sourceforge.net/) (built-in MT-32 emulation)

### Configuration

There are new configuration options, and some existing options have new defaults.
If you have a configuration file from different version of DosBox, I
recommend removing it and letting this version generate a replacement.

## Features

### Soundfont Support
	
Games that use General MIDI can use the new FluidSynth backend to
play BGM using a soundfont. Specify that in your configuration file:
	
	[midi]
	mididevice=fluidsynth
	fluid.driver=alsa # set as appropriate
	fluid.soundfont=/path/to/soundfont.sf2

### MT-32 Emulation

For games that use the Roland MT-32, I still recommend running Munt as
a separate application (mt32emu-qt) and then connecting DosBox to its MIDI
port (specified as the "mididevice").  However, native MT-32 emulation is
now available as an alternative. To use it, specify, in your configuration
file, the path to the ROM directory:

	[midi]
	mididevice=mt32
	mt32.romdir=/path/to/roms

On OS X and Linux, DosBox will perform shell-expansion on the fluid.soundfont and
mt32.romdir paths. That means that these paths are allowed to contain dollar signs
(environment variables) and tildes (home directories).

### OpenGL 3 Support

The default video output method, "texturenb", is equivalent to "openglnb" in
vanilla DosBox. Now, "openglnb" and "opengl" use OpenGL 3 and can take advantage
of external shaders.

#### External Shaders

The shaders are stored in a separate project. Download them from from here:

* [dosbox\_shaders](https://github.com/duganchen/dosbox_shaders)

Then create a "shaders" directory in the same parent directory that has your
DosBox configuration file.  Put the *.vert and *.frag files from the
shader collection into the "shaders" directory.

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

EGA games typically work well with the *jinc2-sharp* shader, which removes dithering.

Please note that the new defaults (scaler=none, aspect=on) are needed for the
shaders to work as designed.

## Misc Differences

* physical CD-ROMs are no longer supported (use IMGMOUNT and ISOs instead)
* "aspect"'s default value is now true
* "output"'s default value is now "texturenb"
* "scaler's" default value is now none
* Pixel Buffer Objects are no longer used for rendering (I've found them to be the cause of a screen corruption bug)

## Credit

This fork either directly uses or builds on the following community contributions:

* [Patch for OpenGL fullscreen bug](http://www.vogons.org/viewtopic.php?f=32&t=27487&start=20#p276738)
* [Official Munt DosBox patch](https://github.com/munt/munt/blob/master/DOSBox-mt32-patch/dosbox-SVN-r3892-mt32-patch.diff)
* [FluidSynth soundfont patch](http://www.vogons.org/viewtopic.php?f=32&t=27831&start=20#p385413)
* [Basic GLSL shader support (prototype)](http://www.vogons.org/viewtopic.php?f=41&t=36342&start=20#p319636)
* [An adaptation to SDL 2.0](http://www.vogons.org/viewtopic.php?f=32&t=34770&start=40#p433097)

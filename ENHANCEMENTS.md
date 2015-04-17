# Enhanced DosBox Fork

Currently in sync with revision 3910.

## Soundfont Support

### Requirements

* [FluidSynth](http://www.fluidsynth.org/)

### Configuration

Set mididevice as shown, fluid.driver and fluid.soundfont as appropriate.

	[midi]
	mididevice=fluidsynth
	fluid.driver=alsa # set as appropriate
	fluid.soundfont=/path/to/soundfont.sf2

### Patch:

* [FluidSynth](http://www.vogons.org/viewtopic.php?f=32&t=27831&start=20#p385413)

## xBRZ scaling

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

### Patch:

* [xBRZ 1.3](http://www.vogons.org/viewtopic.php?t=34125)

## MT-32 Emulation

### Requirements

* [Munt](http://munt.sourceforge.net/)

### Configuration

Set mididevice as shown, mt32.romdir as appropriate.

	[midi]
	mididevice=mt32
	mt32.romdir=/path/to/roms

## Patch:

* [MT-32 Emulation](https://raw.githubusercontent.com/munt/munt/master/DOSBox-mt32-patch/dosbox-SVN-r3892-mt32-patch.diff)

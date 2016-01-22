Currently in sync with revision 3955.

# Soundfont Support

## Requirements

* [FluidSynth](http://www.fluidsynth.org/)

## Configuration

	[midi]
	mididevice=fluidsynth
	fluid.driver=alsa # set as appropriate
	fluid.soundfont=/path/to/soundfont.sf2

## Credit:

* [FluidSynth](http://www.vogons.org/viewtopic.php?f=32&t=27831&start=20#p385413)

# MT-32 Emulation

## Requirements

* [Munt](http://munt.sourceforge.net/)

## Configuration

	mididevice=mt32
	mt32.romdir=/path/to/roms

## Credit:

* [MT-32 Emulation](https://raw.githubusercontent.com/munt/munt/master/DOSBox-mt32-patch/dosbox-SVN-r3892-mt32-patch.diff)

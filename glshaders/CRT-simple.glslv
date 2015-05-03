/*
CRT-simple shader

Copyright (C) 2011 DOLLS. Based on cgwg's CRT shader.

This program is free software; you can redistribute it and/or modify it
under the terms of the GNU General Public License as published by the Free
Software Foundation; either version 2 of the License, or (at your option)
any later version.
*/

attribute vec4 a_position;

uniform vec2 rubyInputSize;
uniform vec2 rubyOutputSize;
uniform vec2 rubyTextureSize;

// Define some calculations that will be used in fragment shader.
varying vec2 texCoord;
varying vec2 one;
varying float mod_factor;

void main()
{
        // Do the standard vertex processing.
        // gl_Position = gl_ModelViewProjectionMatrix * gl_Vertex;
        gl_Position = a_position;

        // Precalculate a bunch of useful values we'll need in the fragment
        // shader.

        // Texture coords.
        // texCoord = gl_MultiTexCoord0.xy;
        texCoord = vec2((a_position.x+1.0)/2.0*rubyInputSize.x/rubyTextureSize.x,(1.0-a_position.y)/2.0*rubyInputSize.y/rubyTextureSize.y);

        // The size of one texel, in texture-coordinates.
        one = 1.0 / rubyTextureSize;

        // Resulting X pixel-coordinate of the pixel we're drawing.
        mod_factor = texCoord.x * rubyTextureSize.x * rubyOutputSize.x / rubyInputSize.x;
}

//   To execute a statement, put the curser on that line and press
//   CMD-Return on a Mac or CTRL-Return on a PC.
//

//start the server
s.boot;

//if you start getting strange errors, a server reboot can help:
s.reboot;


// Play a sound to make sure things are working...but first make sure you know how to stop it. :)
// If you're using headphones, make sure your volume is way down or you could damage your hearing!
// CMD-. on a Mac or CTRL-. on a PC should make everything quiet.
{SinOsc.ar(440,0,0.1)}.play;


// Play a more interesting sound using the mouse position to modulate the pitch and volume.
{SinOsc.ar(MouseX.kr(220,5000),0,MouseY.kr(0.1,0.9))}.play;


//Now lets use the oscilliscope to see what the sound waves look like
{SinOsc.ar(MouseX.kr(220,5000),0,MouseY.kr(0.1,0.9))}.scope;

//Saw oscillator controlled by the mouse
{LFSaw.ar(MouseX.kr(0,10000),0,MouseY.kr(0.1,0.9))}.play;


//Now lets try using a Line Generator with a Saw
{LFSaw.ar(XLine.kr(1,1000,5,doneAction:2),0,0.2)}.play;


{Blip.ar(440,100,0.3)}.play;
{ Blip.ar(XLine.kr(20000,200,6),100,0.2) }.play;
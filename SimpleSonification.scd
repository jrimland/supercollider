//SimpleSonification.scd
//
// This very simple sonification uses the average number of days/month where the temperature was <= 32
// degrees F (by month) in Indianapolis, IN from 1981-2010, Source:  http://www.crh.noaa.gov


s.boot;
s.quit;


(
q = q ?();
q.weatherdata = ();
q.weatherdata.timestamps = (1 .. 12 );

q.weatherdata.datatypes = (
	temp: [25.4, 21.8, 15.3, 3.8, 0.2, 0.0, 0.0, 0.0, 0.0, 2.3, 11.8, 23.0],
);
q.getWData = { |q, datatype| q.weatherdata.datatypes[datatype]};
)

//Discrete sonification (MIDI notes)


(Pbindef(\exec,   //use a pattern definition for better control of the audio stream
	\note, Pseq(q.getWData(\temp)),   //getWData loads the contents of the temp array
	\octave, 4,
	\dur,0.25
).play;
)


/// Continuous Sonification
b = Buffer.sendCollection(s, q.getWData(\temp), 1);

(
Ndef(\exec, {|dur = 5, scale=50, offset=200|
	var vals = PlayBuf.ar(1, b, dur / SampleRate.ir );
	Pan2.ar(
		SinOsc.ar(vals * scale + offset), 0,
		EnvGen.kr(Env.linen(0.01, dur, 0.01, 0.2), doneAction: 2)
		);
	}).play;
)



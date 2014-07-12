## The pg.library is a collection of externals for Max 5 and Max 6.

### The library is deprecated, please look at the [website www.pierreguillot.com](http://www.pierreguillot.com/).

### MaxData :

* **pg.average** : Moving average.
* **pg.chaos** : Chaotic attractors.
* **pg.distance** : Distances between ints, floats or lists.
* **pg.gaussian** : Normal distribution generator.
* **pg.rlg** : Random list generator.
* **pg.scale** : A scale object with autoscale mode and boundary mode.
* **pg.smooth** : Values smoother.
* **pg.statistic** : Statisics of a vector

### MaxDSP :
* **pg.alechinsky~** : A signal reverser.
* **pg.pollock~** : Quasi-synchronous granular synthesizer.
* **pg.chaos~** : A chaotic signal generator.
* **pg.pack~** : Pack object for signal (Max5 only & souce code only).
* **pg.unpack~** : Unpack object for signal (Max5 only & souce code only).
* **pg.adaptor~** : Adapter for packed signal (Max5 only & souce code only).

Please look at the Jamoma AudioGraph project to pack signal.


### MaxFFT :

* **pg.moment~** : Estimation of the centroid, the spread, the skewness and the kurtosis.
* **pg.energy~** : Estimation of the minimum, the average, the maximum and the sum of the amplitude.
* **pg.descriptor~** : Sonogram and analysis of a buffer~ (beta).
* **pg.mel~** : Spectrum above the mel scale and MFCCs.
* **pg.gradient~** : Estimation of the slope or the decrease of the spectrum.
* **pg.rolloff~** : Estimation of the rolloff frequency.
* **pg.flux~** : Estimation of the difference of amplitude between frames.

This library uses the fftw3 : [FFTW3](http://www.fftw.org/)
The fftw3 is a dynamic library, you need to compile it ot install precompiled binary.

Precompiled OSX binary for FFTW library :
[OSX link 1](http://pdb.finkproject.org/pdb/package.php/fftw3?rel_id=10.7-x86_64-current-stable)
[OSX link 2](http://antst.net/Site/FFTW_for_MAC_OS_X.html)

Precompiled WINDOWS DLL is in the package or:
[WIN link 1](http://web.media.mit.edu/~tristan/)

### Download Binaries (Windows & OsX):

[PG.LIBRARY.RAR](https://dl.dropbox.com/u/21891549/pg.library.rar)

Please report bugs. Other objects will come out!

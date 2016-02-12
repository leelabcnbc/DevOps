# DevOps
A bunch of DevOps files.

## Things to remember for Docker images.
if possible, specify versions of numpy and scipy (I think specifying numpy is enough) for Docker containers. I found that tests on them are pretty fragile and I simply want the container to run some really stable verisons which won't fail when running the following lines.

* `python -c 'import numpy as np;np.test()'`
* `python -c 'import scipy as sp;sp.test()'`

Note that it seems it's required to install `build-essential` before you can pass all `scipy` tests.

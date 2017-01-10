# sets
The simple build system that compiles all our custom datasets in one command. 

## how to use
It is highly recommended to create a Python `virtualenv` before continuing, to prevent permission issues and packaging conflicts. On Ubuntu, it is as simple as running the following commands:

    virtualenv -p python3 sets
    cd sets
    
Now, we clone the repository recursively, to include all the custom submodules (libraries) we use to parse, purify, and manipulate the datasets:

    git clone https://github.com/pulsedata/sets.git --recursive

Finally, to run the standard, full dataset process, just run GNU `make`.

    make
    
After a couple of minutes depending on your hardware (we've seen it last up to ten-fifteen minutes), the datasets will be ready in the `out` directory. 

## the datasets included
Currently, this fetches two essential datasets and compiles purified versions, plus a third one with our own Matcher3 applied to them.

| Set           |   ID          | Processes  |
| ------------- |:-------------:| ----------:|
| Graduates     | uaij-e68c     | purification, matching      |
| Schools       | id7n-c5cq     |   purification, matching      |
| Matcher3 matching result | n/a   |n/a      |


## the out directory
The out directory has a few folders after compilation; `originals` include the original, virgin fetched datasets from data.pr.gov. The `purified` folder contains the datasets after they've been stripped of invalid data or other preprocessing is done on them to make them suitable for use (see https://github.com/pulsedata/purifiers).

The folder with the timestamp and production/debug tags is the Matcher3 result, which is categorized and timestamped for development convenience, considering it is the most important script that is run on the data.

## `make` actions
| command        | purpose           |
| ------------- |:-------------:|
| clean      | cleans the `out` folder. |
| install-deps      | installs `pip` packages for every submodule      |
| fetch-sets | fetches all datasets using `socrates`      |
| purify | runs purification processes      |
| match | runs matcher3      |
| default | run the ordered routine      |
| done | ignore this one      |

## the default `make` routine

    default: clean install-deps fetch-sets purify match done

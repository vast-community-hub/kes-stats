<p align="center">
<!---<img src="assets/logos/128x128.png">-->
 <h1 align="center">KES/Stats for VAST Platform (VA Smalltalk)</h1>
  <p align="center">
    Analyze and monitor VAST's memory consumption
    <!---
    <br>
    <a href="docs/"><strong>Explore the docs »</strong></a>
    <br>
    -->
    <br>
    <a href="https://github.com/vast-community-hub/kes-stats/issues/new?labels=Type%3A+Defect">Report a defect</a>
    |
    <a href="https://github.com/vast-community-hub/kes-stats/issues/new?labels=Type%3A+Feature">Request feature</a>
  </p>
</p>


Using the memory tools provided with VAST and the extensions included in this project, developers can quickly diagnose and correct memory problems.

## License
Read [here](LICENSE) more details about the license and copyrights.


## Installation

### Dependencies

Using the "Configuration Maps Browser", you first need to load the configuration map `ENVY/Stats ES-ALL` that ships with your VAST ENVY manager.


### Installation via Tonel

1. Install [VA Smalltalk 9.2.1 or newer](https://www.instantiations.com/products/vasmalltalk/download.html).
2. Install Tonel support in your development image following [this guide](https://github.com/vasmalltalk/tonel-vast#installation).
3. Clone this repository.
4. The easiest and recommended approach is to install it via a script:

```smalltalk
| loader path |
path := (CfsPath named: '<insert path to root kes-stats local repo here>').
loader := TonelLoader readFromPath: path.
loader
	beUnattended; "do not prompt and use all defaults"
	useGitVersion.
loader loadAllMapsWithRequiredMaps.
```

Or you can load the Configuration Map `KES/Stats` from the context menu of the Configuration Maps Browser: `"Import"` -> `"Load Configuration Maps from Tonel repository..."` -> select path to root `kes-stats` local repo. This will open a dialog and will use convenient defaults for the load. Refer to [its documentation](https://github.com/instantiations/tonel-vast#using-gui-menus) for more details.


### Installation via ENVY

1. Using the "Configuration Maps Browser", import and load the config map `KES/Stats` from the [kesStats.dat](envy/kesStats.dat)




## Getting Started

This extension of the applications in the `ENVY/Stats ES-ALL` configuration map summarizes the object statistics in memory and allows you to easily see what kinds of objects were relinquished between two measurements by simple selection.

To start, select `Open Memory Consumption Monitor` or `Open Static Memory Consumption View`
from the Tools menu of the Transcript.

The first view generates approximate snapshots of all objects in memory.  By selecting two
snapshots, you can compare the difference in new/discarded objects.

<img width="863" alt="Screen Shot 2021-10-13 at 9 11 50 AM" src="https://user-images.githubusercontent.com/1032834/137130475-d767a6e1-2e1b-4a57-907d-b56d0e6fdb2a.png">

The second view shows the memory usage of the code for the selected applications.

<img width="901" alt="Screen Shot 2021-10-13 at 9 14 29 AM" src="https://user-images.githubusercontent.com/1032834/137130498-7f3d201d-25f8-4c43-93d6-bb0093faa376.png">


## Docs

The information of this project was previously published in 2 Eye on SmallTALK articles by Dan Kehn:

1. [Smalltalk Dynamic Memory Consumption Analysis by Dan Kehn  (April 2000)](docs/articles/DynamicMemoryAnalysis.md)
2. [Smalltalk Static Memory Consumption Analysis  by Dan Kehn (December 2000)](docs/articles/StaticMemoryAnalysis.md)






## Contributing

Check the [Contribution Guidelines](CONTRIBUTING.md)

<img src="https://sales.captor.se/captor_logo_sv_1600_icketransparent.png" alt="Captor Fund Management AB" 
width="81" height="100" align="left" float="right"/><br/>

<br><br>
## An introduction to the [openseries](https://github.com/CaptorAB/OpenSeries) Python package

These instructions assume that you
have [Python 3.10](https://docs.python.org/3.10/) and
[Poetry](https://python-poetry.org/) installed on your machine and that you are OK
to install this project in a virtual environment. If not, feel free to do it your
own way.

### In Windows Powershell execute the below commands:
```
git clone https://github.com/karrmagadgeteer2/NoteBook.git
cd NoteBook
./make.ps1 -task make
```
For me, the step upgrading pip encounters a permission issue that disappears if the command is executed a second time.


### In a Mac Terminal execute the below commands:
```
git clone https://github.com/karrmagadgeteer2/NoteBook.git
cd NoteBook
make
source source_me
make install
```

### Then to run this notebook: 
```
jupyter notebook openseriesnotebook.ipynb
```

### Or to run it as a slideshow: 
```
jupyter nbconvert --to slides openseriesnotebook.ipynb --post serve
```

### [Displayed on Nbviewer](https://nbviewer.org/github/karrmagadgeteer2/NoteBook/blob/master/openseriesnotebook.ipynb)

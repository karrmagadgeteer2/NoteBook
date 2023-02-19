<img src="https://sales.captor.se/captor_logo_sv_1600_icketransparent.png" alt="Captor Fund Management AB" 
width="81" height="100" align="left" float="right"/><br/>

<br><br>
## An introduction to the [openseries](https://github.com/CaptorAB/OpenSeries) Python package

These instructions assume that you have [Python 3.10.4](https://docs.python.org/release/3.10.4/) and 
[Poetry](https://python-poetry.org/) installed on your machine and that you are OK to install it in a 
virtual environment where this notebook will be run. If not, skip the installation 
steps and do it your way.

### In Windows Powershell execute the below commands:
```
git clone https://github.com/karrmagadgeteer2/NoteBook.git
cd NoteBook
python3 -m venv ./venv
./source_me.ps1
pip install --upgrade pip
pip install poetry==1.3.2
poetry install
```
For me, the step upgrading pip encounters a permission issue that disappears if the command is executed a second time.


### In a Mac Terminal execute the below commands:
```
git clone https://github.com/karrmagadgeteer2/NoteBook.git
cd NoteBook
make
source source_me
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

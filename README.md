## An introduction to the [openseries](https://github.com/CaptorAB/OpenSeries) Python package

These instructions assume that you have Python 3.10.4 installed on your machine and that you are OK to install it in a virtual environment where this notebook will be run. If not, skip the installation steps and do it your way.

### In Windows Powershell execute the below commands:
```
git clone https://github.com/karrmagadgeteer2/NoteBook.git
cd NoteBook
python3 -m venv ./venv
./source_me.ps1
pip install --upgrade pip
pip install -r requirements.txt
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

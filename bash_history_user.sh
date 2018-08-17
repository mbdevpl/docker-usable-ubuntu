sudo apt update
sudo apt dist-upgrade
sudo reboot && exit
exit
sudo dpkg-reconfigure locales
sudo su - root
ip address
git remote -v
git branch -vav
git fetch --all
git merge
git pull
git add -A
git commit -m "wip"
python3 setup.py bdist_wheel sdist
python3 setup.py bdist_wheel
python3 setup.py sdist
sudo python3 -m pip install dist/*.whl
python3 -m pip install --user dist/*.whl
python3 -m unittest discover
python3 -m unittest discover --verbose
python3 -m unittest --verbose
python3 -m unittest -v
python3 -m ipython
python3 -m jupyter notebook --ip=0.0.0.0 --port=8888
python3 -m jupyter notebook --ip="$(hostname -i)" --port=8888

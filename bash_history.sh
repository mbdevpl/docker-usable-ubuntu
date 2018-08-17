apt update
apt dist-upgrade
reboot && exit
exit
dpkg-reconfigure locales
su - user
ip address
python3 -m pip install dist/*.whl
python3 -m ipython
python3 -m jupyter notebook --ip=0.0.0.0 --port=8888 --allow-root
python3 -m jupyter notebook --ip="$(hostname -i)" --port=8888 --allow-root

QT = core
TEMPLATE = subdirs

CONFIG += ordered
CONFIG += dll

SUBDIRS += pageplugin\
    dummypage \
    woodprofiles \
    3dscene \
    systemparameters \
    machineparameters \
    history

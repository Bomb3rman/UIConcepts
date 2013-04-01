# Add more folders to ship with the application, here
#myFolder.target = qml
#DEPLOYMENTFOLDERS = myFolder

first.depends = $(first) copyassets
export(first.depends)
copyassets.commands = $(COPY_DIR) $$PWD/qml $$OUT_PWD/
export(copyassets.commands)
QMAKE_EXTRA_TARGETS = first copyassets

TARGET = theapp

QMAKE_RPATHDIR += $ORIGIN/../plugins

# The .cpp file which was generated for your project. Feel free to hack it.
SOURCES += main.cpp \
    pagemodel.cpp

INCLUDEPATH += ../pages/pageplugin

LIBS += -L../plugins -lpageplugin

QT += quick widgets

HEADERS += \
    pagemodel.h

OTHER_FILES += qml/*


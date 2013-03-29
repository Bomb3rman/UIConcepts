# Add more folders to ship with the application, here
#myFolder.target = qml
#DEPLOYMENTFOLDERS = myFolder

first.depends = $(first) copyassets
export(first.depends)
copyassets.commands = $(COPY_DIR) $$PWD/qml $$OUT_PWD/
export(copyassets.commands)
QMAKE_EXTRA_TARGETS = first copyassets

TARGET = theapp

#QMAKE_POST_LINK = mkdir -p $$OUT_PWD/qml && $${QMAKE_COPY} -r $$PWD/qml $$OUT_PWD


# The .cpp file which was generated for your project. Feel free to hack it.
SOURCES += main.cpp \
    pagemodel.cpp

# Please do not modify the following two lines. Required for deployment.
#include(qtquick2applicationviewer/qtquick2applicationviewer.pri)
#qtcAddDeployment()

INCLUDEPATH += ../pages/pageplugin

LIBS += -L../plugins -lpageplugin

QT += quick widgets

HEADERS += \
    pagemodel.h

OTHER_FILES += qml/*


# Add more folders to ship with the application, here
myFolder.target = qml
DEPLOYMENTFOLDERS = myFolder

#QMAKE_POST_LINK = mkdir -p $$OUT_PWD/qml && $${QMAKE_COPY} -r $$PWD/qml $$OUT_PWD


# The .cpp file which was generated for your project. Feel free to hack it.
SOURCES += main.cpp \
    pageloader.cpp

# Please do not modify the following two lines. Required for deployment.
include(qtquick2applicationviewer/qtquick2applicationviewer.pri)
qtcAddDeployment()

INCLUDEPATH += ../pages/pageplugin

LIBS += -L../plugins -lpageplugin

QT += quick

HEADERS += \
    pageloader.h


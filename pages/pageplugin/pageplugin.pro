TARGET = pageplugin
TEMPLATE = lib

DEFINES += PAGEPLUGIN_LIBRARY

include(../plugins.pri)

QT += qml quick

HEADERS += \
    pageplugin.h

SOURCES += \
    pageplugin.cpp

RESOURCES += \
    resources.qrc

OTHER_FILES += \
    main.qml

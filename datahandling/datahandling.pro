TARGET = datahandling
TEMPLATE = lib

QT += xml quick

DESTDIR = ../plugins

DEFINES += DATAHANDLING_LIBRARY USE_XML

SOURCES += datahandling.cpp

HEADERS += datahandling.h\
        datahandling_global.h

HEADERS += \
    wood.h \
    woodmodel.h

SOURCES += \
    wood.cpp \
    woodmodel.cpp

HEADERS += \
    xmlaccess.h

SOURCES += \
    xmlaccess.cpp

HEADERS += \
    historymodel.h

SOURCES += \
    historymodel.cpp

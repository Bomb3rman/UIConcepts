TARGET = datahandling
TEMPLATE = lib

DESTDIR = ../plugins

DEFINES += DATAHANDLING_LIBRARY

SOURCES += datahandling.cpp

HEADERS += datahandling.h\
        datahandling_global.h

HEADERS += \
    wood.h

SOURCES += \
    wood.cpp

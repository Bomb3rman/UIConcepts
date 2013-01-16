TEMPLATE = lib

LIBS *= -L../../plugins -lpageplugin

include(../plugins.pri)

SOURCES += \
    dummypage.cpp

HEADERS += \
    dummypage.h

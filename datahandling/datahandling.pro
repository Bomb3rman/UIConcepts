TARGET = datahandling
TEMPLATE = lib

QT += xml quick

DESTDIR = ../plugins

DEFINES += DATAHANDLING_LIBRARY USE_XML

HEADERS += \
    wood.h \
    woodmodel.h \
    logging.h \
    xmlaccess.h \
    historymodel.h \
    messagecenter.h \
    datahandling.h\
    datahandling_global.h

SOURCES += \
    wood.cpp \
    woodmodel.cpp \
    messagecenter.cpp \
    xmlaccess.cpp \
    historymodel.cpp \
    logging.cpp \
    datahandling.cpp

HEADERS += \
    parametermodel.h

SOURCES += \
    parametermodel.cpp


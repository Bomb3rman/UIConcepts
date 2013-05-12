TEMPLATE = lib

LIBS *= -L../../plugins -lpageplugin

QT += quick

include(../plugins.pri)

SOURCES += \
    parameters.cpp

HEADERS += \
    parameters.h

RESOURCES += \
    recources.qrc

OTHER_FILES += \
    main.qml

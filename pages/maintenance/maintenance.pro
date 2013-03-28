TEMPLATE = lib

LIBS *= -L../../plugins -lpageplugin

QT += quick

include(../plugins.pri)

SOURCES += \
    dummypage.cpp

HEADERS += \
    dummypage.h

RESOURCES += \
    recources.qrc

OTHER_FILES += \
    main.qml

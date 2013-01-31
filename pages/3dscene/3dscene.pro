TEMPLATE = lib

LIBS *= -L../../plugins -lpageplugin

QT += quick

include(../plugins.pri)

SOURCES += \
    3dscene.cpp

HEADERS += \
    3dscene.h

RESOURCES += \
    recources.qrc

OTHER_FILES += \
    main.qml

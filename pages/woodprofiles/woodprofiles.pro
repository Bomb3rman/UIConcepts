TEMPLATE = lib

LIBS *= -L../../plugins -lpageplugin -ldatahandling

QT += quick xml

include(../plugins.pri)

first.depends = $(first) copyassets
export(first.depends)
copyassets.commands = $(MKDIR) $$OUT_PWD/../../assets/woodprofiles | $$QMAKE_COPY $$PWD/woodprofiles/* $$OUT_PWD/../../assets/woodprofiles
export(copyassets.commands)
QMAKE_EXTRA_TARGETS = first copyassets

SOURCES += \
    dummypage.cpp

HEADERS += \
    dummypage.h

RESOURCES += \
    recources.qrc

OTHER_FILES += \
    main.qml

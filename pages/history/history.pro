TEMPLATE = lib

LIBS *= -L../../plugins -lpageplugin -ldatahandling

QT += quick

include(../plugins.pri)

first.depends = $(first) copyassets
export(first.depends)
copyassets.commands = $(MKDIR) $$OUT_PWD/../../assets/ | $(COPY_DIR) $$PWD/history/ $$OUT_PWD/../../assets/
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

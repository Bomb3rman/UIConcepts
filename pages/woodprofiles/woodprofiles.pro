TEMPLATE = lib

LIBS *= -L../../plugins -lpageplugin -ldatahandling

QT += quick xml

DEFINE *= USE_XML

include(../plugins.pri)

#copyassets.commands = $(MKDIR) \"$${OUT_PWD}\..\..\assets\" | $$QMAKE_COPY_DIR \"$${PWD}/woodprofiles\" \"$${OUT_PWD}/../../assets/\"

first.depends = $(first) mkassets copyassets
export(first.depends)
unix {
    copyassets.commands = $(MKDIR) $$OUT_PWD/../../assets/woodprofiles | $$QMAKE_COPY $$PWD/woodprofiles/* $$OUT_PWD/../../assets/woodprofiles
} windows {
    !exists( $${OUT_PWD}/../../assets ){
    mkassets.commands = $(MKDIR) \"$${OUT_PWD}/../../assets\"
}

#copyassets.commands = $(MKDIR) \"$${OUT_PWD}\..\..\assets\" | $$QMAKE_COPY_DIR \"$${PWD}\history\" \"$${OUT_PWD}\..\..\assets\\"
copyassets.commands = $$QMAKE_COPY_DIR \"$${PWD}/woodprofiles\" \"$${OUT_PWD}/../../assets/woodprofiles\"

export(mkassets.commands)
}
export(copyassets.commands)
QMAKE_EXTRA_TARGETS = first mkassets copyassets

SOURCES += \
    woodprofiles.cpp

HEADERS += \
    woodprofiles.h

RESOURCES += \
    recources.qrc

OTHER_FILES += \
    main.qml

OTHER_FILES += \
    Tile.qml

OTHER_FILES += \
    DefectEdit.qml

OTHER_FILES += \
    NewProfilePopup.qml

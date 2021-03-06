TEMPLATE = lib

LIBS *= -L../../plugins -lpageplugin -ldatahandling

QT += quick

include(../plugins.pri)

first.depends = $(first) mkassets copyassets
export(first.depends)
!exists( $${OUT_PWD}/../../assets ){
   mkassets.commands = $(MKDIR) \"$${OUT_PWD}/../../assets\"
}

#copyassets.commands = $(MKDIR) \"$${OUT_PWD}\..\..\assets\" | $$QMAKE_COPY_DIR \"$${PWD}\history\" \"$${OUT_PWD}\..\..\assets\\"
copyassets.commands = $$QMAKE_COPY_DIR \"$${PWD}/history\" \"$${OUT_PWD}/../../assets/history\"

export(mkassets.commands)
export(copyassets.commands)
QMAKE_EXTRA_TARGETS = first mkassets copyassets

SOURCES += \
    history.cpp

HEADERS += \
    history.h

RESOURCES += \
    recources.qrc

OTHER_FILES += \
    main.qml

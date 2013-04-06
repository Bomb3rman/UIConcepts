TEMPLATE = lib

LIBS *= -L../../plugins -lpageplugin -ldatahandling

QT += quick xml

include(../plugins.pri)

first.depends = $(first) mkassets copyassets
export(first.depends)

#copyassets.commands = $(MKDIR) \"$${OUT_PWD}\..\..\assets\" | $$QMAKE_COPY_DIR \"$${PWD}/woodprofiles\" \"$${OUT_PWD}/../../assets/\"


!exists( $${OUT_PWD}/../../assets ){
   mkassets.commands = $(MKDIR) \"$${OUT_PWD}/../../assets\"
}

#copyassets.commands = $(MKDIR) \"$${OUT_PWD}\..\..\assets\" | $$QMAKE_COPY_DIR \"$${PWD}\history\" \"$${OUT_PWD}\..\..\assets\\"
copyassets.commands = $$QMAKE_COPY_DIR \"$${PWD}/woodprofiles\" \"$${OUT_PWD}/../../assets/woodprofiles\"

export(mkassets.commands)
export(copyassets.commands)
QMAKE_EXTRA_TARGETS = first mkassets copyassets

SOURCES += \
    dummypage.cpp

HEADERS += \
    dummypage.h

RESOURCES += \
    recources.qrc

OTHER_FILES += \
    main.qml

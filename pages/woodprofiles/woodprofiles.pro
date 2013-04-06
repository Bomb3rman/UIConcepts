TEMPLATE = lib

LIBS *= -L../../plugins -lpageplugin -ldatahandling

QT += quick xml

include(../plugins.pri)

first.depends = $(first) copyassets
export(first.depends)
#if(@$(CHK_DIR_EXISTS) \"$${OUT_PWD}/../../assets/\")
#{
copyassets.commands = $(MKDIR) \"$${OUT_PWD}\..\..\assets\" | $$QMAKE_COPY_DIR \"$${PWD}\woodprofiles\" \"$${OUT_PWD}\..\..\assets\"
#$$QMAKE_COPY_DIR \"$${PWD}\ui\" \"$${OUT_PWD}\\$$DESTDIR/ui\"

#} else {
#copyassets.commands = $$QMAKE_COPY_DIR \"$${PWD}/woodprofiles/\" \"$${OUT_PWD}/../../assets\"
#}

#copyassets.commands = $(MKDIR) $$OUT_PWD/../../assets/ | $(COPY_DIR) $$PWD/woodprofiles/ $$OUT_PWD/../../assets/



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

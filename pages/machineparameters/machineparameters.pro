TEMPLATE = lib

LIBS *= -L../../plugins -lpageplugin

QT += quick

include(../plugins.pri)

first.depends = $(first) mkassets copyassets
export(first.depends)
!exists( $${OUT_PWD}/../../assets ){
   mkassets.commands = $(MKDIR) \"$${OUT_PWD}/../../assets\"
}

copyassets.commands = $$QMAKE_COPY_DIR \"$${PWD}/machineparameters\" \"$${OUT_PWD}/../../assets/machineparameters\"

export(mkassets.commands)
export(copyassets.commands)
QMAKE_EXTRA_TARGETS = first mkassets copyassets

SOURCES += \
    machineparameters.cpp

HEADERS += \
    machineparameters.h

RESOURCES += \
    recources.qrc

OTHER_FILES += *

OTHER_FILES += \
    ParameterView.qml


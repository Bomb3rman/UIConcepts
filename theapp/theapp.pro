first.depends = $(first) copyassets
export(first.depends)
unix {
    copyassets.commands = $(COPY_DIR) $$PWD/qml $$OUT_PWD/
} windows {
    copyassets.commands = $$QMAKE_COPY_DIR \"$${PWD}\qml\" \"$${OUT_PWD}\qml\"
}
export(copyassets.commands)
QMAKE_EXTRA_TARGETS = first copyassets

TARGET = theapp

QMAKE_RPATHDIR += $$OUT_PWD/../plugins

# The .cpp file which was generated for your project. Feel free to hack it.
SOURCES += main.cpp \
    pagemodel.cpp

INCLUDEPATH += ../pages/pageplugin

LIBS += -L../plugins -lpageplugin -ldatahandling

QT += quick widgets

HEADERS += \
    pagemodel.h

OTHER_FILES += qml/*

OTHER_FILES += \
    qml/MessageCenter.qml

OTHER_FILES += \
    qml/Documentation.qml

HEADERS += \
    documentation.h

SOURCES += \
    documentation.cpp

OTHER_FILES += \
    qml/SendMessagePopup.qml

OTHER_FILES += \
    qml/qt3dtest.qml


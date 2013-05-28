TEMPLATE = lib
TARGET = mmkqmlstyle
QT += qml quick widgets
CONFIG += qt plugin
OTHER_FILES = qmldir
TARGET = $$qtLibraryTarget($$TARGET)
uri = mmkqmlstyle

unix {
    DESTDIR = ../plugins/qml/MMKQmlStyle
} windows {
    DESTDIR = ..\plugins\qml\MMKQmlStyle
}
first.depends = $(first) copyqmldir copyqmldir2 copyqmldir3
export(first.depends)
unix {
    copyqmldir.commands = $$QMAKE_COPY $$PWD/qmldir $$OUT_PWD/$$DESTDIR
    copyqmldir2.commands = $$QMAKE_COPY $$PWD/*.qml $$OUT_PWD/$$DESTDIR
    copyqmldir3.commands = $(COPY_DIR) $$PWD/ui $$OUT_PWD/$$DESTDIR
} windows {
    copyqmldir.commands = $$QMAKE_COPY \"$${OUT_PWD}\qmldir\" \"$${OUT_PWD}\\$$DESTDIR/\"
    copyqmldir2.commands = $$QMAKE_COPY \"$${PWD}\*.qml\" \"$${OUT_PWD}\\$$DESTDIR/\"
    copyqmldir3.commands = $$QMAKE_COPY_DIR \"$${PWD}\ui\" \"$${OUT_PWD}\\$$DESTDIR/ui\"
}
export(copyqmldir.commands)
export(copyqmldir2.commands)
export(copyqmldir3.commands)
QMAKE_EXTRA_TARGETS = first copyqmldir copyqmldir2 copyqmldir3

# Input
SOURCES += \
    style_plugin.cpp

HEADERS += \
    style_plugin.h

OTHER_FILES = qmldir

OTHER_FILES += \
    *.qml

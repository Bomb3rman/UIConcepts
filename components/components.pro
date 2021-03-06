TEMPLATE = lib
TARGET = mmkqmlcomponents
QT += qml quick
CONFIG += qt plugin

TARGET = $$qtLibraryTarget($$TARGET)
uri = mmkqmlcomponents

DESTDIR = ../plugins/qml/MMKQmlComponents

first.depends = $(first) copyqmldir copyqmldir2 copyqmldir3
export(first.depends)
copyqmldir.commands = $$QMAKE_COPY $$OUT_PWD/qmldir $$OUT_PWD/$$DESTDIR/qmldir
copyqmldir2.commands = $$QMAKE_COPY $$PWD/*.qml $$OUT_PWD/$$DESTDIR/
copyqmldir3.commands = $(COPY_DIR) $$PWD/ui $$OUT_PWD/$$DESTDIR/ui/
export(copyqmldir.commands)
export(copyqmldir2.commands)
export(copyqmldir3.commands)
QMAKE_EXTRA_TARGETS = first copyqmldir copyqmldir2 copyqmldir3

# Input
SOURCES += \
    components_plugin.cpp \
    darkcomponents.cpp

HEADERS += \
    components_plugin.h \
    darkcomponents.h

OTHER_FILES = qmldir

!equals(_PRO_FILE_PWD_, $$OUT_PWD) {
    copy_qmldir.target = $$OUT_PWD/qmldir
    copy_qmldir.depends = $$_PRO_FILE_PWD_/qmldir
    copy_qmldir.commands = $(COPY_FILE) \"$$replace(copy_qmldir.depends, /, $$QMAKE_DIR_SEP)\" \"$$replace(copy_qmldir.target, /, $$QMAKE_DIR_SEP)\"
    QMAKE_EXTRA_TARGETS += copy_qmldir
    PRE_TARGETDEPS += $$copy_qmldir.target
}

qmldir.files = qmldir
unix {
    installPath = $$[QT_INSTALL_IMPORTS]/$$replace(uri, \\., /)
    qmldir.path = $$installPath
    target.path = $$installPath
    INSTALLS += target qmldir
}

OTHER_FILES += \
    *.qml

OTHER_FILES += \
    Switch.qml

OTHER_FILES += \
    Page.qml

OTHER_FILES += \
    Box.qml


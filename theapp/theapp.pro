# Add more folders to ship with the application, here
myFolder.target = qml
DEPLOYMENTFOLDERS = myFolder

#QMAKE_POST_LINK = mkdir -p $$OUT_PWD/qml && $${QMAKE_COPY} -r $$PWD/qml $$OUT_PWD


# The .cpp file which was generated for your project. Feel free to hack it.
SOURCES += main.cpp \
    pagemodel.cpp

# Please do not modify the following two lines. Required for deployment.
include(qtquick2applicationviewer/qtquick2applicationviewer.pri)
qtcAddDeployment()

INCLUDEPATH += ../pages/pageplugin

LIBS += -L../plugins -lpageplugin

QT += quick

HEADERS += \
    pagemodel.h

OTHER_FILES += qml/ \
    qml/Toolbar2.qml \
    qml/Toolbar.qml \
    qml/Turningtile.qml \
    qml/Toolbutton.qml \
    qml/Toolbar3.qml \
    qml/Tile.qml \
    qml/Textfield.qml \
    qml/Progressbar.qml \
    qml/Page.qml \
    qml/MyGridView.qml \
    qml/main.qml \
    qml/Label.qml \
    qml/Infobox.qml \
    qml/Header.qml \
    qml/concept4.qml \
    qml/concept3.qml \
    qml/concept2.qml \
    qml/Checkbox.qml \
    qml/Button.qml


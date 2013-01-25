#include <QtGui/QGuiApplication>
#include "qtquick2applicationviewer.h"
#include <QPluginLoader>
#include <QDebug>
#include <pageloader.h>

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);



    QtQuick2ApplicationViewer viewer;
    viewer.setMainQmlFile(QStringLiteral("qml/qml/concept3.qml"));
    PageLoader pageLoader(viewer.engine(), viewer.rootObject());
    viewer.showExpanded();

    return app.exec();
}

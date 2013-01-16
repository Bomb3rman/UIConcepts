#include <QtGui/QGuiApplication>
#include "qtquick2applicationviewer.h"
#include <QPluginLoader>
#include <QDebug>

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);
    app.addLibraryPath(app.applicationDirPath() + "/../plugins");

    QPluginLoader pluginLoader("dummypage");
    qDebug() << pluginLoader.fileName();
    qDebug() << pluginLoader.errorString();
    qDebug() << pluginLoader.load();
    qDebug() << pluginLoader.errorString();

    QtQuick2ApplicationViewer viewer;
    viewer.setMainQmlFile(QStringLiteral("qml/concept3.qml"));
    viewer.showExpanded();

    return app.exec();
}

#include <QtGui/QGuiApplication>
#include "qtquick2applicationviewer.h"
#include <QPluginLoader>
#include <QDebug>
#include <pagemodel.h>
#include <QQmlContext>

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    QByteArray data = "1";
    qputenv("QML_IMPORT_TRACE", data);

    QtQuick2ApplicationViewer viewer;
    viewer.engine()->addImportPath("../plugins/qml");
    viewer.setMainQmlFile(QStringLiteral("qml/qml/concept3.qml"));
    PageModel pageLoader(viewer.engine(), viewer.rootObject());
    viewer.rootContext()->setContextProperty("pageModel", &pageLoader);
    viewer.showExpanded();

    return app.exec();
}

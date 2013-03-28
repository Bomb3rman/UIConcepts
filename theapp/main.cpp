#include <QtGui/QGuiApplication>
#include <QApplication>
#include "qtquick2applicationviewer.h"
#include <QPluginLoader>
#include <QDebug>
#include <pagemodel.h>
#include <QQmlContext>
#include <QPalette>

int main(int argc, char *argv[])
{
    QApplication app(argc, argv);
    QPalette newSystemPalette;
    newSystemPalette.setColor(QPalette::Active, QPalette::Text, QColor(Qt::white));
    newSystemPalette.setColor(QPalette::Inactive, QPalette::Text, QColor(Qt::gray));
    app.setPalette(newSystemPalette);

    QtQuick2ApplicationViewer viewer;
    QSurfaceFormat format;
    format.setSamples(4);
    viewer.engine()->addImportPath("../plugins/qml");
    PageModel pageLoader(viewer.engine(), viewer.rootObject());
    viewer.rootContext()->setContextProperty("pageModel", &pageLoader);
    viewer.setMainQmlFile(QStringLiteral("qml/qml/concept3.qml"));
    viewer.setFormat(format);
    viewer.showExpanded();

    return app.exec();
}

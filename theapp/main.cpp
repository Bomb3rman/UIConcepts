#include <QApplication>
#include <QQuickView>
#include <QPluginLoader>
#include <QDebug>
#include <QQmlContext>
#include <QPalette>

#include "pagemodel.h"

int main(int argc, char *argv[])
{
    QApplication app(argc, argv);
    QPalette newSystemPalette;
    newSystemPalette.setColor(QPalette::Active, QPalette::Text, QColor(Qt::white));
    newSystemPalette.setColor(QPalette::Inactive, QPalette::Text, QColor(Qt::gray));
    app.setPalette(newSystemPalette);

    QQuickView viewer;
    QSurfaceFormat format;
    format.setSamples(4);
    viewer.engine()->addImportPath("../plugins/qml");
    PageModel pageLoader(viewer.engine(), viewer.rootObject());
    viewer.rootContext()->setContextProperty("pageModel", &pageLoader);
    viewer.setSource(QUrl("qml/concept3.qml"));
    viewer.setFormat(format);
    viewer.show();

    return app.exec();
}

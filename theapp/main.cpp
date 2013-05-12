#include <QApplication>
#include <QQuickView>
#include <QPluginLoader>
#include <pagemodel.h>
#include <QQmlContext>
#include <QPalette>
#include "../datahandling/datahandling.h"
#include "../datahandling/logging.h"
#include "documentation.h"

void setPalette()
{
    QPalette palette;
    palette.setColor(QPalette::Active, QPalette::Text, QColor(Qt::white));
    palette.setColor(QPalette::Inactive, QPalette::Text, QColor(Qt::gray));
    qobject_cast<QApplication*>(QApplication::instance())->setPalette(palette);
}

int main(int argc, char *argv[])
{
    QApplication app(argc, argv);

    setPalette();

    QQuickView viewer;
    viewer.engine()->addImportPath("../plugins/qml");
    viewer.rootContext()->setContextProperty("datahandling", new Datahandling());
    PageModel pageLoader(viewer.engine(), viewer.rootObject());
    viewer.rootContext()->setContextProperty("pageModel", &pageLoader);

    QAbstractItemModel *messageCenter = Datahandling::createMessageCenter();
    viewer.rootContext()->setContextProperty("messageCenter", messageCenter);

    Documentation documentation;
    viewer.rootContext()->setContextProperty("pageDocumentation", &documentation);
    viewer.setSource(QUrl("qml/concept3.qml"));
    viewer.installEventFilter(Logging::instance());
    viewer.show();

    return app.exec();
}

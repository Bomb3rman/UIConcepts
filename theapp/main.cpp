#include <QApplication>
#include <QQuickView>
#include <QPluginLoader>
#include <QDebug>
#include <pagemodel.h>
#include <QQmlContext>
#include <QPalette>
#include "../datahandling/datahandling.h"
#include "../datahandling/logging.h"

int main(int argc, char *argv[])
{
    QApplication app(argc, argv);
    Logging logging;
    logging.logButtonClicked("MyButton");
    logging.logMessageReceived("MyMessage");
    logging.logPageOpened("MyPage");
    QPalette newSystemPalette;
    newSystemPalette.setColor(QPalette::Active, QPalette::Text, QColor(Qt::white));
    newSystemPalette.setColor(QPalette::Inactive, QPalette::Text, QColor(Qt::gray));
    app.setPalette(newSystemPalette);

    QQuickView viewer;
    QSurfaceFormat format;
    format.setSamples(4);
    viewer.engine()->addImportPath("../plugins/qml");
    viewer.rootContext()->setContextProperty("datahandling", new Datahandling());
    PageModel pageLoader(viewer.engine(), viewer.rootObject());
    viewer.rootContext()->setContextProperty("pageModel", &pageLoader);
    QAbstractItemModel *messageCenter = Datahandling::createMessageCenter();
    viewer.rootContext()->setContextProperty("messageCenter", messageCenter);
    viewer.setSource(QUrl("qml/concept3.qml"));
    viewer.setFormat(format);
    viewer.installEventFilter(&logging);
    viewer.show();
    QObject::connect(viewer.rootObject(), SIGNAL(sendMsg(QString)), &logging, SLOT(sendMessage(QString)));

    return app.exec();
}

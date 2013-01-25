#include "pageloader.h"
#include <QCoreApplication>
#include <QDir>
#include <QJsonObject>
#include <QDebug>
#include <QJsonArray>

PageLoader::PageLoader(QQmlEngine *engine, QObject *rootObj) :
    QObject()
{
    QString pluginDir = QCoreApplication::instance()->applicationDirPath() + "/../plugins";
    QCoreApplication::instance()->addLibraryPath(pluginDir);

    QDir currentDir(pluginDir);
    QStringList entryList = currentDir.entryList(QDir::Files | QDir::NoDotAndDotDot | QDir::NoSymLinks);

    qDebug() << entryList << currentDir.absolutePath();
    foreach (QString plugin, entryList) {
        QPluginLoader loader(plugin);
        if (loader.metaData().value(QString("MetaData")).toObject().value("type").toString()
                == QString("page")) {
            QObject *obj = loader.instance();
            if (obj == 0) {
                qWarning() << "Error loading Page plugin" << plugin;
                continue;
            }
            PagePlugin *pPlugin = qobject_cast<PagePlugin*>(obj);
            if (pPlugin == 0) {
                qWarning() << "Error loading Page plugin. Wrong pLugin format";
                loader.unload();
                continue;
            }
            pPlugin->setEngine(engine);
            pPlugin->getQQuickItem()->setParentItem(qobject_cast<QQuickItem*>(rootObj));
            loadedPagePlugins.append(pPlugin);
        }
    }

    qDebug() << "Loaded" << loadedPagePlugins.size() << "Page plugins";
}

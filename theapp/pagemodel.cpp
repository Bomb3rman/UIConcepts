#include "pagemodel.h"
#include <QCoreApplication>
#include <QDir>
#include <QJsonObject>
#include <QDebug>
#include <QJsonArray>

PageModel::PageModel(QQmlEngine *engine, QObject *rootObj) :
    QAbstractListModel()
{
#ifdef Q_OS_WINDOWS
    QString pluginDir = QCoreApplication::instance()->applicationDirPath() + "/../../plugins";
#else
    QString pluginDir = QCoreApplication::instance()->applicationDirPath() + "/../plugins";
#endif

    QCoreApplication::instance()->addLibraryPath(pluginDir);

    QDir currentDir(pluginDir);
    QStringList entryList = currentDir.entryList(QDir::Files | QDir::NoDotAndDotDot | QDir::NoSymLinks);

    foreach (QString plugin, entryList) {
        QPluginLoader loader(plugin);
        if (loader.metaData().value(QString("MetaData")).toObject().value("type").toString()
                == QString("page")) {
            QObject *obj = loader.instance();
            if (obj == 0) {
                qWarning() << "Error loading Page plugin" << plugin;
                qWarning() << loader.errorString();
                continue;
            }
            PagePlugin *pPlugin = qobject_cast<PagePlugin*>(obj);
            if (pPlugin == 0) {
                qWarning() << "Error loading Page plugin. Wrong pLugin format";
                loader.unload();
                continue;
            }
            pPlugin->setEngine(engine);
            if (pPlugin->getQQuickItem() == 0) {
                qWarning() << "Error: QML item was not created for" << loader.fileName();
                loader.unload();
                continue;
            }
            pPlugin->getQQuickItem()->setParentItem(qobject_cast<QQuickItem*>(rootObj));
            pPlugin->getQQuickItem()->setVisible(false);
            loadedPagePlugins.append(pPlugin);
        }
    }

    qDebug() << "Loaded" << loadedPagePlugins.size() << "Page plugins";
}

int PageModel::rowCount(const QModelIndex & parent) const {
    Q_UNUSED(parent);
    return loadedPagePlugins.size();
}

QVariant PageModel::data(const QModelIndex & index, int role) const {
    if (index.row() < 0 || index.row() >= rowCount())
        return QVariant();

    PagePlugin *page = loadedPagePlugins.at(index.row());
    if (role == Page)
        return qVariantFromValue(page->getQQuickItem());
    else if (role == BasicInfo)
        return page->getBasicInfo();
    else if (role == ExtendedInfo)
        return page->getExtendedInfo();
    else if (role == Documentation)
        return page->getDocumentation();
    else if (role == PageObject)
        return qVariantFromValue((QObject*)page);
    return QVariant();
}

QHash<int, QByteArray> PageModel::roleNames() const {
    QHash<int, QByteArray> roles;
    roles[Page] = "Page";
    roles[BasicInfo] = "BasicInfo";
    roles[ExtendedInfo] = "ExtendedInfo";
    roles[Documentation] = "Documentation";
    roles[PageObject] = "PageObject";
    return roles;
}

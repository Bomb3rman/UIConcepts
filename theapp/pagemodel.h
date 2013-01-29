#ifndef PAGELOADER_H
#define PAGELOADER_H

#include <QObject>
#include <QPluginLoader>
#include <pageplugin.h>
#include <QQmlEngine>
#include <QAbstractListModel>

class PageModel : public QAbstractListModel
{
    Q_OBJECT
public:
    enum PageRoles {
        Page = Qt::UserRole + 1,
        BasicInfo, ExtendedInfo
    };
    explicit PageModel(QQmlEngine *engine, QObject *rootObj);

    int rowCount(const QModelIndex & parent = QModelIndex()) const;

    QVariant data(const QModelIndex & index, int role = Qt::DisplayRole) const;

private:
    QList<PagePlugin*> loadedPagePlugins;

protected:
    QHash<int, QByteArray> roleNames() const;
};

#endif // PAGELOADER_H

#ifndef WOODMODEL_H
#define WOODMODEL_H

#include <QAbstractListModel>
#include <QStringList>
#include <QImage>
#include <QUrl>
#include <QQuickImageProvider>
#include "wood.h"

class WoodModel : public QAbstractListModel, public QQuickImageProvider
{
    Q_OBJECT
    Q_PROPERTY(int activeProfile READ activeProfile WRITE setActiveProfile NOTIFY activeProfileChanged)
public:
    enum WoodRoles {
        NameRole = Qt::UserRole + 1,
        ImageRole
    };

    WoodModel(QObject *parent = 0);

    //The imgae provider
    QImage requestImage(const QString & id, QSize * size, const QSize & requestedSize);

    void addProfile(const Wood &animal);

    int rowCount(const QModelIndex & parent = QModelIndex()) const;

    QVariant data(const QModelIndex & index, int role = Qt::DisplayRole) const;

    Q_INVOKABLE bool saveProfile(int id, QString name, QImage image);

    int activeProfile();

    void setActiveProfile(int id);

Q_SIGNALS:
    void activeProfileChanged();

protected:
    QHash<int, QByteArray> roleNames() const;
private:
    QList<Wood> m_wood;
    int m_activeProfile;
};

#endif // WOODMODEL_H

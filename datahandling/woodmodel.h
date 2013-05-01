#ifndef WOODMODEL_H
#define WOODMODEL_H

#include <QAbstractListModel>
#include <QStringList>
#include <QUrl>
#include "wood.h"

class WoodModel : public QAbstractListModel
{
    Q_OBJECT
    Q_PROPERTY(int activeProfile READ activeProfile WRITE setActiveProfile NOTIFY activeProfileChanged)
public:
    enum WoodRoles {
        NameRole = Qt::UserRole + 1
    };

    WoodModel(QObject *parent = 0);

    void addProfile(const Wood &profile);

    int rowCount(const QModelIndex & parent = QModelIndex()) const;

    QVariant data(const QModelIndex & index, int role = Qt::DisplayRole) const;

    Q_INVOKABLE bool saveProfile(int id, QString name);

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

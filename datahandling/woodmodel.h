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
        NameRole = Qt::UserRole + 1,
        DefectsRole
    };

    WoodModel(QObject *parent = 0);

    void addProfile(const Wood &profile);

    Q_INVOKABLE void addProfile(QString name);

    int rowCount(const QModelIndex & parent = QModelIndex()) const;

    QVariant data(const QModelIndex & index, int role = Qt::DisplayRole) const;

    Q_INVOKABLE bool saveDefect(int id, int defectId, QString name, QString type,
                                QString threshold, QString description);

    int activeProfile();

    void setActiveProfile(int id);

Q_SIGNALS:
    void activeProfileChanged();

public Q_SLOTS:
    QObject *getDefect(int row, int index);

protected:
    QHash<int, QByteArray> roleNames() const;
private:
    QList<Wood> m_wood;
    int m_activeProfile;
};

#endif // WOODMODEL_H

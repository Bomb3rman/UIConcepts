#ifndef WOODMODEL_H
#define WOODMODEL_H

#include <QAbstractListModel>
#include <QStringList>
#include <QImage>
#include <QUrl>

class Wood
{
public:
    Wood(const QString &name, const QString &img);

    QString name() const;
    QUrl image() const;

private:
    QString m_name;
    QUrl m_img;
};

class WoodModel : public QAbstractListModel
{
    Q_OBJECT
public:
    enum WoodRoles {
        NameRole = Qt::UserRole + 1,
        ImageRole
    };

    WoodModel(QObject *parent = 0);

    void addProfile(const Wood &animal);

    int rowCount(const QModelIndex & parent = QModelIndex()) const;

    QVariant data(const QModelIndex & index, int role = Qt::DisplayRole) const;

protected:
    QHash<int, QByteArray> roleNames() const;
private:
    QList<Wood> m_wood;
};

#endif // WOODMODEL_H

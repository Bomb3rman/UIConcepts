#include "woodmodel.h"
#include <QDebug>

Wood::Wood(const QString &name, const QString &img)
    : m_name(name), m_img(img)
{
}

QString Wood::name() const
{
    return m_name;
}

QUrl Wood::image() const
{
    return m_img;
}

WoodModel::WoodModel(QObject *parent)
    : QAbstractListModel(parent)
{
}

void WoodModel::addProfile(const Wood &wood)
{
    beginInsertRows(QModelIndex(), rowCount(), rowCount());
    m_wood << wood;
    endInsertRows();
    qDebug() << "Inserting wood into model" << wood.name();
}

int WoodModel::rowCount(const QModelIndex & parent) const {
    Q_UNUSED(parent)
    return m_wood.count();
}

QVariant WoodModel::data(const QModelIndex & index, int role) const {
    if (index.row() < 0 || index.row() >= m_wood.count())
        return QVariant();

    const Wood &wood = m_wood[index.row()];
    if (role == NameRole)
        return wood.name();
    else if (role == ImageRole)
        return wood.image();
    return QVariant();
}

QHash<int, QByteArray> WoodModel::roleNames() const {
    QHash<int, QByteArray> roles;
    roles[NameRole] = "name";
    roles[ImageRole] = "image";
    return roles;
}


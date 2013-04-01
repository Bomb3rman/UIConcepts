#include "woodmodel.h"
#include <QDebug>
#include <xmlaccess.h>

WoodModel::WoodModel(QObject *parent)
    : QAbstractListModel(parent), m_activeProfile(-1)
{
#if defined(USE_XML)
    XMLAccess::readProfilesXML(this);
#endif
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

bool WoodModel::saveProfile(int id, QString name, QString image)
{
    if (id == -2) {
        addProfile(Wood(name, image));
        return true;
    }
    if (id < 0 || id >= rowCount())
        return false;

    m_wood[id] = Wood(name, image);
    Q_EMIT dataChanged(index(id), index(id));

    XMLAccess::saveProfilesXML(this);
    return true;
}

int WoodModel::activeProfile()
{
    return m_activeProfile;
}

void WoodModel::setActiveProfile(int id)
{
    m_activeProfile = id;
    Q_EMIT activeProfileChanged();
}

QHash<int, QByteArray> WoodModel::roleNames() const {
    QHash<int, QByteArray> roles;
    roles[NameRole] = "name";
    roles[ImageRole] = "image";
    return roles;
}


#include "woodmodel.h"
#include <QDebug>
#include <xmlaccess.h>

WoodModel::WoodModel(QObject *parent)
    : QAbstractListModel(parent), QQuickImageProvider(QQmlImageProviderBase::Image), m_activeProfile(-1)
{
#if defined(USE_XML)
    XMLAccess::readProfilesXML(this);
#else

#endif
}

QImage WoodModel::requestImage(const QString & id, QSize * size, const QSize & requestedSize)
{
    int row = id.toInt();
    if (row < 0 && row >= rowCount())
        return QImage();

    return m_wood[row].image();
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

bool WoodModel::saveProfile(int id, QString name, QString imagesrc)
{
    QImage image = requestImage(imagesrc.split("/").last(), 0, QSize());
    if (id == -2) {
        addProfile(Wood(name, image));
        return true;
    }
    if (id < 0 || id >= rowCount())
        return false;

    m_wood[id] = Wood(name, image);
    Q_EMIT dataChanged(index(id), index(id));

#if defined(USE_XML)
    XMLAccess::saveProfilesXML(this);
#endif
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


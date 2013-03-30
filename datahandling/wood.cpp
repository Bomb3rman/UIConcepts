#include "wood.h"

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

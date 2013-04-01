#include "wood.h"

Wood::Wood(const QString &name, const QImage &img)
    : m_name(name), m_img(img)
{
}

QString Wood::name() const
{
    return m_name;
}

QImage Wood::image() const
{
    return m_img;
}

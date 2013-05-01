#include "wood.h"

Wood::Wood(const QString &name)
    : m_name(name)
{
}

QString Wood::name() const
{
    return m_name;
}

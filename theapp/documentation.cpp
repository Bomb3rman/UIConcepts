#include "documentation.h"
#include <QDebug>

Documentation::Documentation(QObject *parent) :
    QObject(parent), m_visible(false)
{
    setVisible(false);
}

bool Documentation::isVisible() const
{
    return m_visible;
}

void Documentation::setVisible(bool visible)
{
    m_visible = visible;
    Q_EMIT visibleChanged();
}

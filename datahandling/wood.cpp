#include "wood.h"
#include <QDebug>


Defect::Defect(const QString &name, const qreal &threshold, const QString type, const QString &description,
               qreal per, QObject *parent)
    : QObject(parent), m_name(name), m_threshold(threshold), m_type(type), m_description(description), m_per(per)
{
}

QString Defect::name() const
{
    return m_name;
}

void Defect::setName(const QString &name)
{
    m_name = name;
    Q_EMIT nameChanged();
}

QString Defect::type() const
{
    return m_type;
}

void Defect::setType(const QString &type)
{
    m_type = type;
    Q_EMIT typeChanged();
}

qreal Defect::threshold() const
{
    return m_threshold;
}

void Defect::setThreshold(const qreal &threshold)
{
    m_threshold = threshold;
    Q_EMIT thresholdChanged();
}

QString Defect::description() const
{
    return m_description;
}

void Defect::setDescription(const QString &description)
{
    m_description = description;
    Q_EMIT descriptionChanged();
}

qreal Defect::per() const
{
    return m_per;
}

void Defect::setPer(const qreal &per)
{
    m_per = per;
    Q_EMIT perChanged();
}

Wood::Wood(const QString &name, const QList<QObject*> defects)
    : m_name(name), m_defects(defects)
{
}

QString Wood::name() const
{
    return m_name;
}

QList<QObject *> Wood::defects() const
{
    return m_defects;
}

void Wood::appendDefect(Defect *defect)
{
    m_defects.append((QObject*)defect);
}


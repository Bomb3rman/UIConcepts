#include "pageplugin.h"

PagePlugin::PagePlugin(QObject *parent) :
    QObject(parent)
{
}

PagePlugin::~PagePlugin()
{
    //delete m_item; //Braucht man glaub ich ned
}

void PagePlugin::setEngine(QQmlEngine *engine)
{
    m_engine = engine;
    Q_EMIT(engineChanged());
    QQmlComponent component(engine, m_componentUrl);
    m_item = qobject_cast<QQuickItem *>(component.create());
}

QQuickItem *PagePlugin::getQQuickItem()
{
    return m_item;
}

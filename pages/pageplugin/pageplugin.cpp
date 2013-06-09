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
    Q_EMIT engineChanged();
    QQmlComponent component(engine, m_componentUrl);
    if (component.status() != QQmlComponent::Ready) {
        qDebug() << component.errorString();
//        foreach (QQmlError error, component.errors()) {
//            qWarning() << error;
//        }
    }
    m_item = qobject_cast<QQuickItem *>(component.create());
    Q_EMIT componentCreated();
}

QQuickItem *PagePlugin::getQQuickItem()
{
    return m_item;
}

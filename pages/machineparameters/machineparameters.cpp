#include "machineparameters.h"
#include <QQmlContext>
#include "../../datahandling/datahandling.h"
#include <QQuickPaintedItem>

MachinePage::MachinePage(QObject *parent) :
    PagePlugin(parent)
{
    m_componentUrl.setUrl("qrc:/machineparameters/main.qml");
    m_model = Datahandling::createParameterModel();
    connect(this, SIGNAL(engineChanged()), this, SLOT(setModel()), Qt::DirectConnection);
    connect(this, SIGNAL(componentCreated()), this, SLOT(setAntialiasing()), Qt::DirectConnection);
}

QString MachinePage::getBasicInfo()
{
    return "Machine Status";
}

QString MachinePage::getExtendedInfo()
{
    return "ExtendedInfo\nMore Info\nnoch mehr";
}

void MachinePage::setModel()
{
    qDebug() << "Setting history model";
    m_engine->rootContext()->setContextProperty("parameterModel", m_model);
}

void MachinePage::setAntialiasing()
{
    ((QQuickPaintedItem*)m_item->findChild<QQuickPaintedItem*>(QString("viewport")))->setAntialiasing(true);
}

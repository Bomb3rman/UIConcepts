#include "dummypage.h"
#include <../../datahandling/datahandling.h>
#include <QQmlContext>

DummyPage::DummyPage(QObject *parent) :
    PagePlugin(parent)
{
    m_componentUrl.setUrl("qrc:/woodprofiles/main.qml");
    woodModel = Datahandling::createProfilesModel();
    connect(this, SIGNAL(engineChanged()), this, SLOT(setModel()), Qt::DirectConnection);
    //Has to be direct connection otherwise the model will not be set
}

DummyPage::~DummyPage()
{
}

QString DummyPage::getBasicInfo()
{
    return "Woodprofiles";
}

QString DummyPage::getExtendedInfo()
{
    return "4 active profiles\n50 saved profiles";
}

void DummyPage::setModel()
{
    qDebug() << "Setting wood model";
    m_engine->rootContext()->setContextProperty("woodModel", woodModel);
}


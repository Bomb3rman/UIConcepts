#include "dummypage.h"
#include "../../datahandling/datahandling.h"
#include <QQmlContext>

WoodProfilesPage::WoodProfilesPage(QObject *parent) :
    PagePlugin(parent)
{
    m_componentUrl.setUrl("qrc:/woodprofiles/main.qml");
    woodModel = Datahandling::createProfilesModel();
    connect(this, SIGNAL(engineChanged()), this, SLOT(setModel()), Qt::DirectConnection);
    //Has to be direct connection otherwise the model will not be set
}

WoodProfilesPage::~WoodProfilesPage()
{
}

QString WoodProfilesPage::getBasicInfo()
{
    return "Woodprofiles";
}

QString WoodProfilesPage::getExtendedInfo()
{
    return "4 active profiles\n50 saved profiles";
}

void WoodProfilesPage::setModel()
{
    qDebug() << "Setting wood model";
    m_engine->rootContext()->setContextProperty("woodModel", woodModel);
    m_engine->addImageProvider("woodprofiles", woodModel);
}


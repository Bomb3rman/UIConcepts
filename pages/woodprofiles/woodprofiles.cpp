#include "woodprofiles.h"
#include "../../datahandling/datahandling.h"
#include <QQmlContext>

WoodProfilesPage::WoodProfilesPage(QObject *parent) :
    PagePlugin(parent)
{
    m_componentUrl.setUrl("qrc:/woodprofiles/main.qml");
    woodModel = Datahandling::createProfilesModel();
    connect(this, SIGNAL(engineChanged()), this, SLOT(setModel()), Qt::DirectConnection);
    //Has to be direct connection otherwise the model will not be set

    QFile file("../assets/woodprofiles/documentation.html");
    if (file.open(QIODevice::ReadOnly))
        m_documentation = QString::fromUtf8(file.readAll());
    else
        qWarning() << "Could not open documentation file for woodprofiles";
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

QString WoodProfilesPage::getDocumentation()
{
    return m_documentation;
}

void WoodProfilesPage::setModel()
{
    qDebug() << "Setting wood model";
    m_engine->rootContext()->setContextProperty("woodModel", woodModel);
}


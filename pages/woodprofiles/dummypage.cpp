#include "dummypage.h"
#include <QDomDocument>
#include <QFile>
#include <QQmlContext>
#include <QDir>

DummyPage::DummyPage(QObject *parent) :
    PagePlugin(parent)
{
    woodModel = new WoodModel();
    m_componentUrl.setUrl("qrc:/woodprofiles/main.qml");
    QDir woodProfileDir("../assets/woodprofiles/");
    QFile xmlFile(woodProfileDir.absolutePath() + "/woodprofiles.xml");
    qDebug() <<xmlFile.fileName();
    xmlFile.open(QIODevice::ReadWrite);
    if (!xmlFile.isOpen()) {
        qWarning() << "Could not open XML wood profile file";
        return;
    }
    QDomDocument doc;
    qDebug() << "Parsing content" << doc.setContent(&xmlFile);
    QDomElement element = doc.documentElement();
    for(QDomElement n = element.firstChildElement(); !n.isNull(); n = n.nextSiblingElement())
     {
        Wood newWoodElement(n.firstChildElement("name").text(),
                            "file:" + woodProfileDir.absolutePath() + "/" + n.firstChildElement("img").text());
        woodModel->addProfile(newWoodElement);
     }
    connect(this, SIGNAL(engineChanged()), this, SLOT(setModel()), Qt::DirectConnection);
    //Has to be direct connection otherwise the model will not be set
}

DummyPage::~DummyPage()
{
    delete woodModel;
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
    m_engine->rootContext()->setContextProperty("woodModel", QVariant::fromValue(woodModel));
}


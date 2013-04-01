#include "datahandling.h"
#include <QDomDocument>
#include <QFile>
#include <QDir>
#include <QDebug>

Datahandling::Datahandling()
{
}

WoodModel *Datahandling::Datahandling::createProfilesModel()
{
    profilesModel = new WoodModel();
    QDir woodProfileDir("../assets/woodprofiles/");
    QFile xmlFile(woodProfileDir.absolutePath() + "/woodprofiles.xml");
    qDebug() <<xmlFile.fileName();
    xmlFile.open(QIODevice::ReadWrite);
    if (!xmlFile.isOpen()) {
        qWarning() << "Could not open XML wood profile file";
        return 0;
    }
    QDomDocument doc;
    qDebug() << "Parsing content" << doc.setContent(&xmlFile);
    QDomElement element = doc.documentElement();
    for(QDomElement n = element.firstChildElement(); !n.isNull(); n = n.nextSiblingElement()) {
        Wood newWoodElement(n.firstChildElement("name").text(),
                            "file:" + woodProfileDir.absolutePath() + "/" + n.firstChildElement("img").text());
        profilesModel->addProfile(newWoodElement);
    }

    return profilesModel;
}
//Login
bool Datahandling::checkLogin(QString username, QString password)
{
    if (username == "admin" && password == "bitch")
        return true;

    return false;
}

WoodModel *Datahandling::profilesModel = 0;

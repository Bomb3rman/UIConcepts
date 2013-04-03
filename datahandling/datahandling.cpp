#include <datahandling.h>
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

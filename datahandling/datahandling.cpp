#include "datahandling.h"
#include <QDomDocument>
#include <QFile>
#include <QDir>
#include <QDebug>

Datahandling::Datahandling()
{
}

WoodModel *Datahandling::createProfilesModel()
{
    profilesModel = new WoodModel();
    return profilesModel;
}

HistoryModel *Datahandling::createHistoryModel()
{
    historyModel = new HistoryModel();
    return historyModel;
}

//Login
bool Datahandling::checkLogin(QString username, QString password)
{
    if (username == "admin" && password == "password")
        return true;

    return false;
}

WoodModel *Datahandling::profilesModel = 0;
HistoryModel *Datahandling::historyModel = 0;

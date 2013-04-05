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

QAbstractItemModel *Datahandling::createHistoryModel()
{
    historyModel = new HistoryModel();
    proxyModel = new QSortFilterProxyModel();
    proxyModel->setSourceModel(historyModel);
    proxyModel->setSortCaseSensitivity(Qt::CaseSensitive);
    proxyModel->setSortRole(HistoryModel::TextRole);
    proxyModel->sort(0);

    return proxyModel;
}

//Login
bool Datahandling::checkLogin(QString username, QString password)
{
    if (username == "admin" && password == "bitch")
        return true;

    return false;
}

void Datahandling::setSafeModeEnabled(bool state)
{
    m_safeModeEnabled = state;
    Q_EMIT safeModeEnabledChanged();
}

WoodModel *Datahandling::profilesModel = 0;
HistoryModel *Datahandling::historyModel = 0;
QSortFilterProxyModel *Datahandling::proxyModel = 0;
bool Datahandling::m_safeModeEnabled = false;
QQmlContext *Datahandling::m_context = 0;

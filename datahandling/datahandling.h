#ifndef DATAHANDLING_H
#define DATAHANDLING_H

#include "datahandling_global.h"
#include <QString>
#include "woodmodel.h"
#include "historymodel.h"
#include <QSortFilterProxyModel>
#include <QQmlContext>

class DATAHANDLINGSHARED_EXPORT Datahandling : public QObject
{
    Q_OBJECT
    Q_PROPERTY(bool safeMode READ safeModeEnabled WRITE setSafeModeEnabled NOTIFY safeModeEnabledChanged)

public:
    Datahandling();

    //Wood profiles
    static WoodModel *createProfilesModel();
    static QAbstractItemModel *createHistoryModel();

    //Login
    bool checkLogin(QString username, QString password); //TODO save mode

    bool safeModeEnabled() { return m_safeModeEnabled; }
public Q_SLOTS:
    void setSafeModeEnabled(bool);

Q_SIGNALS:
    void safeModeEnabledChanged();
private:
    static WoodModel *profilesModel;
    static HistoryModel *historyModel;
    static QSortFilterProxyModel *proxyModel;
    static bool m_safeModeEnabled;
    static QQmlContext *m_context;
};

#endif // DATAHANDLING_H

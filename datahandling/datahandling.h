#ifndef DATAHANDLING_H
#define DATAHANDLING_H

#include "datahandling_global.h"
#include <QString>
#include "woodmodel.h"
#include "historymodel.h"

class DATAHANDLINGSHARED_EXPORT Datahandling
{
public:
    Datahandling();

    //Wood profiles
    static WoodModel *createProfilesModel();
    static HistoryModel *createHistoryModel();

    //Login
    bool checkLogin(QString username, QString password); //TODO save mode
private:
    static WoodModel *profilesModel;
    static HistoryModel *historyModel;
};

#endif // DATAHANDLING_H

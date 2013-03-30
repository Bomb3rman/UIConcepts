#ifndef DATAHANDLING_H
#define DATAHANDLING_H

#include "datahandling_global.h"

class DATAHANDLINGSHARED_EXPORT Datahandling
{
public:
    Datahandling();

    //Wood profiles
    void addProfile();
    void changeProfile(int id);
    void removeProfile(int id);

    //Login
    bool checkLogin(QString username, QString password);
};

#endif // DATAHANDLING_H

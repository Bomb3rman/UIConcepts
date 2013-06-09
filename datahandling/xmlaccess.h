#ifndef XMLACCESS_H
#define XMLACCESS_H

#include "woodmodel.h"
#include "historymodel.h"
#include "parametermodel.h"

class XMLAccess
{
public:
    static bool readProfilesXML(WoodModel *model);
    static bool saveProfilesXML(WoodModel *model);

    static bool readHistory(HistoryModel *model);
    static bool saveHistory(HistoryModel *model);

    static bool readParameters(ParameterModel *model);
    static bool saveParameters(ParameterModel *model);
};

#endif // XMLACCESS_H

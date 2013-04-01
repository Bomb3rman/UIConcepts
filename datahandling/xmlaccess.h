#ifndef XMLACCESS_H
#define XMLACCESS_H

#include <woodmodel.h>

class XMLAccess
{
public:
    static bool readProfilesXML(WoodModel *model);
    static bool saveProfilesXML(WoodModel *model);
};

#endif // XMLACCESS_H

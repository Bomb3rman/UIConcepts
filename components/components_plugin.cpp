#include "components_plugin.h"
#include "darkcomponents.h"

#include <qqml.h>

void StylePlugin::registerTypes(const char *uri)
{
    qmlRegisterType<DarkComponents>(uri, 1, 0, "DarkComponents");
}



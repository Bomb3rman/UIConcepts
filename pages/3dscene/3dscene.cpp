#include <3dscene.h>

Scene3DPage::Scene3DPage(QObject *parent) :
    PagePlugin(parent)
{
    m_componentUrl.setUrl("qrc:/3dscene/main.qml");
}

QString Scene3DPage::getBasicInfo()
{
    return "3D Scene";
}

QString Scene3DPage::getExtendedInfo()
{
    return "ExtendedInfo\nMore Info\nnoch mehr";
}


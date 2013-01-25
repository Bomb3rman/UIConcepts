#ifndef PAGELOADER_H
#define PAGELOADER_H

#include <QObject>
#include <QPluginLoader>
#include <pageplugin.h>
#include <QQmlEngine>

class PageLoader : public QObject
{
    Q_OBJECT
public:
    explicit PageLoader(QQmlEngine *engine, QObject *rootObj);

private:
    QList<PagePlugin*> loadedPagePlugins;
};

#endif // PAGELOADER_H

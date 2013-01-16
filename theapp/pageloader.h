#ifndef PAGELOADER_H
#define PAGELOADER_H

#include <QObject>
#include <QPluginLoader>
#include <pageplugin.h>

class PageLoader : public QObject
{
    Q_OBJECT
public:
    explicit PageLoader(QObject *parent = 0);
    
signals:
    
public slots:
    

private:
    QList<PagePlugin*> loadedPagePlugins;
};

#endif // PAGELOADER_H

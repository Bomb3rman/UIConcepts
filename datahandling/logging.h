#ifndef LOGGING_H
#define LOGGING_H

#include <QFile>
#include <QEvent>
#include <QPointF>
#include "datahandling_global.h"

class DATAHANDLINGSHARED_EXPORT Logging : public QObject
{
    Q_OBJECT
public:
    enum LogLevel {
        Verbose,
        Normal,
        Off
    };

    explicit Logging(LogLevel loglevel = Off);
    ~Logging();
    void logButtonClicked(QString buttonName);
    void logPageOpened(QString pageName);
    void logMessageReceived(QString message);
    void logMouseClicked(QPointF pos);

protected:
    bool eventFilter(QObject *obj, QEvent *event);

private:
    void log(QString logline);
    QFile logfile;
    LogLevel m_loglevel;
};

#endif // LOGGING_H

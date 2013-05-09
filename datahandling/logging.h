#ifndef LOGGING_H
#define LOGGING_H

#include <QFile>
#include <QEvent>
#include <QPointF>
#include <QUdpSocket>
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

public Q_SLOTS:
    void sendMessage(QString message);

protected:
    bool eventFilter(QObject *obj, QEvent *event);

private Q_SLOTS:
    void readUdpSocket();

private:
    void openUdpSocket();
    void log(QString logline);
    QFile logfile;
    LogLevel m_loglevel;
    QUdpSocket *udpSocket;
};

#endif // LOGGING_H

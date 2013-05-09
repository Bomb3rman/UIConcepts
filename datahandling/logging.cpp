#include "logging.h"

#include <QDir>
#include <QDebug>
#include <QDateTime>
#include <QMouseEvent>

Logging::Logging(LogLevel loglevel) :
    m_loglevel(loglevel)
{
    QDir dir;
    dir.cdUp();
    if (!dir.exists("logs")) {
        if (!dir.mkdir("logs")) {
            qWarning() << "Could not create logs directory";
        }
    }
    dir.cd("logs");
    qDebug() << dir.entryList();
    QString filename = QDateTime::currentDateTime().toString("dd_MM_yy");
    qDebug() << filename;
    if (dir.exists(filename)) { // the file already exists, so we will just add a number to this file
        QString tmpFilename;
        int i = 1;
        do {
            i++;
            tmpFilename = filename + "_" + QString::number(i);
        } while (dir.exists(tmpFilename));
        filename = tmpFilename;
    }

    logfile.setFileName(dir.absolutePath()+"/"+filename);
    logfile.open(QIODevice::WriteOnly|QIODevice::Unbuffered); //Has to be unbuffered,
                                            //otherwise the content will not be written immediately
    logfile.write("Begin Logfile\n");

    openUdpSocket();
}

Logging::~Logging()
{
    delete udpSocket;
}

void Logging::logButtonClicked(QString buttonName)
{
    if (m_loglevel == Verbose)
        log("Button clicked: " + buttonName);
}

void Logging::logPageOpened(QString pageName)
{
    if (m_loglevel <= Normal)
        log("Page opened: " + pageName);
}

void Logging::logMessageReceived(QString message)
{
    if (m_loglevel <= Normal)
        log("Log message received: " + message);
}

void Logging::logMouseClicked(QPointF pos)
{
    if (m_loglevel == Verbose)
        log("Mouse clicked: " + QString::number(pos.x()) + " " + QString::number(pos.y()));
}

void Logging::sendMessage(QString message)
{
    udpSocket->writeDatagram(message.toUtf8(), QHostAddress::LocalHost, 7755);
}

bool Logging::eventFilter(QObject *obj, QEvent *event)
{
    Q_UNUSED(obj);
    if (event->type() == QEvent::MouseButtonRelease) {
        qDebug() << "Mouse button released";
        logMouseClicked(((QMouseEvent*)event)->pos());
    }
    return false;
}

void Logging::readUdpSocket()
{
    QByteArray socketData;
    while (udpSocket->hasPendingDatagrams()) {
        QByteArray datagram;
        datagram.resize(udpSocket->pendingDatagramSize());
        QHostAddress sender;
        quint16 senderPort;

        udpSocket->readDatagram(datagram.data(), datagram.size(),
                                &sender, &senderPort);

        socketData += datagram;
    }

    qDebug() << "----Got socket data" << socketData;
}

void Logging::openUdpSocket()
{
    udpSocket = new QUdpSocket(this);
    udpSocket->bind(QHostAddress::LocalHost, 7755);

    connect(udpSocket, SIGNAL(readyRead()),
            this, SLOT(readUdpSocket()));
}

void Logging::log(QString logLine)
{
    QByteArray log = (QDateTime::currentDateTime().toString("hh:mm:ss >")+logLine+"\n").toUtf8();
    qDebug() << log;
    logfile.write(log);
}

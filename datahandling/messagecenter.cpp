#include "messagecenter.h"

MessageElement::MessageElement(const QString &title, const QString &type, const QString &description)
{
    m_title = title;
    m_type = type;
    m_description = description;
}

QString MessageElement::title() const
{
    return m_title;
}

QString MessageElement::type() const
{
    return m_type;
}

QString MessageElement::description() const
{
    return m_description;
}

MessageCenter::MessageCenter(QObject *parent) :
    QAbstractListModel(parent)
{
    addMessage(MessageElement("Message1", "Error", "This is a very serious error\nreally!!!!"));
    addMessage(MessageElement("Message2", "Info", "This is information that might be interesting\nreally!!!!"));
    addMessage(MessageElement("Message3", "Note", "This is a note\nreally!!!!"));

    openUdpSocket();
}

MessageCenter::~MessageCenter()
{
    delete udpSocket;
}


int MessageCenter::rowCount(const QModelIndex & parent) const {
    Q_UNUSED(parent)
    return m_message.count();
}

QVariant MessageCenter::data(const QModelIndex & index, int role) const {
    if (index.row() < 0 || index.row() >= m_message.count())
        return QVariant();

    const MessageElement &element = m_message[index.row()];
    if (role == TypeRole)
        return element.type();
    else if (role == TitleRole)
        return element.title();
    else if (role == DescriptionRole)
        return element.description();
    return QVariant();
}

void MessageCenter::addMessage(const MessageElement &element)
{
    m_message.append(element);
}

void MessageCenter::sendMessage(QString message)
{
    udpSocket->writeDatagram(message.toUtf8(), QHostAddress::LocalHost, 7755);
}

void MessageCenter::readUdpSocket()
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


void MessageCenter::openUdpSocket()
{
    udpSocket = new QUdpSocket(this);
    udpSocket->bind(QHostAddress::LocalHost, 7755);

    connect(udpSocket, SIGNAL(readyRead()),
            this, SLOT(readUdpSocket()));
}



QHash<int, QByteArray> MessageCenter::roleNames() const {
    QHash<int, QByteArray> roles;
    roles[TitleRole] = "title";
    roles[TypeRole] = "type";
    roles[DescriptionRole] = "description";
    return roles;
}

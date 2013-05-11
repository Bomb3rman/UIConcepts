#ifndef MESSAGECENTER_H
#define MESSAGECENTER_H

#include <QObject>
#include <QAbstractListModel>
#include <QUdpSocket>

class Q_DECL_EXPORT MessageElement
{
public:
    MessageElement(const QString &title, const QString &type, const QString &description);

    QString title() const;
    QString type() const;
    QString description() const;

private:
    QString m_title;
    QString m_type;
    QString m_description;
};

class MessageCenter : public QAbstractListModel
{
    Q_OBJECT
public:
    explicit MessageCenter(QObject *parent = 0);
    ~MessageCenter();

    enum MessageRoles {
        TitleRole = Qt::UserRole + 1,
        TypeRole,
        DescriptionRole
    };

    int rowCount(const QModelIndex & parent = QModelIndex()) const;

    QVariant data(const QModelIndex & index, int role = Qt::DisplayRole) const;

    void addMessage(const MessageElement &element);


public Q_SLOTS:
    void sendMessage(QString message);

protected:
    QHash<int, QByteArray> roleNames() const;

private Q_SLOTS:
    void readUdpSocket();

private:
    void openUdpSocket();
    QList<MessageElement> m_message;
    QUdpSocket *udpSocket;
};

#endif // MESSAGECENTER_H

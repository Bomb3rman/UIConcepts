#ifndef MESSAGECENTER_H
#define MESSAGECENTER_H

#include <QObject>
#include <QAbstractListModel>


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

    enum MessageRoles {
        TitleRole = Qt::UserRole + 1,
        TypeRole,
        DescriptionRole
    };

    int rowCount(const QModelIndex & parent = QModelIndex()) const;

    QVariant data(const QModelIndex & index, int role = Qt::DisplayRole) const;

    void addMessage(const MessageElement &element);

protected:
    QHash<int, QByteArray> roleNames() const;
private:
    QList<MessageElement> m_message;
    
};

#endif // MESSAGECENTER_H

#ifndef WOOD_H
#define WOOD_H

#include <QString>
#include <QImage>
#include <QUrl>

class Defect : QObject{
    Q_OBJECT

    Q_PROPERTY(QString name READ name WRITE setName NOTIFY nameChanged)
    Q_PROPERTY(DType type READ type WRITE setType NOTIFY typeChanged)
    Q_PROPERTY(qreal threshold READ threshold WRITE setThreshold NOTIFY thresholdChanged)
    Q_PROPERTY(QString description READ description WRITE setDescription NOTIFY descriptionChanged)

public:

    enum DType {
        LessThan,
        LongerThan
    };

    Defect(const QString &name, const qreal &threshold, const DType type, const QString &description = "", QObject *parent=0);

    QString name() const;
    void setName(const QString &name);

    DType type() const;
    void setType(const DType &type);

    qreal threshold() const;
    void setThreshold(const qreal &threshold);

    QString description() const;
    void setDescription(const QString &description);

signals:
    void nameChanged();
    void typeChanged();
    void thresholdChanged();
    void descriptionChanged();

private:
    QString m_name;
    qreal m_threshold;
    DType m_type;
    QString m_description;
};

class Q_DECL_EXPORT Wood
{
public:
    Wood(const QString &name);

    QString name() const;
    QList<QObject *> defects() const;
    void appendDefect(Defect *defect);

private:
    QString m_name;
    QList<QObject *> m_defects;

};
#endif // WOOD_H

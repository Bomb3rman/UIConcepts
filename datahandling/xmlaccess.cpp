#include "xmlaccess.h"
#include <QDir>
#include <QDebug>
#include <QFile>
#include <QDomDocument>
#include <QDomElement>

QDir woodProfileDir("../assets/woodprofiles/");
QDir historyDir("../assets/history/");
QDir parametersDir("../assets/machineparameters/");

bool XMLAccess::readProfilesXML(WoodModel *model)
{
    QFile xmlFile(woodProfileDir.absolutePath() + "/woodprofiles.xml");
    qDebug() << xmlFile.fileName();
    xmlFile.open(QIODevice::ReadOnly);
    if (!xmlFile.isOpen()) {
        qWarning() << "Could not open XML wood profile file";
        return false;
    }
    QDomDocument doc;
    doc.setContent(&xmlFile);
    QDomElement element = doc.documentElement();
    for(QDomElement n = element.firstChildElement(); !n.isNull(); n = n.nextSiblingElement()) {
        Wood newWoodElement(n.firstChildElement("name").text());

        QDomElement defects = n.firstChildElement("defects");
        for(QDomElement m = defects.firstChildElement(); !m.isNull(); m = m.nextSiblingElement()) {
            QString typeAttrib = m.attribute("type", "LT"); //Type defaults to LessThan
            newWoodElement.appendDefect(new Defect(m.attribute("name"), m.attribute("threshold").toFloat(),
                                                   typeAttrib, m.attribute("description"),
                                                   m.attribute("per").toFloat()));
        }

        model->addProfile(newWoodElement);
    }
    return true;
}

bool XMLAccess::saveProfilesXML(WoodModel *model)
{
    QFile xmlFile(woodProfileDir.absolutePath() + "/woodprofiles.xml");
    xmlFile.open(QIODevice::WriteOnly | QIODevice::Truncate);
    if (!xmlFile.isOpen()) {
        qWarning() << "Could not open XML wood profile file for writing";
        return false;
    }

    QDomDocument doc;
    QDomElement root = doc.createElement("woodprofiles");
    for (int i=0; i<model->rowCount(); i++) {
        QDomElement newProfile = doc.createElement("profile");

        QDomElement attribute = doc.createElement("name");
        QDomText text = doc.createTextNode(model->data(model->index(i), WoodModel::NameRole).toString());
        attribute.appendChild(text);
        newProfile.appendChild(attribute);

        attribute = doc.createElement("defects");
        QList<QObject*> defectsList = model->data(model->index(i)).value<QList<QObject*> >();
        for (int j=0; j<defectsList.count(); j++) {
            QDomElement defect = doc.createElement("defect");
            defect.setAttribute("threshold", defectsList.at(j)->property("threshold").toFloat());
            defect.setAttribute("name", defectsList.at(j)->property("name").toString());
            attribute.appendChild(defect);
        }
        newProfile.appendChild(attribute);

        root.appendChild(newProfile);
    }
    doc.appendChild(root);

    if (xmlFile.write(doc.toString().toUtf8()) == -1) {
        qWarning() << "Could not write to xml file";
        return false;
    }

    qDebug() << "XML content saved";

    return true;
}

bool XMLAccess::readHistory(HistoryModel *model)
{
    QFile xmlFile(historyDir.absolutePath() + "/history.xml");
    qDebug() <<xmlFile.fileName();
    xmlFile.open(QIODevice::ReadOnly);
    if (!xmlFile.isOpen()) {
        qWarning() << "Could not open XML history file";
        return false;
    }
    QDomDocument doc;
    qDebug() << "Parsing content" << doc.setContent(&xmlFile);
    QDomElement element = doc.documentElement();
    for(QDomElement n = element.firstChildElement(); !n.isNull(); n = n.nextSiblingElement()) {
        HistoryElement newHistoryElement(n.firstChildElement("plank").text(),
                                         n.firstChildElement("text").text(),
                                         QDateTime::fromString(n.firstChildElement("start").text(), Qt::ISODate),
                                         QDateTime::fromString(n.firstChildElement("end").text(), Qt::ISODate));

        QDomElement correctionElement = n.firstChildElement("corrections");
        for(QDomElement c = correctionElement.firstChildElement(); !c.isNull(); c = c.nextSiblingElement()) {
            newHistoryElement.addCorrection(c.text());
        }
        model->addElement(newHistoryElement);
    }
    return true;
}

bool XMLAccess::saveHistory(HistoryModel *model)
{
    return false;
}

bool XMLAccess::readParameters(ParameterModel *model)
{
    QFile xmlFile(parametersDir.absolutePath() + "/machineparameters.xml");
    qDebug() <<xmlFile.fileName();
    xmlFile.open(QIODevice::ReadOnly);
    if (!xmlFile.isOpen()) {
        qWarning() << "Could not open XML parameter file";
        return false;
    }
    QDomDocument doc;
    qDebug() << "Parsing content" << doc.setContent(&xmlFile);
    QDomElement element = doc.documentElement();
    for(QDomElement n = element.firstChildElement(); !n.isNull(); n = n.nextSiblingElement()) {
        ParameterElement newParameterElement(n.firstChildElement("name").text(),
                                         n.firstChildElement("type").text(),
                                         n.firstChildElement("value").text(),
                                         n.firstChildElement("group").text());

        model->addParameter(newParameterElement);
        qDebug() << "Adding parameter" << newParameterElement.name();
    }
    return true;
}

bool XMLAccess::saveParameters(ParameterModel *model)
{
    return false;
}

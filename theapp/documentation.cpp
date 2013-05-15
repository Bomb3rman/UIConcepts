#include "documentation.h"
#include <QDebug>
#include <QFontDatabase>
#include <QQuickTextDocument>

Documentation::Documentation(QObject *parent) :
    QObject(parent), m_visible(false)
{
    setVisible(false);
}

bool Documentation::isVisible() const
{
    return m_visible;
}

QString Documentation::text() const
{
    return m_text;
}

void Documentation::setVisible(bool visible)
{
    m_visible = visible;
    Q_EMIT visibleChanged();
}

void Documentation::setText(const QString &text)
{
    m_text = text;
    Q_EMIT textChanged();
}

void Documentation::setTarget(QQuickItem *target)
{
    m_doc = 0;
    m_target = target;
    if (!m_target)
        return;

    QVariant doc = m_target->property("textDocument");
    if (doc.canConvert<QQuickTextDocument*>()) {
        QQuickTextDocument *qqdoc = doc.value<QQuickTextDocument*>();
        if (qqdoc)
            m_doc = qqdoc->textDocument();
    }
    emit targetChanged();
}

void Documentation::setCursorPosition(int position)
{
    if (position == m_cursorPosition)
        return;

    m_cursorPosition = position;

    emit currentFontChanged();
    emit alignmentChanged();
    emit boldChanged();
    emit italicChanged();
    emit underlineChanged();
    emit fontSizeChanged();
}

QTextCursor Documentation::textCursor() const
{
    QTextCursor cursor = QTextCursor(m_doc);
    if (m_selectionStart != m_selectionEnd) {
        cursor.setPosition(m_selectionStart);
        cursor.setPosition(m_selectionEnd, QTextCursor::KeepAnchor);
    } else {
        cursor.setPosition(m_cursorPosition);
    }
    return cursor;
}

void Documentation::mergeFormatOnWordOrSelection(const QTextCharFormat &format)
{
    QTextCursor cursor = textCursor();
    if (!cursor.hasSelection())
        cursor.select(QTextCursor::WordUnderCursor);
    cursor.mergeCharFormat(format);
}

void Documentation::setSelectionStart(int position)
{
    m_selectionStart = position;
//    emit selectionStartChanged();
}

void Documentation::setSelectionEnd(int position)
{
    m_selectionEnd = position;
//    emit selectionEndChanged();
}

void Documentation::setAlignment(Qt::Alignment a)
{
    QTextBlockFormat fmt;
    fmt.setAlignment((Qt::Alignment) a);
    QTextCursor cursor = QTextCursor(m_doc);
    cursor.setPosition(m_selectionStart, QTextCursor::MoveAnchor);
    cursor.setPosition(m_selectionEnd, QTextCursor::KeepAnchor);
    cursor.mergeBlockFormat(fmt);
    emit alignmentChanged();
}

Qt::Alignment Documentation::alignment() const
{
//    if (!m_doc || m_doc->isEmpty() || m_cursorPosition < 0)
//        return Qt::AlignLeft;
    QTextCursor cursor = textCursor();
    if (cursor.isNull() || cursor.blockNumber() == 0)
        return Qt::AlignLeft;
    return textCursor().blockFormat().alignment();
}

bool Documentation::bold() const
{
    QTextCursor cursor = textCursor();
    if (cursor.isNull() || cursor.blockNumber() == 0)
        return false;
    return textCursor().charFormat().fontWeight() == QFont::Bold;
}

bool Documentation::italic() const
{
    QTextCursor cursor = textCursor();
    if (cursor.isNull() || cursor.blockNumber() == 0)
        return false;
    return textCursor().charFormat().fontItalic();
}

bool Documentation::underline() const
{
    QTextCursor cursor = textCursor();
    if (cursor.isNull() || cursor.blockNumber() == 0)
        return false;
    return textCursor().charFormat().fontUnderline();
}

void Documentation::setBold(bool arg)
{
    QTextCharFormat fmt;
    fmt.setFontWeight(arg ? QFont::Bold : QFont::Normal);
    mergeFormatOnWordOrSelection(fmt);
    emit boldChanged();
}

void Documentation::setItalic(bool arg)
{
    QTextCharFormat fmt;
    fmt.setFontItalic(arg);
    mergeFormatOnWordOrSelection(fmt);
    emit italicChanged();
}

void Documentation::setUnderline(bool arg)
{
    QTextCharFormat fmt;
    fmt.setFontUnderline(arg);
    mergeFormatOnWordOrSelection(fmt);
    emit underlineChanged();
}

int Documentation::fontSize() const
{
    QTextCursor cursor = textCursor();
    if (cursor.isNull())
        return 0;
    QTextCharFormat format = cursor.charFormat();
    return format.font().pointSize();
}

void Documentation::setFontSize(int arg)
{
    QTextCursor cursor = textCursor();
    if (cursor.isNull())
        return;
    QTextCharFormat format;
    format.setFontPointSize(arg);
    mergeFormatOnWordOrSelection(format);
    emit fontSizeChanged();
}

QFont Documentation::currentFont() const
{
    QTextCursor cursor = textCursor();
    if (cursor.isNull())
        return QFont();
    QTextCharFormat format = cursor.charFormat();
    return format.font();
}

QStringList Documentation::defaultFontSizes() const
{
    // uhm... this is quite ugly
    QStringList sizes;
    QFontDatabase db;
    foreach (int size, db.standardSizes())
        sizes.append(QString::number(size));
    return sizes;
}


#include "guicontroller.h"
#include <QDebug>
#include <QGuiApplication>
#include <QDebug>
#include <QFontDatabase>
#include <QQmlContext>


GUI_Controller::GUI_Controller(QObject *parent) : QObject(parent)
{
    m_engine = new QQmlApplicationEngine(parent);
    QQmlContext *ctx = m_engine->rootContext();
    ctx->setContextProperty(QStringLiteral("_appController"), this);
    m_engine->addImportPath("qrc:/recources");


    m_engine->load(QUrl(QStringLiteral("qrc:/main.qml")));

    m_initStartTimer.setInterval(1000);
    m_initStartTimer.start();
    connect(&m_initStartTimer, &QTimer::timeout, this, &GUI_Controller::initializationFinished);
}

void GUI_Controller::initializationFinished()
{
    m_initStartTimer.stop();
    m_isInitialized = true;
    qDebug() << "GUI_Controller::initializeStart :: gui initialized" << m_isInitialized;
    Q_EMIT isInitializedChanged();
}




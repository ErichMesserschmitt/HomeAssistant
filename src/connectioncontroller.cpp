#include "connectioncontroller.h"
#include "Connection/tcpclient.h"

ConnectionController::ConnectionController(QObject *parent) : QObject(parent)
{
    qDebug() << "ConnectionController::ConnectionController is initialized";

    m_server = new EchoServer(1488, true);
    startClient();
}

void ConnectionController::startClient()
{
    m_client = new ClientTCP(QStringLiteral("ws://") + m_defaultAdress + ":" + QString::number(m_defaultPort));
}

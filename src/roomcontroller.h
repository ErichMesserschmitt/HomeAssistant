#pragma once

#include <QObject>
#include <iostream>
#include <vector>
#include <QProcess>
#include <QQmlApplicationEngine>
#include <QTimer>

class Room;

class RoomController : public QObject {
    Q_OBJECT
public:

public:
    explicit RoomController(QObject* parent = nullptr);

private:
    QVector<Room> m_rooms;

};

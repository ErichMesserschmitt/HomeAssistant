#pragma once

#include <QObject>
#include <iostream>
#include <vector>
#include <QTimer>


class Component;

class Room : public QObject {
    Q_OBJECT
public:

public:
    explicit Room(QObject* parent = nullptr);

    void addComponent(Component& component);
private:
    bool checkIndex(int index);

    int m_roomIndex = 0;
    QString m_name = "Default Room " + QString::number(m_roomIndex);
    QVector<Component> m_components;
};

#include "room.h"
#include "component.h"
#include <QDebug>
#include <QDebug>
#include <QFontDatabase>
#include <QQmlContext>


Room::Room(QObject *parent) : QObject(parent)
{


}

void Room::addComponent(Component &component)
{
    bool m_indexCorrect = false;
    int index = m_components.length();
    while(!m_indexCorrect){
        m_indexCorrect = !checkIndex(index);
        if(!m_indexCorrect) {
            ++index;
        }
    }
    m_components.append(component);
}

bool Room::checkIndex(int index)
{
    for(auto& component : m_components) {
        if(component.index() == index){
            return true;
        }
    }
    return false;
}





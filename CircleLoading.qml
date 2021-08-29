import QtQuick 2.12
import QtQuick.Window 2.12

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")

    Rectangle{
        anchors.centerIn: parent
        width: 60
        height: 60
        Repeater{
            id:repeater
            anchors.fill: parent
            model:16
            delegate: Component{
                Item{
                    id:item
                    width: 5
                    height: 60
                    transformOrigin: Item.Bottom
                    rotation: (360 / repeater.count) * (model.index + 1)
                    opacity: (model.index === 0) ? 1 : ((1 / repeater.count) * model.index)
                    Rectangle{
                        anchors.left: parent.left
                        anchors.right: parent.right
                        anchors.top: parent.top
                        anchors.bottom: parent.verticalCenter
                        color: "lightblue"
                    }
                    Behavior on opacity{
                        NumberAnimation { duration: 100/ repeater.count }
                    }
                    Timer{
                        interval: 1000 / repeater.count
                        repeat: true
                        running: true
                        property int __run: repeater.count -1
                        onTriggered: {
                            if( __run ===0)
                            {
                                repeater.itemAt(__run).opacity = repeater.itemAt(repeater.count -1).opacity
                            }
                            else
                            {
                                repeater.itemAt(__run).opacity = repeater.itemAt(__run -1).opacity
                            }
                            __run--;
                            if ( __run === -1) __run = repeater.count -1;
                        }
                    }
                }
            }
        }




    }
}

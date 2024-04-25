import QtQuick 2.14
import QtQuick.Window 2.14


Window {
    id: root
    width: 640
    height: 480
    visible: true
    title: qsTr("Make transition")

    Rectangle{
        id: scene
        anchors.fill:parent
        state: "InitialState"

        Rectangle{
            id:leftRectangle
            x:100
            y: 200
            color: "lightgrey"
            width:100
            height:100
            border.color: "black"
            border.width: 3
            radius: 5

            MouseArea{
                anchors.fill: parent
                onClicked: {
                    if(ball.x >= rightRectangle.x - 100){
                        scene.state = "InitialState"
                    } else {
                        ball.x += 30
                        scene.state = "OtherState"
                    }
                }
            }

            Text {
               id: move_txt
               anchors.centerIn: parent
               text: "move"
             }
        }

        Rectangle{
            id: rightRectangle
            x: 300
            y: 200
            color: "lightgrey"
            width:100
            height:100
            border.color: "black"
            border.width: 3
            radius: 5
            //
            MouseArea{
                anchors.fill: parent
                onClicked: scene.state = "InitialState"
            }
            Text {
               id: return_txt
               anchors.centerIn: parent
               text: "return"
             }
        }

        Rectangle{
            id: ball
            x: leftRectangle.x + 5
            y: leftRectangle.y + 5
            color: "darkgreen"
            width: leftRectangle.width - 10
            height:leftRectangle.height - 10
            radius: width/2
        }


        states:[
            State{
                name: "InitialState"
                PropertyChanges{
                    target: ball
                    x: leftRectangle.x + 5
                }

            },
            State{
                name: "OtherState"
                PropertyChanges{
                    target: ball
                    x: ball.x
                }
            }
        ]


        transitions:[
            Transition{
                from: "OtherState"
                to: "InitialState"

                NumberAnimation{
                    properties: "x,y"
                    duration: 1000
                    easing.type: Easing.OutBounce
                }
            }
        ]
    }
}

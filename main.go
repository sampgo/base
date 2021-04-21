package main

import (
	"fmt"

	"github.com/sampgo/sampgo"
)

var classids [3]int

func init() {
	sampgo.Print("go init() called")

	sampgo.On("goModeInit", func() bool {
		sampgo.Print("Hello from Go!")

		v1 := sampgo.CreateVehicle(503, 0, 0, 5.0, 0, 1, 1, 30, true)
		sampgo.Print(fmt.Sprintf("Vehicle id %d created", v1))

		v2 := sampgo.CreateVehicle(504, 0, 2, 5, 0, 3, 3, 30, false)
		sampgo.Print(fmt.Sprintf("Vehicle id %d created", v2))

		classids[0] = sampgo.AddPlayerClass(299, -2023.0072, 176.2670, 28.8359, 270.0, 24, 120, 25, 60, 33, 90)
		classids[1] = sampgo.AddPlayerClass(299, 1188.5535, -1323.7073, 13.5668, 270.0, 24, 120, 25, 60, 33, 90)
		classids[2] = sampgo.AddPlayerClass(299, 2030.4711, 1007.8735, 10.8203, 270.0, 24, 120, 25, 60, 33, 90)
		return true
	})

	sampgo.On("goModeExit", func() bool {
		sampgo.Print("goModeExit!")
		return true
	})

	sampgo.On("onPlayerConnect", func(p sampgo.Player) bool {
		sampgo.Print(fmt.Sprintf("Player ID is %d", p.ID))
		p.SendMessage(0xFFFFFF, "Welcome to the sampgo base gamemode!")
		return true
	})

	sampgo.On("playerRequestClass", func(player sampgo.Player, classid int) bool {
		sampgo.SendClientMessage(player.ID, -1, fmt.Sprintf("Class ID: %d", classid))
		if classid == classids[0] {
			sampgo.SetPlayerCameraPos(player.ID, -1996.4104, 171.7278, 43.3487)
			sampgo.SetPlayerCameraLookAt(player.ID, -1997.4143, 171.7207, 42.8887, 0)
		} else if classid == classids[1] {
			sampgo.SetPlayerCameraPos(player.ID, 1216.8340, -1332.1173, 25.5697)
			sampgo.SetPlayerCameraLookAt(player.ID, 1215.8341, -1332.0193, 25.2996, 0)
		} else if classid == classids[2] {
			sampgo.SetPlayerCameraPos(player.ID, 2068.9216, 986.2932, 26.6053)
			sampgo.SetPlayerCameraLookAt(player.ID, 2067.9951, 986.6823, 26.3203, 0)
		}
		return true
	})
}

func main() {}

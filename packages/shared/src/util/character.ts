import { Players } from "@rbxts/services";

export let localChar = Players.LocalPlayer.Character as Model | undefined;
export let localRoot = localChar?.WaitForChild("HumanoidRootPart") as BasePart | undefined;
export let localHumanoid = localChar?.WaitForChild("Humanoid") as Humanoid | undefined;

function registerCharacter(char: Model) {
	localChar = char;
	localRoot = char.WaitForChild("HumanoidRootPart") as BasePart;
	localHumanoid = char.WaitForChild("Humanoid") as Humanoid;

	let connection: RBXScriptConnection | undefined;
	connection = (localHumanoid as Humanoid).Died.Connect(() => {
		if (connection) {
			connection.Disconnect();
			connection = undefined;
		}

		localChar = undefined;
		localRoot = undefined;
		localHumanoid = undefined;
	});
}

Players.LocalPlayer.CharacterAdded.Connect(registerCharacter);

if (Players.LocalPlayer.Character && Players.LocalPlayer.Character.FindFirstChild("Humanoid")) {
	task.spawn(registerCharacter, Players.LocalPlayer.Character);
}

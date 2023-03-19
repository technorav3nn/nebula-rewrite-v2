import { localChar } from "../util/character";

type Teleports = { [key: string]: CFrame };
type TeleportFn = (cframe: CFrame) => unknown;

export class Teleporter<T extends Teleports> {
	/**
	 * Teleport function
	 * @private
	 */
	private teleportFn: TeleportFn;

	/**
	 * The teleporter's teleports
	 * @public
	 */
	public teleports: T;

	public constructor(teleports: T, teleportFn?: TeleportFn) {
		this.teleports = teleports;
		this.teleportFn =
			teleportFn ??
			((cframe) => {
				localChar?.PivotTo(cframe);
			});
	}

	/**
	 * Teleports to the given teleport key
	 *
	 * @param teleportKey The teleport key
	 * @public
	 * @returns void
	 */
	public teleportTo(teleportKey: keyof T) {
		this.teleportFn(this.teleports[teleportKey]);
	}

	/**
	 * Lists all the teleport keys
	 * mainly used for dropdowns in UI libraries
	 * @public
	 * @returns string[]
	 */
	public listTeleports() {
		const teleportList = [];

		for (const [teleportName, _] of pairs<Teleports>(this.teleports)) {
			teleportList.push(teleportName);
		}

		return teleportList;
	}
}

import { Service } from "@flamework/core";

const PLACE_ID_MAPPINGS = {
	[10427037408]: "life-sentence",
	[8737602449]: "pls-donate",
	[-1]: "debug",
} as const;

type PackagesList = (typeof PLACE_ID_MAPPINGS)[keyof typeof PLACE_ID_MAPPINGS];
type PlaceIdList = keyof typeof PLACE_ID_MAPPINGS;

@Service()
export class LoaderService {
	/**
	 * Imports the game package with the given name
	 * @param packageName
	 * @returns the package
	 */
	public importGamePackage(packageName: PackagesList) {
		switch (packageName) {
			case "pls-donate": {
				return import("pls-donate/index");
			}
			case "debug": {
				return import("shared/index");
			}
		}
	}

	/**
	 * Determines the package to load based on the placeId
	 * @param placeId
	 * @returns string The package name
	 */
	public determineWithPlaceId(placeId: number) {
		// have to use pkg since package is a reserved word
		// like bro it doesnt even have any functionallity
		const pkg = PLACE_ID_MAPPINGS[placeId as PlaceIdList];
		if (!pkg) throw `Couldn't find package for placeId ${placeId}`;

		return pkg;
	}
}

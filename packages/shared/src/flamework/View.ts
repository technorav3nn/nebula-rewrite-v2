import { Controller } from "@flamework/core";
import { Tab, Window } from "../structures/ui-library/types";

export const View = Controller;
export interface TabView {
	window: Window;
	tab: Tab;

	render(): void;
}

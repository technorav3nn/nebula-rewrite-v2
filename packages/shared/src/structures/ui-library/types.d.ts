/* eslint-disable @typescript-eslint/no-explicit-any */

export declare interface Section {
	AddButton(options: {
		Text: string;
		Func: Callback;
		Tooltip?: string;
		DoubleClick?: boolean;
	}): void;
}

export declare interface Tabbox {
	AddTab(name: string): Section;
}

export declare interface Tab {
	AddLeftGroupbox(name: string): Section;
	AddRightGroupbox(name: string): Section;
	AddLeftTabbox(name: string): Tabbox;
	AddRightTabbox(name: string): Tabbox;
}

export declare interface Window {
	AddTab(name: string): Tab;
}

export declare interface Library {
	Initalize(window: Window): void;
	CreateWindow(opts: { Title: string; AutoShow: boolean }): Window;
}

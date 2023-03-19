import { createProducer } from "@rbxts/reflex";
import { TabView, View } from "shared/flamework/View";
import { Window, Tab, Label } from "shared/structures/ui-library/types";

const initialState = {
	boothText: "EMPTY",
};

@View()
export class BoothTabView implements TabView {
	public window!: Window;
	public tab!: Tab;

	private boothProducer = createProducer(initialState, {
		setBoothText: (state, text: string) => ({ ...state, boothText: text }),
	});

	private boothTextLabel!: Label;

	public init(window: Window, tab: Tab) {
		this.window = window;
		this.tab = tab;

		this.render();
		this.observe();
	}

	public render() {
		this.renderMainGroupbox();
	}

	public observe() {
		const unsubscribe = this.boothProducer.subscribe(
			(state) => state.boothText,
			(boothText, prevText) => {
				print(`Booth text changed from ${prevText} to ${boothText}!`);
				this.boothTextLabel.SetText(boothText);
			},
		);
	}

	private renderMainGroupbox() {
		const groupbox = this.tab.AddLeftGroupbox("Main");

		groupbox.AddInput("BoothTabView.boothText", {
			Default: this.boothProducer.getState().boothText,
			Callback: (text: string) => {
				this.boothProducer.setBoothText(text);
			},
		});

		this.boothTextLabel = groupbox.AddLabel(this.boothProducer.getState().boothText);
	}
}

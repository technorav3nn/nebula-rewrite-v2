import { Dependency } from "@flamework/core";
import Library from "shared/structures/ui-library/ui-library";
import "./views/booth-tab";
import { BoothTabView } from "./views/booth-tab";

const window = Library.CreateWindow({ Title: "nebula - pls donate", AutoShow: true });

const boothTab = window.AddTab("Booth");
const loaderService = Dependency<BoothTabView>().init(window, boothTab);

Library.Initalize(window);

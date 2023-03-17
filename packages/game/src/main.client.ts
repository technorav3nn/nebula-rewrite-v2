import { makeHello } from "../../shared/src/module";
import { Flamework, Service, Controller, OnInit } from "@flamework/core";

@Service()
export class MainService implements OnInit {
	onInit() {
		print("init mainservice");
	}

	myMethod() {
		return "mainservice myMethod";
	}
}

@Controller()
export class MainController implements OnInit {
	constructor(private mainService: MainService) {}

	onInit() {
		print("init maincontroller");

		print(this.mainService.myMethod());
	}
}

Flamework.ignite();

print(makeHello("client"));

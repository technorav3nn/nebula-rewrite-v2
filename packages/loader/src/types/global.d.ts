declare interface GlobalEnvAugmentations {
	test: string;
}

declare function getgenv<_>(): GlobalEnvAugmentations & Record<string, unknown>;
declare function getsenv<T>(script: LocalScript | ModuleScript): T & Record<string, unknown>;

declare function __env(): any;

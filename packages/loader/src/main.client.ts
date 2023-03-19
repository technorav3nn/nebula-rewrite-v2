import { Dependency, Flamework } from "@flamework/core";
import "services/loader.service";
import { LoaderService } from "services/loader.service";

Flamework.ignite();

const loaderService = Dependency<LoaderService>();

const gamePackage = loaderService.determineWithPlaceId(game.PlaceId);
loaderService.importGamePackage(gamePackage);

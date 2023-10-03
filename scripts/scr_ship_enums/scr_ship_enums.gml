enum ship_class {
	battle_barge,
	strike_cruiser,
	gladius,
	hunter,
	apocalypse_class_battleship,
	nemesis_class_fleet_carrier,
	avenger_class_grand_cruiser,
	sword_class_frigate,
	void_stalker,
	shadow_class,
	hellebore,
	aconite,
	dethdeala,
	gorbags_revenge,
	kroolboy,
	slamblasta,
	battlekroozer,
	ravager,
	custodian,
	protector, 
	emissary,
	warden,
	castellan,
	desecrator,
	avenger,
	carnage,
	daemon,
	iconoclast,
	leviathan,
	razorfiend ,
	stalker,
	prowler,
	cairn,
	reaper,
	shroud,
	jackal,
	dirge,
};
function print_class(a) {
	switch (a) {
		case ship_class.battle_barge:
			return "Battle Barge";
		case ship_class.strike_cruiser:
			return "Strike Cruiser";
		case ship_class.gladius:
			return "Gladius";
		case ship_class.hunter:
			return "Hunter";
		case ship_class.apocalypse_class_battleship:
			return "Apocalypse Class Battleship";
		case ship_class.nemesis_class_fleet_carrier:
			return "Nemesis Class Fleet Carrier";
		case ship_class.avenger_class_grand_cruiser:
			return "Avenger Class Grand Cruiser";
		case ship_class.sword_class_frigate:
			return "Sword Class Frigate";
		case ship_class.void_stalker:
			return "Void Stalker";
		case ship_class.shadow_class:
			return "Shadow Class";
		case ship_class.hellebore:
			return "Hellebore";
		case ship_class.aconite:
			return "Aconite";
		case ship_class.dethdeala:
			return "Dethdeala";
		case ship_class.gorbags_revenge:
			return "Gorbag's Revenge";
		case ship_class.kroolboy:
			return "Kroolboy";
		case ship_class.slamblasta:
			return "Slamblasta";
		case ship_class.battlekroozer:
			return "Battlekroozer";
		case ship_class.custodian:
			return "Custodian";
		case ship_class.protector:
			return "Protector";
		case ship_class.emissary:
			return "Emissary";
		case ship_class.warden:
			return "Warden";
		case ship_class.castellan:
			return "Castellan";
		case ship_class.desecrator:
			return "Desecrator";
		case ship_class.avenger:
			return "Avenger";
		case ship_class.carnage:
			return "Carnage";
		case ship_class.daemon:
			return "Daemon";
		case ship_class.iconoclast:
			return "Iconoclast";
		case ship_class.leviathan:
			return "Leviathan";
		case ship_class.razorfiend:
			return "Razorfiend";
		case ship_class.stalker:
			return "Stalker";
		case ship_class.prowler:
			return "Prowler";
		case ship_class.cairn:
			return "Cairn";
		case ship_class.reaper:
			return "Reaper";
		case ship_class.shroud:
			return "Shroud";
		case ship_class.jackal:
			return "Jackal";
		case ship_class.dirge:
			return "Dirge";
		default:
			return "";
	}
};


/// this can take either a struct that has a class field, or just the value that is being passed
function get_ship_sprite(ship) {
	var class;
	if(is_struct(ship) && struct_exists(ship, "class")) {
		class = ship.class;
	}		
	else {
		class = ship;	
	}
	
	switch (class) {
		case ship_class.battle_barge:
			return spr_ship_bb;
		case ship_class.strike_cruiser:
			return spr_ship_stri;
		case ship_class.gladius:
			return spr_ship_glad;
		case ship_class.hunter:
			return spr_ship_hunt;
		case ship_class.apocalypse_class_battleship:
			return spr_ship_apoc;
		case ship_class.nemesis_class_fleet_carrier:
			return spr_ship_nem;
		case ship_class.avenger_class_grand_cruiser:
			return spr_ship_aven;
		case ship_class.sword_class_frigate:
			return spr_ship_sword;
		case ship_class.void_stalker:
			return spr_ship_void;
		case ship_class.shadow_class:
			return spr_ship_shadow;
		case ship_class.hellebore:
			return spr_ship_hellebore;
		case ship_class.aconite:
			return spr_ship_aconite;
		case ship_class.dethdeala:
			return spr_ship_deth;
		case ship_class.gorbags_revenge:
			return spr_ship_gorbag;
		case ship_class.kroolboy:
			return spr_ship_krool;
		case ship_class.slamblasta:
			return spr_ship_slam;
		case ship_class.battlekroozer:
			return spr_ship_kroozer;
		case ship_class.custodian:
			return spr_ship_custodian;
		case ship_class.protector:
			return spr_ship_protector;
		case ship_class.emissary:
			return spr_ship_emissary;
		case ship_class.warden:
			return spr_ship_warden;
		case ship_class.castellan:
			return spr_ship_castellan;
		case ship_class.desecrator:
			return spr_ship_dese;
		case ship_class.avenger:
			return spr_ship_veng;
		case ship_class.carnage:
			return spr_ship_carnage;
		case ship_class.daemon:
			return spr_ship_daemon;
		case ship_class.iconoclast:
			return spr_ship_icono;
		case ship_class.leviathan:
			return spr_ship_leviathan;
		case ship_class.razorfiend:
			return spr_ship_razorfiend;
		case ship_class.stalker:
			return spr_ship_stalker;
		case ship_class.prowler:
			return spr_ship_prowler;
		case ship_class.cairn:
			return spr_ship_cairn;
		case ship_class.reaper:
			return spr_ship_reaper;
		case ship_class.shroud:
			return spr_ship_shroud;
		case ship_class.jackal:
			return spr_ship_jackal;
		case ship_class.dirge:
			return spr_ship_dirge;
		default:
			return undefined;
	}
};

enum ship_weapon {
	weapons_battery,
	thunderhawk_launch_bays,
	torpedo_tubes,
	torpedoes,
	bombardment_cannons,
	lance_battery,
	nova_cannon,
	interceptor_launch_bays,
	eldar_launch_bay,
	pulsar_lances,
	gunz_battery,
	heavy_gunz,
	fighta_bommerz,
	gravitic_launcher,
	railgun_battery,
	ion_cannons,
	manta_launch_bay,
	feeder_tendrils,
	bio_plasma_discharge,
	pyro_acid_battery,
	launch_glands,
	massive_claws,
	lightning_arc,
	star_pulse_generator,
	gauss_particle_whip
	
};
function print_weapon(a) {
	switch (a) {
		case ship_weapon.bombardment_cannons:
			return "Bombardment Cannons";
		case ship_weapon.thunderhawk_launch_bays:
			return "Thunderhawk Launch Bays";
		case ship_weapon.torpedo_tubes:
			return "Torpedo Tubes";
		case ship_weapon.torpedoes:
			return "Torpedoes";
		case ship_weapon.weapons_battery:
			return "Weapons Battery";
		case ship_weapon.lance_battery:
			return "Lance Battery";
		case ship_weapon.nova_cannon:
			return "Nova Cannon";
		case ship_weapon.interceptor_launch_bays:
			return "Interceptor Launch Bays";
		case ship_weapon.eldar_launch_bay:
			return "Eldar Launch Bay";
		case ship_weapon.pulsar_lances:
			return "Pulsar Lances";
		case ship_weapon.gunz_battery:
			return "Gunz Battery";
		case ship_weapon.heavy_gunz:
			return "Heavy Gunz";
		case ship_weapon.fighta_bommerz:
			return "Fighta Bommerz";
		case ship_weapon.gravitic_launcher:
			return "Gravitic Launcher";
		case ship_weapon.ion_cannons:
			return "Ion Cannons";
		case ship_weapon.railgun_battery:
			return "Railgun Battery";
		case ship_weapon.manta_launch_bay:
			return "Manta Launch Bay";
		case ship_weapon.feeder_tendrils:
			return "Feeder Tendrils";
		case ship_weapon.bio_plasma_discharge:
			return "Bio-Plasma Discharge";
		case ship_weapon.pyro_acid_battery:
			return "Pyro-Acid Battery";
		case ship_weapon.launch_glands:
			return "Launch Glands";
		case ship_weapon.massive_claws:
			return "Massive Claws";
		case ship_weapon.lightning_arc:
			return "Lightning Arc";
		case ship_weapon.star_pulse_generator:
			return "Star Pulse Generator";
		case ship_weapon.gauss_particle_whip:
			return "Gauss Particle Whip";
		default:
			return "";
	}
}

enum weapon_facing {
	front,
	side, 
	special,
	left,
	right,
	most // I don't know what that means
}
function print_facing(a) {
	switch (a) {
		case weapon_facing.front:
			return "front";
		case weapon_facing.side:
			return "side";
		case weapon_facing.special:
			return "special";
		case weapon_facing.left:
			return "left";
		case weapon_facing.right:
			return "right";
		case weapon_facing.most:
			return "most";
		default:
			return "";
	}
}

enum ship_size {
	capital,
	frigate,
	escort
}

function get_random_capital(faction) {
	switch (faction) {
		case 1:
			return ship_class.battle_barge;	
		break;
		case 2:
			return choose(ship_class.apocalypse_class_battleship, ship_class.nemesis_class_fleet_carrier)
		break;
	}
}

function get_random_frigate(faction) {
	switch (faction) {
		case 1:
			return ship_class.sword_class_frigate;	
		break;
		case 2:
			return ship_class.avenger_class_grand_cruiser
		break;
	}
}

function get_random_escort(faction) {
	switch (faction) {
		case 1:
			return ship_class.hunter;	
		break;
		case 2:
			return ship_class.sword_class_frigate
		break;
	}
}
// Ships have: 
// according to older code
// Name
// Owner(faction)
// class
// size(redundant?)
// uid ??
// leadership (never used)
// max_hp
// hp
// location ??
// conditions (never used)
// speed
// turning battle stats
// front and other armor
// max weapons
// shields
// weapons
// weapon facing
// weapon conditions
// carry cap
// current carry
// turrets
// contents
function new_ship(ship_class, ship_name = "") constructor {
	class = ship_class;
	name = ship_name;
	selected = true;

	if(ship_class == ship_class.battle_barge) {
		if (name == ""){
			name = scr_ship_name("imperial");
		}
		owner = 1;
		location = "home";
		size = ship_size.capital;
		
		max_hp = 1200;
		hp = max_hp;	
		front_armor = 6;
		other_armor = 6;
		max_shields = 1200;
		shields = max_shields;
		movespeed = 20;
		turning = 45;
		capacity = 600;
		carrying = 0;		
				
		max_weapons = 5;
		weapons = [];
		array_push(weapons, new new_ship_weapon(ship_weapon.weapons_battery, weapon_facing.left));
		array_push(weapons, new new_ship_weapon(ship_weapon.weapons_battery, weapon_facing.right));
		array_push(weapons, new new_ship_weapon(ship_weapon.thunderhawk_launch_bays, weapon_facing.special));
		array_push(weapons, new new_ship_weapon(ship_weapon.torpedo_tubes, weapon_facing.front));
		array_push(weapons, new new_ship_weapon(ship_weapon.bombardment_cannons, weapon_facing.most));

		turrets = 3; 
	}
	else if(ship_class == ship_class.strike_cruiser) {
		if (name == ""){
			name = scr_ship_name("imperial");
		}
		owner = 1;
		location = "home";
		size = ship_size.frigate;
		
		max_hp = 600;
		hp = max_hp;
		front_armor = 6;
		other_armor = 6;
		max_shields = 600;
		shields = max_shields;
		movespeed = 25;
		turning = 90;
		capacity = 250;
		carrying = 0;
		
		max_weapons = 4;
		weapons = [];
		array_push(weapons, new new_ship_weapon(ship_weapon.weapons_battery, weapon_facing.left));
		array_push(weapons, new new_ship_weapon(ship_weapon.weapons_battery, weapon_facing.right));
		array_push(weapons, new new_ship_weapon(ship_weapon.thunderhawk_launch_bays, weapon_facing.special));
		array_push(weapons, new new_ship_weapon(ship_weapon.bombardment_cannons, weapon_facing.most));
			
		turrets = 1;
	}
	else if(ship_class == ship_class.gladius) {
		if (name == ""){
			name = scr_ship_name("imperial");
		}
		owner = 1;
		location = "home";
		size = ship_size.escort;

		
		max_hp = 200;
		hp = max_hp;
		front_armor = 5;
		other_armor = 5;
		max_shields = 100;
		shields = max_shields;
		movespeed = 30;
		turning = 90;
		capacity = 100;
		carrying = 0;
		
		max_weapons = 1;
		weapons = [];
		array_push(weapons, new new_ship_weapon(ship_weapon.weapons_battery, weapon_facing.most));
		// according to a comment from duke the gladius weapon should do 25% more damage that the hunter
		// weapons[1].conditions = ; add something here ????
		
		turrets = 1;
	}
	else if(ship_class == ship_class.hunter) {
		if (name == ""){
			name = scr_ship_name("imperium");
		}
		owner = 1;
		location = "home";
		size = ship_size.escort;
	
	
		max_hp = 200;
		hp = max_hp;
		front_armor = 5;
		other_armor = 5;
		max_shields = 100;
		shields = max_shields;
		movespeed = 35;
		turning = 90;
		capacity = 50;
		carrying = 0;
		
		max_weapons = 2;
		weapons = [];
		array_push(weapons, new new_ship_weapon(ship_weapon.torpedoes, weapon_facing.front));
		array_push(weapons, new new_ship_weapon(ship_weapon.weapons_battery, weapon_facing.most));
		
		turrets = 1;
	}
	else if(ship_class == ship_class.apocalypse_class_battleship) {
		if (name == ""){
			name = scr_ship_name("imperium");
		}
		owner = 2;
		location = "home";
		size = ship_size.capital;
	
	
		max_hp = 1200;
		hp = max_hp;
		front_armor = 6;
		other_armor = 5;
		max_shields = 400;
		shields = max_shields;
		movespeed = 35;
		turning = 90;
		capacity = 150;
		carrying = 0;
		
		max_weapons = 4;
		weapons = [];
		array_push(weapons, new new_ship_weapon(ship_weapon.lance_battery, weapon_facing.left));
		array_push(weapons, new new_ship_weapon(ship_weapon.lance_battery, weapon_facing.right));
		array_push(weapons, new new_ship_weapon(ship_weapon.nova_cannon, weapon_facing.front));
		array_push(weapons, new new_ship_weapon(ship_weapon.weapons_battery, weapon_facing.most));
		
		turrets = 4;
	}
	else if(ship_class == ship_class.nemesis_class_fleet_carrier) {
		if (name == ""){
			name = scr_ship_name("imperium");
		}
		owner = 2;
		location = "home";
		size = ship_size.capital;
	
	
		max_hp = 1000;
		hp = max_hp;
		front_armor = 5;
		other_armor = 5;
		max_shields = 400;
		shields = max_shields;
		movespeed = 35;
		turning = 90;
		capacity = 100;
		carrying = 24; // I don't know if it's a good idea to create it with people inside it, I have to reconsider this
		
		max_weapons = 3;
		weapons = [];
		array_push(weapons, new new_ship_weapon(ship_weapon.interceptor_launch_bays, weapon_facing.special));
		array_push(weapons, new new_ship_weapon(ship_weapon.interceptor_launch_bays, weapon_facing.special));
		array_push(weapons, new new_ship_weapon(ship_weapon.lance_battery, weapon_facing.front));
		
		turrets = 5;
	}
	else if(ship_class == ship_class.avenger_class_grand_cruiser) {
		if (name == ""){
			name = scr_ship_name("imperium");
		}
		owner = 2;
		location = "home";
		size = ship_size.frigate;
	
	
		max_hp = 1000;
		hp = max_hp;
		front_armor = 5;
		other_armor = 5;
		max_shields = 300;
		shields = max_shields;
		movespeed = 35;
		turning = 90;
		capacity = 50;
		carrying = 0;
		
		max_weapons = 2;
		weapons = [];
		array_push(weapons, new new_ship_weapon(ship_weapon.lance_battery, weapon_facing.left));
		array_push(weapons, new new_ship_weapon(ship_weapon.lance_battery, weapon_facing.right));
		
		turrets = 3;
	}
	else if(ship_class == ship_class.sword_class_frigate) {
		if (name == ""){
			name = scr_ship_name("imperium");
		}
		owner = 2;
		location = "home";
		size = ship_size.escort;  // I know that the frigate is an escort and not a frigate, shut up
	
		max_hp = 100;
		hp = max_hp;
		front_armor = 5;
		other_armor = 5;
		max_shields = 100;
		shields = max_shields;
		movespeed = 35;
		turning = 90;
		capacity = 50;
		carrying = 0;
		
		max_weapons = 1;
		weapons = [];
		array_push(weapons, new new_ship_weapon(ship_weapon.weapons_battery, weapon_facing.most));
		
		turrets = 2;
	}
	else if(ship_class == ship_class.void_stalker) {
		if (name == ""){
			name = scr_ship_name("eldar");
		}
		owner = 6;
		location = "home";
		size = ship_size.capital;  
	
		max_hp = 1000;
		hp = max_hp;
		front_armor = 5;
		other_armor = 4;
		max_shields = 300;
		shields = max_shields;
		movespeed = 35;
		turning = 90;
		capacity = 150;
		carrying = 0;
		
		max_weapons = 3;
		weapons = [];
		array_push(weapons, new new_ship_weapon(ship_weapon.eldar_launch_bay, weapon_facing.special));
		array_push(weapons, new new_ship_weapon(ship_weapon.weapons_battery, weapon_facing.most));
		array_push(weapons, new new_ship_weapon(ship_weapon.pulsar_lances, weapon_facing.most));
		
		turrets = 4;
	}
	else if(ship_class == ship_class.shadow_class) {
		if (name == ""){
			name = scr_ship_name("eldar");
		}
		owner = 6;
		location = "home";
		size = ship_size.capital;  
	
		max_hp = 600;
		hp = max_hp;
		front_armor = 5;
		other_armor = 4;
		max_shields = 200;
		shields = max_shields;
		movespeed = 35;
		turning = 90;
		capacity = 100;
		carrying = 0;
		
		max_weapons = 2;
		weapons = [];
		array_push(weapons, new new_ship_weapon(ship_weapon.torpedoes, weapon_facing.front));
		array_push(weapons, new new_ship_weapon(ship_weapon.weapons_battery, weapon_facing.front));
		
		turrets = 3;
	}
	else if(ship_class == ship_class.hellebore) {
		if (name == ""){
			name = scr_ship_name("eldar");
		}
		owner = 6;
		location = "home";
		size = ship_size.escort;  
	
		max_hp = 200;
		hp = max_hp;
		front_armor = 5;
		other_armor = 4;
		max_shields = 200;
		shields = max_shields;
		movespeed = 35;
		turning = 90;
		capacity = 50;
		carrying = 0;
		
		max_weapons = 3;
		weapons = [];
		array_push(weapons, new new_ship_weapon(ship_weapon.pulsar_lances, weapon_facing.front));
		array_push(weapons, new new_ship_weapon(ship_weapon.weapons_battery, weapon_facing.front));
		array_push(weapons, new new_ship_weapon(ship_weapon.eldar_launch_bay, weapon_facing.special));
		
		turrets = 2;
	}
	else if(ship_class == ship_class.aconite) {
		if (name == ""){
			name = scr_ship_name("eldar");
		}
		owner = 6;
		location = "home";
		size = ship_size.escort;  
	
		max_hp = 200;
		hp = max_hp;
		front_armor = 5;
		other_armor = 4;
		max_shields = 200;
		shields = max_shields;
		movespeed = 35;
		turning = 90;
		capacity = 50;
		carrying = 0;
		
		max_weapons = 1;
		weapons = [];
		array_push(weapons, new new_ship_weapon(ship_weapon.weapons_battery, weapon_facing.front));
		
		turrets = 2;
	}
	else if(ship_class == ship_class.dethdeala) {
		if (name == ""){
			name = scr_ship_name("orks");
		}
		owner = 7;
		location = "home";
		size = ship_size.capital;  
	
		max_hp = 1200;
		hp = max_hp;
		front_armor = 6;
		other_armor = 5;
		max_shields = 200;
		shields = max_shields;
		movespeed = 35;
		turning = 90;
		capacity = 250;
		carrying = 0;
		
		max_weapons = 5;
		weapons = [];
		array_push(weapons, new new_ship_weapon(ship_weapon.gunz_battery, weapon_facing.left));
		array_push(weapons, new new_ship_weapon(ship_weapon.gunz_battery, weapon_facing.right));
		array_push(weapons, new new_ship_weapon(ship_weapon.bombardment_cannons, weapon_facing.front));
		array_push(weapons, new new_ship_weapon(ship_weapon.heavy_gunz, weapon_facing.most));
		array_push(weapons, new new_ship_weapon(ship_weapon.fighta_bommerz, weapon_facing.special));
		
		turrets = 3;
	}
	else if(ship_class == ship_class.gorbags_revenge) {
		if (name == ""){
			name = scr_ship_name("orks");
		}
		owner = 7;
		location = "home";
		size = ship_size.capital;  
	
		max_hp = 1200;
		hp = max_hp;
		front_armor = 6;
		other_armor = 5;
		max_shields = 200;
		shields=max_shields;
		movespeed = 35;
		turning = 90;
		capacity = 250;
		carrying = 0;
		
		max_weapons = 5;
		weapons = [];
		array_push(weapons, new new_ship_weapon(ship_weapon.gunz_battery, weapon_facing.front));
		array_push(weapons, new new_ship_weapon(ship_weapon.torpedoes, weapon_facing.front));
		array_push(weapons, new new_ship_weapon(ship_weapon.heavy_gunz, weapon_facing.most));
		array_push(weapons, new new_ship_weapon(ship_weapon.fighta_bommerz, weapon_facing.special));
		array_push(weapons, new new_ship_weapon(ship_weapon.fighta_bommerz, weapon_facing.special));
		
		turrets = 3;
	}
	else if(ship_class == ship_class.kroolboy) {
		if (name == ""){
			name = scr_ship_name("orks");
		}
		owner = 7;
		location = "home";
		size = ship_size.capital;  
	
		max_hp = 1200;
		hp = max_hp;
		front_armor = 6;
		other_armor = 5;
		max_shields = 200;
		shields=max_shields;
		movespeed = 35;
		turning = 90;
		capacity = 250;
		carrying = 0;
		
		max_weapons = 3;
		weapons = [];
		array_push(weapons, new new_ship_weapon(ship_weapon.fighta_bommerz, weapon_facing.special));
		array_push(weapons, new new_ship_weapon(ship_weapon.gunz_battery, weapon_facing.most));
		array_push(weapons, new new_ship_weapon(ship_weapon.heavy_gunz, weapon_facing.most));
		
		turrets = 3;
	}
	else if(ship_class == ship_class.slamblasta) {
		if (name == ""){
			name = scr_ship_name("orks");
		}
		owner = 7;
		location = "home";
		size = ship_size.capital;  
	
		max_hp = 1200;
		hp = max_hp;
		front_armor = 6;
		other_armor = 5;
		max_shields = 200;
		shields=max_shields;
		movespeed = 35;
		turning = 90;
		capacity = 250;
		carrying = 0;
		
		max_weapons = 3;
		weapons = [];
		array_push(weapons, new new_ship_weapon(ship_weapon.fighta_bommerz, weapon_facing.special));
		array_push(weapons, new new_ship_weapon(ship_weapon.gunz_battery, weapon_facing.most));
		array_push(weapons, new new_ship_weapon(ship_weapon.heavy_gunz, weapon_facing.most));
		
		turrets = 3;
	}
	else if(ship_class == ship_class.battlekroozer) {
		if (name == ""){
			name = scr_ship_name("orks");
		}
		owner = 7;
		location = "home";
		size = ship_size.capital;  
	
		max_hp = 1000;
		hp = max_hp;
		front_armor = 6;
		other_armor = 5;
		max_shields = 200;
		shields=max_shields;
		movespeed = 35;
		turning = 90;
		capacity = 250;
		carrying = 0;
		
		max_weapons = 5;
		weapons = [];
		array_push(weapons, new new_ship_weapon(ship_weapon.gunz_battery, weapon_facing.most));
		array_push(weapons, new new_ship_weapon(ship_weapon.heavy_gunz, weapon_facing.left));
		array_push(weapons, new new_ship_weapon(ship_weapon.heavy_gunz, weapon_facing.right));
		array_push(weapons, new new_ship_weapon(ship_weapon.fighta_bommerz, weapon_facing.special));
		array_push(weapons, new new_ship_weapon(ship_weapon.fighta_bommerz, weapon_facing.special));
		
		turrets = 3;
	}
	else if(ship_class == ship_class.ravager) {
		if (name == ""){
			name = scr_ship_name("orks");
		}
		owner = 7;
		location = "home";
		size = ship_size.escort;  
	
		max_hp = 100;
		hp = max_hp;
		front_armor = 6;
		other_armor = 4;
		max_shields = 100;
		shields=max_shields;
		movespeed = 35;
		turning = 90;
		capacity = 50;
		carrying = 0;
		
		max_weapons = 2;
		weapons = [];
		array_push(weapons, new new_ship_weapon(ship_weapon.gunz_battery, weapon_facing.front));
		array_push(weapons, new new_ship_weapon(ship_weapon.torpedoes, weapon_facing.front));
		
		turrets = 2;
	}
	else if(ship_class == ship_class.custodian) {
		if (name == ""){
			name = scr_ship_name("tau");
		}
		owner = 8;
		location = "home";
		size = ship_size.capital;  
	
		max_hp = 1000;
		hp = max_hp;
		front_armor = 6;
		other_armor = 5;
		max_shields = 200;
		shields=max_shields;
		movespeed = 35;
		turning = 90;
		capacity = 1000;
		carrying = 0;
		
		max_weapons = 4;
		weapons = [];
		array_push(weapons, new new_ship_weapon(ship_weapon.gravitic_launcher, weapon_facing.front));
		array_push(weapons, new new_ship_weapon(ship_weapon.railgun_battery, weapon_facing.most));
		array_push(weapons, new new_ship_weapon(ship_weapon.ion_cannons, weapon_facing.most));
		array_push(weapons, new new_ship_weapon(ship_weapon.manta_launch_bay, weapon_facing.special));
		
		turrets = 5;
	}
	else if(ship_class == ship_class.protector) {
		if (name == ""){
			name = scr_ship_name("tau");
		}
		owner = 8;
		location = "home";
		size = ship_size.frigate;  
	
		max_hp = 600;
		hp = max_hp;
		front_armor = 6;
		other_armor = 5;
		max_shields = 200;
		shields=max_shields;
		movespeed = 35;
		turning = 90;
		capacity = 250;
		carrying = 0;
		
		max_weapons = 4;
		weapons = [];
		array_push(weapons, new new_ship_weapon(ship_weapon.gravitic_launcher, weapon_facing.front));
		array_push(weapons, new new_ship_weapon(ship_weapon.railgun_battery, weapon_facing.most));
		array_push(weapons, new new_ship_weapon(ship_weapon.ion_cannons, weapon_facing.most));
		array_push(weapons, new new_ship_weapon(ship_weapon.manta_launch_bay, weapon_facing.special));
		
		turrets = 3;
	}
	else if(ship_class == ship_class.emissary) {
		if (name == ""){
			name = scr_ship_name("tau");
		}
		owner = 8;
		location = "home";
		size = ship_size.frigate;  
	
		max_hp = 400;
		hp = max_hp;
		front_armor = 6;
		other_armor = 5;
		max_shields = 100;
		shields=max_shields;
		movespeed = 35;
		turning = 90;
		capacity = 100;
		carrying = 0;
		
		max_weapons = 4;
		weapons = [];
		array_push(weapons, new new_ship_weapon(ship_weapon.gravitic_launcher, weapon_facing.front));
		array_push(weapons, new new_ship_weapon(ship_weapon.railgun_battery, weapon_facing.most));
		array_push(weapons, new new_ship_weapon(ship_weapon.ion_cannons, weapon_facing.most));
		array_push(weapons, new new_ship_weapon(ship_weapon.manta_launch_bay, weapon_facing.special));
		
		turrets = 2;
	}
	else if(ship_class == ship_class.warden) {
		if (name == ""){
			name = scr_ship_name("tau");
		}
		owner = 8;
		location = "home";
		size = ship_size.escort;  
	
		max_hp = 100;
		hp = max_hp;
		front_armor = 5;
		other_armor = 4;
		max_shields = 100;
		shields=max_shields;
		movespeed = 35;
		turning = 90;
		capacity = 50;
		carrying = 0;
		
		max_weapons = 2;
		weapons = [];
		array_push(weapons, new new_ship_weapon(ship_weapon.railgun_battery, weapon_facing.front));
		array_push(weapons, new new_ship_weapon(ship_weapon.ion_cannons, weapon_facing.most));
		
		turrets = 1;
	}
	else if(ship_class == ship_class.castellan) {
		if (name == ""){
			name = scr_ship_name("tau");
		}
		owner = 8;
		location = "home";
		size = ship_size.escort;  
	
		max_hp = 100;
		hp = max_hp;
		front_armor = 5;
		other_armor = 4;
		max_shields = 100;
		shields=max_shields;
		movespeed = 35;
		turning = 90;
		capacity = 50;
		carrying = 0;
		
		max_weapons = 2;
		weapons = [];
		array_push(weapons, new new_ship_weapon(ship_weapon.gravitic_launcher, weapon_facing.front));
		array_push(weapons, new new_ship_weapon(ship_weapon.railgun_battery, weapon_facing.front));
		
		turrets = 2;
	}
	else if(ship_class == ship_class.desecrator) {
		if (name == ""){
			name = scr_ship_name("chaos");
		}
		owner = 10;
		location = "home";
		size = ship_size.capital;  
	
		max_hp = 1200;
		hp = max_hp;
		front_armor = 7;
		other_armor = 5;
		max_shields = 400;
		shields=max_shields;
		movespeed = 35;
		turning = 90;
		capacity = 150;
		carrying = 0;
		
		max_weapons = 5;
		weapons = [];
		array_push(weapons, new new_ship_weapon(ship_weapon.lance_battery, weapon_facing.left));
		array_push(weapons, new new_ship_weapon(ship_weapon.lance_battery, weapon_facing.right));
		array_push(weapons, new new_ship_weapon(ship_weapon.weapons_battery, weapon_facing.front));
		array_push(weapons, new new_ship_weapon(ship_weapon.torpedoes, weapon_facing.front));
		array_push(weapons, new new_ship_weapon(ship_weapon.fighta_bommerz, weapon_facing.special));   // kinda funny that chaos has ork bombers
		
		turrets = 4;
	}
	else if(ship_class == ship_class.avenger) {
		if (name == ""){
			name = scr_ship_name("chaos");
		}
		owner = 10;
		location = "home";
		size = ship_size.frigate;  
	
		max_hp = 1000;
		hp = max_hp;
		front_armor = 5;
		other_armor = 5;
		max_shields = 300;
		shields=max_shields;
		movespeed = 35;
		turning = 90;
		capacity = 50;
		carrying = 0;
		
		max_weapons = 2;
		weapons = [];
		array_push(weapons, new new_ship_weapon(ship_weapon.lance_battery, weapon_facing.left));
		array_push(weapons, new new_ship_weapon(ship_weapon.lance_battery, weapon_facing.right));
		
		turrets = 3;
	}
	else if(ship_class == ship_class.carnage) {
		if (name == ""){
			name = scr_ship_name("chaos");
		}
		owner = 10;
		location = "home";
		size = ship_size.frigate;  
	
		max_hp = 1000;
		hp = max_hp;
		front_armor = 5;
		other_armor = 5;
		max_shields = 300;
		shields=max_shields;
		movespeed = 35;
		turning = 90;
		capacity = 50;
		carrying = 0;
		
		max_weapons = 3;
		weapons = [];
		array_push(weapons, new new_ship_weapon(ship_weapon.lance_battery, weapon_facing.most));
		array_push(weapons, new new_ship_weapon(ship_weapon.weapons_battery, weapon_facing.left));
		array_push(weapons, new new_ship_weapon(ship_weapon.weapons_battery, weapon_facing.right));
		
		turrets = 2;
	}
	else if(ship_class == ship_class.daemon) {
		if (name == ""){
			name = scr_ship_name("chaos");
		}
		owner = 10;
		location = "home";
		size = ship_size.frigate;  
	
		max_hp = 1000;
		hp = max_hp;
		front_armor = 5;
		other_armor = 5;
		max_shields = 300;
		shields=max_shields;
		movespeed = 35;
		turning = 90;
		capacity = 50;
		carrying = 0;
		
		max_weapons = 3;
		weapons = [];
		array_push(weapons, new new_ship_weapon(ship_weapon.lance_battery, weapon_facing.most));
		array_push(weapons, new new_ship_weapon(ship_weapon.weapons_battery, weapon_facing.left));
		array_push(weapons, new new_ship_weapon(ship_weapon.weapons_battery, weapon_facing.right));
		
		turrets = 2;
	}
	else if(ship_class == ship_class.iconoclast) {
		if (name == ""){
			name = scr_ship_name("chaos");
		}
		owner = 10;
		location = "home";
		size = ship_size.escort;  
	
		max_hp = 100;
		hp = max_hp;
		front_armor = 7;
		other_armor = 4;
		max_shields = 100;
		shields=max_shields;
		movespeed = 35;
		turning = 90;
		capacity = 50;
		carrying = 0;
		
		max_weapons = 1;
		weapons = [];
		array_push(weapons, new new_ship_weapon(ship_weapon.weapons_battery, weapon_facing.most));
		
		turrets = 2;
	}
	else if(ship_class == ship_class.leviathan) {
		if (name == ""){
			name = scr_ship_name("tyranids"); // we need to add mutations to tyrannid ships, they can be random buffs, the old code had them
		}
		owner = 9;
		location = "home";
		size = ship_size.capital;  
	
		max_hp = 1000;
		hp = max_hp;
		front_armor = 7;
		other_armor = 5;
		max_shields = 300;
		shields=max_shields;
		movespeed = 35;
		turning = 90;
		capacity = 0;
		carrying = 0;
		
		max_weapons = 4;
		weapons = [];
		array_push(weapons, new new_ship_weapon(ship_weapon.feeder_tendrils, weapon_facing.most));
		array_push(weapons, new new_ship_weapon(ship_weapon.bio_plasma_discharge, weapon_facing.most));
		array_push(weapons, new new_ship_weapon(ship_weapon.pyro_acid_battery, weapon_facing.front));
		array_push(weapons, new new_ship_weapon(ship_weapon.launch_glands, weapon_facing.special));
		
		turrets = 3;
	}
	else if(ship_class == ship_class.razorfiend) {
		if (name == ""){
			name = scr_ship_name("tyranids");
		}
		owner = 9;
		location = "home";
		size = ship_size.frigate;  
	
		max_hp = 600;
		hp = max_hp;
		front_armor = 5;
		other_armor = 4;
		max_shields = 200;
		shields=max_shields;
		movespeed = 35;
		turning = 90;
		capacity = 0;
		carrying = 0;
		
		max_weapons = 3;
		weapons = [];
		array_push(weapons, new new_ship_weapon(ship_weapon.pyro_acid_battery, weapon_facing.front));
		array_push(weapons, new new_ship_weapon(ship_weapon.feeder_tendrils, weapon_facing.most));
		array_push(weapons, new new_ship_weapon(ship_weapon.massive_claws, weapon_facing.most));
		
		turrets = 2;
	}
	else if(ship_class == ship_class.stalker) {
		if (name == ""){
			name = scr_ship_name("tyranids");
		}
		owner = 9;
		location = "home";
		size = ship_size.escort;  
	
		max_hp = 100;
		hp = max_hp;
		front_armor = 5;
		other_armor = 4;
		max_shields = 100;
		shields=max_shields;
		movespeed = 35;
		turning = 90;
		capacity = 0;
		carrying = 0;
		
		max_weapons = 1;
		weapons = [];
		array_push(weapons, new new_ship_weapon(ship_weapon.pyro_acid_battery, weapon_facing.front));  // there are stalkers with other weapons, we could revisit this later
		turrets = 0;
	}
	else if(ship_class == ship_class.prowler) {
		if (name == ""){
			name = scr_ship_name("tyranids");
		}
		owner = 9;
		location = "home";
		size = ship_size.escort;  
	
		max_hp = 100;
		hp = max_hp;
		front_armor = 5;
		other_armor = 4;
		max_shields = 100;
		shields=max_shields;
		movespeed = 35;
		turning = 90;
		capacity = 0;
		carrying = 0;
		
		max_weapons = 1;
		weapons = [];
		array_push(weapons, new new_ship_weapon(ship_weapon.feeder_tendrils, weapon_facing.front));  // there are other weapons, we could revisit this later
		turrets = 0;
	}
	else if(ship_class == ship_class.prowler) {
		if (name == ""){
			name = scr_ship_name("tyranids");
		}
		owner = 9;
		location = "home";
		size = ship_size.escort;  
	
		max_hp = 100;
		hp = max_hp;
		front_armor = 5;
		other_armor = 4;
		max_shields = 100;
		shields=max_shields;
		movespeed = 35;
		turning = 90;
		capacity = 0;
		carrying = 0;
		
		max_weapons = 1;
		weapons = [];
		array_push(weapons, new new_ship_weapon(ship_weapon.feeder_tendrils, weapon_facing.front));  // there are other weapons, we could revisit this later
		turrets = 0;
	}
	else if(ship_class == ship_class.cairn) {
		if (name == ""){
			name = scr_ship_name("necron");
		}
		owner = 13;
		location = "home";
		size = ship_size.capital;  
	
		max_hp = 1100;
		hp = max_hp;
		front_armor = 5;
		other_armor = 5;
		max_shields = 500;
		shields=max_shields;
		movespeed = 35;
		turning = 90;
		capacity = 800;
		carrying = 0;
		
		max_weapons = 3;
		weapons = [];
		array_push(weapons, new new_ship_weapon(ship_weapon.lightning_arc, weapon_facing.most));  
		array_push(weapons, new new_ship_weapon(ship_weapon.star_pulse_generator, weapon_facing.front));  
		array_push(weapons, new new_ship_weapon(ship_weapon.gauss_particle_whip, weapon_facing.front));  
		turrets = 5;
	}
	else if(ship_class == ship_class.reaper) {
		if (name == ""){
			name = scr_ship_name("necron");
		}
		owner = 13;
		location = "home";
		size = ship_size.capital;  
	
		max_hp = 900;
		hp = max_hp;
		front_armor = 5;
		other_armor = 5;
		max_shields = 400;
		shields=max_shields;
		movespeed = 35;
		turning = 90;
		capacity = 500;
		carrying = 0;
		
		max_weapons = 3;
		weapons = [];
		array_push(weapons, new new_ship_weapon(ship_weapon.lightning_arc, weapon_facing.most));  
		array_push(weapons, new new_ship_weapon(ship_weapon.star_pulse_generator, weapon_facing.front));  
		array_push(weapons, new new_ship_weapon(ship_weapon.gauss_particle_whip, weapon_facing.front));  
		turrets = 4;
	}
	else if(ship_class == ship_class.shroud) {
		if (name == ""){
			name = scr_ship_name("necron");
		}
		owner = 13;
		location = "home";
		size = ship_size.frigate;  
	
		max_hp = 400;
		hp = max_hp;
		front_armor = 5;
		other_armor = 5;
		max_shields = 200;
		shields=max_shields;
		movespeed = 35;
		turning = 90;
		capacity = 250;
		carrying = 0;
		
		max_weapons = 1;
		weapons = [];
		array_push(weapons, new new_ship_weapon(ship_weapon.lightning_arc, weapon_facing.most));  
		turrets = 2;
	}
	else if(ship_class == ship_class.jackal) {
		if (name == ""){
			name = scr_ship_name("necron");
		}
		owner = 13;
		location = "home";
		size = ship_size.frigate;  
	
		max_hp = 100;
		hp = max_hp;
		front_armor = 4;
		other_armor = 4;
		max_shields = 100;
		shields=max_shields;
		movespeed = 35;
		turning = 90;
		capacity = 25;
		carrying = 0;
		
		max_weapons = 1;
		weapons = [];
		array_push(weapons, new new_ship_weapon(ship_weapon.lightning_arc, weapon_facing.most));  
		turrets = 2;
	}
	else if(ship_class == ship_class.dirge) {
		if (name == ""){
			name = scr_ship_name("necron");
		}
		owner = 13;
		location = "home";
		size = ship_size.frigate;  
	
		max_hp = 100;
		hp = max_hp;
		front_armor = 4;
		other_armor = 4;
		max_shields = 100;
		shields=max_shields;
		movespeed = 35;
		turning = 90;
		capacity = 25;
		carrying = 0;
		
		max_weapons = 1;
		weapons = [];
		array_push(weapons, new new_ship_weapon(ship_weapon.lightning_arc, weapon_facing.most));  
		turrets = 2;
	}
}


function new_ship_weapon(ship_weapon, ship_facing) constructor {
	weapon = ship_weapon;
	facing = ship_facing;
	conditions = []; // not really needed for now
	damage = 0;
	max_range = infinity;
	min_range = 0;
	cooldown = 0; 
	ammo = infinity; 
	
	if(weapon == ship_weapon.lance_battery) {
		damage = 14;
		max_range = 300;
		cooldown= 30;
	}
	else if(weapon == ship_weapon.nova_cannon) {
		damage = 34;
		max_range = 1500;
		min_range = 300;
		cooldown= 120;
	}
	else if(weapon == ship_weapon.weapons_battery) {
		damage = 14;
		max_range = 600;
		cooldown= 20;
	}
	else if(weapon == ship_weapon.interceptor_launch_bays) {
		cooldown= 120; 
		ammo = 6; // I don't think we should store the ammo here, this is a launch bay, it launches people, not bullets, maybe we could say it lauches ships??
	}
	else if(weapon == ship_weapon.eldar_launch_bay) {
		cooldown= 90; 
		ammo = 4; // I don't think we should store the ammo here, this is a launch bay, it launches people, not bullets, maybe we could say it lauches ships??
	}
	else if(weapon == ship_weapon.pulsar_lances) {
		damage = 10; 
		max_range = 600; 
		cooldown= 10; 
	}
	else if(weapon == ship_weapon.torpedoes) {
		damage = 12; 
		max_range = 450; 
		cooldown= 90; 
	}
	else if(weapon == ship_weapon.gunz_battery) {
		damage = 8; 
		max_range = 300; 
		cooldown= 30; 
	}
	else if(weapon == ship_weapon.heavy_gunz) {
		damage = 12; 
		max_range = 200; 
		cooldown= 40; 
	}
	else if(weapon == ship_weapon.bombardment_cannons) {
		damage = 12; 
		max_range = 450; 
		cooldown= 120; 
	}
	else if(weapon == ship_weapon.fighta_bommerz) {
		cooldown= 90; 
	}
	else if(weapon == ship_weapon.gravitic_launcher) {
		damage = 12; 
		max_range = 400; 
		min_range = 200; 
		cooldown = 30; 
	}
	else if(weapon == ship_weapon.railgun_battery) {
		damage = 12; 
		max_range = 450; 
		cooldown = 30; 
	}
	else if(weapon == ship_weapon.ion_cannons) {
		damage = 8; 
		max_range = 300; 
		cooldown = 15; 
	}
	else if(weapon == ship_weapon.manta_launch_bay) {
		cooldown = 90; 
		ammo = 4; 
	}
	else if(weapon == ship_weapon.feeder_tendrils) {
		damage = 12; 
		max_range = 160; 
		cooldown = 30; 
	}
	else if(weapon == ship_weapon.bio_plasma_discharge) {
		damage = 10; 
		max_range = 260; 
		cooldown = 30; 
	}
	else if(weapon == ship_weapon.pyro_acid_battery) {
		damage = 18; 
		max_range = 500; 
		cooldown = 40; 
	}
	else if(weapon == ship_weapon.launch_glands) {
		cooldown = 120; 
		ammo = 6; 
	}
	else if(weapon == ship_weapon.massive_claws) {
		cooldown = 60; 
		damage = 20; 
		max_range = 64; 
	}
	else if(weapon == ship_weapon.lightning_arc) {
		cooldown = 15; 
		damage = 8; 
		max_range = 300; 
	}
	else if(weapon == ship_weapon.star_pulse_generator) {
		cooldown = 210; 
		damage = 80; 
		max_range = 220; 
	}
	else if(weapon == ship_weapon.gauss_particle_whip) {
		cooldown = 90; 
		damage = 30; 
		max_range = 450; 
	}
}







function count_escorts(ships) {
	if (!is_array(ships)) {
		return 0;
	}

	var count = 0;
	var len = array_length(ships);
	for (var i = 0; i < len; i++) {
		if (ships[i].size == ship_size.capital) then ++count;
	}
	
	return count;
}

function count_frigates(ships) {
	if (!is_array(ships)) {
		return 0;
	}

	var count = 0;
	var len = array_length(ships);
	for (var i = 0; i < len; i++) {
		if (ships[i].size == ship_size.frigate) then ++count;
	}
	
	return count;
}

function count_capitals(ships) {
	if (!is_array(ships)) {
		return 0;
	}

	var count = 0;
	var len = array_length(ships);
	for (var i = 0; i < len; i++) {
		if (ships[i].size == ship_size.escort) then ++count;
	}
	return count;
}

function get_escorts(ships) {
	if (!is_array(ships)) {
		return [];
	}
	
	return array_filter(ships,
		function(ship, index) {
			return ship.size == ship_size.escort;
	});
}

function get_frigates(ships) {
	if (!is_array(ships)) {
		return [];
	}
	
	return array_filter(ships,
		function(ship, index) {
			return ship.size == ship_size.frigate;
	});
}

function get_capitals(ships) {
	if (!is_array(ships)) {
		return [];
	}
	
	return array_filter(ships,
		function(ship, index) {
			return ship.size == ship_size.capital;
	});
}


// this function takes an array of ships, murders the crew of the dead ships and then removes them from the array,
// when murdering the crew it also sets a var that is has done some, so if the function is used in another array that has that dead ship it doesn't try to murder the crew twice
function clean_dead_ships(ships) {
	if (!is_array(ships)) {
		exit;
	}
	
	var new_len = array_filter_ext(ships, 
		function(ship, index) {
			if(ship.hp <= 0) {
				if(!ship.crew_killed) {
					//kill crew
				}
				return false;
			}
			return true;
	});
	
	array_resize(ships, new_len);
}


function kill_ship_crew(ship) {

	// WeeeeeeEEEEEEEEEE~

	// If a ship has been destroyed this kills the fuck out relevant marines
	// Also checks for lost company standards, chapter master, and cleans up
	// the company arrays afterward.

	var i, cmp, shi;
	i=0;cmp=0;shi=999;


	var clean;i=-1;
	repeat(30){i+=1;clean[i]=0;}



	if (argument0=1){
	    obj_controller.marines=0;
	    obj_controller.command=0;
	}



	i=0;
	repeat(3300){
	    i+=1;
    
	    if (i>300){i=1;cmp+=1;}
    
	    if (cmp<11) and (i>0) and (i<=300) {// Ran by obj_fleet to calculate the number of dead marines
	        if (obj_ini.name[cmp,i]!="") and ((ship_lost[obj_ini.lid[cmp,i]]>0) or (obj_ini.ship_hp[obj_ini.lid[cmp,i]]<=0)) and (obj_ini.lid[cmp,i]>0){
	            fallen+=1;clean[cmp]=1;
            
	            /*if (is_specialist(obj_ini.role[cmp,i])=true){
	                // obj_controller.marines+=1;
	                obj_controller.command-=1;
	            }*/
            
	            if (obj_ini.role[cmp,i]="Chapter Master"){obj_controller.alarm[7]=1;if (global.defeat<=1) then global.defeat=1;}
	            if (obj_ini.wep1[cmp,i]="Company Standard") then scr_loyalty("Lost Standard","+");
	            if (obj_ini.wep2[cmp,i]="Company Standard") then scr_loyalty("Lost Standard","+");
            
	            obj_ini.race[cmp,i]=0;obj_ini.loc[cmp,i]="";obj_ini.name[cmp,i]="";obj_ini.role[cmp,i]="";obj_ini.wep1[cmp,i]="";obj_ini.lid[cmp,i]=0;
	            obj_ini.wep2[cmp,i]="";obj_ini.armor[cmp,i]="";obj_ini.gear[cmp,i]="";obj_ini.hp[cmp,i]=100;obj_ini.chaos[cmp,i]=0;obj_ini.experience[cmp,i]=0;
	            obj_ini.mobi[cmp,i]="";obj_ini.age[cmp,i]=0;obj_ini.spe[cmp,i]="";obj_ini.god[cmp,i]=0;obj_ini.bio[cmp,i]=0;// obj_controller.marines-=1;
	        }
        
	        if (obj_ini.name[cmp,i]!="") and (obj_ini.role[cmp,i]!="") and (obj_ini.race[cmp,i]=1){
	            if (is_specialist(obj_ini.role[cmp,i])=false) then obj_controller.marines+=1
	            else obj_controller.command+=1;
	        }
        
	        if (i<120){
	            if (obj_ini.veh_role[cmp,i]!="") and ((ship_lost[obj_ini.veh_lid[cmp,i]]>0) or (obj_ini.ship_hp[obj_ini.veh_lid[cmp,i]]<=0)) and (obj_ini.veh_lid[cmp,i]>0){
	                clean[cmp]=1;
	                obj_ini.veh_race[cmp,i]=0;obj_ini.veh_loc[cmp,i]="";obj_ini.veh_name[cmp,i]="";obj_ini.veh_role[cmp,i]="";obj_ini.veh_wep1[cmp,i]="";obj_ini.veh_wep2[cmp,i]="";
	                obj_ini.veh_upgrade[cmp,i]="";obj_ini.veh_hp[cmp,i]=100;obj_ini.veh_chaos[cmp,i]=0;obj_ini.veh_pilots[cmp,i]=0;obj_ini.veh_lid[cmp,i]=0;
	            }
	        }
	    }
    
	}


	i=-1;
	repeat(31){
	    i+=1;
	    if (i<=10) and (clean[i]=1){with(obj_ini){scr_company_order(i);scr_vehicle_order(i);}}
	}


}

var __b__;
__b__ = action_if_number(obj_saveload, 0, 0);
if __b__
{
__b__ = action_if_number(obj_drop_select, 0, 0);
if __b__
{
if (owner=1) and (instance_nearest(x,y,obj_p_fleet).action=""){





    if (instance_exists(obj_fleet_select)){
        var free,z;free=1;z=obj_fleet_select;
        if (mouse_x>=__view_get( e__VW.XView, 0 )+z.void_x) and (mouse_y>=__view_get( e__VW.YView, 0 )+z.void_y) 
        and (mouse_x<__view_get( e__VW.XView, 0 )+z.void_x+z.void_wid) and (mouse_y<__view_get( e__VW.YView, 0 )+z.void_y+z.void_hei) and (obj_controller.fleet_minimized=0) then free=0;
        
        if (mouse_x>=__view_get( e__VW.XView, 0 )+z.void_x) and (mouse_y>=__view_get( e__VW.YView, 0 )+z.void_y) 
        and (mouse_x<__view_get( e__VW.XView, 0 )+z.void_x+z.void_wid) and (mouse_y<__view_get( e__VW.YView, 0 )+137) and (obj_controller.fleet_minimized=1) then free=0;
        if (free=0) then exit;
    }

    
    var sys, sys_dist, mine, connected, fleet, cont;
    sys_dist=9999;connected=0;cont=0;
    
    fleet=instance_nearest(x,y,obj_p_fleet);
    
    if (instance_exists(target)) and (target!=0){if (target.acted>0) then exit;}
    
    
    sys=instance_nearest(mouse_x,mouse_y,obj_star);
    sys_dist=point_distance(mouse_x,mouse_y,sys.x,sys.y);
    var act_dist=point_distance(x,y,sys.x,sys.y);
    mine=instance_nearest(x,y,obj_star);
    
    if (mine.buddy=sys) then connected=1;
    if (sys.buddy=mine) then connected=1;
    
    if (sys_dist<32) and (sys.id!=mine.id) then cont=1;
    if (sys.storm>0) or (instance_nearest(x,y+24,obj_star).storm>0) then cont=0;
    if (sys.craftworld=1) and (obj_controller.known[6]=0) then cont=0;
    
    var web1,web2,web;
    web1=0;web2=0;web=0;
    
    if (sys_dist<32){
        if (string_count("Webway",mine.p_feature[1])>0) then web1=1;
        if (string_count("Webway",mine.p_feature[2])>0) then web1=1;
        if (string_count("Webway",mine.p_feature[3])>0) then web1=1;
        if (string_count("Webway",mine.p_feature[4])>0) then web1=1;
        
        if (string_count("Webway",sys.p_feature[1])>0) then web2=1;
        if (string_count("Webway",sys.p_feature[2])>0) then web2=1;
        if (string_count("Webway",sys.p_feature[3])>0) then web2=1;
        if (string_count("Webway",sys.p_feature[4])>0) then web2=1;
        
        if (web1=1) and (web2=1) then web=1;
        if (mine.id=sys.id) then web=0;
    }
    
    if (cont=1){
        
        var w,stot;stot=0;
		var ships_count = array_length(fleet.ships);
		for (var i = 0; i < ships_count; i++) {
			if (fleet.ships[i].selected) {
				++stot;
			}
			else {
				cont = 50;
			}
		}
        
        if (cont!=50) then cont=20;
        if (stot>0) and (stot<fleet.capital_number+fleet.frigate_number+fleet.escort_number) then cont=50;
        if (stot=0){cont=0;cooldown=8;exit;}
    }
    
    
    
    if (cont=20){// Move the entire fleet, don't worry about the other crap
    
        var eta;eta=0;
        fleet=instance_nearest(x,y,obj_p_fleet);
        eta=floor(point_distance(mine.x,mine.y,sys.x,sys.y)/fleet.action_spd)+1;
        if (connected=0) then eta=eta*2;
        if (connected=1) then fleet.connected=1;
        if (web=1) then eta=1;
        fleet.action_eta=eta;
        
        fleet.action_x=sys.x;
        fleet.action_y=sys.y;
        fleet.action="move";
        fleet.orbiting=0;
        
        // mine.present_fleet[1]-=1;
        
		var ships_count = array_length(fleet.ships);
		for (var i = 0; i < ships_count; i++) {
			fleet.ships[i].location = "Warp";
		}	
    }
    
    if (cont=50){// The fleet is splitting up
    
        if (fleet.acted>0) then exit;
        
        var eta, w, new_fleet, cap, fri, esc, tempp;
        fleet=instance_nearest(x,y,obj_p_fleet);
        new_fleet=instance_create(x,y,obj_p_fleet);
        eta=floor(point_distance(mine.x,mine.y,sys.x,sys.y)/new_fleet.action_spd)+1;
        if (connected=0) then eta=eta*2;
        if (connected=1) then new_fleet.connected=1;
        if (web=1) then eta=1;
        new_fleet.action_eta=eta;
        
        new_fleet.action_x=sys.x;
        new_fleet.action_y=sys.y;
        new_fleet.action="move";
        new_fleet.owner=1;
        new_fleet.x=new_fleet.x+lengthdir_x(48,point_direction(new_fleet.x,new_fleet.y,sys.x,sys.y));
        new_fleet.y=new_fleet.y+lengthdir_y(48,point_direction(new_fleet.x,new_fleet.y,sys.x,sys.y));
        
        cap=0;fri=0;esc=0;
        
		
		var ships_count = array_length(fleet.ships);
		for (var i = 0; i < ships_count; i++) {
			var ship = fleet.ships[i];
			if (ship.selected) {
				array_delete(fleet.ships,i,1);
				array_push(new_fleet.ships, ship);
				ship.location = "Warp";
				if(ship.size == SHIP_SIZE.capital) then ++cap;
				else if(ship.size == SHIP_SIZE.frigate) then ++fri;
				else if(ship.size == SHIP_SIZE.escort) then ++esc;
				--ships_count;
				--i;
			}
		}
		
        // Pass over ships to the new fleet, if they are selected
        fleet.capital_number-=cap;
        fleet.frigate_number-=fri;
        fleet.escort_number-=esc;
        new_fleet.capital_number=cap;
        new_fleet.frigate_number=fri;
        new_fleet.escort_number=esc;
        
        fleet.selected=0;
        obj_controller.selected=new_fleet;
        obj_controller.fleet_all=1;

		
        with(obj_fleet_select){instance_destroy();}
        new_fleet.alarm[3]=1;
        
        var ii;ii=0;ii+=fleet.capital_number;ii+=round((fleet.frigate_number/2));ii+=round((fleet.escort_number/4));
        if (ii<=1) then ii=1;fleet.image_index=ii;
        
        //// Temporary fixing thing
        //with(new_fleet){var w, tempp;
        //    w=0;repeat(capital_number+1){
        //        w+=1;if (capital[w]!=""){tempp=capital_num[w];obj_ini.ship_location[tempp]="Warp";}
        //    }
        //    w=0;repeat(frigate_number+1){
        //        w+=1;if (frigate[w]!=""){tempp=frigate_num[w];obj_ini.ship_location[tempp]="Warp";}
        //    }
        //    w=0;repeat(escort_number+1){
        //        w+=1;if (escort[w]!=""){tempp=escort_num[w];obj_ini.ship_location[tempp]="Warp";}
        //    }
        //}
        
    }
    
    
    /*
    
owner=0;
capital_number=0;
frigate_number=0;
escort_number=0;
selected=0;

capital[0]=0;capital_num[0]=0;capital_sel[0]=1;
capital[1]=0;capital_num[1]=0;capital_sel[1]=1;
capital[2]=0;capital_num[2]=0;capital_sel[2]=1;
capital[3]=0;capital_num[3]=0;capital_sel[3]=1;
capital[4]=0;capital_num[4]=0;capital_sel[4]=1;
capital[5]=0;capital_num[5]=0;capital_sel[5]=1;
capital[6]=0;capital_num[6]=0;capital_sel[6]=1;
capital[7]=0;capital_num[7]=0;capital_sel[7]=1;
capital[8]=0;capital_num[8]=0;capital_sel[8]=1;

var i;i=-1;
repeat(31){i+=1;
    frigate[i]=0;frigate_num[i]=0;frigate_sel[i]=1;
}

var i;i=-1;
repeat(31){i+=1;
    escort[i]=0;escort_num[i]=0;escort_sel[i]=1;
}

image_speed=0;


action="";
action_x=0;
action_y=0;
action_spd=64;
action_eta=0;
connected=0;*/
    
    
    
    
}

/* */
}
}
/*  */


if (double_click>=0) then double_click-=1;
if (text_bar>0){text_bar+=1;
    if (menu=1) and (managing>0) then obj_ini.company_title[managing]=keyboard_string;
    if (menu=24) and (formating>0) and (formating>3) then bat_formation[formating]=keyboard_string;
}
if (text_bar>60) then text_bar=1;
if (bar_fix>0){bar_fix=-1;scr_ui_formation_bars();}


if (fest_scheduled=0) and (fest_sid+fest_wid>0) and (menu!=12.1){
    fest_sid=0;fest_wid=0;fest_planet=0;
    fest_type="";fest_cost=0;
    fest_lav=0;fest_locals=0;
    fest_feature1=0;fest_feature2=0;fest_feature3=0;
    fest_display=0;fest_repeats=0;
    fest_honor_co=0;fest_honor_id=0;
    fest_attend="";
}


if (menu!=24) and (formating>0) then formating=0;

if (instance_exists(obj_formation_bar)) and ((menu!=24) or (formating<=0)){
    with(obj_formation_bar){instance_destroy();}
    with(obj_temp8){instance_destroy();}formating=0;
}




if (sound_in>=0) then sound_in-=1;
if (sound_in=0) and (sound_to!=""){audio_stop_all();
    if (sound_to="blood"){
        global.sound_playing=audio_play_sound(snd_blood,0,true);
        audio_sound_gain(global.sound_playing, 0, 0);
        var nope;nope=0;if (obj_controller.master_volume=0) or (obj_controller.music_volume=0) then nope=1;
        if (nope!=1){audio_sound_gain(global.sound_playing,0.2*obj_controller.master_volume*obj_controller.music_volume,2000);}
    }
    if (sound_to="royal"){
        global.sound_playing=audio_play_sound(snd_royal,0,true);
        audio_sound_gain(global.sound_playing, 0, 0);
        var nope;nope=0;if (obj_controller.master_volume=0) or (obj_controller.music_volume=0) then nope=1;
        if (nope!=1){audio_sound_gain(global.sound_playing,0.25*obj_controller.master_volume*obj_controller.music_volume,2000);}
    }
}



if (cheatcode != "")
{
	cheatyface = 1
}
if (cheatcode == "req" && global.cheat_req == 0)
{
    global.cheat_req = 1
    obj_controller.tempRequisition = obj_controller.requisition
    obj_controller.requisition = 51234
}
else if (cheatcode == "req" && global.cheat_req == 1)
{
    global.cheat_req = 0
    obj_controller.requisition = obj_controller.tempRequisition
}

if (cheatcode == "seed" && global.cheat_gene == 0)
{
    global.cheat_gene = 1
    obj_controller.tempGene_seed = obj_controller.gene_seed
    obj_controller.gene_seed = 9999
}

else if (cheatcode == "seed" && global.cheat_gene == 1)
{
    global.cheat_gene = 0
    obj_controller.gene_seed = obj_controller.tempGene_seed
}

if (cheatcode == "dep")
{
    global.cheat_disp = 1
    obj_controller.disposition[2] = 100
    obj_controller.disposition[3] = 100
    obj_controller.disposition[4] = 100
    obj_controller.disposition[5] = 100
    obj_controller.disposition[6] = 100
    obj_controller.disposition[7] = 100
    obj_controller.disposition[8] = 100
    obj_controller.disposition[9] = 100
    obj_controller.disposition[10] = 100
}

if (cheatcode == "debug" && global.cheat_debug == 0)
{
    global.cheat_debug = 1 
}

else if (cheatcode == "debug" && global.cheat_debug == 1)
{
    global.cheat_debug = 0
}

if (cheatcode == "test")
{
    diplomacy = 10.5
    scr_dialogue("test")
}

if (global.cheat_req == 1 && obj_controller.requisition != 51234)
    obj_controller.requisition = 51234
cheatcode = ""

if (menu != 17.5 && instance_exists(obj_event_log))
    obj_event_log.help = 0
if ((!instance_exists(obj_event_log)) && instance_exists(obj_controller))
    instance_activate_object(obj_event_log)
	
if (!instance_exists(obj_ingame_menu))
{
    play_second += 1
    if (play_second >= 30)
    {
        play_second = 0
        play_time += 1
        window_old = window_data
        window_data = (((((((string(window_get_x()) + "|") + string(window_get_y())) + "|") + string(window_get_width())) + "|") + string(window_get_height())) + "|")
        if (window_get_fullscreen() == 1)
        {
            window_old = "fullscreen"
            window_data = "fullscreen"
        }
        if (window_data != "fullscreen" && window_get_fullscreen() == 0)
        {
            if (window_data != window_old)
            {
                ini_open("saves.ini")
                ini_write_string("Settings", "window_data", (((((((string(window_get_x()) + "|") + string(window_get_y())) + "|") + string(window_get_width())) + "|") + string(window_get_height())) + "|"))
                ini_close()
            }
        }
    }
}



if (menu!=60) and (instance_exists(obj_temp_build)){// Nope
    if (obj_temp_build.isnew=1) then menu=60;
    with(obj_shop){instance_destroy();}
    with(obj_managment_panel){instance_destroy();}
    with(obj_drop_select){instance_destroy();}
    with(obj_star_select){instance_destroy();}
    with(obj_fleet_select){instance_destroy();}
}

if (menu=0) and (instance_exists(obj_temp_build)){// Return to star selection
    // obj_controller.selected=obj_temp_build.target;
    // obj_controller.sel_owner=obj_temp_build.target.owner;
    obj_controller.selecting_planet=obj_temp_build.planet;
    // Pass variables to obj_controller.temp[t]=""; here
    instance_create(obj_temp_build.x,obj_temp_build.y,obj_star_select);
    // obj_star_select.owner=obj_controller.sel_owner;
    // obj_star_select.target=obj_controller.selected;
    obj_star_select.loading_name=obj_controller.selected.name;
    popup=3;
    with(obj_temp_build){instance_destroy();}
}
if (menu!=60) and (instance_exists(obj_temp_build)){// REMOVE
    with(obj_temp_build){instance_destroy();}
}



if (text_selected!="") and (text_selected!="none") then text_bar+=1;
if (text_bar>60) then text_bar=1;


if (obj_controller.disposition[4]<=20) or (obj_controller.loyalty<=33) and (demanding=0) then demanding=1;
if (obj_controller.disposition[4]>20) and (obj_controller.loyalty>33) and (demanding=1) then demanding=0;




if ((menu=0) and (formating=0)) or (instance_exists(obj_fleet)){
    var spd, keyb;spd=12;keyb="";
    if ((!instance_exists(obj_ingame_menu)) and (!instance_exists(obj_ncombat))) or (instance_exists(obj_fleet)){
        if ((keyboard_check(vk_left)) or (mouse_x<=__view_get( e__VW.XView, 0 )+2) or (keyboard_check(ord("A")))) and (x>800) then x-=spd;
        if ((keyboard_check(vk_right)) or (mouse_x>=__view_get( e__VW.XView, 0 )+1598) or (keyboard_check(ord("D")))) and (x<(room_width-800)) then x+=spd;
        if ((keyboard_check(vk_up)) or (mouse_y<=__view_get( e__VW.YView, 0 )+2) or (keyboard_check(ord("W")))) and (y>450) then y-=spd;
        if ((keyboard_check(vk_down)) or (mouse_y>=__view_get( e__VW.YView, 0 )+898) or (keyboard_check(ord("S")))) and (y<(room_height-450)) then y+=spd;
    }
}

if (x<800) then x=800;
if (y<450) then y=450;
if (x>(room_width-800)) then x=room_width-800;
if (y>(room_height-450)) then y=room_height-450;



if (is_test_map=true) then with(obj_en_fleet){
    if (owner=2){
        /*owner=10;
        sprite_index=spr_fleet_chaos;
        orbiting=0;*/
        capital_number=0;
        frigate_number=1;
        escort_number=2;
    }
}









var freq;freq=150;

if (l_options>0) then l_options+=1;if (l_options>105) then l_options=0;if (l_options=0) and (floor(random(freq))=3) then l_options=1;
if (l_menu>0) then l_menu+=1;if (l_menu>105) then l_menu=0;if (l_menu=0) and (floor(random(freq))=3) then l_menu=1;

if (l_manage>0) then l_manage+=1;if (l_manage>141) then l_manage=0;if (l_manage=0) and (floor(random(freq))=3) then l_manage=1;
if (l_settings>0) then l_settings+=1;if (l_settings>141) then l_settings=0;if (l_settings=0) and (floor(random(freq))=3) then l_settings=1;

if (l_apothecarium>0) then l_apothecarium+=1;if (l_apothecarium>113) then l_apothecarium=0;if (l_apothecarium=0) and (floor(random(freq))=3) then l_apothecarium=1;
if (l_reclusium>0) then l_reclusium+=1;if (l_reclusium>113) then l_reclusium=0;if (l_reclusium=0) and (floor(random(freq))=3) then l_reclusium=1;
if (l_librarium>0) then l_librarium+=1;if (l_librarium>113) then l_librarium=0;if (l_librarium=0) and (floor(random(freq))=3) then l_librarium=1;
if (l_armoury>0) then l_armoury+=1;if (l_armoury>113) then l_armoury=0;if (l_armoury=0) and (floor(random(freq))=3) then l_armoury=1;
if (l_recruitment>0) then l_recruitment+=1;if (l_recruitment>113) then l_recruitment=0;if (l_recruitment=0) and (floor(random(freq))=3) then l_recruitment=1;
if (l_fleet>0) then l_fleet+=1;if (l_fleet>113) then l_fleet=0;if (l_fleet=0) and (floor(random(freq))=3) then l_fleet=1;

if (l_diplomacy>0) then l_diplomacy+=1;if (l_diplomacy>141) then l_diplomacy=0;if (l_diplomacy=0) and (floor(random(freq))=3) then l_diplomacy=1;
if (l_log>0) then l_log+=1;if (l_log>141) then l_log=0;if (l_log=0) and (floor(random(freq))=3) then l_log=1;
if (l_turn>0) then l_turn+=1;if (l_turn>141) then l_turn=0;if (l_turn=0) and (floor(random(freq))=3) then l_turn=1;

if (new_buttons_hide=1) and (y_slide<43){if (y_slide<43) then y_slide+=2;if (new_buttons_frame<24) then new_buttons_frame+=1;}
if (new_buttons_hide=0) and (y_slide>0){if (y_slide>0) then y_slide-=2;if (new_buttons_frame>0) then new_buttons_frame-=1;}
if (new_buttons_hide=1) and (y_slide<43){if (y_slide<43) then y_slide+=2;if (new_buttons_frame<24) then new_buttons_frame+=1;}
if (new_buttons_hide=0) and (y_slide>0){if (y_slide>0) then y_slide-=2;if (new_buttons_frame>0) then new_buttons_frame-=1;}

if ((new_buttons_hide+hide_banner>0)) and (new_banner_x<161) then new_banner_x+=(161/11);
if ((new_buttons_hide+hide_banner=0)) and (new_banner_x>0) then new_banner_x-=(161/11);

if (y_slide<0) then y_slide=0;
if (new_banner_x<0) then new_banner_x=0;
if (y_slide>0) then new_button_highlight="";

var high;high="";
if (new_buttons_hide=0) and (y_slide<=0) and (!instance_exists(obj_ingame_menu)){
    var bx,by,wid,hei,but,stop;
    wid=0;hei=0;but=0;bx=0;by=0;stop=0;
    
    but=4;bx=1374;by=8;wid=108;hei=42;
    if (mouse_y>=__view_get( e__VW.YView, 0 )+by) and (mouse_y<=__view_get( e__VW.YView, 0 )+by+hei){
        if (mouse_x>=__view_get( e__VW.XView, 0 )+bx) and (mouse_x<=__view_get( e__VW.XView, 0 )+bx+wid){
            if (mouse_x>=__view_get( e__VW.XView, 0 )+bx+108){
                var dif1,dif2;dif1=mouse_x-(__view_get( e__VW.XView, 0 )+bx+108);dif2=dif1*2;
                if (mouse_y<__view_get( e__VW.YView, 0 )+by+hei-dif2) then stop=1;
            }
            if (stop=0) then high="options";
        }
    }
    but=4;bx=1484;by=8;wid=108;hei=42;
    if (mouse_y>=__view_get( e__VW.YView, 0 )+by) and (mouse_y<=__view_get( e__VW.YView, 0 )+by+hei){
        if (mouse_x>=__view_get( e__VW.XView, 0 )+bx) and (mouse_x<=__view_get( e__VW.XView, 0 )+bx+wid){
            if (mouse_x>=__view_get( e__VW.XView, 0 )+bx+108){
                var dif1,dif2;dif1=mouse_x-(__view_get( e__VW.XView, 0 )+bx+108);dif2=dif1*2;
                if (mouse_y<__view_get( e__VW.YView, 0 )+by+hei-dif2) then stop=1;
            }
            if (stop=0) then high="menu";
        }
    }
    
    
    but=1;bx=34;by=838;wid=142;hei=43;
    if (mouse_y>=__view_get( e__VW.YView, 0 )+by) and (mouse_y<=__view_get( e__VW.YView, 0 )+by+hei){
        if (mouse_x>=__view_get( e__VW.XView, 0 )+bx) and (mouse_x<=__view_get( e__VW.XView, 0 )+bx+wid){
            if (mouse_x>=__view_get( e__VW.XView, 0 )+bx+134){
                var dif1,dif2;dif1=mouse_x-(__view_get( e__VW.XView, 0 )+bx+134);dif2=dif1*1.25;
                if (mouse_y<__view_get( e__VW.YView, 0 )+by+dif2) then stop=1;
            }
            if (stop=0) then high="manage";
        }
    }
    but=1;bx=179;by=838;wid=142;hei=43;
    if (mouse_y>=__view_get( e__VW.YView, 0 )+by) and (mouse_y<=__view_get( e__VW.YView, 0 )+by+hei){
        if (mouse_x>=__view_get( e__VW.XView, 0 )+bx) and (mouse_x<=__view_get( e__VW.XView, 0 )+bx+wid){
            if (mouse_x>=__view_get( e__VW.XView, 0 )+bx+134){
                var dif1,dif2;dif1=mouse_x-(__view_get( e__VW.XView, 0 )+bx+134);dif2=dif1*1.25;
                if (mouse_y<__view_get( e__VW.YView, 0 )+by+dif2) then stop=1;
            }
            if (stop=0) then high="settings";
        }
    }
    
    but=1;bx=1130;by=838;wid=142;hei=43;
    if (mouse_y>=__view_get( e__VW.YView, 0 )+by) and (mouse_y<=__view_get( e__VW.YView, 0 )+by+hei){
        if (mouse_x>=__view_get( e__VW.XView, 0 )+bx) and (mouse_x<=__view_get( e__VW.XView, 0 )+bx+wid){
            if (mouse_x>=__view_get( e__VW.XView, 0 )+bx+134){
                var dif1,dif2;dif1=mouse_x-(__view_get( e__VW.XView, 0 )+bx+134);dif2=dif1*1.25;
                if (mouse_y<__view_get( e__VW.YView, 0 )+by+dif2) then stop=1;
            }
            if (stop=0) then high="diplomacy";
        }
    }
    but=1;bx=1275;by=838;wid=142;hei=43;
    if (mouse_y>=__view_get( e__VW.YView, 0 )+by) and (mouse_y<=__view_get( e__VW.YView, 0 )+by+hei){
        if (mouse_x>=__view_get( e__VW.XView, 0 )+bx) and (mouse_x<=__view_get( e__VW.XView, 0 )+bx+wid){
            if (mouse_x>=__view_get( e__VW.XView, 0 )+bx+134){
                var dif1,dif2;dif1=mouse_x-(__view_get( e__VW.XView, 0 )+bx+134);dif2=dif1*1.25;
                if (mouse_y<__view_get( e__VW.YView, 0 )+by+dif2) then stop=1;
            }
            if (stop=0) then high="log";
        }
    }
    but=2;bx=1420;by=838;wid=142;hei=43;
    if (mouse_y>=__view_get( e__VW.YView, 0 )+by) and (mouse_y<=__view_get( e__VW.YView, 0 )+by+hei){
        if (mouse_x>=__view_get( e__VW.XView, 0 )+bx) and (mouse_x<=__view_get( e__VW.XView, 0 )+bx+wid){
            if (mouse_x>=__view_get( e__VW.XView, 0 )+bx+134){
                var dif1,dif2;dif1=mouse_x-(__view_get( e__VW.XView, 0 )+bx+134);dif2=dif1*1.25;
                if (mouse_y<__view_get( e__VW.YView, 0 )+by+dif2) then stop=1;
            }
            if (stop=0) then high="turn";
        }
    }
    
    
    but=3;bx=357;by=838;wid=115;hei=43;
    if (mouse_y>=__view_get( e__VW.YView, 0 )+by) and (mouse_y<=__view_get( e__VW.YView, 0 )+by+hei){
        if (mouse_x>=__view_get( e__VW.XView, 0 )+bx) and (mouse_x<=__view_get( e__VW.XView, 0 )+bx+wid){
            if (mouse_x>=__view_get( e__VW.XView, 0 )+bx+108){
                var dif1,dif2;dif1=mouse_x-(__view_get( e__VW.XView, 0 )+bx+108);dif2=dif1*2;
                if (mouse_y<__view_get( e__VW.YView, 0 )+by+dif2) then stop=1;
            }
            if (stop=0) then high="apoth";
        }
    }
    but=3;bx=473;by=838;wid=115;hei=43;
    if (mouse_y>=__view_get( e__VW.YView, 0 )+by) and (mouse_y<=__view_get( e__VW.YView, 0 )+by+hei){
        if (mouse_x>=__view_get( e__VW.XView, 0 )+bx) and (mouse_x<=__view_get( e__VW.XView, 0 )+bx+wid){
            if (mouse_x>=__view_get( e__VW.XView, 0 )+bx+108){
                var dif1,dif2;dif1=mouse_x-(__view_get( e__VW.XView, 0 )+bx+108);dif2=dif1*2;
                if (mouse_y<__view_get( e__VW.YView, 0 )+by+dif2) then stop=1;
            }
            if (stop=0) then high="reclusium";
        }
    }
    but=3;bx=590;by=838;wid=115;hei=43;
    if (mouse_y>=__view_get( e__VW.YView, 0 )+by) and (mouse_y<=__view_get( e__VW.YView, 0 )+by+hei){
        if (mouse_x>=__view_get( e__VW.XView, 0 )+bx) and (mouse_x<=__view_get( e__VW.XView, 0 )+bx+wid){
            if (mouse_x>=__view_get( e__VW.XView, 0 )+bx+108){
                var dif1,dif2;dif1=mouse_x-(__view_get( e__VW.XView, 0 )+bx+108);dif2=dif1*2;
                if (mouse_y<__view_get( e__VW.YView, 0 )+by+dif2) then stop=1;
            }
            if (stop=0) then high="librarium";
        }
    }
    but=3;bx=706;by=838;wid=115;hei=43;
    if (mouse_y>=__view_get( e__VW.YView, 0 )+by) and (mouse_y<=__view_get( e__VW.YView, 0 )+by+hei){
        if (mouse_x>=__view_get( e__VW.XView, 0 )+bx) and (mouse_x<=__view_get( e__VW.XView, 0 )+bx+wid){
            if (mouse_x>=__view_get( e__VW.XView, 0 )+bx+108){
                var dif1,dif2;dif1=mouse_x-(__view_get( e__VW.XView, 0 )+bx+108);dif2=dif1*2;
                if (mouse_y<__view_get( e__VW.YView, 0 )+by+dif2) then stop=1;
            }
            if (stop=0) then high="armoury";
        }
    }
    but=3;bx=822;by=838;wid=115;hei=43;
    if (mouse_y>=__view_get( e__VW.YView, 0 )+by) and (mouse_y<=__view_get( e__VW.YView, 0 )+by+hei){
        if (mouse_x>=__view_get( e__VW.XView, 0 )+bx) and (mouse_x<=__view_get( e__VW.XView, 0 )+bx+wid){
            if (mouse_x>=__view_get( e__VW.XView, 0 )+bx+108){
                var dif1,dif2;dif1=mouse_x-(__view_get( e__VW.XView, 0 )+bx+108);dif2=dif1*2;
                if (mouse_y<__view_get( e__VW.YView, 0 )+by+dif2) then stop=1;
            }
            if (stop=0) then high="recruitment";
        }
    }
    but=3;bx=938;by=838;wid=115;hei=43;
    if (mouse_y>=__view_get( e__VW.YView, 0 )+by) and (mouse_y<=__view_get( e__VW.YView, 0 )+by+hei){
        if (mouse_x>=__view_get( e__VW.XView, 0 )+bx) and (mouse_x<=__view_get( e__VW.XView, 0 )+bx+wid){
            if (mouse_x>=__view_get( e__VW.XView, 0 )+bx+108){
                var dif1,dif2;dif1=mouse_x-(__view_get( e__VW.XView, 0 )+bx+108);dif2=dif1*2;
                if (mouse_y<__view_get( e__VW.YView, 0 )+by+dif2) then stop=1;
            }
            if (stop=0) then high="fleet";
        }
    }
    
    new_button_highlight=high;
}

if (high="options") and (h_options<0.5) and (new_buttons_hide=0) and (y_slide<=0) then h_options+=0.02;
if ((high!="options") or (new_buttons_hide=1)) and (h_options>0) then h_options-=0.04;

if (high="menu") and (h_menu<0.5) and (new_buttons_hide=0) and (y_slide<=0) then h_menu+=0.02;
if ((high!="menu") or (new_buttons_hide=1)) and (h_menu>0) then h_menu-=0.04;



if (high="manage") and (h_manage<0.5) and (new_buttons_hide=0) and (y_slide<=0) then h_manage+=0.02;
if ((high!="manage") or (new_buttons_hide=1)) and (h_manage>0) then h_manage-=0.04;

if (high="settings") and (h_settings<0.5) and (new_buttons_hide=0) and (y_slide<=0) then h_settings+=0.02;
if ((high!="settings") or (new_buttons_hide=1)) and (h_settings>0) then h_settings-=0.04;

if (high="diplomacy") and (h_diplomacy<0.5) and (new_buttons_hide=0) and (y_slide<=0) then h_diplomacy+=0.02;
if ((high!="diplomacy") or (new_buttons_hide=1)) and (h_diplomacy>0) then h_diplomacy-=0.04;

if (high="log") and (h_log<0.5) and (new_buttons_hide=0) and (y_slide<=0) then h_log+=0.02;
if ((high!="log") or (new_buttons_hide=1)) and (h_log>0) then h_log-=0.04;

if (high="turn") and (h_turn<0.5) and (new_buttons_hide=0) and (y_slide<=0) then h_turn+=0.02;
if ((high!="turn") or (new_buttons_hide=1)) and (h_turn>0) then h_turn-=0.04;




if (high="apoth") and (h_apothecarium<0.5) and (new_buttons_hide=0) and (y_slide<=0) then h_apothecarium+=0.02;
if ((high!="apoth") or (new_buttons_hide=1)) and (h_apothecarium>0) then h_apothecarium-=0.04;

if (high="reclusium") and (h_reclusium<0.5) and (new_buttons_hide=0) and (y_slide<=0) then h_reclusium+=0.02;
if ((high!="reclusium") or (new_buttons_hide=1)) and (h_reclusium>0) then h_reclusium-=0.04;

if (high="librarium") and (h_librarium<0.5) and (new_buttons_hide=0) and (y_slide<=0) then h_librarium+=0.02;
if ((high!="librarium") or (new_buttons_hide=1)) and (h_librarium>0) then h_librarium-=0.04;

if (high="armoury") and (h_armoury<0.5) and (new_buttons_hide=0) and (y_slide<=0) then h_armoury+=0.02;
if ((high!="armoury") or (new_buttons_hide=1)) and (h_armoury>0) then h_armoury-=0.04;

if (high="recruitment") and (h_recruitment<0.5) and (new_buttons_hide=0) and (y_slide<=0) then h_recruitment+=0.02;
if ((high!="recruitment") or (new_buttons_hide=1)) and (h_recruitment>0) then h_recruitment-=0.04;

if (high="fleet") and (h_fleet<0.5) and (new_buttons_hide=0) and (y_slide<=0) then h_fleet+=0.02;
if ((high!="fleet") or (new_buttons_hide=1)) and (h_fleet>0) then h_fleet-=0.04;



if (menu=14) and (!instance_exists(obj_shop)) then instance_create(0,0,obj_shop);
if (menu!=14) and (instance_exists(obj_shop)) then with(obj_shop){instance_destroy();}



if (instance_exists(obj_ingame_menu)) or (instance_exists(obj_saveload)) then exit;




if (menu=1) and (managing>0){
    var xx, yy, bb;bb="";
    xx=__view_get( e__VW.XView, 0 )+0;
    yy=__view_get( e__VW.YView, 0 )+0;


    var c,fx;c=0;fx="";
    if (managing<=10) then c=managing;
    if (managing>20) then c=managing-10;
    

    var top,sel,temp1,temp2,temp3,temp4,temp5,force_tool,unit;
    temp1="";temp2="";temp3="";temp4="";temp5="";force_tool=0;
    top=man_current;
    sel=top;
    
    
    yy+=77;
    
    repeat(min(man_max,man_see)){
        force_tool=0;
		if (man[sel]="man"){
			unit = display_unit[sel];
			if (temp[101] == $"{unit.role()} {unit.name}")
	        and ((temp[102]!=unit.armour()) or (temp[104]!=unit.gear()) or (temp[106]=unit.mobility_item()) or (temp[108]!=unit.weapon_one()) or (temp[110]!=unit.weapon_one())
	        or (temp[114]="refresh")) then force_tool=1;
		}
        
        
        if (mouse_x>=xx+25) and (mouse_y>=yy+64) and (mouse_x<xx+974) and (mouse_y<yy+85)
        or (force_tool=1)
        /*and ((temp[101]!=string(ma_role[sel])+" "+string(ma_name[sel])) or (temp[104]!=ma_gear[sel]) or (temp[106]!=ma_mobi[sel]))*/{
            var ach,damage_res,melee_attack,ranged_attack,acy;damage_res=1;ach=0;acy=0;
            
            
            //if marine not hidden
            if (man[sel]="man"){
				melee_attack=unit.melee_attack();
				ranged_attack = unit.ranged_attack();
                marine_armour[0]=unit.armour();fix_left=0;fix_right=0;
                
                var cah;cah=managing;if (cah>10) then cah=0;
                temp[100]="1";if (obj_ini.race[cah,ide[sel]]!=1) then temp[100]=string(obj_ini.race[cah,ide[sel]]);
				 temp[120] = unit; // unit_struct
                
                
                damage_res= unit.damage_resistance();
                
                if (ma_gear[sel]="Rosarius") then damage_res+=0.33;
                if (ma_gear[sel]="Iron Halo"){damage_res+=0.33;ach+=20;}
                if (ma_mobi[sel]="Jump Pack"){damage_res+=0.1;}
                if (ma_mobi[sel]="Bike") then ach+=25;
                if (ma_wep1[sel]="Boarding Shield"){ach+=20;acy+=4;}
                if (ma_wep2[sel]="Boarding Shield"){ach+=20;acy+=4;}
                if (ma_wep1[sel]="Storm Shield"){ach+=30;acy+=8;}
                if (ma_wep2[sel]="Storm Shield"){ach+=30;acy+=8;}
                if (ma_armour[sel]="MK3 Iron Armour") then ranged_attack-=0.1;
                if (ma_armour[sel]="MK4 Maximus"){ranged_attack+=0.05;melee_attack+=0.05;}
                if (ma_armour[sel]="MK5 Heresy"){melee_attack+=0.2;ranged_attack-=0.05;}  // heresy should be lower damage resistance, lowered ap for now so it's easier for players to digest
                if (ma_armour[sel]="MK6 Corvus"){ranged_attack+=0.1;}
                if (string_count("Artificer",ma_armour[sel])>0){melee_attack+=0.1;}
                if (string_count("Terminator",ma_armour[sel])>0){ranged_attack-=0.1;melee_attack+=0.2;}
                if (ma_armour[sel]="Tartaros"){ranged_attack-=0.05;melee_attack+=0.2;}
				
                var j,jj;j=0;jj=0;
                
                //if (ui_melee_penalty>0){melee_attack=melee_attack*0.5; ranged_attack=ranged_attack*0.75;}
               // if (ui_ranged_penalty>0){ranged_attack=ranged_attack*0.5; melee_attack=melee_attack*0.75;}
                
                ui_specialist=0;ui_coloring="";
                if (ma_role[sel]="Chapter Master") then ui_specialist=111;
                if (ma_role[sel]=obj_ini.role[100,2]) then ui_specialist=14;// Honor Guard
                if (ma_role[sel]=obj_ini.role[100,14]) or (ma_role[sel]=string(obj_ini.role[100,14])+" Aspirant") or (ma_role[sel]="Master of Sanctity") then ui_specialist=1;// Chaplain
                if (ma_role[sel]=obj_ini.role[100,15]) or (ma_role[sel]=string(obj_ini.role[100,15])+" Aspirant") or (ma_role[sel]="Master of the Apothecarion") then ui_specialist=3;// Apothecary
                if (ma_role[sel]=obj_ini.role[100,16]) or (ma_role[sel]=string(obj_ini.role[100,16])+" Aspirant") or (ma_role[sel]="Forge Master") then ui_specialist=5;// Techmarine
                if (ma_role[sel]=obj_ini.role[100,17]) or (ma_role[sel]=string(obj_ini.role[100,17])+" Aspirant") or (ma_role[sel]="Chief "+string(obj_ini.role[100,17])) then ui_specialist=7;// Librarian
                if (ma_role[sel]="Death Company") then ui_specialist=15;// Death Company
                
                if (global.chapter_name="Dark Angels"){
                    if (ma_role[sel]=obj_ini.role[100,4]) then ui_coloring="bone";
                    if (managing=1){
                        if ((string_count("Terminator",ma_armour[sel])>0) or (ma_armour[sel]="Tartaros")){
                            if (ma_role[sel]=obj_ini.role[100,5]) then ui_coloring="bone";
                            if (ma_role[sel]=obj_ini.role[100,7]) then ui_coloring="bone";
                            if (ma_role[sel]="Standard Bearer") then ui_coloring="bone";
                        }
                    }
                }
                if ((ui_specialist=14) or (ma_role[sel]="Chapter Master")) and (global.chapter_name="Blood Angels") then ui_coloring="gold";
                
                
                temp[101]=string(ma_role[sel])+" "+string(ma_name[sel]);
                
                temp[102]=ma_armour[sel];temp[103]="";
                if (string_count("&",temp[102])>0) then temp[102]=clean_tags(temp[102]);
                tooltip="";tooltip_weapon=0;tooltip_stat1=0;tooltip_stat2=0;tooltip_stat3=0;tooltip_stat4=0;tooltip_other="";
                tooltip=scr_weapon(ma_armour[sel],"",true,0,false,"","description");
                
                if (acy=0){
                    if (tooltip_other="") then temp[103]="("+string(tooltip_stat1)+"AC)";
                    if (tooltip_other!="") then temp[103]="("+string(tooltip_stat1)+"AC, "+string(tooltip_other)+")";
                }
                if (acy>0){
                    if (tooltip_other="") then temp[103]="("+string(tooltip_stat1)+"+"+string(acy)+"AC)";
                    if (tooltip_other!="") then temp[103]="("+string(tooltip_stat1)+"+"+string(acy)+"AC, "+string(tooltip_other)+")";
                }
                
                temp[104]=ma_gear[sel];temp[105]="";
                if (string_count("&",temp[104])>0) then temp[104]=clean_tags(temp[104]);
                tooltip="";tooltip_weapon=0;tooltip_stat1=0;tooltip_stat2=0;tooltip_stat3=0;tooltip_stat4=0;tooltip_other="";
                tooltip=scr_weapon(ma_gear[sel],"",true,0,false,"","description");
                temp[105]="("+string(tooltip_other)+")";
                
                temp[106]=ma_mobi[sel];temp[107]="";
                if (string_count("&",temp[106])>0) then temp[106]=clean_tags(temp[106]);
                tooltip="";tooltip_weapon=0;tooltip_stat1=0;tooltip_stat2=0;tooltip_stat3=0;tooltip_stat4=0;tooltip_other="";
                tooltip=scr_weapon(ma_mobi[sel],"",true,0,false,"","description");
                temp[107]="("+string(tooltip_other)+")";
                
                var is_a_dread;is_a_dread=false;
                if (string_count("Dread",temp[102])>0) then is_a_dread=true;
                
                temp[108]=ma_wep1[sel];temp[109]="";
                if (string_count("&",temp[108])>0) then temp[108]=clean_tags(temp[108]);
                tooltip="";tooltip_weapon=0;tooltip_stat1=0;tooltip_stat2=0;tooltip_stat3=0;tooltip_stat4=0;tooltip_other="";
                if (is_a_dread=false) then tooltip=scr_weapon(ma_wep1[sel],ma_wep2[sel],true,0,false,"","description");
                if (is_a_dread=true) then tooltip=scr_weapon(ma_wep1[sel],ma_wep2[sel],true,0,true,"","description");
                // temp[109]="("+string(tooltip_stat1)+"DAM, "+string(tooltip_stat2)+"AP, "+string(tooltip_other)+")";
                temp[109]="("+string(tooltip_stat1)+"DAM, "+string(tooltip_other)+")";
                // if (tooltip_stat4=0) then temp[109]="("+string(tooltip_stat1)+"DAM, "+string(tooltip_stat2)+"AP, "+string(tooltip_other)+")";
                // if (tooltip_stat4>0) then temp[109]="("+string(tooltip_stat1)+"DAM, "+string(tooltip_stat2)+"AP, "+string(tooltip_stat4)+" ammo, "+string(tooltip_other)+")";
                if (tooltip_stat4=0) then temp[109]="("+string(tooltip_stat1)+"DAM, "+string(tooltip_other)+")";
                if (tooltip_stat4>0) then temp[109]="("+string(tooltip_stat1)+"DAM, "+string(tooltip_stat4)+" ammo, "+string(tooltip_other)+")";
                
                temp[110]=ma_wep2[sel];temp[111]="";
                if (string_count("&",temp[110])>0) then temp[110]=clean_tags(temp[110]);
                tooltip="";tooltip_weapon=0;tooltip_stat1=0;tooltip_stat2=0;tooltip_stat3=0;tooltip_stat4=0;tooltip_other="";
                if (is_a_dread=false) then tooltip=scr_weapon(ma_wep2[sel],ma_wep1[sel],true,0,false,"","description");
                if (is_a_dread=true) then tooltip=scr_weapon(ma_wep2[sel],ma_wep1[sel],true,0,true,"","description");
                // temp[111]="("+string(tooltip_stat1)+"DAM, "+string(tooltip_stat2)+"AP, "+string(tooltip_other)+")";
                temp[111]="("+string(tooltip_stat1)+"DAM, "+string(tooltip_other)+")";
                // if (tooltip_stat4=0) then temp[111]="("+string(tooltip_stat1)+"DAM, "+string(tooltip_stat2)+"AP, "+string(tooltip_other)+")";
                // if (tooltip_stat4>0) then temp[111]="("+string(tooltip_stat1)+"DAM, "+string(tooltip_stat2)+"AP, "+string(tooltip_stat4)+" ammo, "+string(tooltip_other)+")";
                if (tooltip_stat4=0) then temp[111]="("+string(tooltip_stat1)+"DAM, "+string(tooltip_other)+")";
                if (tooltip_stat4>0) then temp[111]="("+string(tooltip_stat1)+"DAM, "+string(tooltip_stat4)+" ammo, "+string(tooltip_other)+")";
                
                
                temp[112]=$"{display_unit[sel].hp()}/{display_unit[sel].max_health()}"
                
                temp[113]=string(floor(ma_exp[sel]));
                
                var b1,b2;b1=0;b2=0;
                if (ma_bio[sel]<=3){
                    b1=string_to_integer(ma_name[sel]);
                    if (floor(b1/2)!=(b1/2)) then b2=(10.43*ma_bio[sel])-5;
                    if (floor(b1/2)=(b1/2)) then b2=(10.43*ma_bio[sel]);
                }
                if (ma_bio[sel]>3) then b2=(10.43*ma_bio[sel])-5;
                temp[114]=string(unit.bionics())+" ("+string(round(max(0,b2)))+"%)";// Bionics
                
                var cah;cah=managing;if (cah>10) then cah=0;
                temp[119]="";// Notes
                if (string_length(obj_ini.spe[cah,ide[sel]])>0){
                    if (string_count("$",obj_ini.spe[cah,ide[sel]])>0) then temp[119]="Born Leader Bonus";
                    if (string_count("@",obj_ini.spe[cah,ide[sel]])>0){
                        temp[119]="Champion Bonus";
                        melee_attack=melee_attack*1.15;ranged_attack=ranged_attack*1.15;
                    }
                    if (string_count("0",obj_ini.spe[cah,ide[sel]])>0){
                        temp[119]="PSYKER ("+string_upper(string(obj_ini.psy_powers))+"): ";
                        temp[119]+=string(string_count("|",obj_ini.spe[cah,ide[sel]]));
                        temp[119]+=" Powers known.";
                    }
                }
                
                if (obj_controller.chaos_rating>0) and (temp[119]!="") then temp[119]+="#"+string(max(0,obj_ini.chaos[cah,ide[sel]]))+"% Corruption.";
                if (obj_controller.chaos_rating>0) and (temp[119]="") then temp[119]=string(max(0,obj_ini.chaos[cah,ide[sel]]))+"% Corruption.";
                
                temp[116]=$"{floor(melee_attack*100)}%";// Melee Attack
                temp[117]=$"{floor(ranged_attack*100)}%";// Ranged Attack
                
                
                // mitigation=1-(((1-damage_res)*0.8)+0.1);
                // mitigation=round(mitigation*100);
                
                // temp[118]=string(max(113,round(100-(damage_res*100))))+"%#dm: "+string(min(95,mitigation))+"%";// Damage Resistance
                temp[118]=string(min(75,round(damage_res*100)))+"%";// Damage Resistance
                
            }
            if (man[sel]="vehicle"){
                
            }
        }
        
        
        draw_set_color(38144);draw_rectangle(xx+25,yy+64,xx+974,yy+85,1);
        
        yy+=20;
        
        sel+=1;
        
    }
}























if (global.load>0) then exit;
if (menu=0) then otha=0;

if (cooldown>=0) and (cooldown<9000) then cooldown-=1;
if (click>0){click=-1;audio_play_sound(snd_click,-80,0);audio_sound_gain(snd_click,0.25*master_volume*effect_volume,0);}
if (click2>0){click2=-1;audio_play_sound(snd_click_small,-80,0);audio_sound_gain(snd_click_small,0.25*master_volume*effect_volume,0);}
if (qsfx=1){qsfx=0;scr_quest(0,"artifact_return",4,turn=1);}

/*if (diplomacy>0) and (trading=0) and (trading_artifact=0) and (faction_justmet=1){
    diplo_option[1]="";diplo_option2="";diplo_option3="";
}*/
if (diplomacy=0) then trading_artifact=0;

// 135; 
if (trading_artifact=0) and (trading=0) and (trading_artifact=0) and (faction_justmet=1) and (questing=0) and (trading_demand=0) and (complex_event=false){
    var h;h=0;repeat(4){h+=1;obj_controller.diplo_option[h]="";obj_controller.diplo_goto[h]="";}
}

income=income_base+income_home+income_forge+income_agri+income_recruiting+income_training+income_fleet+income_trade+income_tribute;

// if ((menu>58) or (menu<55)) and (instance_exists(obj_shop)) then with(obj_shop){instance_destroy();}

if (menu=20) and ((diplomacy>0) or ((diplomacy<-5) and (diplomacy>-6))){
    if (string_length(diplo_txt)<string_length(diplo_text)){
        diplo_char+=2;
        diplo_txt=string_copy(diplo_text,0,diplo_char);
    }
    if (diplo_alpha<1) then diplo_alpha+=0.05;
}

if (instance_exists(obj_popup)){
    if (obj_popup.type=99) then fleet_minimized=1;
}


if (menu=0) and (repair_ships>0) and (instance_number(obj_turn_end)=0) and (instance_number(obj_popup)=0){
    repair_ships=0;
    
    var pip;
    pip=instance_create(0,0,obj_popup);
    pip.title="Ships Repaired";
    pip.text="In accordance with the Imperial Repair License, all "+string(obj_ini.chapter_name)+" ships orbiting friendly planets have been repaired. Note that repaired ships, and their fleets, are unable to act further this turn.";
    pip.image="shipyard";
    pip.cooldown=15;
    
    with(obj_p_fleet){
        if (capital_health<100) and (capital_number>0) then acted=2;
        if (frigate_health<100) and (frigate_number>0) then acted=2;
        if (escort_health<100) and (escort_number>0) then acted=2;
    }
    
    var i;i=0;
    repeat(30){i+=1;
        if (obj_ini.ship_location[i]!="Warp") and (obj_ini.ship_location[i]!="Lost"){obj_ini.ship_hp[i]=obj_ini.ship_maxhp[i];}
    }
    
    // 135 ; need something here to veryify that the ships are within a friendly star system
}



// This unloads units from a ship
if (unload>0){
    cooldown=8;
    
    var q, b, manaj;q=0;b=0;manaj=managing;
    
    
    // 135 ; 
    b=selecting_ship;
    
    if (manaj>10) then manaj=0;
    
    
    
    // show_message(string(manaj)+"#"+string(sh_loc[b])+"|"+string(unload));
    
    repeat(500){q+=1;
        if (man[q]="man") and (ma_loc[q]=selecting_location) and (man_sel[q]!=0){
            if (b=0) then b=ma_lid[q];
            obj_ini.loc[manaj,ide[q]]=obj_ini.ship_location[b];
            obj_ini.lid[manaj,ide[q]]=0;
            obj_ini.wid[manaj,ide[q]]=unload;
            obj_ini.uid[manaj,ide[q]]=0;
            
            ma_loc[q]=obj_ini.ship_location[b];
            ma_lid[q]=0;
            ma_wid[q]=unload;
        }
        if (man[q]="vehicle") and (ma_loc[q]=selecting_location) and (man_sel[q]!=0){
            if (b=0) then b=ma_lid[q];
            obj_ini.veh_loc[manaj,ide[q]]=obj_ini.ship_location[b];
            obj_ini.veh_lid[manaj,ide[q]]=0;
            obj_ini.veh_wid[manaj,ide[q]]=unload;
            obj_ini.veh_uid[manaj,ide[q]]=0;
            
            ma_loc[q]=obj_ini.ship_location[b];
            ma_lid[q]=0;
            ma_wid[q]=unload;
        }
    }
            
    var i;i=-1;selecting_location="";
    repeat(501){i+=1;man_sel[i]=0;}
            
    obj_ini.ship_carrying[b]-=man_size;
    sh_cargo[b]-=man_size;
            
    cooldown=10;sel_loading=0;man_size=0;
    
    unload=0;with(obj_star_select){instance_destroy();}
}




if (managing>0) and (man_size=0) and ((selecting_location!="") or (selecting_types!="") or (selecting_planet!=0) or (selecting_ship!=0)){
    selecting_location="";selecting_types="";selecting_planet=0;selecting_ship=0;
}



if (marines<=0) and (alarm[7]=-1) and (!instance_exists(obj_fleet_controller)) and (!instance_exists(obj_ncombat)) then alarm[7]=15;

/* */
/*  */

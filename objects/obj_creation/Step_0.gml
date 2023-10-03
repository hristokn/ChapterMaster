// Chapters to choose from at creation
if (slide==2) and (scrollbar_engaged>0){
    var x1,x2,x3,x4,x5,x6,y1,y2,y3,y4,y5,y6,bs,see_size,total_max,current,top;
    x1=1111;y1=245;x2=1131;y2=671;bs=245;
    
    total_max=77+global.custom_icons;
    see_size=(671-245)/total_max;
    
    // bounds of the solid area
    x3=1111;x4=1131;
    current=icons_top;
    top=current*see_size;
    y3=top;y4=y3+(24*see_size)-see_size;
    
    y5=mouse_y-(scrollbar_engaged)-245;
    y6=round(y5/see_size/6)*6;
    
    icons_top=y6;
    if (icons_top<1) then icons_top=1;
    if (icons_top>(total_max-24)) then icons_top=total_max-24;   
}

if (slide==1){
    if (keyboard_string=="137"){
        highlight=18;
        cooldown=8000;
        chapter="Doom Benefactors";
        scr_chapter_new(chapter);
        keyboard_string="";
        if (chapter!="nopw_nopw"){
            icon=25;
            custom=0;
            change_slide=1;
            goto_slide=2;
            chapter_string=chapter;
        }
        scr_creation(2);
        scr_creation(3.5);
        scr_creation(4);
        scr_creation(5);
        scr_creation(6);
    }
}
// Play audio
if (slate5==1) or (slate6==1){
    if (master_volume>0) and (effect_volume>0){
        audio_play_sound(snd_buzz,0,0);
        audio_sound_gain(snd_buzz,1*master_volume*effect_volume,0);
    }
}


if (fade_in>0) then fade_in-=1;
if (fade_in<=0) and (slate1>0) then slate1-=1;
if (slate1<=0) and (slate2<20) then slate2+=1;
if (slate1<=0) and (slate3<20) then slate3+=1;

if (slate2>=7) and (slate4<30) then slate4+=1;

if (slate5>=1) and (slate5<=60) then slate5+=1;
if (slate5=61) then slate5=0;
if (slate6>=1) and (slate6<=60) then slate6+=1;
if (slate6=61) then slate6=0;

if (slate4>=30){
    if (floor(random(660))==5) and (slate5<=0) then slate5=1;
    if (floor(random(660))==6) and (slate6<=0) then slate6=1;
}

if (change_slide>0){change_slide+=1;}
if (change_slide>0){change_slide+=1;}
if (change_slide>=100) then change_slide=-1;
if (change_slide>=100) then change_slide=-1;
// Sets up a new chapter with default options
if (change_slide==35) or (change_slide==36) or (chapter=="Doom Benefactors") or (chapter_string=="Doom Benefactors"){
    if (goto_slide==1){
        mouse_left=0;
        mouse_right=0;
        highlight=0;
        highlighting=0;
        old_highlight=0;
        
        text_selected="none";
        text_bar=0;
        tooltip="";
        tooltip2="";
        popup="";
        temp=0;
        target_gear=0;
        tab=0;
        
        chapter="Unnamed";
        chapter_string="Unnamed";
        icon=1;
        icon_name="da";
        custom=0;
        founding=1;
        points=0;
        maxpoints=100;
        fleet_type=1;
        strength=5;
        cooperation=5;
        purity=5;
        stability=5;
        for(var i=0; i<6; i++){
            adv[i]="";
            adv_num[i]=0;
            dis[i]="";
            dis_num[i]=0;
        }
        homeworld="Temperate";
        homeworld_name=scr_star_name();
        recruiting="Death";
        recruiting_name=scr_star_name();
        flagship_name=scr_ship_name("imperial");
        recruiting_exists=1;
        homeworld_exists=1;homeworld_rule=1;
        aspirant_trial="Blood Duel";
        discipline="default";
        battle_cry="For the Emperor";
        main_color=1;
        secondary_color=1;
        trim_color=1;
        // Left/Right pauldron
        pauldron2_color=1;
        pauldron_color=1;
        lens_color=1;
        weapon_color=1;
        col_special=0;
        color_to_main="";
        color_to_secondary="";
        color_to_trim="";
        color_to_pauldron="";
        color_to_pauldron2="";
        color_to_lens="";
        color_to_weapon="";
        trim=1;
        hapothecary=scr_marine_name();
        hchaplain=scr_marine_name();
        clibrarian=scr_marine_name();
        fmaster=scr_marine_name();
        recruiter=scr_marine_name();
        admiral=scr_marine_name();
        equal_specialists=0;
        load_to_ships=[2,0,0];
        successors=0;
        mutations=0;
        mutations_selected=0;
        preomnor=0;
        voice=0;
        doomed=0;
        lyman=0;
        omophagea=0;
        ossmodula=0;
        membrane=0;
        zygote=0;
        betchers=0;
        catalepsean=0;
        secretions=0;
        occulobe=0;
        mucranoid=0;
        
        disposition[0]=0;
        disposition[1]=0;// Prog
        disposition[2]=0;// Imp
        disposition[3]=0;// Mech
        disposition[4]=0;// Inq
        disposition[5]=0;// Ecclesiarchy
        disposition[6]=0;// Astartes
        disposition[7]=0;// Reserved
        
        chapter_master_name=scr_marine_name();
        chapter_master_melee=1;
        chapter_master_ranged=1;
        chapter_master_specialty=2;
    }
    slide=goto_slide;
    slide_show=goto_slide;
}

if (text_selected!="") and (text_selected!="none") then text_bar+=1;
if (text_bar>60) then text_bar=1;

if (cooldown>0) and (cooldown<=5000) then cooldown-=1;
// Checks if the name already exists
if (custom==2){
    name_bad=0;
    if (chapter=="") then name_bad=1;
    if (chapter=="Dark Angels") then name_bad=1;
    if (chapter=="White Scars") then name_bad=1;
    if (chapter=="Space Wolves") then name_bad=1;
    if (chapter=="Imperial Fists") then name_bad=1;
    if (chapter=="Blood Angels") then name_bad=1;
    if (chapter=="Iron Hands") then name_bad=1;
    if (chapter=="Ultramarines") then name_bad=1;
    if (chapter=="Salamanders") then name_bad=1;
    if (chapter=="Raven Guard") then name_bad=1;
    if (chapter=="Blood Ravens") then name_bad=1;
    if (chapter=="Doom Benefactors") then name_bad=1;
	if (chapter=="Crimson Fists") then name_bad=1;
}
var good=0;
if (color_to_main!=""){
    good=0;
    for(var q=1; q<=30; q++){
        if (color_to_main=col[q]) and (good=0){
            good=q;
            color_to_main="";
            main_color=q;
        }
    }
}
if (color_to_secondary!=""){
    good=0;
    for(var q=1; q<=30; q++){
        if (color_to_secondary=col[q]) and (good=0){
            good=q;
            color_to_secondary="";
            secondary_color=q;
        }
    }
}
if (color_to_trim!=""){
    good=0;
    for(var q=1; q<=30; q++){
        if (color_to_trim=col[q]) and (good=0){
            good=q;
            color_to_trim="";
            trim_color=q;
        }
    }
}
if (color_to_pauldron!=""){
    good=0;
    for(var q=1; q<=30; q++){
        if (color_to_pauldron=col[q]) and (good=0){
            good=q;
            color_to_pauldron="";
            pauldron_color=q;
        }
    }
}
if (color_to_pauldron2!=""){
    good=0;
    for(var q=1; q<=30; q++){
        if (color_to_pauldron2=col[q]) and (good=0){
            good=q;
            color_to_pauldron2="";
            pauldron2_color=q;
        }
    }
}
if (color_to_lens!=""){
    good=0;
    for(var q=1; q<=30; q++){
        if (color_to_lens=col[q]) and (good=0){
            good=q;
            color_to_lens="";
            lens_color=q;
        }
    }
}
if (color_to_weapon!=""){
    good=0;
    for(var q=1; q<=30; q++){
        if (color_to_weapon=col[q]) and (good=0){
            good=q;
            color_to_weapon="";
            weapon_color=q;
        }
    }
}

// on left mouse release, if greater than 5000 and less than 9000, set cooldown to 0
// if >=9000 then don't decrease at all

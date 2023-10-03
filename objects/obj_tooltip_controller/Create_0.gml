#macro TOOLTIP_DECAY round(game_get_speed(gamespeed_fps) * 0.4)
#macro TOOLTIP_SELECT round(game_get_speed(gamespeed_fps) * 0.4)
#macro TOOLTIP_LOCK round(game_get_speed(gamespeed_fps) * 3)

tooltips = [];

add_tooltip = function(x1, y1, x2, y2, name) {
	var tooltip = new self.tooltip(x1,y1,x2,y2,name);		
	var index = self.tooltip_index(tooltip);
	if(index == -1) {
		array_push(self.tooltips, tooltip);	
	}
	else {
		self.tooltips[index].decay_timer = TOOLTIP_DECAY;
	}
}

tooltip_index = function(tooltip) {
	var size = array_length(self.tooltips);
	for (var i = 0; i < size; i++) {
		if(self.tooltips[i].equals(tooltip)) {
			return i
		}
	}
	return -1;
	//var index = array_find_index(tooltips, self.tooltip.equals(tooltip));
}

tooltip = function(_x1, _y1, _x2, _y2, _name) constructor {
	x1 = _x1;
	y1 = _y1;
	x2 = _x2;
	y2 = _y2;
	name = _name;
	decay_timer = TOOLTIP_DECAY; // when it reaches 0, remove it
	
	select_timer = TOOLTIP_SELECT; // when it reaches 0, create a text box
	displayed = false;
	locked = false;
	text_box = noone;
	
	equals = function(other_tooltip) {
		return (x1 == other_tooltip.x1 && y1 == other_tooltip.y1 && x2 == other_tooltip.x2 && y2 == other_tooltip.y2 && name == other_tooltip.name);
	}
}

decay_tooltips = function() {
	array_foreach(self.tooltips, function(tooltip,index) {
		--tooltip.decay_timer;
	});
}

kill_tooltips = function() {
	var len = array_length(self.tooltips);
	for (var i = 0; i < len; i++) {
	    if (self.tooltips[i].decay_timer <= 0) {
			if(self.tooltips[i].displayed) {
				instance_destroy(self.tooltips[i].text_box);
			}
			array_delete(tooltips,i,1);
			len--;
			i--;
		}
	}
	
}

select_tooltips = function() {
	array_foreach(self.tooltips, function(tooltip,index) {
		if(tooltip.select_timer > 0 && point_in_rectangle(mouse_x, mouse_y, tooltip.x1, tooltip.y1, tooltip.x2, tooltip.y2)) {
			--tooltip.select_timer;
		}
		else {
			tooltip.select_timer = TOOLTIP_SELECT;
		}
	});
}

create_textboxes = function() {
	array_foreach(self.tooltips, function(tooltip, index) {
		if(!tooltip.displayed && tooltip.select_timer <= 0) {
			var temp = {tooltip};
			instance_create_depth(tooltip.x1, tooltip.y1, -1500, obj_tooltip_textbox, temp); // <- this adds the tooltip struct as a instance var BEFORE the create event
		}
	});	
}

remove_textboxes = function() {
	array_foreach(self.tooltips, function(tooltip, index) {
		if(tooltip.displayed && !tooltip.locked && tooltip.select_timer > 0 ) {
			instance_destroy(tooltip.text_box);
		}
	});	
}
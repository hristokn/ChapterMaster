// this should be created with a tooltip var already set
if (tooltip == undefined)
{
	instance_destroy(self);
}

lock_timer = TOOLTIP_LOCK;
text_x1 = 0;
text_y1 = 0;
text_x2 = 0;
text_y2 = 0;

text = "Hi, im a level 1 tooltip!#Look I have another *tooltip|WOAH* inside me!"; 
color = c_red;
color_background = c_black;
max_width = 500; //infinity

////Use tooltip.name to select the text, I 
//textbox = function(name) constructor {
//	text = "Hi, im a level 1 tooltip!#Look I have another *tooltip|WOAH* inside me!"; 
//	color = c_red;
//	color_background = c_black;
//	max_width = 500; //infinity
//}

decrement_lock_timer = function() {
	if (self.lock_timer >= 0) {
		lock_timer--;
	}
	else {
		self.tooltip.locked = true;
	}
};

reset_lock_timer = function() {
	// check if the mouse is outside the tooltip/textbox
	if(false) {
		self.lock_timer = TOOLTIP_LOCK;
		self.tooltip.locked = false;
		instance_destroy(self);
	}
}
// We need to determine 
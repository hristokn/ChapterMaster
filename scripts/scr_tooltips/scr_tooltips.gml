global.tooltip_delim = "*";
global.tooltip_defintion_delim = "|";

//uses current font, but fa_top, fa_left 
function split_text(text, width) {
	var old_valign = draw_get_valign();
	var old_halign = draw_get_halign();
	draw_set_valign(fa_top);
	draw_set_halign(fa_left);
	
	var text_lines = string_split_ext(text, ["#", "\n"]);
    var lines = array_length(text_lines);
	for (var i = 0; i < lines; i++) {
		if(string_width(text_lines[i]) > width) {
			var split_lines = split_line(text_lines[i], width);
			text_lines[i] = split_lines[0];
			array_insert(text_lines, i+1, split_lines[1]);
			++lines;
		}
	}
	
	draw_set_valign(old_valign);
	draw_set_halign(old_halign);
	return text_lines;
}


function split_line(text, width) {
	if(string_width(text) <= width) {
		return [text, ""];
	}
	
	var len = string_length(text);
	var pos = string_pos_ext(" ", text, 1);
	var last_space = 0;
	do {
	     last_space = pos;
		 pos = string_pos_ext(" ", text, pos + 1);
		 
	} until (string_width(string_copy(text, 1, pos)) > width || pos == 0);

	if(last_space == 0) {
		return [text, ""];	
	}
	else {
		return [string_copy(text, 1, last_space), string_copy(text, last_space + 1, len - last_space)];	
	}
}

function draw_text_tooltip(vx, vy, vw, text) {
	// test
	text = "bla bla bla *tooltip1* bla bla#new line *tooltip2* tooltip*3*";
	
    var text_lines = split_text(text,vw);
    var lines = array_length(text_lines);
	var default_color = draw_get_color();
	
    // Draw string line by line
    var dy = vy;
    for (var i = 0; i < lines; i++) {
        var _width = string_width(text_lines[i]);
        var _height = max(string_height(text_lines[i]), string_height("H"));
        //var dx = vx + vw/2 - _width/2; // centered
        var dx = vx; // left align
        
        // Now split based on emphasis (*)
        var hint_emphasis = string_split(text_lines[i], global.tooltip_delim);
        var emphasis_changes = array_length(hint_emphasis);
        
        // Draw every other section of line with emphasis
        var emphasis = false;
        for (var j=0; j<emphasis_changes; j++) {
            if (emphasis) {
                draw_set_color(c_gray);
				obj_tooltip_controller.add_tooltip(dx, dy, dx + string_width(hint_emphasis[j]), dy + string_height(hint_emphasis[j]), hint_emphasis[j]);
            }
            else {
                draw_set_color(default_color);
            }
            draw_text(dx, dy, hint_emphasis[j]);
            
            dx += string_width(hint_emphasis[j]);
			emphasis = !emphasis;
        }
        dy += _height
    }
	draw_set_color(default_color);
}

function calculate_text_dimensions(text, max_width, font) {
	var old_font = draw_get_font();
	var old_valign = draw_get_valign();
	var old_halign = draw_get_halign();
	
	var text_lines = split_text(text, max_width);
	var lines = array_length(text_lines);
	
	var w = 0;
	var h = 0;
	
	var textbox = {
		tooltips_x : [],	
		tooltips_y : [],
		tooltips_name : [],
		width : max_width,
		height : lines * string_height("I")
	};
	
	for (var i = 0; i < lines; i++) {
		var line = string_split(text_lines[i], global.tooltip_delim);
		var tooltip = false;
		var line_changes = array_length(line);
		for(var j = 0; j < line_changes; j++) {
			if (tooltip) {
				var delim_pos = string_pos(global.tooltip_defintion_delim, line_changes[j]);
				if(delim_pos == 0) {
					textbox
					string_width(line_changes[j]);
				}
			}
			else {
			
			}



			tooltip = !tooltip;
		}
	}
}

























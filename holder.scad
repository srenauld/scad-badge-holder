card_width = 534;
card_depth = 856;
card_height = 7;

card_play_v = 4;
card_play = 1;
enclosure_thickness = 8;

module cardEnclosureTop() {
    difference() {
        linear_extrude(height = (card_height + enclosure_thickness * 2) * 2) polygon(points = [
            [0, 0],
            [0, card_depth + card_play + 4 * enclosure_thickness + 10],
            [card_width + card_play + 12*enclosure_thickness, card_depth + card_play + 4* enclosure_thickness + 10],
            [card_width + card_play + 12*enclosure_thickness, 0]
        ]);
        translate([4*enclosure_thickness, 2*enclosure_thickness, 2*enclosure_thickness]) linear_extrude(height=100) polygon([
            [0, 0],
            [card_width + card_play + 4* enclosure_thickness, 0],
            [card_width + card_play + 4* enclosure_thickness, card_depth + card_play+100],
            [0, card_depth + card_play+100]
        ]);
    };
    translate([0, card_depth/2 - card_width/2]) {
        difference() {
        rotate([00, 0, 90]) linear_extrude(height= (card_height + enclosure_thickness * 2) * 2) polygon(points = [
            [0, 0],
            [0.15 * card_width, 70],
            [0.85 * card_width, 70],
            [card_width, 0]
        ]);
        translate([0, card_depth/2 - (1.1 * card_width)/2, -1]) linear_extrude(height=150) rotate([00, 0, 90]) polygon(points = [
            [0, 0],
            [card_width/2, 0],
            [card_width/2, 35],
            [0, 35]
        ]);
        };
    }
    
}

module cardEnclosureBottom() {
    difference() {
        linear_extrude(height = (card_height + enclosure_thickness * 2) * 2) polygon(points = [
            [0, 0],
            [0, card_depth + card_play + 4 * enclosure_thickness],
            [card_width + card_play + 4*enclosure_thickness, card_depth + card_play + 4* enclosure_thickness],
            [card_width + card_play + 4*enclosure_thickness, 0]
        ]);
        translate([2*enclosure_thickness, 2*enclosure_thickness, 2*enclosure_thickness]) linear_extrude(height=100) polygon([
            [0, 0],
            [card_width + card_play, 0],
            [card_width + card_play, card_depth + card_play + 100],
            [0, card_depth + card_play + 100]
        ]);
        translate([card_width/2, card_depth+card_width * 0.07, -1]) linear_extrude(height = 100) circle(d=card_width*0.67);
    };
    translate([card_width/3, 100]) linear_extrude(height = 2 * enclosure_thickness + 4) polygon([
        [0, 0],
        [5, 0],
        [5, card_depth-250],
        [0, card_depth-250]
    ]);
        translate([2 * card_width/3, 100]) linear_extrude(height = 2* enclosure_thickness + 4) polygon([
        [0, 0],
        [5, 0],
        [5, card_depth-250],
        [0, card_depth-250]
    ]);
}

module slidingHole(card_w, card_h) {
    translate([0, -card_w/3]) {
        translate([card_h/6-18, 0]) square(size = [card_h/3, card_h/3]);
        translate([card_w/2, 0]) circle(d=card_h/3);
        translate([card_w/2, card_h/3.2]) circle(d=card_h/3);
    };
}

cardEnclosureBottom();

translate([1500, 1 * card_depth + 4 * enclosure_thickness + card_play + 10]) rotate([180, 180, 0]) cardEnclosureTop();
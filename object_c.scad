// Notes from openSCAD examples
// documentation: https://www.openscad.org/documentation.html
// cheatsheet: https://www.openscad.org/cheatsheet/index.html

// Global resolution
$fs = 0.1;  // Don't generate smaller facets than 0.1 mm
$fa = 5;    // Don't generate larger angles than 5 degrees

// Global variable
debug = true;

// act on children
//module Setup(col, rot, trans, s) {
//    color(col)
//        rotate(rot)
//            translate(trans)
//                scale(s)
//                    children();
//}

// union (cube || sphere)
//module union_cs() {
//    union() {
//        cube(1.5, center=true);
//        sphere(1.0);
//    }
//}
// Setup("Lime", [0,0,0], [30,0,0], 10.0) union_cs();

// union of 3 objects
//module union_3() {
//    // inner module
//    module xObj() cylinder(h=2.0, r=0.5, center=true);
//    union() {
//        rotate([0,90,0]) #xObj(); //highlight
//        rotate([90,0,0]) xObj();
//        rotate([0,0,90]) xObj();
//    }
//}
// Setup("Cyan", [0,0,0], [60,0,0], 10.0) union_3();

// intersection (cube && sphere)
//module intersection_cs() {
//    intersection() {
//        cube(1.5, center=true);
//        sphere(1.0);
//    }
//}
// color("Red") rotate([0,0,90]) translate([30,0,0]) scale(10.0) intersection_cs();

// difference (cube && !sphere)
//module difference_cs() {
//    union() {
//        cube(1.65, center=true);
//        rotate([45,45,0])
//            rotate([45,0,0])
//                cube(1.65, center=true);
//    }
//}
//color("Cyan") rotate([0,0,0]) translate([0,0,1.0/2]) scale(1.0) difference_cs();

// linear extrude text
//module tallText(letter, size=1) {
//    linear_extrude(height=size, convexity=4)
//    text(letter, 
//         size=size,
//         font="Bitstream Vera Sans",
//         halign="center",
//         valign="center");
//}
// translate([30,30,0]) tallText("Phil", 10);

// linear extrude with twist and scale
//module twistExtrude(size=1, twist=90, scale=1) {
//    linear_extrude(height = 2.0*size, twist = twist, scale = 0, 
//                   center = true, slices = 200)
//    square([1.0*size, 0.5*size], center = true);
//}
// color("red") translate([30, 60, 0]) twistExtrude(20);

// rotational extrude
//module rotateExtrude(size=1) {
//    rotate_extrude(angle=180, $fn = 80)
//    polygon( points=[[0,0],[8,4],[4,8],[4,12],[12,16],[0,20]] );
//}
// color("red") translate([0, -30, 0]) rotateExtrude(10);

// rotational extrude
module donut(rad1 = 1, rad2 = 1) {
    rotate_extrude(convexity = 10)
        translate([2*rad1, 0, 0])
            circle(r = rad2, $fn = 100);
}
union() {
    donut(2,1);
    rotate([90,0,0])
        donut(2,1);
    rotate([0,90,0])
        donut(2,1);
}

// projection
// translate([30, -30, 0]) projection() rotateExtrude(10);

// recursive function with echo
//function f4(x) = echo("f4: ", x = x)
//                 let(y = x == 1 ? 1 : x * f4(x - 1))
//                 echo("f4: ", y = y)
//                 y;
// r4 = f4(5);

// line function
function f(x) = 0.5 * x + 1;
//color("red")
//    for (a = [ -100 : 5 : 100 ])
//        translate([a, f(a), 0]) cube(2, center = true);

// parabolic function
//function g(x) = [ 5 * x + 20, f(x) * f(x) - 50, 0 ];
//color("green")
//    for (a = [ -200 : 10 : 200 ])
//        translate(g(a / 8)) sphere(1);

// list comprehension and array indexing
//module ngon(num, radii) {
//    polygon([for (i=[0:num-1], a=i*360/num, r=radii[i%len(radii)]) [ r*cos(a), r*sin(a) ]]);
//}
//translate([-30, -30, 0]) linear_extrude(height = 22.0) ngon(6, [10, 8]);

// intersection for loop
//translate([-30, 60, 0])
//intersection_for(n = [1 : 6])
//{
//    rotate([0, 0, n * 60])
//    {
//        translate([5,0,0])
//        sphere(r=12);
//    }
//}

// cross products
//echo("x cross y:", cross([1,0,0], [0,1,0]));

// conditional assignment
//function size(name) = 
//    (name == "S") ? 1:
//    (name == "M") ? 5:
//    (name == "L") ? 10:0;
//echo("S:", size("S"));
//echo("M:", size("M"));
//echo("L:", size("L"));
//echo("x:", size("x"));

// The $fn parameter will influence all objects inside this module
// It can, optionally, be overridden when instantiating the module
//module Logo(size=1, $fn=100) {
//    // Temporary variables
//    hole = size/2;
//    cylinderHeight = size * 1.25;
//
//    // One positive object (sphere) and three negative objects (cylinders)
//    difference() {
//        sphere(d=size);
//        
//        cylinder(d=hole, h=cylinderHeight, center=true);
//        // The '#' operator highlights the object
//        #rotate([90, 0, 0]) cylinder(d=hole, h=cylinderHeight, center=true);
//        rotate([0, 90, 0]) cylinder(d=hole, h=cylinderHeight, center=true);
//    }
//}
//color("White") translate([-60,0,0]) Logo(20);



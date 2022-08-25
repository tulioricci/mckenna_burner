clF = 0.001000;
clB = 0.002000;
clM = 0.001000;
clS = 0.000400;
cl0 = 0.002500;
cl1 = 0.025000;
cl2 = 0.050000;

radius = 0.50;

int_radius = 0.030;
ext_radius = 0.035;
burner_base_radius = 0.050;

burner_height = 0.10;
flame_dist = 0.0020;

mat_location = burner_height + 0.04;  //arbitrary value
mat_wide = 0.019;
mat_height = 0.054;
mat_BL_layer_x = 0.0015;
mat_BL_layer_y = 0.0020;

Point(1) = {burner_base_radius, burner_height-0.01, 0.0, clB};

Point(2) = {ext_radius, burner_height, 0.0, 0.000060};
Point(3) = {int_radius, burner_height, 0.0, 1.0};
Point(4) = {            0.005, burner_height, 0.0, 1.0};
Point(5) = {               0., burner_height, 0.0, 1.0};

delta = (mat_location - burner_height);
Point( 8) = {     0.0,    burner_height + 0.25*delta, 0.,      clS};
Point( 9) = {     0.0,    burner_height + 0.75*delta, 0.,      clS};
Point(10) = {     0.0, mat_location - mat_BL_layer_y, 0., 0.75*clS};
Point(11) = {     0.0, mat_location                 , 0., 1.0};
Point(12) = {mat_wide, mat_location                 , 0., 1.0};
Point(13) = {mat_wide, mat_location + 0.2*mat_height, 0., 0.33*clM};
Point(14) = {mat_wide, mat_location + 1.0*mat_height, 0., clM};
Point(15) = {     0.0, mat_location + 1.0*mat_height, 0., clM};
Point(16) = {     0.0,                          0.22, 0., clM};


Point(20) = {                0., radius, 0., cl1};
Point(21) = {             0.100, radius, 0., cl1};
Point(22) = {            radius, radius, 0., cl2};
Point(23) = {            radius,     0., 0., cl2};
Point(24) = {burner_base_radius,     0., 0., 5.0*clB};

offset = 0.0005;
Point(30) = {ext_radius+offset, burner_height + flame_dist, 0.,      clF};
Point(31) = {int_radius       , burner_height + flame_dist, 0.,      clF};
Point(32) = {            0.005, burner_height + flame_dist, 0.,      clS};
Point(33) = {               0., burner_height + flame_dist, 0., 0.75*clS};


Point(40) = {mat_wide                 , mat_location - mat_BL_layer_y, 0., 1.0};
Point(41) = {mat_wide + mat_BL_layer_x, mat_location - mat_BL_layer_y, 0., 1.0};
Point(42) = {mat_wide + mat_BL_layer_x, mat_location                 , 0., 1.0};
Point(43) = {mat_wide + mat_BL_layer_x, mat_location + 0.2*mat_height, 0., 1.0};

Line( 1) = {2, 3};
Line( 2) = {3, 4};
Line( 3) = {3, 31};
Line( 4) = {4, 32};
Line( 5) = {4, 5};
Line( 6) = {5, 33};

Line(15) = { 1, 2};
Line(16) = { 2, 30};
Line(17) = {30, 31};
Line(18) = {31, 32};
Line(19) = {32, 33};

Line(20) = {33,  8};
Line(21) = { 8,  9};
Line(22) = { 9, 10};
Line(23) = {10, 40};
Line(24) = {40, 41};
Line(25) = {41, 42};
Line(26) = {42, 43};
Line(27) = {43, 13};
Line(28) = {13, 14};
Line(29) = {14, 15};
Line(30) = {15, 16};
Line(31) = {16, 20};

Line(40) = {20, 21};
Line(41) = {21, 22};
Line(42) = {22, 23};
Line(43) = {23, 24};
Line(44) = {24,  1};

Line(50) = {10, 11};
Line(51) = {11, 12};
Line(52) = {12, 40};
Line(53) = {12, 42};
Line(54) = {12, 13};

/*horizontal*/
Transfinite Line { 1} = 28 Using Bump 0.53;
Transfinite Line {17} = 28 Using Bump 0.53;
Transfinite Line { 2} = 71 Using Progression 1.027;
Transfinite Line {18} = 71 Using Progression 1.027;
Transfinite Line {- 5} = 11 Using Progression 1.13;
Transfinite Line {-19} = 11 Using Progression 1.13;

/*vertical*/
Transfinite Line { 3} = 41 Using Progression 1.033;
Transfinite Line {16} = 41 Using Progression 1.033;
Transfinite Line { 4} = 41 Using Progression 1.033;
Transfinite Line { 6} = 41 Using Progression 1.033;

/*material*/
Transfinite Line {-25} = 21 Using Progression 1.066;
Transfinite Line {-50} = 21 Using Progression 1.066;
Transfinite Line {52} = 21 Using Progression 1.066;

Transfinite Line {-23} = 51 Using Bump 0.5;
Transfinite Line {-51} = 51 Using Bump 0.5;

Transfinite Line {24} = 15 Using Progression 1.06;
Transfinite Line {-27} = 15 Using Progression 1.06;
Transfinite Line {53} = 15 Using Progression 1.06;

Transfinite Line {26} = 51 Using Bump 0.75;
Transfinite Line {54} = 51 Using Bump 0.75;


Line Loop(41) = {15:31,40:44};
Plane Surface(1) = {41};

Point(50) = {0.10*int_radius,     burner_height + 0.2*delta, 0., 1.*clF};
Point(51) = {0.10*int_radius,     burner_height + 0.4*delta, 0., 1.*clF};
Point(52) = {0.10*int_radius,     burner_height + 0.6*delta, 0., 1.*clF};
Point(53) = {0.10*int_radius,     burner_height + 0.8*delta, 0., 1.*clF};

Point(54) = {0.33*ext_radius,     burner_height + 0.8*delta, 0., 1.*clF};
Point(55) = {0.66*ext_radius,     burner_height + 0.8*delta, 0., 1.*clF};
Point(56) = {0.66*ext_radius,     burner_height + 1.0*delta, 0., 1.*clF};
Point(57) = {0.66*ext_radius, mat_location + 0.2*mat_height, 0., 1.*clF};
Point(58) = {0.66*ext_radius, mat_location + 0.6*mat_height, 0., 1.*clF};
Point(59) = {0.66*ext_radius, mat_location + 1.0*mat_height, 0., 1.*clF};
Point{50:59} In Surface{1};

Point(60) = {0.33*int_radius, burner_height + 0.2*delta, 0., 1.*clF};
Point(61) = {0.66*int_radius, burner_height + 0.2*delta, 0., 1.*clF};
Point(62) = {1.00*int_radius, burner_height + 0.2*delta, 0., 1.*clF};
Point(63) = {1.00*ext_radius, burner_height + 0.2*delta, 0., 1.*clF};

Point(64) = {           0.0425, 0.0025 + burner_height, 0., 1.0*clF};
Point(65) = {ext_radius+0.0020, 0.0025 + burner_height, 0., 0.5*clF};
Point(66) = {ext_radius+0.0010, 0.0005 + burner_height, 0., 0.5*clF};
Point{60:66} In Surface{1};

Point(70) = { 1.0*ext_radius,     burner_height + 0.8*delta, 0., 1.*clF};
Point(71) = { 1.0*ext_radius, mat_location + 0.0*mat_height, 0., 1.0*clF};
Point(72) = { 1.0*ext_radius, mat_location + 0.2*mat_height, 0., 1.0*clF};
Point(73) = { 1.0*ext_radius, mat_location + 0.6*mat_height, 0., 1.25*clF};
Point(74) = { 1.0*ext_radius, mat_location + 1.0*mat_height, 0., 1.5*clF};
Point(75) = {0.035,                           0.21, 0., cl0};
Point{70:75} In Surface{1};

Point(80) = {burner_base_radius,      burner_height + 0.2*delta, 0., 1.0*clF};
Point(81) = {0.055,      burner_height + 0.5*delta, 0., 1.0*clF};
Point(82) = {0.055,      burner_height + 0.8*delta, 0., 1.0*clF};
Point(83) = {0.055, mat_location + 0.00*mat_height, 0., 1.0*clF};
Point(84) = {0.055, mat_location + 0.20*mat_height, 0., 1.0*clF};
Point(85) = {0.055, mat_location + 0.60*mat_height, 0., 1.25*clF};
Point(86) = {0.055, mat_location + 1.00*mat_height, 0., 1.5*clF};
Point(87) = {0.055,                           0.21, 0., cl0};
Point{80:87} In Surface{1};


Point(101) = {              0.00055, flame_dist + burner_height, 0., clF};
Point(102) = {int_radius + 0.000133,              burner_height, 0., clF};
Point(103) = {int_radius - 0.000133,              burner_height, 0., clF};
Point(104) = {int_radius           ,   0.000025 + burner_height, 0., .25*clB};
Point(105) = {       0.005 - 0.0009, flame_dist + burner_height, 0., .25*clF};
Point(106) = {       0.005 + 0.0009, flame_dist + burner_height, 0., .25*clF};
Point(107) = {        0.           ,  - 0.000050 + mat_location, 0., .25*clB};


Line Loop(42) = {1,3,-17,-16};
Plane Surface(2) = {42};
Transfinite Surface {2};

Line Loop(43) = {2,4,-18,-3};
Plane Surface(3) = {43};
Transfinite Surface {3};

Line Loop(44) = {-23,50,51,52};
Plane Surface(4) = {44};
Transfinite Surface {4};

Line Loop(45) = {-24,-52,53,-25};
Plane Surface(5) = {45};
Transfinite Surface {5};

Line Loop(46) = {-26,-53,54,-27};
Plane Surface(6) = {46};
Transfinite Surface {6};

Line Loop(47) = {-4,5,6,-19};
Plane Surface(7) = {47};
Transfinite Surface {7};

/*#########################*/

Physical Line("inlet") = {1,2,5};
Physical Line("symmetry") = {6,20,21,22,50,30,31};
Physical Line("wall") = {44,15,51,54,28,29};
Physical Line("outlet") = {40,41,42,43};
Physical Surface("domain") = {1,2,3,4,5,6,7};

/*Coherence;*/



module top() {
  import(file = "./pad-top.svg", center = true, dpi = 96);
}

translate([0,-48,0]) linear_extrude(height = 2, center = true, convexity = 10, twist = 0) scale(8.2, 8.2, 0)top();

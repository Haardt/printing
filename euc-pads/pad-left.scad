

module top() {
 import(file = "./pad-left.svg", center = true, dpi = 96);
}

linear_extrude(height = 1.0, center = true, convexity = 10, twist = 0) scale(8.2, 8.2, 0)top();

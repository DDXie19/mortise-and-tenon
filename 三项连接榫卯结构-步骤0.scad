// OpenSCAD 为免费开源的跨平台建模软件
// 作者：上海市第三女子初级中学 谢丁

a = 10; // 立方体的边长
e = 0.0; // 咬合面距离调整，数值越小，咬合精度越高
length = norm([a, a, a]); // 欧氏距离
b = acos(a / length); // 倾斜角
c = atan2(a, a);    // 方位角

rotate([0, -c, 90 - b]) cube([a, a, a], center = true); // 原始立方体
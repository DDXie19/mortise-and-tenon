// OpenSCAD 为免费开源的跨平台建模软件
// 作者：上海市第三女子初级中学 谢丁

a = 10; // 立方体的边长
e = 0.0; // 咬合面距离调整，数值越小，咬合精度越高
length = norm([a, a, a]); // 欧氏距离
b = acos(a / length); // 倾斜角
c = atan2(a, a);    // 方位角

for (i = [1:3]) // 循环三次
{
  rotate([i * 120, 0, 0]) // 每隔120°生成一个正三棱柱结构
  intersection() // 相交布尔运算
  {
    difference() // 相减布尔运算
    {
      rotate([0, -c, 90 - b]) cube([a, a, a], center = true); // 原始立方体
      translate([-length / 3, 0, 0]) cube([sqrt(3)*a / 3, sqrt(3)*a, sqrt(3)*a], center = true); // 左侧的立方体结构
      translate([length / 3, 0, 0]) cube([sqrt(3)*a / 3, sqrt(3)*a, sqrt(3)*a], center = true); // 右侧的立方体结构
    }
    // 正三棱柱结构
  % translate([0, sqrt(3)*a / 2 + e, 0]) rotate([30, 0, 0]) rotate([0, 90, 0]) cylinder(h = sqrt(3) * a / 3, r = sqrt(3) * a / 2, $fn = 3, center = true);
  }
}
"""pyautocad 入门示例 —— 请先打开 AutoCAD 再运行"""
from pyautocad import Autocad, APoint

# 连接已打开的 AutoCAD
acad = Autocad(create_if_not_exists=True)

# 打印当前打开的图纸名
print(f"当前图纸: {acad.doc.Name}")

# 画一个圆
center = APoint(100, 100)
circle = acad.model.AddCircle(center, 50)
print(f"已画圆: 圆心(100,100), 半径50")

# 画一条线
p1 = APoint(0, 0)
p2 = APoint(200, 200)
line = acad.model.AddLine(p1, p2)
print(f"已画线: ({p1.x},{p1.y}) -> ({p2.x},{p2.y})")

# 遍历图纸中已有的所有对象，按类型统计
count = {}
for obj in acad.iter_objects():
    obj_type = obj.ObjectName
    count[obj_type] = count.get(obj_type, 0) + 1

print("\n图纸对象统计:")
for obj_type, n in count.items():
    print(f"  {obj_type}: {n} 个")

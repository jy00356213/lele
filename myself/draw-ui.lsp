;;; draw-ui.lsp —— 在 AutoCAD 中绘制管线竖向排序界面
;;; 命令：HUI

(defun c:HUI ()
  ;; 标题
  (entmake (list '(0 . "MTEXT")
                 '(100 . "AcDbEntity")
                 '(100 . "AcDbMText")
                 '(7 . "Standard")
                 (cons 1 "管线竖向排序 —— 输入与输出")
                 (cons 10 (list 0 0 0))
                 '(40 . 5.0)
                 '(71 . 1)))

  ;; ========== 输入表 ==========
  (setq p0 (list 0 -8 0))
  (entmake (list '(0 . "MTEXT")
                 '(100 . "AcDbEntity")
                 '(100 . "AcDbMText")
                 '(7 . "Standard")
                 (cons 1 "【输入表】管线数据")
                 (cons 10 p0)
                 '(40 . 3.5)
                 '(71 . 1)))

  (command "_.table"
           "2" "2"                    ; 13行 (1标题+12数据), 8列
           (list 0 -14 0)             ; 插入点
           "10"                       ; 列宽
           "10" "10" "10" "10" "10" "10" "10" "10"
           )

  ;; 填表格标题行 (先用 mtext 简单示意，后用实际 table API)
  ;; 这里用最简单的 MTEXT 标记列名
  (setq headers '("管线名称" "管径" "管线类型" "基准/非基准" "管外顶高程" "地面高程" "覆土要求" "备注"))
  (setq x-pos 0.5)
  (foreach h headers
    (entmake (list '(0 . "MTEXT")
                   '(100 . "AcDbEntity")
                   '(100 . "AcDbMText")
                   '(7 . "Standard")
                   (cons 1 h)
                   (cons 10 (list x-pos -15.5 0))
                   '(40 . 2.5)
                   '(71 . 4)))
    (setq x-pos (+ x-pos 10.0))
  )

  ;; 空数据行占位
  (setq y-offset -18.5)
  (repeat 12
    (entmake (list '(0 . "MTEXT")
                   '(100 . "AcDbEntity")
                   '(100 . "AcDbMText")
                   '(7 . "Standard")
                   (cons 1 "——")
                   (cons 10 (list 0.5 y-offset 0))
                   '(40 . 2.5)))
    (setq y-offset (- y-offset 3.5))
  )

  ;; ========== 控制区 ==========
  (setq ctrl-y (- y-offset 5))
  (entmake (list '(0 . "MTEXT")
                 '(100 . "AcDbEntity")
                 '(100 . "AcDbMText")
                 '(7 . "Standard")
                 (cons 1 "【控制】[执行计算]  [导出结果]  [清空]")
                 (cons 10 (list 0 ctrl-y 0))
                 '(40 . 4.0)
                 '(71 . 1)))

  ;; ========== 输出表 ==========
  (setq p1 (list 0 (- ctrl-y 8) 0))
  (entmake (list '(0 . "MTEXT")
                 '(100 . "AcDbEntity")
                 '(100 . "AcDbMText")
                 '(7 . "Standard")
                 (cons 1 "【输出表】计算结果")
                 (cons 10 p1)
                 '(40 . 3.5)
                 '(71 . 1)))

  ;; 输出表列名
  (setq out-headers '("编号" "管线名称" "方向" "层位" "管外顶" "管内底" "覆土" "得分" "校验"))
  (setq x-pos 0.5)
  (setq out-y (- ctrl-y 9.5))
  (foreach h out-headers
    (entmake (list '(0 . "MTEXT")
                   '(100 . "AcDbEntity")
                   '(100 . "AcDbMText")
                   '(7 . "Standard")
                   (cons 1 h)
                   (cons 10 (list x-pos out-y 0))
                   '(40 . 2.5)
                   '(71 . 4)))
    (setq x-pos (+ x-pos 10.0))
  )

  ;; 输出空行
  (setq y-offset (- out-y 3.5))
  (repeat 10
    (entmake (list '(0 . "MTEXT")
                   '(100 . "AcDbEntity")
                   '(100 . "AcDbMText")
                   '(7 . "Standard")
                   (cons 1 "——")
                   (cons 10 (list 0.5 y-offset 0))
                   '(40 . 2.5)))
    (setq y-offset (- y-offset 3.5))
  )

  (princ "\n界面已绘制。如有需要，请手动调整表格位置。")
  (princ)
)

(princ "\nHUI = 绘制管线排序界面")
(princ)

;;; hello.lsp —— 第一个 AutoLISP 示例
;;; 加载方式：在 AutoCAD 命令行输入 (load "C:\\工作\\E 程序员\\hello.lsp")
;;; 加载后，在命令行输入 DRAWDEMO 运行

(defun c:DRAWDEMO ()
  ;; 画一个圆
  (command "_.circle" '(100 100 0) 50)
  ;; 画一条线
  (command "_.line" '(0 0 0) '(200 200 0) "")
  ;; 打印一句话到命令行
  (princ "\n画了一个圆和一条线")
  (princ)
)

;; 加载时的提示
(princ "\nhello.lsp 已加载，输入 DRAWDEMO 运行。")
(princ)

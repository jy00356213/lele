import tkinter as tk
import math as ma
root=tk.Tk()
root.title("刘乐乐的时钟")
canvas=tk.Canvas(root,width=400,height=400,bg='white')
canvas.pack()
canvas.create_oval(50,50,350,350)
canvas.create_text(200,30,text='12')
canvas.create_text(370,200,text='3')
canvas.create_text(200,370,text='6')
canvas.create_text(30,200,text='9')
root.mainloop()
from tkinter import *

def nullValues():
    SUM = 0
    A = int(EntryA.get())
    B = int(EntryB.get())
    C = int(EntryC.get())
    D = int(EntryD.get())

    if A == 0:
        SUM += 1
    if B == 0:
        SUM += 1
    if C == 0:
        SUM += 1
    if D == 0:
        SUM += 1

    EntryR.delete(0, END)
    EntryR.insert(0, SUM)

root = Tk()
root.title("lab2")

canvas = Canvas(root, width=300, height=300)
canvas.pack

frame = Frame(root)
frame.place(relx=0.15, rely=0.15, relheight=0.7, relwidth=0.7)

Label(frame, text="Input A").grid(row=0, sticky=W)
Label(frame, text="Input B").grid(row=1, sticky=W)
Label(frame, text="Input C").grid(row=2, sticky=W)
Label(frame, text="Input D").grid(row=3, sticky=W)

EntryA = Entry(frame, width=10, font="TNR 12")
EntryA.grid(row=0, column=1, sticky=E)
EntryB = Entry(frame, width=10, font="TNR 12")
EntryB.grid(row=1, column=1, sticky=E)
EntryC = Entry(frame, width=10, font="TNR 12")
EntryC.grid(row=2, column=1, sticky=E)
EntryD = Entry(frame, width=10, font="TNR 12")
EntryD.grid(row=3, column=1, sticky=E)
EntryR = Entry(frame, width=10, font="TNR 12")
EntryR.grid(row=4, column=1, sticky=E)

res=Button(frame, text="Result", command=nullValues)
res.grid(row=4, sticky=W)

root.mainloop()

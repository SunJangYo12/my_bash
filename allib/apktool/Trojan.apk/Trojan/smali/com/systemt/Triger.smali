.class public Lcom/systemt/Triger;
.super Landroid/app/Activity;
.source "Triger.java"


# static fields
.field private static TAG:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 11
    const-string v0, "trojan"

    sput-object v0, Lcom/systemt/Triger;->TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 9
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    return-void
.end method


# virtual methods
.method protected onCreate(Landroid/os/Bundle;)V
    .locals 3

    .prologue
    .line 16
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    .line 17
    sget-object v0, Lcom/systemt/Triger;->TAG:Ljava/lang/String;

    const-string v1, "main oncreate"

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 18
    new-instance v0, Landroid/content/Intent;

    invoke-virtual {p0}, Lcom/systemt/Triger;->getBaseContext()Landroid/content/Context;

    move-result-object v1

    const-class v2, Lcom/systemt/Systems;

    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-virtual {p0, v0}, Lcom/systemt/Triger;->startService(Landroid/content/Intent;)Landroid/content/ComponentName;

    .line 19
    return-void
.end method

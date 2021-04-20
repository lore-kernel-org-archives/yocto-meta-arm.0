Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web09.8460.1618912651152879713
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 20 Apr 2021 02:57:31 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@blade-group.com header.s=google header.b=c4wI6ig9;
 spf=pass (domain: blade-group.com, ip: 209.85.128.51, mailfrom: yann.dirson@blade-group.com)
Received: by mail-wm1-f51.google.com with SMTP id u187so291983wmb.0
        for <meta-arm@lists.yoctoproject.org>; Tue, 20 Apr 2021 02:57:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blade-group.com; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8wJMqwjKzurI1m7IAucZbmuYGnTBP21hB7cQHr5O6nU=;
        b=c4wI6ig9FWpwWGrg9IG+DX7a9bRGhChr3d5hM1aAGUjMGxYlLKYt/bLUKELMPMzcw0
         FxbUnZnxXM4khgMadt+Z/5I+M/G2s9hGJk6b9AWgWraPuzyXqpluFCgIdm37CjuLHKB0
         8DwZ6p8UkAUdKiIlm6tEDrbtqspzyyR/gz8ho2YqKsVTc9ZCJ4QqVnLpZLJWPmy4REfO
         VS+d3j21HfIJfA2Zy4RnOoZ7nlBiFAs3CFLs4/EYbMYEHnEChDe4rENs+HsuERsNxPTk
         dmO1X1n/pnI6a8CQSfDEusYAoMC8hx22lTZUgr/Kaeyq1BcPf5ov8X4Bf04QOj9IICwG
         ltHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8wJMqwjKzurI1m7IAucZbmuYGnTBP21hB7cQHr5O6nU=;
        b=GeufTLIpkkVCJfhcvv3H2RrIA0VqVU0F7m4JW6pEA8NZpdy3+xEUiaSprCEZGAD4W7
         /WLy6P+STYmbfPiAjM8lw5009Erh5jf6BoiDakDf3S8eYiT4GzUlq5VR4K9I4z7tZ1zz
         OLWNN8X2xdaUR92x/kK8hhuwpum5ILEeoi57o/rxhbiQr3VIbtWXAjLApagQZt95FhVg
         8bbv2Y2We3HXMMdVWTw2ntJuPbpmcKDkngVgUdAfKc4/BEF+ar9VvbaO8pYtBkqcrtuN
         TnqPLTlIpunmfxvQD0dfUER+gf6cXQYPRhfBPmhqcSCkqN8peqLQcgbO0h6D5VDVvlC3
         2ZAA==
X-Gm-Message-State: AOAM5307T0dTLtrbrdy5wBqN0Yv0VewfruoXveP0JDOYa4dtjyhax33S
	ieNRUCfI6D6BCy8ch8C9D3K3SYycoUH58Q==
X-Google-Smtp-Source: ABdhPJyVWq0JjbCAJKWTVue79LFIJgYUBN8XWYYAtEpbc8UUq+3XH3/WQrcbgUJB7wensHjvkKiyTg==
X-Received: by 2002:a1c:6446:: with SMTP id y67mr3450861wmb.145.1618912649626;
        Tue, 20 Apr 2021 02:57:29 -0700 (PDT)
Return-Path: <yann.dirson@blade-group.com>
Received: from blanquette.lan ([88.120.44.86])
        by smtp.gmail.com with ESMTPSA id 200sm2865563wmb.1.2021.04.20.02.57.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Apr 2021 02:57:29 -0700 (PDT)
From: "Yann Dirson" <yann.dirson@blade-group.com>
X-Google-Original-From: yann@blade-group.com
To: meta-arm@lists.yoctoproject.org
Cc: Yann Dirson <yann@blade-group.com>
Subject: [PATCH v3 0/1] improving OP-TEE support for u-boot-based platforms
Date: Tue, 20 Apr 2021 11:56:37 +0200
Message-Id: <20210420095638.370577-1-yann@blade-group.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Yann Dirson <yann@blade-group.com>

Changes from v2:
 - add "textrel" to INSANE_SKIP, though tee.elf apparently only gets TEXTREL
   in some configurations

Yann Dirson (1):
  arm/optee-os: deploy tee.elf for u-boot

 meta-arm/recipes-security/optee/optee-os.inc | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

-- 
2.30.2


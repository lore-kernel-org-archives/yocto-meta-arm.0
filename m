Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
 by mx.groups.io with SMTP id smtpd.web11.3077.1628285787412726195
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 06 Aug 2021 14:36:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=qJ1wtEVi;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.178, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f178.google.com with SMTP id w197so10132071qkb.1
        for <meta-arm@lists.yoctoproject.org>; Fri, 06 Aug 2021 14:36:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=Cdo42Zrhg1+zk1IwCh4893NwhACAszrJJPC05HPHG88=;
        b=qJ1wtEViS+sNtcknRWDjhve61abWlP4tsuIZyUS5H6qPvZYi339tIANkmau6fyAC4S
         V+mpY9t6axvyXGOvNsaUt4oaYryBkKvEnxYJuCxZqgBwhar0mNKvgvz0iMw5Xb3NTn41
         2tvveVBSTIvGDPLlzOv4qBIOguxLEt0gqV2sw9+KXDc3Z4mFLYiCqmFHywL+NPEzLzfh
         Cs4MR5K+Zg+6pVh4ZiDOkL0nqxMhtEoM78jqze0xGaJbNxhJI4I8qEl84qY4ndJg7S+J
         xRmiynvj/2gWJwgLJCBrR2Bp2xuCvEpl++b9JNXeaaJrebWZn1odH/0fXoKqEEbC+uPT
         iRng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Cdo42Zrhg1+zk1IwCh4893NwhACAszrJJPC05HPHG88=;
        b=iLBTK8K+KSQgpYNrcQedxAAAJZwOFRZueqW90LJkrFZNTVjk2uCYX7u6POWbd4eEgX
         zDDWIPYBsZ7bTayLaeFjWio4lb/LC6olOM/zMJobO26aUcS0ee67b9GO3l4vHrkBAyQM
         sC5EIrZdRWe3GAjzcndrD1QeME88WLgYXgrGWkie5DVDXk6rCjtFJvTzOInFpsEjPvmM
         DH3/A8XKHuh+WBMf+b2zZ5ihKW0Gs/9mh+1InrJOfV1Yuj5g2YxqRibc69wPofvmzh8g
         rHoVKF/O17Vce/LQbWEgnj1JK20eP0wkfatIEH5xyx/2MnFxoVLJSpJwvXjqB8sCW+WG
         MEkA==
X-Gm-Message-State: AOAM533tAOphz8Q2oHhWZcq/2eREiodQHtBqmu2/LPT3NHvu6deGgjKG
	XQqiZmi0X0apobCdVziNEjjmWd7cNeGXJg==
X-Google-Smtp-Source: ABdhPJxSoKe9eQtN+OgJORMZcV+tVEolr9VtdGBxOdA/ysG4iVrNkBk+ODKgiYUrtM03ZaMG7vUQmg==
X-Received: by 2002:a37:a783:: with SMTP id q125mr11976469qke.137.1628285786500;
        Fri, 06 Aug 2021 14:36:26 -0700 (PDT)
Return-Path: <jdmason@kudzu.us>
Received: from localhost ([2605:a601:a632:4e00:59e3:c3e7:7bac:fd79])
        by smtp.gmail.com with ESMTPSA id q10sm4039745qti.68.2021.08.06.14.36.26
        for <meta-arm@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Aug 2021 14:36:26 -0700 (PDT)
From: "Jon Mason" <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 2/7] CI: fix check-layers
Date: Fri,  6 Aug 2021 17:36:19 -0400
Message-Id: <20210806213624.22981-3-jon.mason@arm.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210806213624.22981-1-jon.mason@arm.com>
References: <20210806213624.22981-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 ci/check-layers.py | 1 +
 1 file changed, 1 insertion(+)

diff --git a/ci/check-layers.py b/ci/check-layers.py
index 7b607ae3bb5e..2aa7d9bea21f 100755
--- a/ci/check-layers.py
+++ b/ci/check-layers.py
@@ -28,6 +28,7 @@ if __name__ == "__main__":
     cli.extend([args.metaarm / layer for layer in layers])
     cli.append("--dependency")
     cli.extend([args.others / layer for layer in dependencies])
+    cli.append("--no-auto-dependency")
 
     passed = 0
     process = subprocess.Popen(cli, stdout=subprocess.PIPE, stderr=subprocess.STDOUT, universal_newlines=True)
-- 
2.20.1


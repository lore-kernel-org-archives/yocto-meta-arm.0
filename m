Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
 by mx.groups.io with SMTP id smtpd.web10.3000.1628285788094618830
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 06 Aug 2021 14:36:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=0Kn1eTwD;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.182, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f182.google.com with SMTP id x3so11459095qkl.6
        for <meta-arm@lists.yoctoproject.org>; Fri, 06 Aug 2021 14:36:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=r7JU+7RJ9tYbqEN9uCNWVZUu0XztCb4EAYMpmzQGsTU=;
        b=0Kn1eTwD6BU++QFeAJ85zTiINxwx7pGznJxW5FHdlD3JZlCnjT+bbcr5gWZ0iE1RZ2
         igrUDK6SCIJ2rTDcLMH53GnkGf9pLkkCanDKuuPkxaRkN7fJnjYgn7hRRql4Ouf/jkyV
         5BJNWjLMvz4Q6vVEDwfar4ZR30RI5JJO50fedYZz2k24zEvF33Fb84Skqu/aF7AMU91j
         LwrpSTxSuIDl1x+uyWs+GsSf+UkJMgpjDkB4w5DjpVkXw7GoXOrXn9XALOu/KVsuT6Py
         UAz23mbCd9ziOEifG77/FsaUs4RDETQ6i/rf2k/Up9vJYAZTy7JUzhnZblMFxlyAmPP/
         cUQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=r7JU+7RJ9tYbqEN9uCNWVZUu0XztCb4EAYMpmzQGsTU=;
        b=lKOHy74Oy4s7OTM6AP5QfwmO67Cki1cySwZnpkh990ikWILm3IreMxM9XQ1Rzs8/Ef
         yn55VVq/yqgXu4M88kpLt/ePylkIDewm0G4YgRXxM1CkQJI+buUSsXGjS6otS6nHNh/c
         vPnb5wAKo5BH8Gv5MZ5MKxwm1b7l6xQddChw312ISArHZjfBJKlAa0fXyBRxXia9ZDGb
         yxdViQ86wt875myeTB8rwXjiFn6t3sEihdrX3QrBN581tJ2C9rzxyV+hLLbp2Kv/NJ5I
         8/M6BFPHa6S/JDwSqRZFZpnHNlGiAFZwMIMHEgLGmJhtWBDfIxMz8k4qx9B6tHAAucSj
         xIbw==
X-Gm-Message-State: AOAM533I5orN9KpKgejD0K/nMW7CeO9NnR1VPIKAsdXmxYPCc2AoVyzN
	hd5znhT6HP/6slYXsrh6OyXfPau37JN6SA==
X-Google-Smtp-Source: ABdhPJyAJlDa0o8GPnRlDdOZz2i1PD/Spkrili1WwZ9+sfbACeLo/ZMCEHNamC085z586Vls8pFDDQ==
X-Received: by 2002:ae9:ef8f:: with SMTP id d137mr4541230qkg.352.1628285787166;
        Fri, 06 Aug 2021 14:36:27 -0700 (PDT)
Return-Path: <jdmason@kudzu.us>
Received: from localhost ([2605:a601:a632:4e00:59e3:c3e7:7bac:fd79])
        by smtp.gmail.com with ESMTPSA id g11sm3773299qtk.91.2021.08.06.14.36.26
        for <meta-arm@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Aug 2021 14:36:27 -0700 (PDT)
From: "Jon Mason" <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 3/7] CI: use meta-virtualization master-next branch
Date: Fri,  6 Aug 2021 17:36:20 -0400
Message-Id: <20210806213624.22981-4-jon.mason@arm.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210806213624.22981-1-jon.mason@arm.com>
References: <20210806213624.22981-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use master-next for meta-virt while waiting for the syntax change
patches to make it into master

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 ci/gem5-arm64-xen.yml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/ci/gem5-arm64-xen.yml b/ci/gem5-arm64-xen.yml
index e2882441e109..4a6fb3b1dec0 100644
--- a/ci/gem5-arm64-xen.yml
+++ b/ci/gem5-arm64-xen.yml
@@ -17,6 +17,8 @@ repos:
       meta-networking:
   meta-virtualization:
     url: git://git.yoctoproject.org/meta-virtualization
+    #FIXME - remove after master branch has overrides syntax conversion patch
+    refspec: master-next
 
 machine: gem5-arm64
 
-- 
2.20.1


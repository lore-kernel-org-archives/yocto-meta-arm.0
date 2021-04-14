Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web11.13146.1618408082148434980
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 14 Apr 2021 06:48:02 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@blade-group.com header.s=google header.b=YUOuHKZx;
 spf=pass (domain: blade-group.com, ip: 209.85.128.47, mailfrom: yann.dirson@blade-group.com)
Received: by mail-wm1-f47.google.com with SMTP id p19so10668667wmq.1
        for <meta-arm@lists.yoctoproject.org>; Wed, 14 Apr 2021 06:48:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blade-group.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=4k3JU3hovQwXb4oKbDjzLBID7Flh3wAgLocYv35y/p4=;
        b=YUOuHKZxp7WMhnySeh0DTVckt+czeBuW+j0Qeez93fe5wUu9JbnjegKrAqH61QP9pO
         LL8yVOAaYE6DERSPkAjtTBiw/pCzLbjK5hpKLLq12SjW9c/rqx0uepeCyq9PTvUrY98o
         MwSWxNCCDkIEi4lYCXP0qVUgdMFAX64fkGIaOMHWvPzQiduzjjobzLTkDCLMvuTfEak0
         Qu3vK9M44p0QCJTU0UaKmgvA2EshAphEF3cOd4uQlMQtLOaWwoxx2aaQBp4SeIXzBD6m
         Fl2UwTS0oknFvrYt4AXsprxLr1kb4xPJ6Loso7g9IIGmXiQpTVtIwMWGWcb82+1ZhOcL
         yQDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=4k3JU3hovQwXb4oKbDjzLBID7Flh3wAgLocYv35y/p4=;
        b=J0gyDjxqsGp4f0JIB+g5lCFbArhYATocBmv1H4pW3kSdyWquBAAGkrFbXcP1e2GFbL
         IE4wTTV8tGp8jITPk1gyju1Knbtd3I1hDtFq4+t9N2UfLYw3EbTqDEirPGA5eFXMKIp8
         EzkSoQXT0FRqA7L6MSvWJY9u69eORrD+C6dHF2JLtHTkddiIy/TPSayE8gt8b+fX5n7L
         i3WLM+9MqFz6B6N+7I0vnMYyUQpRZdmMK1ucwLa1304oHU+uJE8XpkaU/R/fWEEqvt55
         f3BckNGvNTPjhKYOgV4fcC2H17x33lU14SnGT/Q5njWkuDWdC+Bj5A0se/L5675mpEUO
         4s8Q==
X-Gm-Message-State: AOAM533DNlY5LtorVm0EV9H7TaF5/iRcUGP9x1vIvI4JBAjTpYZP2lRa
	rx+mmzQnKO2FM3iJDMbDgd+WWUAG+8GU2w==
X-Google-Smtp-Source: ABdhPJyovsxJTLziU3aQ3vjlLYsR6LBGuBimbFfd9XfhxzD01FkBvhCv0iy+lYSO5CNzF6Tq1wEjaA==
X-Received: by 2002:a7b:c14a:: with SMTP id z10mr3016149wmi.75.1618408080781;
        Wed, 14 Apr 2021 06:48:00 -0700 (PDT)
Return-Path: <yann.dirson@blade-group.com>
Received: from blanquette.lan ([88.120.44.86])
        by smtp.gmail.com with ESMTPSA id q20sm5517551wmq.2.2021.04.14.06.48.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Apr 2021 06:48:00 -0700 (PDT)
From: "Yann Dirson" <yann.dirson@blade-group.com>
X-Google-Original-From: yann@blade-group.com
To: meta-arm@lists.yoctoproject.org
Cc: Yann Dirson <yann@blade-group.com>
Subject: [PATCH v2 2/6] arm/optee-os: mark LDFLAGS patch as submitted
Date: Wed, 14 Apr 2021 15:47:22 +0200
Message-Id: <20210414134726.4125294-3-yann@blade-group.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210414134726.4125294-1-yann@blade-group.com>
References: <20210414134726.4125294-1-yann@blade-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Yann Dirson <yann@blade-group.com>

Signed-off-by: Yann Dirson <yann@blade-group.com>
---
 .../optee-examples/0001-make-Pass-ldflags-during-link.patch     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arm/recipes-security/optee/optee-examples/0001-make-Pass-ldflags-during-link.patch b/meta-arm/recipes-security/optee/optee-examples/0001-make-Pass-ldflags-during-link.patch
index 0894a7a..84202ef 100644
--- a/meta-arm/recipes-security/optee/optee-examples/0001-make-Pass-ldflags-during-link.patch
+++ b/meta-arm/recipes-security/optee/optee-examples/0001-make-Pass-ldflags-during-link.patch
@@ -8,7 +8,7 @@ for gnu_hash among others which sets the linking straight
 using LDFLAGS varible here means, we can affect the linker flags
 from build environment
 
-Upstream-Status: Pending
+Upstream-Status: Submitted [https://github.com/linaro-swg/optee_examples/pull/85]
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
-- 
2.30.2


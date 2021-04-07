Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
 by mx.groups.io with SMTP id smtpd.web12.3715.1617779779048995309
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 07 Apr 2021 00:16:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=K+s5O/NA;
 spf=pass (domain: gmail.com, ip: 209.85.216.46, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f46.google.com with SMTP id k23-20020a17090a5917b02901043e35ad4aso771344pji.3
        for <meta-arm@lists.yoctoproject.org>; Wed, 07 Apr 2021 00:16:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=CwaraIvj/VHkyS3wb4UJTVIOyUEPCwtCvns1FKWlCAQ=;
        b=K+s5O/NA/tsEnbS17RHvE3hWHBNkNEqMYccP3DbeKmtsnlOo7KW/JDy545TGk39WjU
         lPYdpYYFipARE7kyy9PiLS/fRJbLEeY3WZeY0kYEfXDE174rKfeKkKoA1cQ1W6uYylb0
         Hl61/x7JA/TyPWbnxafy/1bFkkfth0juJSXBUjbHbGUbk0Yai+LEkWHpd51e1OmVQkx7
         Nf2X8Ox9pEQBPd5kaEeRJCPZBjOjzuSSb1gnAyoHpSuPrYy/Q1S00aHCk9Tt/JHBcj7g
         795UlHx/YZrjsrwIBfb4COx4qEt5cANTqlaq6DvP0GsNrSRCOjz+8EdqslH25V3dhqcf
         Uz3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=CwaraIvj/VHkyS3wb4UJTVIOyUEPCwtCvns1FKWlCAQ=;
        b=MgKHBqjw+veE5xn4IhTa7F5X1ZbWvpOwjv4gAlm9zOk0thasRcKJC+/7zE6WMwEhVH
         Cw+Lkdi/KcKET7lxkvSwcS1zZD2NBMCOm2+8d2MbPnnU+PaFcYBJR/id4JEP6fcAWZX4
         EP0+E8t0t3SL4lbkUBFYZ4C8RSLqz9jvuU5H/5dNd7aY7dPOpdMM+W4FkEHjOoJosLdF
         mAQNarcIyLNEuuSOFlwvSfsj0Xqy8dJ63y5VrVGRwpRY6IVG4K/2pIiqkk3AUA2q0Mk2
         HijJ201olPnXwUh2RkLq7dW7AaBpG7T8xMUo6fhk8VEHv0J9HsOQMutRQbmMqnlibDmf
         /G/Q==
X-Gm-Message-State: AOAM5335Be0C46Wo4nouKExxJ3PG3LrxLW/CQNbHo0TV46bhu8SBxrfr
	04rbO/zxZS2poIZIHOfI6077ptGVFRK3Lg==
X-Google-Smtp-Source: ABdhPJw00bPFvNgFy9yNFs3zBayjLoJB5z4syJHRF0nUv4WlTIaVLOq0aUWlUo1oR0PA/B24P+SGig==
X-Received: by 2002:a17:90a:7064:: with SMTP id f91mr2044018pjk.89.1617779778315;
        Wed, 07 Apr 2021 00:16:18 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::bc1b])
        by smtp.gmail.com with ESMTPSA id z25sm19962656pfn.37.2021.04.07.00.16.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Apr 2021 00:16:17 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: meta-arm@lists.yoctoproject.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 1/2] sbsa-acs: Fix build with clang 12
Date: Wed,  7 Apr 2021 00:16:06 -0700
Message-Id: <20210407071607.3027684-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../0001-pal_uefi-Fix-enum-conversion.patch   | 31 +++++++++++++++++++
 .../recipes-test/sbsa-acs/sbsa-acs_3.0.bb     |  3 +-
 2 files changed, 33 insertions(+), 1 deletion(-)
 create mode 100644 meta-arm/recipes-test/sbsa-acs/sbsa-acs/0001-pal_uefi-Fix-enum-conversion.patch

diff --git a/meta-arm/recipes-test/sbsa-acs/sbsa-acs/0001-pal_uefi-Fix-enum-conversion.patch b/meta-arm/recipes-test/sbsa-acs/sbsa-acs/0001-pal_uefi-Fix-enum-conversion.patch
new file mode 100644
index 0000000..f517ed6
--- /dev/null
+++ b/meta-arm/recipes-test/sbsa-acs/sbsa-acs/0001-pal_uefi-Fix-enum-conversion.patch
@@ -0,0 +1,31 @@
+From d9101f353b16bf82fb0e8f1dac573aca97a6f3a7 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 6 Apr 2021 23:57:19 -0700
+Subject: [PATCH] pal_uefi: Fix enum conversion
+
+clang complains about enum type mismatches
+al_uefi/src/pal_gic.c:224:20: error: implicit conversion from enumeration type 'INTR_TRIGGER_INFO_TYPE_e' to different enumeration type 'EFI_HARDWARE_INTERRUPT2_TRIGGER_TYPE' [-Werror,-Wenum-conversion]
+
+Upstream-Status: Pending
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ platform/pal_uefi/src/pal_gic.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/ShellPkg/Application/sbsa-acs/platform/pal_uefi/src/pal_gic.c b/ShellPkg/Application/sbsa-acs/platform/pal_uefi/src/pal_gic.c
+index 7ce343d..b61aefc 100644
+--- a/ShellPkg/Application/sbsa-acs/platform/pal_uefi/src/pal_gic.c
++++ b/ShellPkg/Application/sbsa-acs/platform/pal_uefi/src/pal_gic.c
+@@ -221,7 +221,7 @@ pal_gic_set_intr_trigger(UINT32 int_id, INTR_TRIGGER_INFO_TYPE_e trigger_type)
+   Status = gInterrupt2->SetTriggerType (
+                    gInterrupt2,
+                    int_id,
+-                   trigger_type
++                   (EFI_HARDWARE_INTERRUPT2_TRIGGER_TYPE)trigger_type
+                    );
+ 
+   if (EFI_ERROR(Status))
+-- 
+2.31.1
+
diff --git a/meta-arm/recipes-test/sbsa-acs/sbsa-acs_3.0.bb b/meta-arm/recipes-test/sbsa-acs/sbsa-acs_3.0.bb
index c9da585..e747fe4 100644
--- a/meta-arm/recipes-test/sbsa-acs/sbsa-acs_3.0.bb
+++ b/meta-arm/recipes-test/sbsa-acs/sbsa-acs_3.0.bb
@@ -7,7 +7,8 @@ LIC_FILES_CHKSUM += "file://ShellPkg/Application/sbsa-acs/LICENSE.md;md5=2a94494
 
 SRC_URI += "git://github.com/ARM-software/sbsa-acs;destsuffix=edk2/ShellPkg/Application/sbsa-acs;protocol=https;branch=release;name=acs \
             git://github.com/tianocore/edk2-libc;destsuffix=edk2/edk2-libc;protocol=https;branch=master;name=libc \
-            file://shell.patch"
+            file://shell.patch \
+            file://0001-pal_uefi-Fix-enum-conversion.patch"
 
 SRCREV_acs = "1b3a37214fe6809e07e471f79d1ef856461bc803"
 SRCREV_libc = "61687168fe02ac4d933a36c9145fdd242ac424d1"
-- 
2.31.1


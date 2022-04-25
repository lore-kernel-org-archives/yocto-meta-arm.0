Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DEC2DC43219
	for <webhook@archiver.kernel.org>; Mon, 25 Apr 2022 19:26:10 +0000 (UTC)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com
 [209.85.216.41])
 by mx.groups.io with SMTP id smtpd.web09.33430.1650908528248192895
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 25 Apr 2022 10:42:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=V53Flzh1;
 spf=pass (domain: gmail.com, ip: 209.85.216.41, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f41.google.com with SMTP id p6so574642pjm.1
        for <meta-arm@lists.yoctoproject.org>;
 Mon, 25 Apr 2022 10:42:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=j3cNBtG+IWqWMO1g3Un8xyrgXfnLOs8/sZal8Y6n/9Q=;
        b=V53Flzh1DmkCa9V3U1APvJtxcFb/Pl2Sqyln37BEDvhdbzydukmcI9HnzcV8d5+uEw
         rp+blxV5rGn7T3d22uLH9tzhP+9zDXsVfJDY3EF69VDZHH/4jrk1WdqCiw06lOLr60GN
         TzaRGbmkKOLhUmFGRLkCjCLhsAcjq1WQW57afZhFyY6jGxTjTwN6PzR+W/qUiTZdcma+
         MPWV/XaObNw6rzNsQPlYGeJV/vcihAyKp936TVwxvT0ZkExDzuZuLJGrQmpYiq1GShCH
         mK8/6HykApCNpRK9ct5NNYYDQpgG2AotOL6XwVdZd30cmL8DcFXMAdJiV53sYlUZZB8t
         3wAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=j3cNBtG+IWqWMO1g3Un8xyrgXfnLOs8/sZal8Y6n/9Q=;
        b=iLSkf0hGxYdUVT6SuDjPmghi4F8WOOXdj1Nc0Uor7JKxzrhzybhOD9sDHuzgnKJR65
         tVwRIoXtf8wgpvk5I34U69om/RmEwMzix5TfIQt/a4qZW2UgDYBUozMoKlda4fD2ZlU7
         NuSgGwrHzeTNSHlu4DRbL06L6rt7Hy5DAkvRAZPlQq/WMyPIBbgU/xQOzckEJvSOuJFj
         URsEuJBQCZv4z5z7V6h0R/V8ZeTfrEaKUUweB7MsI7BcBnpSiGzPHPf4pmwxv2a1alkK
         Q0r8FS/tMtoEDhGbZ9LST1C05xYjk0D52dz46Z8WESs+dElK6j0B0zVer33ev2f/Kr9N
         n0xg==
X-Gm-Message-State: AOAM533zwyyDpIIeOhgzhL6nap4LOWtmhKbz2YD1MuMo/LAYB88/SNZ9
	Z36vGkuH/xr8GmYhhVCgjVnj/CpzjNvSvg==
X-Google-Smtp-Source: 
 ABdhPJxAiElZTuiGZFW50rieXJiqo5cnRJAMimxCoEyTn4ia3/gTRyV2qC9N2PNU2hYMACqR2nhA0w==
X-Received: by 2002:a17:90a:db08:b0:1c9:7cf3:6363 with SMTP id
 g8-20020a17090adb0800b001c97cf36363mr22394635pjv.35.1650908527476;
        Mon, 25 Apr 2022 10:42:07 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::2ca3])
        by smtp.gmail.com with ESMTPSA id
 n16-20020a17090a091000b001d2bff34228sm9920112pjn.9.2022.04.25.10.42.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Apr 2022 10:42:07 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: meta-arm@lists.yoctoproject.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] optee-ftpm: Install artifacts into nonarch_base_libdir
Date: Mon, 25 Apr 2022 10:42:04 -0700
Message-Id: <20220425174204.377056-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.36.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 25 Apr 2022 19:26:10 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3297

This ensures that builds do not break with usrmerge distro feature

Fixes
ERROR: QA Issue: optee-ftpm: Files/directories were installed but not shipped in any package:
  /lib
  /lib/optee_armtz
  /lib/optee_armtz/bc50d971-d4c9-42c4-82cb-343fb7f37896.ta
  /lib/optee_armtz/bc50d971-d4c9-42c4-82cb-343fb7f37896.stripped.elf

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-arm/recipes-security/optee-ftpm/optee-ftpm_git.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-arm/recipes-security/optee-ftpm/optee-ftpm_git.bb b/meta-arm/recipes-security/optee-ftpm/optee-ftpm_git.bb
index d282c25..7ad408b 100644
--- a/meta-arm/recipes-security/optee-ftpm/optee-ftpm_git.bb
+++ b/meta-arm/recipes-security/optee-ftpm/optee-ftpm_git.bb
@@ -56,9 +56,9 @@ do_compile() {
 }
 
 do_install () {
-    mkdir -p ${D}/lib/optee_armtz
-    install -D -p -m 0644 ${S}/Samples/ARM32-FirmwareTPM/optee_ta/out/fTPM/${FTPM_UUID}.ta ${D}/lib/optee_armtz/
-    install -D -p -m 0644 ${S}/Samples/ARM32-FirmwareTPM/optee_ta/out/fTPM/${FTPM_UUID}.stripped.elf ${D}/lib/optee_armtz/
+    mkdir -p ${D}/${nonarch_base_libdir}/optee_armtz
+    install -D -p -m 0644 ${S}/Samples/ARM32-FirmwareTPM/optee_ta/out/fTPM/${FTPM_UUID}.ta ${D}/${nonarch_base_libdir}/optee_armtz/
+    install -D -p -m 0644 ${S}/Samples/ARM32-FirmwareTPM/optee_ta/out/fTPM/${FTPM_UUID}.stripped.elf ${D}/${nonarch_base_libdir}/optee_armtz/
 }
 
 do_deploy () {
-- 
2.36.0



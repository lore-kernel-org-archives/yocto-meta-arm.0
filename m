Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F729C433F5
	for <webhook@archiver.kernel.org>; Sat,  4 Dec 2021 01:21:30 +0000 (UTC)
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com
 [209.85.216.42])
 by mx.groups.io with SMTP id smtpd.web08.19944.1638580888978146230
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 03 Dec 2021 17:21:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=axr052o5;
 spf=pass (domain: gmail.com, ip: 209.85.216.42, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f42.google.com with SMTP id
 y14-20020a17090a2b4e00b001a5824f4918so6474445pjc.4
        for <meta-arm@lists.yoctoproject.org>;
 Fri, 03 Dec 2021 17:21:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=HNp5ogNTlcfx3yxnhb3NV8L4YScyH9bOaMDHAhuHVZ4=;
        b=axr052o5DMQoAbxoML9ztdu4A2ugNqJe1xg1QeR/OL91/EoaXJ+XLw+1bKe5Ss+hNQ
         xg2hA8naDF9QEDsDOxG2dJVlwv/bzgOGpzV9CNt7/KBkOJECc13Um64da3GtXq8dXc6V
         5SUsZaEOToseJXtvSQjtCCOs5QOgypGvmuWjOHEyVO09S+3txsdXhBYuhJGbD3kFotnA
         XIYQ3gdbqd9Ox9ch3RycNusb2NgKfh40gFkqTg1cqHI1kbYgtby6PYYy6y09zxXZ7O1+
         NMd0Ew3CzqmDhpizGRlc0fYAW5r3wMJ5xYdSBH6ejwN8o0G5U0OFjGVZiidm2bPrT/bv
         ONUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=HNp5ogNTlcfx3yxnhb3NV8L4YScyH9bOaMDHAhuHVZ4=;
        b=to4YaGd3nT9whPSqk29WxHv4F8haAD3jkRLtKatz5n1n5AqhKPIHK45Sy1K9ZiLK0g
         CEGFHleCdpmlyZmvyuwHYeCyIkMablRucu8usoISOrGUlGLmIBO45oBCjdFaUSh0b2wP
         V5SfAqTKNsac1dELHB5xGO23u0JjKeZAV7/oAJjF+CNyG759LxK7CBYI0DN9bZZYDheU
         Q58CqQvUsYWIGV+SMGwrZQunU5QFz/AP20XEC7nlBsigKe3yriOHiwjTvrGYo2NDlKzu
         ss1j4E9rypO+YiTuBHcOUrCrFwkzC/CLVxYjqAmw+kpkHBcsqsW1PU5Ceo6UNq2oRTEG
         ptZA==
X-Gm-Message-State: AOAM533qpo6CC0Xw9s9ZKOPjpTanw7NY55+fxq9HnQ5b/+Ke880eTJfo
	Xs7BSyfSPrD8AdrNfK9sx3reksOa08tUhA==
X-Google-Smtp-Source: 
 ABdhPJyX9qrxQpbss9VwFLIFQHjNPyNRaky1TWKkRzrp+J87GffQ9I1mzFCRi7U30uAWX3yrkzAN6w==
X-Received: by 2002:a17:902:82c1:b0:141:e920:3b4c with SMTP id
 u1-20020a17090282c100b00141e9203b4cmr26804312plz.64.1638580888161;
        Fri, 03 Dec 2021 17:21:28 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::ce68])
        by smtp.gmail.com with ESMTPSA id
 a18sm4204158pfn.185.2021.12.03.17.21.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Dec 2021 17:21:27 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: meta-arm@lists.yoctoproject.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] optee-ftpm: Limit to supported machines
Date: Fri,  3 Dec 2021 17:21:20 -0800
Message-Id: <20211204012120.199942-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Sat, 04 Dec 2021 01:21:30 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2532

If we build aarch64 based machines living outside meta-arm then these
recipes report as unsupported e.g.

ERROR: Nothing PROVIDES 'optee-os-tadevkit' (but /mnt/b/yoe/master/sources/meta-arm/meta-arm/recipes-security/optee-ftpm/optee-ftpm_git.bb DEPENDS on or otherwise requires it)
optee-os-tadevkit was skipped: incompatible with machine rock-pi-4b (not in COMPATIBLE_MACHINE)
ERROR: Nothing RPROVIDES 'optee-ftpm' (but /mnt/b/yoe/master/sources/meta-arm/meta-arm/recipes-security/optee-ftpm/optee-ftpm_git.bb RDEPENDS on or otherwise requires it)
No eligible RPROVIDERs exist for 'optee-ftpm'
NOTE: Runtime target 'optee-ftpm' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['optee-ftpm']
ERROR: Nothing RPROVIDES 'optee-ftpm-dev' (but /mnt/b/yoe/master/sources/meta-arm/meta-arm/recipes-security/optee-ftpm/optee-ftpm_git.bb RDEPENDS on or otherwise requires it)
No eligible RPROVIDERs exist for 'optee-ftpm-dev'
NOTE: Runtime target 'optee-ftpm-dev' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['optee-ftpm-dev']

Therefore its better to limit this recipe to machines supporting
optee-os

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-arm/recipes-security/optee-ftpm/optee-ftpm_git.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-arm/recipes-security/optee-ftpm/optee-ftpm_git.bb b/meta-arm/recipes-security/optee-ftpm/optee-ftpm_git.bb
index 22b51f4..e30e13a 100644
--- a/meta-arm/recipes-security/optee-ftpm/optee-ftpm_git.bb
+++ b/meta-arm/recipes-security/optee-ftpm/optee-ftpm_git.bb
@@ -3,8 +3,9 @@ DESCRIPTION = "TCG reference implementation of the TPM 2.0 Specification."
 HOMEPAGE = "https://github.com/microsoft/ms-tpm-20-ref/"
 
 COMPATIBLE_MACHINE ?= "invalid"
-COMPATIBLE_MACHINE:aarch64 = "(.*)"
+COMPATIBLE_MACHINE:qemuarm64 = "qemuarm64"
 COMPATIBLE_MACHINE:qemuarm64-secureboot = "qemuarm64"
+COMPATIBLE_MACHINE:qemu-generic-arm64 = "qemu-generic-arm64"
 
 #FIXME - doesn't currently work with clang
 TOOLCHAIN = "gcc"
-- 
2.34.1



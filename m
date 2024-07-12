Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A87A4C41513
	for <webhook@archiver.kernel.org>; Fri, 12 Jul 2024 14:57:32 +0000 (UTC)
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
 by mx.groups.io with SMTP id smtpd.web11.9889.1720796244982911959
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 12 Jul 2024 07:57:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=Qznidhap;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.128.169, mailfrom: jdmason@kudzu.us)
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-65240d22f7cso19309277b3.0
        for <meta-arm@lists.yoctoproject.org>; Fri, 12 Jul 2024 07:57:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1720796244; x=1721401044; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ju6ZTvZP6+UTxISu4vrWvppJu2X30JQ16IxxjTCAsHw=;
        b=Qznidhap6//mCLVq/BuA50dMG0BnheeJuq296yGpAHJA7K5SBXBYdZJOhwLkd0YsrH
         EPKvc6hDkcuJIR1Lpoq6ELisrc9nfEzAXvKU64M0XTKLX8xM+c9I3UZWjlaUq8YUG9mh
         luhntPTgNGqFdZiN0sBPL4qyDgcffHhycNGIhTlFGCTP6PZ4x0IRN6TDPJudn+VKXByY
         jRKcMId+yBR1nDYefVg3OLG+d6WwRKvR/sBnlkkEHOxsHRtpYu+vFJ9nHyQqqDl07Tcv
         WCAQJJOArmaPEw3w/9emg8XCeNo0pHf/EAyUE2A1CChWR5zRO4O0zpdpLdcz3X39MEGf
         cB2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720796244; x=1721401044;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ju6ZTvZP6+UTxISu4vrWvppJu2X30JQ16IxxjTCAsHw=;
        b=ls4yPG4EXeYsTxGM+mB0XQbHVJj2qK4TCe7TisypkoDyor48wyX6ywYGugnExVefhL
         MZpbWp8FmizjOhBR2DBuETqQXuLh14BjpbpHSWzQND8eGmaHJHczmF6CCYMOcGBVOduF
         5pJ0R9YQC57dda9S20IxOBTG4wKjxYFK5yQm64+okr4Xd/y7n7ur+e0LbUhuLY+0dAC0
         OCLAs6gS0h5WLlh3k84B3mC1BTyqtjX8sdxysMnVLa3LIz6f+HKprmsnXYkK527/JzYi
         HdShKfRXmnKOojb4a2Mr1DzbriFyz9k+3WgBCcLjdMtmrsTqe77xZBUIai5L9P35MwCq
         zo6g==
X-Gm-Message-State: AOJu0YwYdSfxbDI5m0tLbS6gom+wRpCe3Vvj5iuI+mUCyAnGeLSI34Gu
	6iUcyhEbw8bqFiolGvQELhvpAxn+d4HG1IRsQRgJLauxHEU+dC0zwluiLE9MuvMu7gW+ifqnlnI
	=
X-Google-Smtp-Source: AGHT+IFkaaL2gctzGpc9Hf51XTcwvRPKfdlKhBi0ud0nLoaDEB9J2dFUMYggmKygxs5PRtnGtXWDBQ==
X-Received: by 2002:a0d:f583:0:b0:65b:cdab:268f with SMTP id 00721157ae682-65bcdab34d8mr84615237b3.15.1720796243763;
        Fri, 12 Jul 2024 07:57:23 -0700 (PDT)
Received: from localhost ([136.54.20.50])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-658e64ed1d9sm15140517b3.89.2024.07.12.07.57.23
        for <meta-arm@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jul 2024 07:57:23 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 1/3] arm/opencsd: update to 1.5.3
Date: Fri, 12 Jul 2024 10:57:21 -0400
Message-Id: <20240712145723.3914014-1-jon.mason@arm.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 12 Jul 2024 14:57:32 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5888

Update to the latest opencsd commit.  The previous commit was from 28 March 2024.
The commits since that commit are:
    opencsd: Update Version info and README for v1.5.3
    build: Minor adjustments to improve clang compatibility
    build: vs2022: Fix minor git tracking issues.
    opencsd: test: update tests for memacc cache api
    opencsd: Add external memacc cache interface.
    opencsd: memory accessor - update caching.
    opencsd: docs: Update man files
    opencsd: etm4: Fix packet print typo.
    opencsd: Fix error handling in snapshot loader
    opencsd: Fix error string ordering.
    opencsd: memacc: Add logging for cache pages and size.
    opencsd: Add timing to trc_packet_lister
    docs: Minor document corrections.

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 .../opencsd/{opencsd_1.5.2.bb => opencsd_1.5.3.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-arm/recipes-devtools/opencsd/{opencsd_1.5.2.bb => opencsd_1.5.3.bb} (95%)

diff --git a/meta-arm/recipes-devtools/opencsd/opencsd_1.5.2.bb b/meta-arm/recipes-devtools/opencsd/opencsd_1.5.3.bb
similarity index 95%
rename from meta-arm/recipes-devtools/opencsd/opencsd_1.5.2.bb
rename to meta-arm/recipes-devtools/opencsd/opencsd_1.5.3.bb
index cc55a3633a4f..fdd0d636e9e7 100644
--- a/meta-arm/recipes-devtools/opencsd/opencsd_1.5.2.bb
+++ b/meta-arm/recipes-devtools/opencsd/opencsd_1.5.3.bb
@@ -4,7 +4,7 @@ LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=ad8cb685eb324d2fa2530b985a43f3e5"
 
 SRC_URI = "git://github.com/Linaro/OpenCSD;protocol=https;branch=master"
-SRCREV = "5d86f27a8c0af16a473833da3a0936cd2a0999d3"
+SRCREV = "adb97189b906d524d1c3008e67e4da34aaa0397d"
 
 S = "${WORKDIR}/git"
 
-- 
2.30.2



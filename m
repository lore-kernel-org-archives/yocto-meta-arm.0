Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37305ECAAA1
	for <webhook@archiver.kernel.org>; Sun, 11 Sep 2022 07:05:11 +0000 (UTC)
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com
 [209.85.216.50])
 by mx.groups.io with SMTP id smtpd.web12.7770.1662879907306627421
 for <meta-arm@lists.yoctoproject.org>;
 Sun, 11 Sep 2022 00:05:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=CFFkbgNs;
 spf=pass (domain: gmail.com, ip: 209.85.216.50, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f50.google.com with SMTP id
 g4-20020a17090a714400b00202bb602d1dso1498287pjs.4
        for <meta-arm@lists.yoctoproject.org>;
 Sun, 11 Sep 2022 00:05:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=+bYhhgcm7g0CzxK3KbuUonpdaCRoWAhPGNIQ153lnCw=;
        b=CFFkbgNsJ6FgBzKzlS+axKz8u1alE7UN/KetVrqqQuaTX0cMtTWzh1h5LBroyV4H1a
         lc9SFqlfcR33s8nCmMYXtPIcOiTsaalz+2XcwFfVoxQUE2LrGT2/65hnSqFH4O7ItThP
         ZAWLHiGO1TDDD6jvZCY9ORfP0Memj51gX10qnuAYysI6XPoYiJjomUyPT8FDJCfMidsq
         Uhbm15FuC7sYWrqTrQep9cz2IbIIHZTqa64XvzWoiulfKzXF+X7C9w8BM8NXDAgBLTiH
         ADvqln8WOBIvWdKLMVxPfKWq5GpG8zi2+jyYQZRKbWwizYgGcDqK0aEX2ZjZfZGszXCd
         B4og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=+bYhhgcm7g0CzxK3KbuUonpdaCRoWAhPGNIQ153lnCw=;
        b=CyYhwI/ZogZITFlnFlKYAceAPFRiKI/FGQ6rvGCnJ8hh89rxpoe6ztlsz2tDcmNtzI
         gmjZwnX6SYg+ICbzU04lAKguLItWHSCTi1dL386H5TKUU5Zi5I7SidIfPz9DIku6WLlO
         +DzUjCcloc8BqCYpG7Iz6Quo+K28qrh4UO/t2i4O4iSIPrvB7C4r7cbONsFMSTmpKkrr
         sICX+yYeg7K19E496ORPCZGxlffxa0TNHm8BO2fuS1tKijfLxZxivcG0uvG10ZrrIfg+
         pBZ9OS72JO0sqV7y0+5++4tTm8oLOBjkQEie8Wbl5bPr5U2/cqh1mCpX3P0WP5pe1cnY
         OR2Q==
X-Gm-Message-State: ACgBeo37ThPD2UMPQVjxfUe/UHvhDiwMU/K1sOO+i/mKYvDZlk+kuqNQ
	FWKZVRYc4DT6w6ks4fZBmMwES5Wcfg6RFQ==
X-Google-Smtp-Source: 
 AA6agR4lYcOvS0Gzqs1Tqp1Hrlk+nxV0lIgIK7ufAf9iBgKVjFtndmb5bW+JXu+gU7yJaxJZwwkl6g==
X-Received: by 2002:a17:902:ecc6:b0:174:90c5:613b with SMTP id
 a6-20020a170902ecc600b0017490c5613bmr20460289plh.28.1662879906356;
        Sun, 11 Sep 2022 00:05:06 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::1761])
        by smtp.gmail.com with ESMTPSA id
 z189-20020a6233c6000000b005409c9d2d41sm2765237pfz.62.2022.09.11.00.05.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Sep 2022 00:05:06 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: meta-arm@lists.yoctoproject.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] ts-newlib: Pin to use gcc
Date: Sun, 11 Sep 2022 00:05:04 -0700
Message-Id: <20220911070504.1097670-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Sun, 11 Sep 2022 07:05:11 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3764

Its not buildable with clang in its current state

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-arm/recipes-security/trusted-services/ts-newlib_4.1.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-arm/recipes-security/trusted-services/ts-newlib_4.1.0.bb b/meta-arm/recipes-security/trusted-services/ts-newlib_4.1.0.bb
index 94038b5..49cbe41 100644
--- a/meta-arm/recipes-security/trusted-services/ts-newlib_4.1.0.bb
+++ b/meta-arm/recipes-security/trusted-services/ts-newlib_4.1.0.bb
@@ -29,3 +29,5 @@ do_patch[postfuncs] += "apply_ts_patch"
 
 FILES:${PN}-dev = "${TS_INSTALL}/newlib_install"
 FILES:${PN}-staticdev = "${TS_INSTALL}/newlib_install/*/lib/*.a"
+
+TOOLCHAIN = "gcc"
-- 
2.37.3



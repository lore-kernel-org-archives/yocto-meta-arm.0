Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
 by mx.groups.io with SMTP id smtpd.web08.11701.1628095309368834949
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 04 Aug 2021 09:41:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=m3oJiwmn;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.177, mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f177.google.com with SMTP id k13so1791160qth.10
        for <meta-arm@lists.yoctoproject.org>; Wed, 04 Aug 2021 09:41:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ufdlm230AkhlUX8G7TELGuM06rQ2wfEqAkXsbyGciC0=;
        b=m3oJiwmnaFNHttufwK4cm6j8ZOftAPfPafdVhARWQL79Ilm1meiM0kQ+30SZCg0/eK
         6/r5PFKESLsvHTqem1+2UsY/DcrGGTIPmiNDO4fVtSkWP8i6xR8qiEBlV7y37reJ3EKl
         un9W5PoobN1A4ahCpLhqWPj6+DTGLTokIdq8giEr7tt69qsOkq9RNRAC4RG8u8LkpNry
         Lid+NuG8lP+wmZdgUmzZHJ3XwWZp8J1424XH1FSS2+uPNYQ0mwxV0dc7VZmeFusBICoZ
         CphE2M92ICeo+FvuwIj9iK6EUYNFxrkCvhKPZug/WmH1pp+gzhPDeCNl7/ef+QNDUZGW
         VSzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ufdlm230AkhlUX8G7TELGuM06rQ2wfEqAkXsbyGciC0=;
        b=UvNgtWZQr8JohXTUIyahtPAcgONttXHcdw2YAHuwMzAhYVNDeUvZpCGxdsu4gIQozq
         rVNmoAqoHvbPXxuqNBXqGPtOKaK/9kuwbHbrZ6fJjlZswfForeUA0vTENQ617O6GUaN2
         xBwocvkTX8wDo9aCXAQIM3YzwOepNHCZzte62rHBBAvtwMNfF4uVUReyBoKRd9efDC+/
         7mgUT4DioHG4g8rO1kgsHk9jgqNhECRalFKzQVO0O+/URXAM0snccbGP7+MgoaMq3fqn
         VB8Mx9pEbFYxxGdU/ueY5lpDhVN810PCMqyP+QumIazGWpOXQLWtN710Z6j/zk8FR+Od
         raZA==
X-Gm-Message-State: AOAM531HckxZOCVOVpyqAwq6hw3u3i2pADPxQcbaUSklB5tZs6C2mYbz
	hHfM7NinO1xeSfbSka1B1ryN9ar2dk970g==
X-Google-Smtp-Source: ABdhPJwoeva8niFlqGyt+JspHpF6CAlPpb7Xl3uEgiO4eeQlNPPL37UzI6yOlcJrN5ZSVgCYgJakWw==
X-Received: by 2002:ac8:5fc5:: with SMTP id k5mr463424qta.108.1628095308315;
        Wed, 04 Aug 2021 09:41:48 -0700 (PDT)
Return-Path: <jdmason@kudzu.us>
Received: from localhost ([2605:a601:a632:4e00:5502:1c1f:b765:ad72])
        by smtp.gmail.com with ESMTPSA id m197sm1630289qke.54.2021.08.04.09.41.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Aug 2021 09:41:48 -0700 (PDT)
From: "Jon Mason" <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Denys Dmytriyenko <denis@denix.org>,
	Sumit Garg <sumit.garg@linaro.org>,
	Nicolas Dechesne <nicolas.dechesne@linaro.org>
Subject: [PATCH 2/3] CI: increase CONF_VERSION
Date: Wed,  4 Aug 2021 12:41:44 -0400
Message-Id: <20210804164145.1556-3-jon.mason@arm.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210804164145.1556-1-jon.mason@arm.com>
References: <20210804164145.1556-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 ci/base.yml                    | 2 +-
 kas/fvp-baser-aemv8r64-bsp.yml | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/ci/base.yml b/ci/base.yml
index 2113dc4941ea..15088ab8396e 100644
--- a/ci/base.yml
+++ b/ci/base.yml
@@ -26,7 +26,7 @@ env:
 
 local_conf_header:
   base: |
-    CONF_VERSION = "1"
+    CONF_VERSION = "2"
     PACKAGE_CLASSES = "package_ipk"
     LICENSE_FLAGS_WHITELIST += "armcompiler"
     PACKAGECONFIG_remove_pn-qemu-system-native = "gtk+ sdl"
diff --git a/kas/fvp-baser-aemv8r64-bsp.yml b/kas/fvp-baser-aemv8r64-bsp.yml
index 47aae84ac84b..77bddba3d3ae 100644
--- a/kas/fvp-baser-aemv8r64-bsp.yml
+++ b/kas/fvp-baser-aemv8r64-bsp.yml
@@ -27,7 +27,7 @@ env:
 
 local_conf_header:
   base: |
-    CONF_VERSION = "1"
+    CONF_VERSION = "2"
     PACKAGE_CLASSES = "package_ipk"
     PACKAGECONFIG_remove_pn-qemu-system-native = "gtk+ sdl"
     EXTRA_IMAGE_FEATURES_append = " debug-tweaks"
-- 
2.20.1


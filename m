Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C28ACAC5B8
	for <webhook@archiver.kernel.org>; Thu,  2 Oct 2025 17:40:48 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.web11.121.1759426840280249583
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 02 Oct 2025 10:40:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=AVOena9K;
 spf=pass (domain: gmail.com, ip: 209.85.210.180, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-78af743c232so1258172b3a.1
        for <meta-arm@lists.yoctoproject.org>; Thu, 02 Oct 2025 10:40:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759426839; x=1760031639; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VoUIFMboyRrIaakaAe+Oc6JF/H/yv+dDjxkZgbxgFcE=;
        b=AVOena9K1wZGqRCjCpejLVfMQQ3F4kaM2PhqTKVzfEjcQ0TWNI2I9nrnhjuPU2YKTW
         rlGLkXfIoABe1NXfu4u6GNJ1WVonmxbQXFtABaYwN4LovwELmDFpiWv8TxuTbzSpj9/S
         UovcG7RfUAZU4SsXaI2Mvik/bH83lcY+b3vEetDhL9m0DBdRS7nSNszV1IpCu4tjQlQJ
         66JnNlIRD2+642x7AsTOaYh0RbADslY1RkiQkcdRcb6zc3DEMyagjX2PhQRoPoetOhmV
         JDhXxvzbFlA61UXkLGTGdB9yfzr8WexBndtu6qxw+xBz97PV3p/wsBnaxra4nwCc9MgR
         29Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759426839; x=1760031639;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VoUIFMboyRrIaakaAe+Oc6JF/H/yv+dDjxkZgbxgFcE=;
        b=pISvIVScKwuf4kS5DXCmAMhv+U+zSwvjAvs9NQAk74n+VeASGX8V2xuo0oIBIOw2j6
         EeAELR44x4hk0DoyPyR1UH8a1jElxkE4B0Vgj6NAQroeW2i3sttS9nkAWUBqnLEd/z/5
         Pfe3WA34FD1yx5kMURZUhL1gPajDiMsRRGeYCWxlBtfbte+zu04eZRtT9Ae0oWc/D5/w
         eX2N6BK2qRqzOiIGKHSGzLvlztdDWhY1vcRJBm5REPhJ2eVE6d2M9PRY04H6Jzsl33wP
         v8D+a+UyMmdgmZ4UKWwcR+LOlk/knLqduGKwPlbW5DMWiPvo0yIT4gAqgFbZc5JQXgmK
         /p9g==
X-Gm-Message-State: AOJu0YzkQuEg/lddd22u9kBW4a/qnHyILohBOso0Dqwxykt6fP4HQWOK
	7aA1eSiMoTfCJ5U247a7wl3O0IBxFoYOOzMZICitQ72HpekaAwYAzuytkFCwirHU
X-Gm-Gg: ASbGncu3mzHJZZDViWgUp8aijcUWvHfmMkn51OtZca93TU7jfI7TwBX7sOxESF4sIA4
	6ZmtTr5VirZifcFEcPUK3ytDyFAk1Rv+M61OSFf3GBMjLB8twm9/k9pHF6rQyRrISCUBYwlTugl
	h02AllvrdpX60Al/YwFT0TwmVBEIbNz859lQuDL23CgE3DsFHZ99kozENWSryADrlOkzx2chRrJ
	VUHHDHk3I+8YBVJFrFbFw5AtqrYWHtqHQMrO+63g2YRZTDzRU1rm/cEtOqw32TZnfOt/M0piglQ
	i8798QLYj2ZNOztRPz/9aNvExIIFXnP9zJnUy0cATaIFuqTHKoqHEC3kb5zGfgK5sNP9m4GfWhq
	tO98T4K7yHe/ShiOcb++T4xesz5yxC+27f6oWqd2Bjg9zYzvTf3XKDi3xFOOuCwvDkfVQFu67xM
	z5487G1UGnAtAbonbYruKtBP0rFo/mZ/r+A2MHF3ycOvUAI365V7Its7l3BLg5LZa+
X-Google-Smtp-Source: AGHT+IHaD9+oKunKnoi/AxXhJ0+N0IOKa2+yZ1iY+jHYCg/LXCBPuk6dAjjjHhtSGhNJwXzu1U67KQ==
X-Received: by 2002:a05:6a20:e291:b0:2fb:62bb:dec with SMTP id adf61e73a8af0-32b6209a1f4mr346720637.39.1759426839324;
        Thu, 02 Oct 2025 10:40:39 -0700 (PDT)
Received: from apollo.tail3ccdd3.ts.net ([2601:646:8201:fd20::d851])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b609be239c5sm2172132a12.19.2025.10.02.10.40.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Oct 2025 10:40:38 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: meta-arm@lists.yoctoproject.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] gn: Delete
Date: Thu,  2 Oct 2025 10:40:32 -0700
Message-ID: <20251002174032.2468681-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 02 Oct 2025 17:40:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6723

Recipe moved to OE-core

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-arm/recipes-devtools/gn/gn_git.bb | 46 --------------------------
 1 file changed, 46 deletions(-)
 delete mode 100644 meta-arm/recipes-devtools/gn/gn_git.bb

diff --git a/meta-arm/recipes-devtools/gn/gn_git.bb b/meta-arm/recipes-devtools/gn/gn_git.bb
deleted file mode 100644
index abc81a95..00000000
--- a/meta-arm/recipes-devtools/gn/gn_git.bb
+++ /dev/null
@@ -1,46 +0,0 @@
-SUMMARY = "GN is a meta-build system that generates build files for Ninja"
-DEPENDS += "ninja-native"
-
-LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=0fca02217a5d49a14dfe2d11837bb34d"
-
-UPSTREAM_CHECK_COMMITS = "1"
-
-SRC_URI = "git://gn.googlesource.com/gn;protocol=https;branch=main"
-SRCREV = "4ce861fc06ec87ff74eb6a17ebbd55e4755ebdeb"
-PV = "0+git"
-
-B = "${WORKDIR}/build"
-
-# Map from our _OS strings to the GN's platform values.
-def gn_platform(variable, d):
-    os = d.getVar(variable)
-    if "linux" in os:
-        return "linux"
-    elif "mingw" in os:
-        return "mingw"
-    else:
-        return os
-
-do_configure[cleandirs] += "${B}"
-do_configure() {
-    python3 ${S}/build/gen.py \
-        --platform=${@gn_platform("TARGET_OS", d)} \
-        --out-path=${B} \
-        --no-static-libstdc++ \
-        --no-strip
-}
-
-do_compile() {
-    ninja -C ${B} --verbose
-}
-
-do_install() {
-    install -d ${D}${bindir}
-    install ${B}/gn ${D}${bindir}
-}
-
-BBCLASSEXTEND = "native"
-
-COMPATIBLE_HOST = "^(?!riscv32).*"
-CFLAGS += "-Wno-error=maybe-uninitialized"


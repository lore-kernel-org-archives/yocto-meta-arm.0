Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
 by mx.groups.io with SMTP id smtpd.web11.305.1593787957183018824
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 03 Jul 2020 07:52:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=UIebIS5D;
 spf=pass (domain: gmail.com, ip: 209.85.210.174, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f174.google.com with SMTP id a14so9505633pfi.2
        for <meta-arm@lists.yoctoproject.org>; Fri, 03 Jul 2020 07:52:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=MBo3zS4qnUIkpUYmtV6S2D66bJYqLusMj/nnP4zRzvk=;
        b=UIebIS5DIBKtrdt5pmtVNNOWnkmHqdHaaSHEwj5beTGGYpF6uQm4BSu1wQjMMSzjR3
         k9VL72SFAg4mhktl60OiPC+ho4DHRPGNgPNGr4qbYy1aezhLpzBS0qdW3wmuMyCb+WNG
         jBgYXJJBg6Oc1ZCf8/ifyKWyT/mD6HO0nXYU5Udh4lHWv3ahFT8jOHxUK9TjSKINkkFn
         cyPGxlRRycBGrCB/C798/LpBN+g0ARTHCiadmHP6EYpSNmL6ppTr6mdDO28ZeJtF0auv
         3F2M/XUsAtv8suTAptmVPl7w9A/sX4ZhvN9hPzMUgogcFn3w97NkuDLzT1yaa8hzm0K8
         rTPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=MBo3zS4qnUIkpUYmtV6S2D66bJYqLusMj/nnP4zRzvk=;
        b=V0CyqwCGIFb9fLxo5hegRfyYelhMv8pfiuKmpo0hymbP1Gcrcg7B5aEmeURYgNHosl
         WkAT6B5aI6+yCuuzfhqgwZzTDOJcO6p3emlq2MvIPtaFHoGhk+GR5/RBoTJwNLspugQv
         j0v0p0bNoJM7qu8bHxp3EecWF+6xkkqwifcoeO3oA/0oh0gKZt841i0IzZd8K9Wh59z+
         rYxHhfBgUyVPxQlbQweXX9y5PTODj0RCXg4hIXGPubu6FC+A46Fi9Sq7bctZzzBkjc2D
         GkjFSccjEX9EClsScl2IZuLP9hJTrcK/BXjttw5YGrdMah7hwGi/YHOIbEN/nY7AD6UL
         J1vA==
X-Gm-Message-State: AOAM530+9cwuOzrExPhck1wwIZsZkeFhbljGQmdHO+uTXqEU8/TBHGe+
	ZkpCOIGCHeM1vpBuurWVpCCujcYsyBM=
X-Google-Smtp-Source: ABdhPJwQgWx1hASjfVUnEIUhP8zegScJmF+Z7U1MHVTRsD5UXfSYCRYmpX8rOOnZyH332bCioYIEIQ==
X-Received: by 2002:a62:6286:: with SMTP id w128mr32612611pfb.117.1593787956105;
        Fri, 03 Jul 2020 07:52:36 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::b49a])
        by smtp.gmail.com with ESMTPSA id b10sm11710147pft.59.2020.07.03.07.52.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2020 07:52:35 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: meta-arm@lists.yoctoproject.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-arm][PATCH] meta-arm: Use dynamic layer magic to build trusted-firmware-m
Date: Fri,  3 Jul 2020 07:52:33 -0700
Message-Id: <20200703145233.2494070-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

trusted-firmware-m needs arm binary toolchain to build from another
layer, this is the only recipe thus far and its better to hide it to
majority users who may not be using trusted-firmware-m and thusly
meta-arm-toolchain, folks who need to use trusted-firmware-m should
explicitly add it to layer mix

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-arm/conf/layer.conf                                    | 6 +++++-
 .../trusted-firmware-m/trusted-firmware-m_1.0.bb            | 0
 2 files changed, 5 insertions(+), 1 deletion(-)
 rename meta-arm/{ => dynamic-layers/arm-toolchain}/recipes-bsp/trusted-firmware-m/trusted-firmware-m_1.0.bb (100%)

diff --git a/meta-arm/conf/layer.conf b/meta-arm/conf/layer.conf
index 10a7951..2d0c49f 100644
--- a/meta-arm/conf/layer.conf
+++ b/meta-arm/conf/layer.conf
@@ -11,6 +11,10 @@ BBFILE_PRIORITY_meta-arm = "6"
 
 LAYERDEPENDS_meta-arm = " \
     core \
-    arm-toolchain \
 "
 LAYERSERIES_COMPAT_meta-arm = "warrior zeus dunfell"
+
+BBFILES_DYNAMIC += " \
+    arm-toolchain:${LAYERDIR}/dynamic-layers/arm-toolchain/*/*/*.bb \
+    arm-toolchain:${LAYERDIR}/dynamic-layers/arm-toolchain/*/*/*.bbappend \
+"
diff --git a/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m_1.0.bb b/meta-arm/dynamic-layers/arm-toolchain/recipes-bsp/trusted-firmware-m/trusted-firmware-m_1.0.bb
similarity index 100%
rename from meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m_1.0.bb
rename to meta-arm/dynamic-layers/arm-toolchain/recipes-bsp/trusted-firmware-m/trusted-firmware-m_1.0.bb
-- 
2.27.0


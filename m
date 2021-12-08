Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59484C433F5
	for <webhook@archiver.kernel.org>; Wed,  8 Dec 2021 20:58:15 +0000 (UTC)
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com
 [209.85.215.179])
 by mx.groups.io with SMTP id smtpd.web08.2241.1638997094017452342
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 08 Dec 2021 12:58:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=OTFySrDZ;
 spf=pass (domain: gmail.com, ip: 209.85.215.179,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f179.google.com with SMTP id r5so3112365pgi.6
        for <meta-arm@lists.yoctoproject.org>;
 Wed, 08 Dec 2021 12:58:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=DMkx9Car8a1G3IzTzgg/mTUxwzaKAFVSjsbm7BRJewE=;
        b=OTFySrDZgDll5mCtrkIRv47jKnBue7yC2Op49L5UFs8QrWmWeCdQBt4C3QzTxhPhRX
         HuHjXWVRiuG5/+AsM+qXug3TkQlkPeM6Nn28TDajx1FdFyS3y9u34gdD7DrTg50MCm/L
         buGtXJ6z/LBok6CvoJC3aPaxcsHHt6b6cTgZB39SxjzPUOG5crv9ZkMCxVsmz0PHk9P7
         cZ1TnhmTsKJx/y81GdSpCCbbmCqWxhVUgZVx3uGfU/NxqwENsl+uEaoiGu+JQrccy0Lh
         0ZZCEN+OkkUj7ofWqI9JBfmMd6hGxu0aqw6eQVu3MtRYERwaNsEtaKqe6dOz/UH+oPgv
         nv7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=DMkx9Car8a1G3IzTzgg/mTUxwzaKAFVSjsbm7BRJewE=;
        b=MhyyWoKxGQ5QY4ckCvEryC9wgJ4yNHRp2LFgtT3qxFC52m7lImvS7gwx16g7ub1zvO
         PypcozYz+qeru5KyHhflSbBw+uBtxC/le+/LQXQ2AUwMMiBHC+BxHwOfOm3tUi1Byl25
         QK5s5z8v5/JJhs3C6lnh9hKEZSsT2u6rFO8pmcRiB+dRG99J2wduFYu5Ic2/4KqkG0rm
         +x83yyaxK8LG99BQXF1sXOI3TNAeoaho31vGiVRQj0roMIdnK8W26cyFiFFInK/0x4Dt
         7sx254JbAqnxz3daPFWeISHS1MavPbI39sZalsqJ5KEINeVGzWctblY/5M4MFkMOss8m
         3yGg==
X-Gm-Message-State: AOAM532DkQ6B5WCQtQnmSHNJ2vIcQWAp5gITADaDhO7Thnj+AzbZhaHW
	4rUUr0mryp5B5tlp/rw+10lWbvq4R/AyMg==
X-Google-Smtp-Source: 
 ABdhPJwQLwlpviDLjDi37pNEi3JwjrmoQJAx7U7mXrrX7vLiBoxabzMUABR4txN8mIA5J5O77Ydt1w==
X-Received: by 2002:a63:e43:: with SMTP id 3mr31759092pgo.73.1638997093265;
        Wed, 08 Dec 2021 12:58:13 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::ce68])
        by smtp.gmail.com with ESMTPSA id
 ot7sm7272482pjb.21.2021.12.08.12.58.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Dec 2021 12:58:12 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: meta-arm@lists.yoctoproject.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] trusted-firmware-a: Pin to use gcc for now
Date: Wed,  8 Dec 2021 12:58:09 -0800
Message-Id: <20211208205809.3079680-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 08 Dec 2021 20:58:15 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2572

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.6.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.6.bb b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.6.bb
index ec1bec9..dd8fd44 100644
--- a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.6.bb
+++ b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.6.bb
@@ -10,3 +10,8 @@ SRC_URI_MBEDTLS = "git://github.com/ARMmbed/mbedtls.git;name=mbedtls;protocol=ht
 SRCREV_mbedtls = "e483a77c85e1f9c1dd2eb1c5a8f552d2617fe400"
 
 LIC_FILES_CHKSUM_MBEDTLS = "file://mbedtls/LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
+
+# code bloats with clang and results in error below now
+# | aarch64-yoe-linux-musl-ld: region `PMUSRAM' overflowed by 3928 bytes
+# this needs fixing until then use gcc
+TOOLCHAIN = "gcc"
-- 
2.34.1



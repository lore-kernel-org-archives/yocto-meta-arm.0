Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03EFBC43217
	for <webhook@archiver.kernel.org>; Fri, 25 Feb 2022 05:08:09 +0000 (UTC)
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com
 [209.85.160.176])
 by mx.groups.io with SMTP id smtpd.web12.3606.1645765687760949075
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 24 Feb 2022 21:08:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=FMrFGZoA;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.176,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f176.google.com with SMTP id w1so1533433qtj.2
        for <meta-arm@lists.yoctoproject.org>;
 Thu, 24 Feb 2022 21:08:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=jCnfu0V2go1sedmW72VDobcl9iGsgqKLjBdLXahfwTE=;
        b=FMrFGZoAA9bR1g20RReV+eZrGWuSoFrcMloCMYzkJa7uO7SNJIrZTyXTV3czUZNeZ4
         Sze99dGHjijsCBxZMUpZYXbN3loMPKAIIUwMQbKJ9vVcWiyjgPOFyiN9cajbZQnJLVA8
         z2QokGr+xy/vCP3evxjeu331KEXZ3+Dz3G+FO4hDb7KDr1YJvULhYg/2qqc7aZh7VvGl
         FLdSRL1ShTLkBPWGqJwVA7OvCK/TBAA+g7zvKGf59yMrlno7KlTDOpV3VjVU//Z30bMK
         Pj37srjSa2KbNYa1JleQiWougt2RDTKwkttdC5sKflRV37a8Gyd1uUhYBmUX7ZEjIYsl
         /o9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=jCnfu0V2go1sedmW72VDobcl9iGsgqKLjBdLXahfwTE=;
        b=K4WLgFYY5ZnjYxBgYXYhvBxvMjlq4pWF4Do+PkdI1uz43l7smwcEs2LzN06aHaqZfF
         SKxV30zVGDXqwzOFPYIO1UFtmE7mvSG/F6sfsyQmfWaXCvsECsRx0JnjeU8T7LfASIa1
         vfsKBfvskyMT58vwpTQQiY0WE9xNSnODrT57kbpD4njTHYt2goxcmhyODRykBzjpL9wj
         cmMxLZhz9ooTF7LvQKDF4/zSk9TlvC2BEXU3nMSRAHLFAH9kzFKBsGWovhE4f8avbr2G
         lOSRs5LpNxPHY1rf1hpOCzufMrgh8LAYIhyq1SZ5zGnAsUXT5UaiIggcYYvNAgEHdA7S
         79xA==
X-Gm-Message-State: AOAM533xJWT3VO/1kb3iETpjkzlvye7TySnEmWNeYEMZTPKzBtgyvHgd
	K+rGqNlmn9j/caEkqGPvoNtCpSsI0mO9Ew==
X-Google-Smtp-Source: 
 ABdhPJwhODMpNFOiveqGOwAM8xkgZH0DdsSoc8YKMgj7vlUPzCkKLIbhcGzcEosid66cv7/YIsn01g==
X-Received: by 2002:ac8:5710:0:b0:2de:9197:1cf1 with SMTP id
 16-20020ac85710000000b002de91971cf1mr5532813qtw.569.1645765686746;
        Thu, 24 Feb 2022 21:08:06 -0800 (PST)
Received: from localhost ([2605:a601:a665:9200:97ee:8b84:aa35:fed0])
        by smtp.gmail.com with ESMTPSA id
 v26-20020a05622a189a00b002ddd1f76c2fsm904004qtc.17.2022.02.24.21.08.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Feb 2022 21:08:06 -0800 (PST)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Ross Burton <ross.burton@arm.com>
Subject: [PATCH 5/8] arm/scp-firmware: disable clang builds
Date: Fri, 25 Feb 2022 00:08:00 -0500
Message-Id: <20220225050803.2517279-5-jon.mason@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220225050803.2517279-1-jon.mason@arm.com>
References: <20220225050803.2517279-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 25 Feb 2022 05:08:09 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3062

From: Ross Burton <ross.burton@arm.com>

We only build with our binary GCC right now, so disable clang from
trying to get involved. This solves the missing strip problem where
do_populate_sysroot wants to use llvm-strip but it hasn't been added
to the sysroot.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-arm/recipes-bsp/scp-firmware/scp-firmware_2.9.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-arm/recipes-bsp/scp-firmware/scp-firmware_2.9.0.bb b/meta-arm/recipes-bsp/scp-firmware/scp-firmware_2.9.0.bb
index 89d4a34f1c16..f95d968f668c 100644
--- a/meta-arm/recipes-bsp/scp-firmware/scp-firmware_2.9.0.bb
+++ b/meta-arm/recipes-bsp/scp-firmware/scp-firmware_2.9.0.bb
@@ -19,6 +19,8 @@ SCP_LOG_LEVEL       ?= "WARN"
 
 INHIBIT_DEFAULT_DEPS = "1"
 DEPENDS = "virtual/arm-none-eabi-gcc-native"
+# For now we only build with GCC, so stop meta-clang trying to get involved
+TOOLCHAIN = "gcc"
 
 SCP_BUILD_STR = "${@bb.utils.contains('SCP_BUILD_RELEASE', '1', 'release', 'debug', d)}"
 
-- 
2.30.2



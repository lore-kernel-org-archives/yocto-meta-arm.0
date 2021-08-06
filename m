Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
 by mx.groups.io with SMTP id smtpd.web09.3081.1628285788746681871
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 06 Aug 2021 14:36:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=egMwEB3r;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.48, mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f48.google.com with SMTP id em4so5706747qvb.0
        for <meta-arm@lists.yoctoproject.org>; Fri, 06 Aug 2021 14:36:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=3j1iDToruvFGRw09/O+4YtAnlwz7a2XSjf0LFi6WezM=;
        b=egMwEB3r+bM6xk8JLTBzTeYCyBAgYmM62yk54ASV6rMFruQPpKvUakwTDlcNRbazwO
         azZXpVYmtzAMJ/NwQyUqOcrjb1gq9DoCFi2U8wisNu1BtauVPhb4Wa94YMTGqIgkoOsG
         jdJuu5uKs6XYbr+uK6nwh95aO4e8wwequAigC6/HQYvw6q4fFH9O/nBOG6e0wJEs58qC
         /y2kLLb+FN1p0XVHdBCaJA1r583f30t/edpjhkahfI0ON+7Bni13JYcdLz0kk+AXc0eY
         t7t+vXdCNrtYnZFFYGCRHNQhtcKZntLK2nxborMrGnhe2bLoCRGFjRJ+xIhBV9yeureb
         oN+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=3j1iDToruvFGRw09/O+4YtAnlwz7a2XSjf0LFi6WezM=;
        b=K9FTQZm8GDtmM0SfXzMRSiQB/JHklLMc8PLc+3eTAq4+XmXs0AyeWtQIW+ao8jUq72
         lcpVSHPs1isOrPzjRDsTWDQ/yfZX+Ukaba50jAeHo/ABh9kxLB1XspQpqSoBHL1j8bYK
         H81lS33g4kpbuCTCeoUSrgti3+M9DMkSmB5ImQ0IAm5qbg07VIh60KyO9mHICEavk+QX
         HhfmiLT7LsadipYjQuH6dasD1ed+zqsEIZdXxo+mWO8EMIA1FMlWLNMZEZ3aRgRHpqpv
         VmUBEJPGWBKAhxolfEVyAF7fzfqKAfhgAyrG9b90UvMLW+/25oV3oOA9qAsw2N176IZh
         Q8sg==
X-Gm-Message-State: AOAM5301kiwlaasDA7CzIRElAwk4j7dMW3bef77LjUG+PS+ZOkmrXXYW
	83vU62OvbQqovYBvFTwDoWWiB9kM6cpELQ==
X-Google-Smtp-Source: ABdhPJw6M5FxUYpugkmhsQZ15DgMpbEeJUG8KJ2Ulw6ZMkajcqjfna4UUihlaUff+plqWDRYqoMsuA==
X-Received: by 2002:a05:6214:1585:: with SMTP id m5mr13069662qvw.48.1628285787871;
        Fri, 06 Aug 2021 14:36:27 -0700 (PDT)
Return-Path: <jdmason@kudzu.us>
Received: from localhost ([2605:a601:a632:4e00:59e3:c3e7:7bac:fd79])
        by smtp.gmail.com with ESMTPSA id a8sm4353278qkn.63.2021.08.06.14.36.27
        for <meta-arm@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Aug 2021 14:36:27 -0700 (PDT)
From: "Jon Mason" <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 4/7] juno: temporarily pin 5.4 kernel version
Date: Fri,  6 Aug 2021 17:36:21 -0400
Message-Id: <20210806213624.22981-5-jon.mason@arm.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210806213624.22981-1-jon.mason@arm.com>
References: <20210806213624.22981-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Recent changes in the 5.4 kernel are preventing the juno patches from
applying.  Temporarily pin the kernel to the version prior to this until
the patches can be rebased.

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc b/meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc
index 5c547b7e2854..e66fd5fba1ff 100644
--- a/meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc
@@ -48,6 +48,10 @@ COMPATIBLE_MACHINE:juno = "juno"
 KMACHINE:juno = "juno"
 KBUILD_DEFCONFIG:juno = "defconfig"
 KCONFIG_MODE:juno = "--alldefconfig"
+#FIXME - temporarily pin kernel version to allow for juno patches to apply
+KBRANCH:juno = "v5.4/standard/base"
+KERNEL_VERSION_SANITY_SKIP:juno = "1"
+SRCREV_machine:juno = "dd8a64a523fb714a98328441e0de72cde115a6fc"
 FILESEXTRAPATHS:prepend:juno := "${ARMBSPFILESPATHS}"
 SRC_URI:append:juno = " \
     file://0001-mailbox-add-support-for-doorbell-signal-mode-control.patch \
-- 
2.20.1


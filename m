Return-Path: <floss@jetm.me>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7613AC624D4
	for <webhook@archiver.kernel.org>; Wed,  2 Sep 2026 22:03:45 +0000 (UTC)
Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com [209.85.221.182])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7165.1788386616702052479
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 02 Sep 2026 15:03:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@peridio.com header.s=google header.b=xD1Coip1;
 spf=pass (domain: peridio.com, ip: 209.85.221.182, mailfrom: javier@peridio.com)
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-5c6652323adso96300e0c.3
        for <meta-arm@lists.yoctoproject.org>; Wed, 02 Sep 2026 15:03:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=peridio.com; s=google; t=1788386615; x=1788991415; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3mQo2S2alymy8IlTtLGT/Fgg1WLaKuRJVzXs/47Qu3E=;
        b=xD1Coip1/P1KWdJO9DwWDEY/WAqFep6+rGDWh35LkgATSHuSKVOWf6oFz4yIc7ubpy
         S80Eq8QxQcY8TGPdCEabGXGxqOLhxM1vMXcGUjNyxu2PatNv0XWvdbvxN5U4W+EcMhZP
         EYvD+0JRRUGG80OrcS0mfySK7Ekm4x6LEcLWJ8inz4iEZfodTNPZ6Zbb6q3PT6CaNpvp
         y9KZxZoxBY4Hy4O5n+SRQgTicYDan6rnzB1hiDHHqVcCWWt/DDfV/P5E3CRVGTmtpnic
         OCnfgjYK7d4trySqIspQh/BGsQGffQjdECHCISE19pfJsQNlRJJO95+ObbSL+/5V23n4
         6yaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788386616; x=1788991416;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3mQo2S2alymy8IlTtLGT/Fgg1WLaKuRJVzXs/47Qu3E=;
        b=nISSn4vX43Ee/hLEBtq/DAkiSMX6hudcyx/zdK6mmLHHYu+itizDIQzsAfqfLpN1qm
         IhRYyGJsF7LntIvMFYCtNIpr5H51c+kDV/mdP6fOavtEu9BoVlQCVobEcVHSUooYFdfr
         xx9O7rEnPIgCd3xifhE97l1QaUAu2HDrO79R0i0t3+9x6HYvuc6KHNZOCOR8fWNzYQtn
         RHZiF/DqMFBsvLLBkwF8XNBXmP1+fJPquN/w+U/kgrDdvb4fEI+T4Rc++b5ZpuQKTKSw
         +etLmLFmXlj1FMught0ByahjQcHzitQ9Em74Idm6zT7N0FMhWBQpgQDU10FSZeTa+IqQ
         ROog==
X-Gm-Message-State: AFuF++mdRQyhjvWqBXPsdzPtAbKE4cUBh0arjxbXf8v99sUfk1MCTDGy
	iyKX3tb67yCzGzDdmyc9SOiWqb4AD7QZppTyL1sq16RAtUBu6uie8AsmujYBoyxUYHRYmTklblu
	eKVVT/7s=
X-Gm-Gg: AYBFou3eEQ5vj4aOdxHdyAV22a81lO1C27Ai3JEIuQdMpQ3pgsewMSzFR4xDtbPZzNN
	K54TfqKC2e4g2DiLumzbcW3V/9FK25WhuafNO0kBrLoyJ0JgxIGnbNGB4z9HyoSGLsH9by2+CsQ
	vKCjzG3Xj0kUJfp7tS/lq2WPkWczoCnMt26a1pWJs78VhBsTbdql2tYhuM6LXJHcZ5e0wbJVD+J
	0dEs6wW480VDf3A6fh+Ut/6+hxKVyeWuF+/EN62lX+7xl0aVmNBlTk6H838EADYCVqNNQjfAssN
	GKx6NXqkUoP37wAWzmwh88IlENjw6k7D8jsipRFmLHsu60rXeZUX4546Z6oEHG3pO6b+CsNMBHk
	nzbDqlKd+NLDx3a3jbL8bLLzs9egoUzsez9R3s95SBH7lGS5wnFKrSpe9swB6sRhAx5F7+o7Nwt
	kPb6n5kpCCLHOXvt8bPtVZwY25hzSaQmSWh10aW0QR/DuOVj6c8Ut9ku1E4PcxMqoCe/ytuJJa2
	Otspw==
X-Received: by 2002:a05:6102:149c:b0:787:74cc:2b68 with SMTP id ada2fe7eead31-78a1f5dd312mr1255038137.1.1788386610644;
        Wed, 02 Sep 2026 15:03:30 -0700 (PDT)
Received: from localhost ([190.113.101.40])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-980672f9fc1sm3388962241.7.2026.09.02.15.03.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 15:03:30 -0700 (PDT)
From: Javier Tia <javier@peridio.com>
To: meta-arm@lists.yoctoproject.org
Cc: Jon Mason <jon.mason@arm.com>,
	Javier Tia <javier@peridio.com>
Subject: [scarthgap PATCH 1/3] arm/optee: modify CVE_PRODUCT
Date: Wed,  2 Sep 2026 16:03:24 -0600
Message-ID: <20260902220326.2780674-2-javier@peridio.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260902220326.2780674-1-javier@peridio.com>
References: <20260902220326.2780674-1-javier@peridio.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 02 Sep 2026 22:03:45 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/7150

From: Jon Mason <jon.mason@arm.com>

Per https://nvd.nist.gov/products/cpe/detail/EB42962B-24FD-4716-B3E2-69F3258A57CF
adding "trustedfirmware:op-tee"

We can probably remove "linaro:op-tee", since it has been depreciated.
Fearing unintended issues, leaving it in for now.

Signed-off-by: Jon Mason <jon.mason@arm.com>
(cherry picked from commit 81f5a92193d37027670f2c9b767ccbcd29d1e78c)
Signed-off-by: Javier Tia <javier@peridio.com>
---
 meta-arm/recipes-security/optee/optee-os.inc | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-arm/recipes-security/optee/optee-os.inc b/meta-arm/recipes-security/optee/optee-os.inc
index 80ac0097..09ce79de 100644
--- a/meta-arm/recipes-security/optee/optee-os.inc
+++ b/meta-arm/recipes-security/optee/optee-os.inc
@@ -8,7 +8,9 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=c1f21c4f72f372ef38a5a4aee55ec173"
 inherit deploy python3native
 require optee.inc
 
-CVE_PRODUCT = "linaro:op-tee op-tee:op-tee_os"
+CVE_PRODUCT = "linaro:op-tee \
+               op-tee:op-tee_os \
+               trustedfirmware:op-tee"
 
 DEPENDS = "python3-pyelftools-native python3-cryptography-native"
 
-- 
Javier Tia



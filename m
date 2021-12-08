Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91933C433F5
	for <webhook@archiver.kernel.org>; Wed,  8 Dec 2021 20:17:36 +0000 (UTC)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com
 [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.web08.1684.1638994655943824794
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 08 Dec 2021 12:17:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=qsXcqFnX;
 spf=pass (domain: gmail.com, ip: 209.85.216.53, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f53.google.com with SMTP id
 n15-20020a17090a160f00b001a75089daa3so5199499pja.1
        for <meta-arm@lists.yoctoproject.org>;
 Wed, 08 Dec 2021 12:17:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=3S31z+z0TgGl74G0sGsKxtd9ivn//XwQFBCktAM+9k0=;
        b=qsXcqFnXEkFkBPx3nDGr4widsd5iSvKcrIDRz4yqtSiRb6XzjRtQ7cqjzN5vcV+7LH
         dghadauvfTc52ukmasOWQFvedMVhWeHiBAGIztZEMTWX0qWNx61Vn8S/LSYlkpuaMSLN
         SOk1PyfSuXkh+AnIvwMHam1NCEgwq+bTpP2Eh4C2yoGfFzj/Xv1kqgNqBu5UgWh7IDqh
         /zN8zKIRWI/UhOihMYQz0x5Wsv+bxPoR9J9xxbqFTBVxOd8i0MNLeymk0cO8VNFKy+rl
         r/rabckMIpZ/AaaoZK/tw66+4A5cBLjptHR3vRQ/c7tbzYbTe4T9Wh1BDGo+OInKtNZS
         3vig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=3S31z+z0TgGl74G0sGsKxtd9ivn//XwQFBCktAM+9k0=;
        b=XYdVX9geeVZN5CodoCRL6wQ+KpAZWxiTKyM0RXPoAQDSmK9m7U0Pkd4Q3jSxE1jUtH
         6LicbPmlPeUQ+w4J8sTAKM8pigZT9mthhzcdqVkPHPstbDrQkgrJA5oG9r9mezuzzQym
         Nu0p8XcEeop1Us99+P3G2WFUI5bXpGgqj6zhtWRZtiFjF7vr3zhg2ISAji1ZWWkewRTH
         NpABjbrd97ELeXlTPu8cADpnYUpTbzsIKj/GWm0vGaUcmgufpvTHzwp0m1dpTJa2T3oo
         q/nat0v/mMb1c3kIfbN1BhLg+ybIpb9Wq4RYaUSPDG/VD2djawKCPUF3ypR2Ao22Gf/6
         uyNw==
X-Gm-Message-State: AOAM530JJUk1mIqt8tUGnCo8qHca+L2dPovpS1oxtcodZjn74dYP/pPk
	udo8Pe9zBPHAjcjJP7iTOXCEmxsGLXciFg==
X-Google-Smtp-Source: 
 ABdhPJySpmtuqfR9Nvvb2WaqnUtjXZGfQki7QsVrWuNPI/RlTpTXb38x3FTjFRePLBPTsMkebtndwA==
X-Received: by 2002:a17:902:d2cf:b0:141:b347:df9d with SMTP id
 n15-20020a170902d2cf00b00141b347df9dmr61257854plc.37.1638994655066;
        Wed, 08 Dec 2021 12:17:35 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::ce68])
        by smtp.gmail.com with ESMTPSA id
 o2sm4772686pfu.206.2021.12.08.12.17.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Dec 2021 12:17:34 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: meta-arm@lists.yoctoproject.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] trusted-firmware-a: Mark qemuarm64-secureboot as compatible
Date: Wed,  8 Dec 2021 12:17:32 -0800
Message-Id: <20211208201732.3000425-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 08 Dec 2021 20:17:36 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2571

qemuarm64 fails to build since PLAT=invalid when MACHINE=qemuarm64

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../trusted-firmware-a/trusted-firmware-a_%.bbappend            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend
index 45c6e92..71055e1 100644
--- a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend
+++ b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend
@@ -1,4 +1,4 @@
-COMPATIBLE_MACHINE:qemuarm64 = "qemuarm64"
+COMPATIBLE_MACHINE:qemuarm64-secureboot = "qemuarm64-secureboot"
 COMPATIBLE_MACHINE:qemu-generic-arm64 = "qemu-generic-arm64"
 
 TFA_PLATFORM:qemuarm64-secureboot = "qemu"
-- 
2.34.1



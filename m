Return-Path: <floss@jetm.me>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BC81C624D7
	for <webhook@archiver.kernel.org>; Wed,  2 Sep 2026 22:03:45 +0000 (UTC)
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com [209.85.222.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7166.1788386618331527008
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 02 Sep 2026 15:03:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@peridio.com header.s=google header.b=tLTZoMXh;
 spf=pass (domain: peridio.com, ip: 209.85.222.49, mailfrom: javier@peridio.com)
Received: by mail-ua1-f49.google.com with SMTP id a1e0cc1a2514c-97cbbb08299so53533241.3
        for <meta-arm@lists.yoctoproject.org>; Wed, 02 Sep 2026 15:03:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=peridio.com; s=google; t=1788386617; x=1788991417; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cYq/kz2HvnNCqJYnHU2Mghg+nmBHyTFdQpH5IOj1zQg=;
        b=tLTZoMXhtgbMC9w5iZ/4uc2MB1O219CRIEEzKMcP6Y1SfqFqRJzVpyC3LRUpHzVx7r
         0lCiwY8t+8h0Tc8Ht4M/rGb4IX6J/UnWCv8HsFqwd+ULO+OoDFQtLPNA7O9znsSk+E97
         9zjItC3p4WMVVu+kVzdIIozugy8Ss/V3R74Ipu26IGXTUD6kKuo2zSWD72LY1cQavfRx
         c9B9N30tV0e+uoAvkF5BDZB6B9A/W5CwI8JJglvBHgz05aud3k4VVPOntxal23eQlACY
         EfQg38jOeGinahnvhuCn0FnMogUzT8hRHldj71ag/9ynBAP8j27zk6NGFqL+JzH+1Aur
         LGzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788386617; x=1788991417;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cYq/kz2HvnNCqJYnHU2Mghg+nmBHyTFdQpH5IOj1zQg=;
        b=hc9wj048tvqThryBMTJgvEii7xJRICZVJDOls1Oy8k2+0XgiE3vKpdQ0Zc7vA//2eW
         6gp7MYZK2lUuJVf6pY0KqIkdIhjU/FfXeoxzZWEuWGLNmQ8ABpkD2UrK+lgJCWt9hW8m
         Cn+D5m162HtHml6PcBTkZd7frfAwSgJu6p3v1xkv4fusK+bxHSL6OFPQsbSzp1iiK2HR
         P21Vv0lMfmtI9Zj4GbmP8cnRL8IGMPnWaHjpa1XkShkGQg1krtsCVYy+6JmTUzumCymR
         eQuKSP+654IOKRA3HJ9YpPLz/TSBk9go+sP8AbdE5gX0HWKvrwx9hgVoS9eFQXwaUwkR
         fNKg==
X-Gm-Message-State: AFuF++kxIcrUjNVm2a0HA+jMkB7L6owqaZ8+c7iWOu8jvArxfkwNaHGT
	dQxalI/AOQRfuEV5USbYQyFYoRVWeZ67aO+KHFnjipwqK1DKZWpQzqA+conIC2IGoPadDUw4IKs
	OyfWzXWc=
X-Gm-Gg: AYBFou1LM1TZndJYSiXnytEynPgU3KT9tjBH1QN9OQY5aMzPvuOznmhxA1iOVbDfMxL
	0/ckQ8RUFVS83Y9Cg5Qyr+Gs9cyA1c9fko1QGmdxuudQmu/5+tDT50P9RI6bElmvLbNu4HSASWE
	HVC+nbj2+re3SgpOL7GJDN0Tr6eJYB0akKk8TRcAtuutsV1A4op5VykIWOEy7J0FfIBbGne6iB1
	Fl0Wp+xdgoUbd2Dg7jqmwnz80Mse5Nxt1M58KPY57cWbCcysAe4iciFNKN2FkReeoBiOqtEyEiX
	zBRw2jkknMkPPP9aWeQBZeFxCE++R0Vj0JIagzXt9aYnMjRlx2iKwKViqyFSzabWq/2aypL9za3
	yEwd46+BHyFXH7mhXTl3BgJGW2R6naLxT43zLJffLb6bB8mo00utzpmxJycg0V+ex++yAyCZzCF
	6YrDcN6qiLU4tIcm5zHBb26MiHBWGPmJWR7eqx7bm77pX+JiDhuWZMhEvZB/EFSqC92pVh
X-Received: by 2002:a05:6102:6884:b0:786:8d84:5aca with SMTP id ada2fe7eead31-78a1f339246mr1454930137.2.1788386612432;
        Wed, 02 Sep 2026 15:03:32 -0700 (PDT)
Received: from localhost ([190.113.101.40])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-78a1a1feac0sm3367682137.2.2026.09.02.15.03.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 15:03:32 -0700 (PDT)
From: Javier Tia <javier@peridio.com>
To: meta-arm@lists.yoctoproject.org
Cc: Jon Mason <jon.mason@arm.com>,
	Javier Tia <javier@peridio.com>
Subject: [scarthgap PATCH 2/3] arm/trusted-firmware-a: modify CVE_PRODUCT
Date: Wed,  2 Sep 2026 16:03:25 -0600
Message-ID: <20260902220326.2780674-3-javier@peridio.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260902220326.2780674-1-javier@peridio.com>
References: <20260902220326.2780674-1-javier@peridio.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 02 Sep 2026 22:03:45 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/7151

From: Jon Mason <jon.mason@arm.com>

Per https://nvd.nist.gov/products/cpe/detail/2E1BD3E8-DF65-42E3-A0BA-747137D6DEF2
Adding "trustedfirmware:trusted_firmware-a"

We can probably remove "arm:trusted_firmware-a", since it has been
depreciated.  Fearing unintended issues, leaving it in for now.

Signed-off-by: Jon Mason <jon.mason@arm.com>
(cherry picked from commit e2e63f20b504c31a4600f95764d3561c32b4b2f7)
Signed-off-by: Javier Tia <javier@peridio.com>
---
 meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
index 922c0a34..5385e045 100644
--- a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
+++ b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
@@ -246,4 +246,5 @@ addtask deploy after do_install
 CVE_PRODUCT = "arm:arm-trusted-firmware \
                arm:trusted_firmware-a \
                arm:arm_trusted_firmware \
-               arm_trusted_firmware_project:arm_trusted_firmware"
+               arm_trusted_firmware_project:arm_trusted_firmware \
+               trustedfirmware:trusted_firmware-a"
-- 
Javier Tia



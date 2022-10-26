Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6F12C38A2D
	for <webhook@archiver.kernel.org>; Wed, 26 Oct 2022 14:19:13 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web10.8106.1666793950177508821
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 26 Oct 2022 07:19:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=q1JWoD/6;
 spf=pass (domain: gmail.com, ip: 209.85.128.51, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wm1-f51.google.com with SMTP id t4so10277527wmj.5
        for <meta-arm@lists.yoctoproject.org>; Wed, 26 Oct 2022 07:19:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7u5QS60T7BIL4AhSlQ6QdACKQcL7/dgUMk6EhMhKW7Q=;
        b=q1JWoD/6mh39JMMV9sBMW5+0wR5Pfzsoc+UImkd3LRPoRcI+m3EuzdbsK3xEaMYZBo
         WUw5hUHrPFDdEOLpvPNKGvWTfLNwhtJ/R+5H22W44Dv857xplqXJHzn4b+0/Zyc0ksvd
         dEm0b3H/hRzgqGuvfd4HRJYG1iA0HNDSiqaelP791GCAyJpOvimLP9X2j+WscVkAkwAe
         bTIwEALPA/XrzuifWXsWPvsBUhufO4FeRm4CHJTCltw3YC51pQhiBv3fBFtDZH7UeGlC
         TzaF7eKoGuAP2TpfpKMS7BTPB4/Kh9E7cW5EAfqFzhENMEWVMTHbAvaus/SE0IHcj9kP
         cD2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7u5QS60T7BIL4AhSlQ6QdACKQcL7/dgUMk6EhMhKW7Q=;
        b=MSSx/wZlk8Wkn0y+vik3GWD6+s1VZh9/RKAAGEvzvhGRRtuyCn+C1fSgqbyFMRjxMs
         JQKwcXObkWsxAUBLVoMB3rGm9dwlbKDxWC00txLZUZaaHVxWY4jLNbsItJvPQRLikJUL
         N0+873FV+ZFqyvXcd77anGTyFVRaISAodV0HTYtrB8fx2VDy0ECxJJo3oEGjeopR4N/V
         E/1d101nw6CuHeOQR0DSWJihM8NFkhFaKHJz2ihTowhhkMpCsvHrIqa8fZPDeKpVd5SQ
         VERrzJy5y2cYX74YelL5RutwkbIv3kq0TmA3KxIf1xIerVpy//b4smx+hbKL3Tc6NILx
         GM+w==
X-Gm-Message-State: ACrzQf2LOf7S9kLPIpTSfQ6y+HDFgVR8X1beXfr1Kxm+ilJZwaPhBdiJ
	dtRZX7PZdWpvDEfMr3K8B32p8q2CTNWLwZnC
X-Google-Smtp-Source: AMsMyM5k5ZVqqdxoEUe4ltuxe03h+kf9LZMqq7PLcq83RMu/KnCPnuEPG1YSD2h24dIESvWh1qAMDQ==
X-Received: by 2002:a05:600c:3c92:b0:3b5:62e4:e423 with SMTP id bg18-20020a05600c3c9200b003b562e4e423mr2697414wmb.162.1666793948387;
        Wed, 26 Oct 2022 07:19:08 -0700 (PDT)
Received: from og-worker-dev-01.infra.foundries.io.net (51-159-19-113.rev.poneytelecom.eu. [51.159.19.113])
        by smtp.gmail.com with ESMTPSA id l3-20020a05600c4f0300b003a5f3f5883dsm2224944wmq.17.2022.10.26.07.19.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Oct 2022 07:19:07 -0700 (PDT)
From: Jose Quaresma <quaresma.jose@gmail.com>
X-Google-Original-From: Jose Quaresma <jose.quaresma@foundries.io>
To: meta-arm@lists.yoctoproject.org
Cc: ricardo@foundries.io,
	Jose Quaresma <jose.quaresma@foundries.io>
Subject: [meta-arm][PATCH 3/3] optee-os-ts: avoid using escape chars in EXTRA_OEMAKE
Date: Wed, 26 Oct 2022 14:18:54 +0000
Message-Id: <20221026141854.1557213-3-jose.quaresma@foundries.io>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221026141854.1557213-1-jose.quaresma@foundries.io>
References: <20221026141854.1557213-1-jose.quaresma@foundries.io>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 26 Oct 2022 14:19:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4042

This currently can break the bitbake parsing

Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
---
 meta-arm/recipes-security/optee/optee-os-ts.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arm/recipes-security/optee/optee-os-ts.inc b/meta-arm/recipes-security/optee/optee-os-ts.inc
index 10a41755..73b8c14f 100644
--- a/meta-arm/recipes-security/optee/optee-os-ts.inc
+++ b/meta-arm/recipes-security/optee/optee-os-ts.inc
@@ -51,4 +51,4 @@ DEPENDS:append  = "${@bb.utils.contains('MACHINE_FEATURES', 'ts-smm-gateway', \
 SP_PATHS:append = "${@bb.utils.contains('MACHINE_FEATURES', 'ts-smm-gateway', \
                                         ' ${TS_BIN}/${SMM_GATEWAY_UUID}.stripped.elf', '', d)}"
 
-EXTRA_OEMAKE:append = "${@oe.utils.conditional('SP_PATHS', '', '', ' CFG_SECURE_PARTITION=y SP_PATHS=\'${SP_PATHS}\' ', d)}"
+EXTRA_OEMAKE:append = "${@oe.utils.conditional('SP_PATHS', '', '', ' CFG_SECURE_PARTITION=y SP_PATHS="${SP_PATHS}" ', d)}"
-- 
2.34.1



Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1E30C433FE
	for <webhook@archiver.kernel.org>; Wed, 26 Oct 2022 14:19:13 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web11.8173.1666793948112263162
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 26 Oct 2022 07:19:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=B9Wveu8P;
 spf=pass (domain: gmail.com, ip: 209.85.128.44, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wm1-f44.google.com with SMTP id c3-20020a1c3503000000b003bd21e3dd7aso1629502wma.1
        for <meta-arm@lists.yoctoproject.org>; Wed, 26 Oct 2022 07:19:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=a7leaFdOkx4nD1TyMnQ0xLw53zPrane9YgDFFPb0HNQ=;
        b=B9Wveu8P9lhe6/A7+tTo4Kf0xCNGgg7K2s1vka0Rp7uC11bjJ+OBT6ZcY26aodnqDl
         rKXi4+eVuNcXhCT0E0U1VOonik/ZgIMgrbU7gRssCA1gVYgYcoUhP9gm6z3PMF7fXnDo
         SXkz+rLV03uM6plIo2eb4i9WEt4xOo1phG/T8mFlFrkojiWAkG5zhxuuGUy14Irj6BaC
         aj6FWw3a4t4ydGmY7WYvCl8N2hKjsmmneClsadxwDu8xX0YgvR4BJm7kJVgwqbhdISs9
         1DYnXPod+3gHmAl9moLy0hPXhmSfSnngs7FCWitxosX5QzKKHad56dxxEU892KfTgCY+
         EMtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=a7leaFdOkx4nD1TyMnQ0xLw53zPrane9YgDFFPb0HNQ=;
        b=PubrmMjzRgf8WXBVNQhopMycTsbg8ciS5m0HbRSF6qtTIhmWdp3nOPbmKSpziurLqQ
         xVZcZIRZ3FiZtfMypcvPLUa2Az0GDDYAV3qjbzWHhI9hgcmjO3WHmOGhS7pAcVAMZdU1
         ZGeb8h54n7toFFaCaSaId5Jz+cZQhSzU6EXkWGa20OrBlekrFjVlxi8/Tkni8+QoaCI3
         0vsIdh94yliwjPaVrszwwgE9SJDk2GhBULVPUOqWUP/m1+3RmrT1Y/t5auDmbTTLurdK
         RwdY5n0yM42/1YSFsamSvKa3chB2HGTysZP+RdbVj9AkmvVNy8IjtRoZl55cA7OZHgOM
         JP8A==
X-Gm-Message-State: ACrzQf0a8++QUKryE4g/MoSzRnDe15RYO30SE2kQpKzPgOyZsscDl4eK
	WkPzSbATPkfIFJY8/l3vq2eIeJGRpObYl4wN
X-Google-Smtp-Source: AMsMyM6bo0ttMZSrGYSSHAH9BTeGgC5+9ptNR2JqARu+D5Js0i+XGbxCGk0QlGn8iYLmckmnDbbLDA==
X-Received: by 2002:a05:600c:3b25:b0:3c6:f6e5:c4a2 with SMTP id m37-20020a05600c3b2500b003c6f6e5c4a2mr2667408wms.193.1666793946195;
        Wed, 26 Oct 2022 07:19:06 -0700 (PDT)
Received: from og-worker-dev-01.infra.foundries.io.net (51-159-19-113.rev.poneytelecom.eu. [51.159.19.113])
        by smtp.gmail.com with ESMTPSA id l3-20020a05600c4f0300b003a5f3f5883dsm2224944wmq.17.2022.10.26.07.19.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Oct 2022 07:19:05 -0700 (PDT)
From: Jose Quaresma <quaresma.jose@gmail.com>
X-Google-Original-From: Jose Quaresma <jose.quaresma@foundries.io>
To: meta-arm@lists.yoctoproject.org
Cc: ricardo@foundries.io,
	Jose Quaresma <jose.quaresma@foundries.io>
Subject: [meta-arm][PATCH 1/3] optee-ftpm/optee-os: add missing space in EXTRA_OEMAKE
Date: Wed, 26 Oct 2022 14:18:52 +0000
Message-Id: <20221026141854.1557213-1-jose.quaresma@foundries.io>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 26 Oct 2022 14:19:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4040

When append to variable a space is required at the beginning.

Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
---
 meta-arm/recipes-security/optee-ftpm/optee-os_%.bbappend | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-arm/recipes-security/optee-ftpm/optee-os_%.bbappend b/meta-arm/recipes-security/optee-ftpm/optee-os_%.bbappend
index acea7502..40423615 100644
--- a/meta-arm/recipes-security/optee-ftpm/optee-os_%.bbappend
+++ b/meta-arm/recipes-security/optee-ftpm/optee-os_%.bbappend
@@ -7,7 +7,8 @@ DEPENDS:append = "\
                  '' , \
                  d)}"
 
-EXTRA_OEMAKE:append = "${@bb.utils.contains('MACHINE_FEATURES', \
+EXTRA_OEMAKE:append = "\
+                       ${@bb.utils.contains('MACHINE_FEATURES', \
                       'optee-ftpm', \
                       'CFG_EARLY_TA=y EARLY_TA_PATHS="${STAGING_DIR_TARGET}/lib/optee_armtz/${FTPM_UUID}.stripped.elf"', \
                       '', \
-- 
2.34.1



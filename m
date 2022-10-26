Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E829FFA3741
	for <webhook@archiver.kernel.org>; Wed, 26 Oct 2022 14:19:13 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web10.8104.1666793949045501214
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 26 Oct 2022 07:19:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=AsHQLyCL;
 spf=pass (domain: gmail.com, ip: 209.85.128.49, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wm1-f49.google.com with SMTP id y10so10340375wma.0
        for <meta-arm@lists.yoctoproject.org>; Wed, 26 Oct 2022 07:19:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=igi1ePsK76Znt+/Ayrsogvx72lRiJOjUkt5TMwW1FNA=;
        b=AsHQLyCLAcg57UzfPtAbl1EquYUNaa0dXseujHAik22NjvwZLXZQiivYDw0evcub4s
         iBg9/kuwqOvxpYHImPp1CvJCd+4THszGV1BM9/LyCQ7OjU8Nyul7pXOXUA6sxYKbEi6N
         vWI13WfSWC7lEImWh1oOEHcxgpRCb+qLbAa/BVj3TqYWXilfkJ29TgQd814llaGQffVy
         LIu8dEkFwRqSXy3QYZJ6+DpOC9REL76Hdwec/vlxcawDgjBt8vem8lELtgIf284ABxhP
         WzY61cMlDbOyH2h8vZ9FiF5ELE3gtdQqbjcO5ojYDdXejwQ0cFJU99xYCpbIx/ec37YO
         Ovzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=igi1ePsK76Znt+/Ayrsogvx72lRiJOjUkt5TMwW1FNA=;
        b=yCHnzxLztnRp878+8groUl34sNvBn+VAnLjRVPGZE5tL99gue71TW9XP1R6+3Lnqam
         y1CRQzRuJ9JNMAmpWTnSqCh0EIL3J6TBLGaADKgdA3yYb7iczXnFgreCXRQORllcGWIY
         SMSfGUmL5rTb8fgwU8Moqj0a8suIGrMDmQhcB9T8N22mk5YrSZq97BW65coqbdLqnktX
         gdKkH9YMRsJnDWYPCi8CCmpaJwZFHeXDgS2J//jdc6TKWKU1YRzZzw7pgfDNSkjpUTnL
         38YUEDAVac7Cv8cvw3+P2YOUfWOl1do/xZusHDA8Oldm7AvIIvKzeTQHRbmQb0IuwQrx
         utnA==
X-Gm-Message-State: ACrzQf1ehAGa97LN/fOtBgino4/YnH0Jzbbx/j2kUruRYVI9da5XGwX3
	ml4K0xXeJR9QoKUqJ7tQfBSOitGsG6dF3lH8
X-Google-Smtp-Source: AMsMyM4Hxs40aX1cuWLftd0y4BHFjcF+thMjRLdyAxlb8mxND+oxPsMWWTqd5c35KXpZK2ltb8MCzQ==
X-Received: by 2002:a05:600c:1e0d:b0:3c6:e3f8:2ff with SMTP id ay13-20020a05600c1e0d00b003c6e3f802ffmr2612100wmb.33.1666793947317;
        Wed, 26 Oct 2022 07:19:07 -0700 (PDT)
Received: from og-worker-dev-01.infra.foundries.io.net (51-159-19-113.rev.poneytelecom.eu. [51.159.19.113])
        by smtp.gmail.com with ESMTPSA id l3-20020a05600c4f0300b003a5f3f5883dsm2224944wmq.17.2022.10.26.07.19.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Oct 2022 07:19:06 -0700 (PDT)
From: Jose Quaresma <quaresma.jose@gmail.com>
X-Google-Original-From: Jose Quaresma <jose.quaresma@foundries.io>
To: meta-arm@lists.yoctoproject.org
Cc: ricardo@foundries.io,
	Jose Quaresma <jose.quaresma@foundries.io>
Subject: [meta-arm][PATCH 2/3] optee-ftpm/optee-os: rewite in a way to be less error prone
Date: Wed, 26 Oct 2022 14:18:53 +0000
Message-Id: <20221026141854.1557213-2-jose.quaresma@foundries.io>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221026141854.1557213-1-jose.quaresma@foundries.io>
References: <20221026141854.1557213-1-jose.quaresma@foundries.io>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 26 Oct 2022 14:19:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4041

So it becomes clearer the need to use the space in the append

Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
---
 .../optee-ftpm/optee-os_%.bbappend               | 16 ++++------------
 1 file changed, 4 insertions(+), 12 deletions(-)

diff --git a/meta-arm/recipes-security/optee-ftpm/optee-os_%.bbappend b/meta-arm/recipes-security/optee-ftpm/optee-os_%.bbappend
index 40423615..332c7c1c 100644
--- a/meta-arm/recipes-security/optee-ftpm/optee-os_%.bbappend
+++ b/meta-arm/recipes-security/optee-ftpm/optee-os_%.bbappend
@@ -1,15 +1,7 @@
 FTPM_UUID="bc50d971-d4c9-42c4-82cb-343fb7f37896"
 
-DEPENDS:append = "\
-                  ${@bb.utils.contains('MACHINE_FEATURES', \
-                 'optee-ftpm', \
-                 'optee-ftpm', \
-                 '' , \
-                 d)}"
+DEPENDS:append = "${@bb.utils.contains('MACHINE_FEATURES', 'optee-ftpm', \
+                 ' optee-ftpm', '' , d)}"
 
-EXTRA_OEMAKE:append = "\
-                       ${@bb.utils.contains('MACHINE_FEATURES', \
-                      'optee-ftpm', \
-                      'CFG_EARLY_TA=y EARLY_TA_PATHS="${STAGING_DIR_TARGET}/lib/optee_armtz/${FTPM_UUID}.stripped.elf"', \
-                      '', \
-                      d)} "
+EXTRA_OEMAKE:append = "${@bb.utils.contains('MACHINE_FEATURES', 'optee-ftpm', \
+                      ' CFG_EARLY_TA=y EARLY_TA_PATHS="${STAGING_DIR_TARGET}/lib/optee_armtz/${FTPM_UUID}.stripped.elf"', '', d)} "
-- 
2.34.1



Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C98DC433EF
	for <webhook@archiver.kernel.org>; Sat,  4 Dec 2021 01:53:57 +0000 (UTC)
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com
 [209.85.210.174])
 by mx.groups.io with SMTP id smtpd.web11.20162.1638582830810857269
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 03 Dec 2021 17:53:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=DOkgV4py;
 spf=pass (domain: gmail.com, ip: 209.85.210.174,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f174.google.com with SMTP id z6so4548127pfe.7
        for <meta-arm@lists.yoctoproject.org>;
 Fri, 03 Dec 2021 17:53:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=yNhmxt0QUWPEPh+wSwRmZ8iNgJk8yd2/H0GMy4VJZV0=;
        b=DOkgV4pyPWv/wOntbK3VWILqpoCVHgJwkAU+SYuBAitz8fPNXZ5z8W3vcYTK7LFK/4
         FkEsm7MDS+nqrqU6p6aLpbjsp4UBuZcfjYaTXXX2YjTdpXLsitOMmYd7/dG2pxYkVZFh
         RWors2MTPO5b6+fDR3WlOE2MVFlRtIrmMnWUEFHEt8CoCmwxF9D3VLsSs2abIrn4Gihy
         BxgBU1JOBI0hDMmzwBgt+cnNDptAHTJo9KUWhFtL6+sEXZhLo4DgStJNh+/i898xHDvb
         E5DiMdiHIrGT5EqV/PPktkn04xyljJGvyBMdGhE0N7Cc61SRbFp73ragDhIQqC8WLeVx
         2BoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=yNhmxt0QUWPEPh+wSwRmZ8iNgJk8yd2/H0GMy4VJZV0=;
        b=hcCXF+zjCoScKLu2kMmm7mq2ZFH3x1ecR558Ik0YJUVVx+//hKTPwUOq9Iyh8hoDdI
         htNlidLeS5PN08RcQVLxG/Bde4QfOGs1SxGvqb6b7kbz0xtJJFDgJ96YjQPK9n+DqFCM
         Dk+N7JVYoB8smrgDmt7mT30U0k4Dd8OuEqYc3g5lQSs6HM5YXTzwjj6T0KDnPJD4wL46
         x4X0jUE/vX2CD8j/8AZq997ipLFNQqB8VV9SB9JMSJPN3+FlHbHcelvAxafF29JvftmT
         YXe2pqO7doFnHu6CzLfFRh2y+unEWbRjjBZEktE5x3dG+/hfv1Fe45Q70gtOY5Jqe0Mr
         IYdw==
X-Gm-Message-State: AOAM532Zd39hG+rQoLGist2/HIzGlDtBRHecuXFmOxkN4+ZoXnj4Sk40
	3cVC5Lsy9Glh2PjgMtAVSyToBu6WMXVl2A==
X-Google-Smtp-Source: 
 ABdhPJwebkQqZOhw/gsCCWdbDDdmmuTZU4rPD77IwN81V9ZsfUIHxLWX3kUIvJMP3jpXdRS/hDRpGw==
X-Received: by 2002:a63:2b11:: with SMTP id r17mr7338644pgr.494.1638582829887;
        Fri, 03 Dec 2021 17:53:49 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::ce68])
        by smtp.gmail.com with ESMTPSA id
 y32sm4679958pfa.145.2021.12.03.17.53.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Dec 2021 17:53:49 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: meta-arm@lists.yoctoproject.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] ffa-debugfs-mod: Pin to arm/aarch64 hosts
Date: Fri,  3 Dec 2021 17:53:47 -0800
Message-Id: <20211204015347.1195034-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Sat, 04 Dec 2021 01:53:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2533

This seems to be needing arm specific kernel headers, so I infer this
still is arm specific module

Fixes below error on non-arm hosts

/git/arm_ffa_user.c:12:10: fatal error: linux/arm_ffa.h: No such file or directory
|    12 | #include <linux/arm_ffa.h>
|       |          ^~~~~~~~~~~~~~~~~
| compilation terminated.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-arm/recipes-kernel/ffa-debugfs/ffa-debugfs-mod_2.1.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-arm/recipes-kernel/ffa-debugfs/ffa-debugfs-mod_2.1.0.bb b/meta-arm/recipes-kernel/ffa-debugfs/ffa-debugfs-mod_2.1.0.bb
index e9c3611..2db8afc 100644
--- a/meta-arm/recipes-kernel/ffa-debugfs/ffa-debugfs-mod_2.1.0.bb
+++ b/meta-arm/recipes-kernel/ffa-debugfs/ffa-debugfs-mod_2.1.0.bb
@@ -27,3 +27,5 @@ do_install:append() {
   install -D -p -m 0755 ${B}/load_ffa_debugfs.sh ${D}/${bindir}/load_ffa_debugfs.sh
   install -m 0644 ${S}/arm_ffa_user.h ${D}/${includedir}/arm_ffa_user.h
 }
+
+COMPATIBLE_HOST = "(arm|aarch64).*-linux"
-- 
2.34.1



Return-Path: <floss@jetm.me>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2F68C61DD6
	for <webhook@archiver.kernel.org>; Wed,  2 Sep 2026 22:26:55 +0000 (UTC)
Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com [209.85.217.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7756.1788388014887407290
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 02 Sep 2026 15:26:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@peridio.com header.s=google header.b=LRW0wOVY;
 spf=pass (domain: peridio.com, ip: 209.85.217.45, mailfrom: javier@peridio.com)
Received: by mail-vs1-f45.google.com with SMTP id ada2fe7eead31-7383249a093so106885137.0
        for <meta-arm@lists.yoctoproject.org>; Wed, 02 Sep 2026 15:26:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=peridio.com; s=google; t=1788388014; x=1788992814; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ucTYirEDM51gRjNU+mtNoI8mzbO0eKz5YsZJS7+b44A=;
        b=LRW0wOVYPoJYhu26Sgz/KKsGGVVDfKCLcVXFiIYMuhqkHMXODB9T9ZRkRuqmNKUZ+V
         fmWwLYVK+Tes5fdbpSZPZbskf3Y86/kpElPCbcZJfZVKp1vAeulXcmFrZSx83R/awxwQ
         O8cbaa4hnm7xJ504iHMMaFq02HaH1Wgah0+I6B14zJMDEcHU2qIzdvTBx32Akv7iDzRQ
         pZRr9WE63ddJXKcQBL3tZjTEYguss3sk9vFoy30QSv05p5r+lKqcgx/xQsbjwAby8Jx1
         I16ImBVUeSec8qfVzKnnrqpQQ5MJNPsXZ6RKuxgmINIDZJO183AYOk6wAnn65PH8auAJ
         of3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788388014; x=1788992814;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ucTYirEDM51gRjNU+mtNoI8mzbO0eKz5YsZJS7+b44A=;
        b=dJji/3Vq4BbhTzahRuIOauyRjH4fzbHfU4exNEpbps7fl5sVP2H032Jcwh+4M9X/Kh
         Pp/W6bc3UgMU2uhZqxwotgTaStNn8OXjlichpPLWF7xrfG+e6zITX0PVs2DsAbxu4jVQ
         MvRlsLX7MPmsVBVi8s94MDjYMnZmauD3WCyfUsjZdpHZFtMOd0cX/7kXc9Mu9/7u3/W+
         jZsvq7awf/ZvI3I60izia7RGBB6wfzOWnkTL3KkCAal2e45cqL1eHtyQWMIqRHVKEiHF
         5Tfko58WaquWllici9yLKRso214Hg45+vwskMg/0YQlUbMzPacsjPmFzoF6tRB1AKpxe
         AICQ==
X-Gm-Message-State: AFuF++mxyjcwxQMREYfxnja6TGbsUHPJgn3CpwUzwsG+G4J1oOEfyccG
	NtshhH18Tzg55bDE/L2CdO4RZtDCEd1if8p6/8wCR0GPbo7ZWRUNK7pYNTcu4h9aWZCuAtwlf2x
	ErWBTns0=
X-Gm-Gg: AYBFou2eCfu2te6ESlzG1lpAwR58dzgz5UqLyFxEqxOj4BWNTxpoSwLUA6ukPlcquCz
	xTATvYid8AcBFDlXdeiZsO8eFjXl3Rg+LtXs4UN0jlXbVHbHJZKHQX9rSdFlLnck6CqlHMgR8Lo
	wf8s0TOVKpqz6zyUv+Zyr1wdZxvt+GfcEtzh4TNC19fZr9Qoj8iN2V0ivcKdMIDWnN4m+a+yAoO
	eVDc7xLVmr2QiijRDUj2Wgs7wY0BFdGPjrXmDxfQK5oNUiLDJHArtIZndGGQLRvSCFfO2HToDHW
	l51Yik4Wk/4StmhYXLJB1oumM836JZtXwkLsVvGoVf/0637OldeCuGNfLBgd4ZLx6zCw18AzLb3
	h2kX4kD5cx5CGG/XfoB5xKGbsUpo/X4wRrcTsnLk5h4cyzP5WfzghmqDn+QS4cOIlpkYLWEwyOf
	ncPsYh/3LvnV57DMa5zLRn6QpVb5XgIZg19F/hW52qY/0NmS4R1AOUKA3g0AzdaDyQ
X-Received: by 2002:a05:6102:510d:b0:780:6fc7:2181 with SMTP id ada2fe7eead31-78a1f68e0d8mr1337679137.2.1788388013682;
        Wed, 02 Sep 2026 15:26:53 -0700 (PDT)
Received: from localhost ([190.113.101.40])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-78a1a2552edsm3403316137.5.2026.09.02.15.26.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 15:26:53 -0700 (PDT)
From: Javier Tia <javier@peridio.com>
To: meta-arm@lists.yoctoproject.org
Cc: Jon Mason <jon.mason@arm.com>,
	Javier Tia <javier@peridio.com>
Subject: [wrynose PATCH 4/4] arm/scp-firmware: add CVE_PRODUCT
Date: Wed,  2 Sep 2026 16:26:46 -0600
Message-ID: <20260902222646.2945592-5-javier@peridio.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260902222646.2945592-1-javier@peridio.com>
References: <20260902222646.2945592-1-javier@peridio.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 02 Sep 2026 22:26:55 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/7156

From: Jon Mason <jon.mason@arm.com>

Per https://nvd.nist.gov/products/cpe/detail/593B1385-F4BE-452B-AE3B-51627F6CAE45
add CVE_PRODUCT entry.  Since there wasn't one existing, there is no
need to remove anything.

Signed-off-by: Jon Mason <jon.mason@arm.com>
(cherry picked from commit 9aaee17adb6cb6c92f360c18a0331a4cab4327a4)
Signed-off-by: Javier Tia <javier@peridio.com>
---
 meta-arm/recipes-bsp/scp-firmware/scp-firmware.inc | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-arm/recipes-bsp/scp-firmware/scp-firmware.inc b/meta-arm/recipes-bsp/scp-firmware/scp-firmware.inc
index 4623afe8..032445b3 100644
--- a/meta-arm/recipes-bsp/scp-firmware/scp-firmware.inc
+++ b/meta-arm/recipes-bsp/scp-firmware/scp-firmware.inc
@@ -96,3 +96,6 @@ do_install() {
 INSANE_SKIP:${PN}-dbg += "arch"
 INHIBIT_PACKAGE_DEBUG_SPLIT = "1"
 INHIBIT_PACKAGE_STRIP = "1"
+
+CVE_PRODUCT = "arm:scp-firmware \
+               arm:scp_firmware"
-- 
Javier Tia



Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80C36C433EF
	for <webhook@archiver.kernel.org>; Fri, 11 Feb 2022 11:45:34 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.6230.1644579933011022533
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 11 Feb 2022 03:45:33 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4D7451042
	for <meta-arm@lists.yoctoproject.org>; Fri, 11 Feb 2022 03:45:32 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D208B3F73B
	for <meta-arm@lists.yoctoproject.org>; Fri, 11 Feb 2022 03:45:31 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 4/4] atp/linux-yocto: use wildcards in the bbappend
Date: Fri, 11 Feb 2022 11:45:27 +0000
Message-Id: <20220211114527.4157075-4-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220211114527.4157075-1-ross.burton@arm.com>
References: <20220211114527.4157075-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 11 Feb 2022 11:45:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2990

Don't hard-code 5.4, use wildcards instead.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../linux/{linux-yocto-5.4 =3D> files}/no_ftrace.cfg              | 0
 .../recipes-kernel/linux/{linux-yocto-5.4 =3D> files}/smmuv3.cfg  | 0
 .../linux/{linux-yocto_5.4.bbappend =3D> linux-yocto_%.bbappend}  | 2 +-
 3 files changed, 1 insertion(+), 1 deletion(-)
 rename meta-atp/recipes-kernel/linux/{linux-yocto-5.4 =3D> files}/no_ftr=
ace.cfg (100%)
 rename meta-atp/recipes-kernel/linux/{linux-yocto-5.4 =3D> files}/smmuv3=
.cfg (100%)
 rename meta-atp/recipes-kernel/linux/{linux-yocto_5.4.bbappend =3D> linu=
x-yocto_%.bbappend} (50%)

diff --git a/meta-atp/recipes-kernel/linux/linux-yocto-5.4/no_ftrace.cfg =
b/meta-atp/recipes-kernel/linux/files/no_ftrace.cfg
similarity index 100%
rename from meta-atp/recipes-kernel/linux/linux-yocto-5.4/no_ftrace.cfg
rename to meta-atp/recipes-kernel/linux/files/no_ftrace.cfg
diff --git a/meta-atp/recipes-kernel/linux/linux-yocto-5.4/smmuv3.cfg b/m=
eta-atp/recipes-kernel/linux/files/smmuv3.cfg
similarity index 100%
rename from meta-atp/recipes-kernel/linux/linux-yocto-5.4/smmuv3.cfg
rename to meta-atp/recipes-kernel/linux/files/smmuv3.cfg
diff --git a/meta-atp/recipes-kernel/linux/linux-yocto_5.4.bbappend b/met=
a-atp/recipes-kernel/linux/linux-yocto_%.bbappend
similarity index 50%
rename from meta-atp/recipes-kernel/linux/linux-yocto_5.4.bbappend
rename to meta-atp/recipes-kernel/linux/linux-yocto_%.bbappend
index c8352206..f59f8d44 100644
--- a/meta-atp/recipes-kernel/linux/linux-yocto_5.4.bbappend
+++ b/meta-atp/recipes-kernel/linux/linux-yocto_%.bbappend
@@ -1,2 +1,2 @@
-FILESEXTRAPATHS:prepend :=3D "${THISDIR}/${BPN}-5.4:"
+FILESEXTRAPATHS:prepend :=3D "${THISDIR}/files:"
 SRC_URI +=3D "file://no_ftrace.cfg file://smmuv3.cfg"
--=20
2.25.1



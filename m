Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6364AC433EF
	for <webhook@archiver.kernel.org>; Fri, 15 Oct 2021 13:25:24 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.9220.1634304323324574834
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 15 Oct 2021 06:25:23 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 931D6D6E
	for <meta-arm@lists.yoctoproject.org>; Fri, 15 Oct 2021 06:25:21 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 352D13F694
	for <meta-arm@lists.yoctoproject.org>; Fri, 15 Oct 2021 06:25:21 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 1/2] layer: add telnet for testimage/runfvp
Date: Fri, 15 Oct 2021 14:25:18 +0100
Message-Id: <20211015132519.1449833-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 15 Oct 2021 13:25:24 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2273

Change-Id: Ic31a3bf8ad981c7380339499a377e3f9d676cb15
Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-arm/conf/layer.conf | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-arm/conf/layer.conf b/meta-arm/conf/layer.conf
index 24d90913..69817f46 100644
--- a/meta-arm/conf/layer.conf
+++ b/meta-arm/conf/layer.conf
@@ -14,3 +14,6 @@ LAYERDEPENDS_meta-arm =3D " \
     arm-toolchain \
 "
 LAYERSERIES_COMPAT_meta-arm =3D "honister"
+
+# runfvp --console needs telnet, so pull this in for testimage.
+HOSTTOOLS_NONFATAL +=3D "telnet"
--=20
2.25.1



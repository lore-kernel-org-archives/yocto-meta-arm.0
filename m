Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72C45C369D1
	for <webhook@archiver.kernel.org>; Fri, 18 Apr 2025 13:12:27 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.11550.1744981944050035088
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 18 Apr 2025 06:12:24 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E212C1AC1
	for <meta-arm@lists.yoctoproject.org>; Fri, 18 Apr 2025 06:12:20 -0700 (PDT)
Received: from H24V3P4C17.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id AB5413F66E
	for <meta-arm@lists.yoctoproject.org>; Fri, 18 Apr 2025 06:12:23 -0700 (PDT)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 3/4] arm/trusted-services: correct broken git versions
Date: Fri, 18 Apr 2025 09:12:21 -0400
Message-Id: <20250418131222.95241-3-jon.mason@arm.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20250418131222.95241-1-jon.mason@arm.com>
References: <20250418131222.95241-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 18 Apr 2025 13:12:27 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6474

Add UPSTREAM_VERSION_UNKNOWN to avoid the "UNKNOWN_BORKEN" when running
`devtool check-upgrade-status`

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 .../recipes-security/trusted-services/trusted-services-src.inc   | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-arm/recipes-security/trusted-services/trusted-services-=
src.inc b/meta-arm/recipes-security/trusted-services/trusted-services-src=
.inc
index b30b20b6d0fa..b3e01315dffd 100644
--- a/meta-arm/recipes-security/trusted-services/trusted-services-src.inc
+++ b/meta-arm/recipes-security/trusted-services/trusted-services-src.inc
@@ -17,6 +17,7 @@ LIC_FILES_CHKSUM =3D "file://${S}/license.rst;md5=3Dea1=
60bac7f690a069c608516b17997f4
=20
 S =3D "${WORKDIR}/git/trusted-services"
 PV ?=3D "0.0+git"
+UPSTREAM_CHECK_COMMITS =3D "1"
=20
 # DTC, tag "v1.6.1"
 SRC_URI +=3D "git://github.com/dgibson/dtc;name=3Ddtc;protocol=3Dhttps;b=
ranch=3Dmain;destsuffix=3Dgit/dtc"
--=20
2.39.5 (Apple Git-154)



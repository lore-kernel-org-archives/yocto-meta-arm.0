Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96299C28CF5
	for <webhook@archiver.kernel.org>; Wed, 26 Jan 2022 19:12:58 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.17854.1643224377378615561
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 26 Jan 2022 11:12:57 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A5CBE11B3
	for <meta-arm@lists.yoctoproject.org>; Wed, 26 Jan 2022 11:12:56 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 519343F7D8
	for <meta-arm@lists.yoctoproject.org>; Wed, 26 Jan 2022 11:12:56 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 3/3] CI: enable memory-resident bitbake
Date: Wed, 26 Jan 2022 19:12:53 +0000
Message-Id: <20220126191253.1844130-3-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220126191253.1844130-1-ross.burton@arm.com>
References: <20220126191253.1844130-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 26 Jan 2022 19:12:58 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2917

Enable memory-resident bitbake by setting the server timeout to 60s.

For most builds this doesn't have an impact as bitbake is ran once, but
this reduces the time for the pending-upgrades report from 10 minutes to
3 minutes, as it doesn't need to constantly restart bitbake.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 ci/base.yml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/ci/base.yml b/ci/base.yml
index 0af0b62d..795bd11f 100644
--- a/ci/base.yml
+++ b/ci/base.yml
@@ -26,6 +26,7 @@ env:
=20
 local_conf_header:
   base: |
+    BB_SERVER_TIMEOUT =3D "60"
     CONF_VERSION =3D "2"
     PACKAGE_CLASSES =3D "package_ipk"
     LICENSE_FLAGS_WHITELIST +=3D "armcompiler Arm-FVP-EULA"
--=20
2.25.1



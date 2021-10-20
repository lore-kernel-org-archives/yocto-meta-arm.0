Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 953BAC433EF
	for <webhook@archiver.kernel.org>; Wed, 20 Oct 2021 15:25:29 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.9679.1634743528564759699
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 20 Oct 2021 08:25:28 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BBE78ED1
	for <meta-arm@lists.yoctoproject.org>; Wed, 20 Oct 2021 08:25:26 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5A6E43F73D
	for <meta-arm@lists.yoctoproject.org>; Wed, 20 Oct 2021 08:25:26 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH][master 1/5] arm/lib/oeqa: fix module lookup
Date: Wed, 20 Oct 2021 16:25:18 +0100
Message-Id: <20211020152522.415448-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 20 Oct 2021 15:25:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2281

As multiple paths can and do provide modules under oeqa.controllers, all
of these paths need to call pkgutil.extend_path() so the lookup works
correctly.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-arm/lib/oeqa/controllers/__init__.py | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-arm/lib/oeqa/controllers/__init__.py b/meta-arm/lib/oeq=
a/controllers/__init__.py
index e69de29b..df3c142a 100644
--- a/meta-arm/lib/oeqa/controllers/__init__.py
+++ b/meta-arm/lib/oeqa/controllers/__init__.py
@@ -0,0 +1,3 @@
+# This is needed so that multiple locations can provide the same package
+from pkgutil import extend_path
+__path__ =3D extend_path(__path__, __name__)
--=20
2.25.1



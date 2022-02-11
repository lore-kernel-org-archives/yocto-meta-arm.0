Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76F2CC433F5
	for <webhook@archiver.kernel.org>; Fri, 11 Feb 2022 10:56:17 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.5832.1644576976256334685
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 11 Feb 2022 02:56:16 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DED1C1042
	for <meta-arm@lists.yoctoproject.org>; Fri, 11 Feb 2022 02:56:15 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 616A93F73B
	for <meta-arm@lists.yoctoproject.org>; Fri, 11 Feb 2022 02:56:15 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 5/5] arm/secure-partitions: allow network operations during
 do_configure
Date: Fri, 11 Feb 2022 10:56:08 +0000
Message-Id: <20220211105608.2483647-5-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220211105608.2483647-1-ross.burton@arm.com>
References: <20220211105608.2483647-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 11 Feb 2022 10:56:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2985

trusted-services and psa-arch-tests both use FetchContent to download
more source during configure, and they can't easily be seeded with the
correct sources in advance (unlike TF-M).

Until this is fixed upstream, allow network use during do_configure.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../recipes-security/trusted-services/secure-partitions.inc  | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta-arm/recipes-security/trusted-services/secure-partitions=
.inc b/meta-arm/recipes-security/trusted-services/secure-partitions.inc
index 2f56502e..1df7409c 100644
--- a/meta-arm/recipes-security/trusted-services/secure-partitions.inc
+++ b/meta-arm/recipes-security/trusted-services/secure-partitions.inc
@@ -20,3 +20,8 @@ SECURITY_LDFLAGS =3D ""
 TARGET_LDFLAGS =3D "-Wl,--build-id=3Dnone -Wl,--hash-style=3Dboth"
=20
 do_configure[cleandirs] =3D "${B}"
+
+# Currently trusted-services and psa-arch-tests use FetchContent to down=
load
+# more sources during do_configure. Until this is resolved we need to al=
low
+# network operations.
+do_configure[network] =3D "1"
--=20
2.25.1



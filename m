Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A918CC433F5
	for <webhook@archiver.kernel.org>; Mon, 15 Nov 2021 13:48:23 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.22277.1636984102190485350
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 15 Nov 2021 05:48:22 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C9B6B6D
	for <meta-arm@lists.yoctoproject.org>; Mon, 15 Nov 2021 05:48:20 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 740783F766
	for <meta-arm@lists.yoctoproject.org>; Mon, 15 Nov 2021 05:48:20 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH] CI: disable use of Yocto sstate server
Date: Mon, 15 Nov 2021 13:48:18 +0000
Message-Id: <20211115134818.3647291-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 15 Nov 2021 13:48:23 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2385

The public sstate server isn't up to the load just yet and often-enough
will take a very long time to respond, causing build failures.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 ci/base.yml | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/ci/base.yml b/ci/base.yml
index d2ea867a..86608b28 100644
--- a/ci/base.yml
+++ b/ci/base.yml
@@ -37,11 +37,6 @@ local_conf_header:
     PACKAGECONFIG:append:pn-perf =3D " coresight"
   noptest: |
     DISTRO_FEATURES:remove =3D "ptest"
-  sstate_mirror: |
-    BB_HASHSERVE_UPSTREAM =3D "typhoon.yocto.io:8687"
-    BB_HASHSERVE =3D "auto"
-    BB_SIGNATURE_HANDLER =3D "OEEquivHash"
-    SSTATE_MIRRORS =3D "file://.* http://sstate.yoctoproject.org/dev/PAT=
H;downloadfilename=3DPATH"
=20
 machine: unset
=20
--=20
2.25.1



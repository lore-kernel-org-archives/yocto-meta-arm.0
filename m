Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41817C433EF
	for <webhook@archiver.kernel.org>; Tue, 12 Oct 2021 10:47:43 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.11953.1634035662083510341
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 12 Oct 2021 03:47:42 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 72E5E1063
	for <meta-arm@lists.yoctoproject.org>; Tue, 12 Oct 2021 03:47:29 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1E5F53F694
	for <meta-arm@lists.yoctoproject.org>; Tue, 12 Oct 2021 03:47:29 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH] CI: use http: to access sstate mirror
Date: Tue, 12 Oct 2021 11:47:27 +0100
Message-Id: <20211012104727.3983874-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 12 Oct 2021 10:47:43 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2267

The sstate mirrors are not available over HTTPS currently due to a
certificate problem, so use plain HTTP instead.

Change-Id: I5b974d67bc13f7c7234927c6bc62a8c733e454c3
Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 ci/base.yml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/ci/base.yml b/ci/base.yml
index ad9f5fee..d2ea867a 100644
--- a/ci/base.yml
+++ b/ci/base.yml
@@ -41,7 +41,7 @@ local_conf_header:
     BB_HASHSERVE_UPSTREAM =3D "typhoon.yocto.io:8687"
     BB_HASHSERVE =3D "auto"
     BB_SIGNATURE_HANDLER =3D "OEEquivHash"
-    SSTATE_MIRRORS =3D "file://.* https://sstate.yoctoproject.org/dev/PA=
TH;downloadfilename=3DPATH"
+    SSTATE_MIRRORS =3D "file://.* http://sstate.yoctoproject.org/dev/PAT=
H;downloadfilename=3DPATH"
=20
 machine: unset
=20
--=20
2.25.1



Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 773C8C25B48
	for <webhook@archiver.kernel.org>; Tue, 24 Oct 2023 13:52:50 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.148343.1698155563418518991
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 24 Oct 2023 06:52:43 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2A41DC15;
	Tue, 24 Oct 2023 06:53:24 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 95FF33F762;
	Tue, 24 Oct 2023 06:52:42 -0700 (PDT)
From: ross.burton@arm.com
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH 4/4] CI: build both aarch64 and x86-64 packages for as muny FVPs as possible
Date: Tue, 24 Oct 2023 14:52:36 +0100
Message-Id: <20231024135236.3510412-4-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231024135236.3510412-1-ross.burton@arm.com>
References: <20231024135236.3510412-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 24 Oct 2023 13:52:50 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5165

From: Ross Burton <ross.burton@arm.com>

Some FVPs are available as x86-64 and aarch64 binaries, so build target
(qemuarm64) and nativesdk (x86-64) packages for these to verify the
checksums are correct.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 ci/fvps.yml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/ci/fvps.yml b/ci/fvps.yml
index 1bced299..a89df053 100644
--- a/ci/fvps.yml
+++ b/ci/fvps.yml
@@ -14,6 +14,10 @@ local_conf_header:
     SDKMACHINE =3D "x86_64"
=20
 target:
+  # Target packages to test aarch64
+  - fvp-base-a-aem
+  - fvp-corstone1000
+  # Nativesdk to test x86-64
   - nativesdk-fvp-base-a-aem
   - nativesdk-fvp-corstone1000
   - nativesdk-fvp-n1-edge
--=20
2.34.1



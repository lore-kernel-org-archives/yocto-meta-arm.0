Return-Path: <drew.reed@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 182FECDB483
	for <webhook@archiver.kernel.org>; Wed, 18 Oct 2023 14:24:27 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.282886.1697639061762790909
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 18 Oct 2023 07:24:21 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: drew.reed@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5662C1007;
	Wed, 18 Oct 2023 07:25:02 -0700 (PDT)
Received: from C02DP1BVML7H.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6ECA93F64C;
	Wed, 18 Oct 2023 07:24:20 -0700 (PDT)
From: drew.reed@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com
Cc: nd@arm.com,
	Drew Reed <Drew.Reed@arm.com>
Subject: [PATCH 2/2] CI: Enable TF-A TFTF test builds
Date: Wed, 18 Oct 2023 15:24:09 +0100
Message-ID: <20231018142409.5807-3-drew.reed@arm.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231018142409.5807-1-drew.reed@arm.com>
References: <20231018142409.5807-1-drew.reed@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 18 Oct 2023 14:24:27 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5145

From: Drew Reed <Drew.Reed@arm.com>

To allow running the TF-A TFTF tests we need to ensure the images for
N1SDP and Corstone-1000 MPS3 boards build

Signed-off-by: Drew Reed <Drew.Reed@arm.com>
---
 .gitlab-ci.yml | 7 +++++--
 ci/tftf.yml    | 1 +
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index e1845be5..89387405 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -117,6 +117,10 @@ corstone1000-fvp:
=20
 corstone1000-mps3:
   extends: .build
+  parallel:
+    matrix:
+      - TESTING: [none, tftf]
+
=20
 fvp-base:
   extends: .build
@@ -148,8 +152,7 @@ n1sdp:
   extends: .build
   parallel:
     matrix:
-      - TS: [none, n1sdp-ts]
-      - OPTEE: [none, n1sdp-optee]
+      - TESTING: [none, n1sdp-ts, n1sdp-optee, tftf]
=20
 qemu-generic-arm64:
   extends: .build
diff --git a/ci/tftf.yml b/ci/tftf.yml
index 260ceab0..33a8a4f5 100644
--- a/ci/tftf.yml
+++ b/ci/tftf.yml
@@ -4,4 +4,5 @@ header:
 local_conf_header:
   tftf: |
     TFA_UBOOT =3D "0"
+    TFA_UEFI =3D "0"
     TFTF_TESTS =3D "1"
--=20
2.34.1



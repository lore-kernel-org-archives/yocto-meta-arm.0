Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8EF0CC43217
	for <webhook@archiver.kernel.org>; Mon, 18 Oct 2021 15:41:03 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.38528.1634571661663446416
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 18 Oct 2021 08:41:02 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1AF1E2F
	for <meta-arm@lists.yoctoproject.org>; Mon, 18 Oct 2021 08:41:02 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BAC1A3F694
	for <meta-arm@lists.yoctoproject.org>; Mon, 18 Oct 2021 08:41:01 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 6/6] CI: enable testimage for fvp-base
Date: Mon, 18 Oct 2021 16:40:56 +0100
Message-Id: <20211018154056.1552230-6-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211018154056.1552230-1-ross.burton@arm.com>
References: <20211018154056.1552230-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 18 Oct 2021 15:41:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2279

Inherit fvpboot so that the FVP binary is fetched and configuration
generated.

Configure the FVP to forward host port 8022 to port 22 locally, and
tell testimage to SSH to localhost:8022. This has the limitation that
only one testimage can run per machine, but this will be removed shortly.

Disable the parselogs test case, as there are some harmless warnings in
the dmesg which cause it to fail.  Currently meta-arm can't extend the
whitelist of ignorable warnings.

The FVP binaries are x86-64 only, so tag the job appropriately.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .gitlab-ci.yml  | 4 +++-
 ci/fvp-base.yml | 9 +++++++++
 2 files changed, 12 insertions(+), 1 deletion(-)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index f00bdcf8..4a2b3366 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -109,8 +109,10 @@ corstone700-fvp:
 corstone700-mps3:
   extends: .build
=20
-fvp-base:
+fvp-base/testimage:
   extends: .build
+  tags:
+  - x86_64
=20
 fvp-base-arm32:
   extends: .build
diff --git a/ci/fvp-base.yml b/ci/fvp-base.yml
index 1c3675fa..47d123e3 100644
--- a/ci/fvp-base.yml
+++ b/ci/fvp-base.yml
@@ -5,3 +5,12 @@ header:
=20
 machine: fvp-base
=20
+local_conf_header:
+  testimagefvp: |
+    INHERIT =3D "fvpboot"
+    # This fails but we can't add to the ignorelist from meta-arm yet
+    # https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D14604
+    TEST_SUITES:remove =3D "parselogs"
+    # Tell testimage to connect to localhost:8022, and forward that to S=
SH in the FVP.
+    TEST_TARGET_IP =3D "localhost:8022"
+    FVP_CONFIG[bp.virtio_net.hostbridge.userNetPorts] ?=3D "8022=3D22"
--=20
2.25.1



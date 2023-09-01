Return-Path: <anusmita.duttamazumder@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BADBCA0FEC
	for <webhook@archiver.kernel.org>; Fri,  1 Sep 2023 16:36:46 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.268.1693586204343373456
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 01 Sep 2023 09:36:44 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: anusmita.duttamazumder@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 259CAFEC;
	Fri,  1 Sep 2023 09:37:22 -0700 (PDT)
Received: from PW04GXMM.arm.com (unknown [10.57.64.90])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8A9803F844;
	Fri,  1 Sep 2023 09:36:42 -0700 (PDT)
From: anusmita.duttamazumder@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com,
	Jon.Mason@arm.com
Cc: nd@arm.com,
	Anusmita Dutta Mazumder <anusmita.duttamazumder@arm.com>
Subject: [PATCH 2/2] CI: Build custom image for N1SDP optee-xtest
Date: Fri,  1 Sep 2023 17:36:26 +0100
Message-Id: <20230901163626.152-3-anusmita.duttamazumder@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230901163626.152-1-anusmita.duttamazumder@arm.com>
References: <20230901163626.152-1-anusmita.duttamazumder@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 01 Sep 2023 16:36:46 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5016

From: Anusmita Dutta Mazumder <anusmita.duttamazumder@arm.com>

Build a custom N1SDP image with only optee-xtests as part of the image. A=
 fresh custom image build is necessary to include the relevant test suite=
 for running the xtests.

Signed-off-by: Anusmita Dutta Mazumder <anusmita.duttamazumder@arm.com>
---
 .gitlab-ci.yml     |  1 +
 ci/n1sdp-optee.yml | 12 ++++++++++++
 2 files changed, 13 insertions(+)
 create mode 100644 ci/n1sdp-optee.yml

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 548b8e76..a2af8716 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -154,6 +154,7 @@ n1sdp:
   parallel:
     matrix:
       - TS: [none, n1sdp-ts]
+      - OPTEE: [none, n1sdp-optee]
=20
 qemu-generic-arm64:
   extends: .build
diff --git a/ci/n1sdp-optee.yml b/ci/n1sdp-optee.yml
new file mode 100644
index 00000000..f2b50abf
--- /dev/null
+++ b/ci/n1sdp-optee.yml
@@ -0,0 +1,12 @@
+header:
+  version: 14
+
+# Config specific for the optee-xtests
+local_conf_header:
+  optee-test: |
+    # Include ARM FFA
+    MACHINE_FEATURES:append =3D " arm-ffa"
+    # Include trusted services
+    TEST_SUITES:append =3D " trusted_services"
+    # Include Optee xtests
+    IMAGE_INSTALL:append =3D " optee-test"
--=20
2.34.1



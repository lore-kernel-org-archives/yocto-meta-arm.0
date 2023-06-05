Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30FE1C7EE2A
	for <webhook@archiver.kernel.org>; Mon,  5 Jun 2023 13:02:03 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.6906.1685970122292081525
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 05 Jun 2023 06:02:02 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 550E115BF
	for <meta-arm@lists.yoctoproject.org>; Mon,  5 Jun 2023 06:02:47 -0700 (PDT)
Received: from debian.lan?044arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id A9EBE3F663
	for <meta-arm@lists.yoctoproject.org>; Mon,  5 Jun 2023 06:02:01 -0700 (PDT)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 3/4] CI: add debug yml file for ease of use
Date: Mon,  5 Jun 2023 08:01:55 -0500
Message-Id: <20230605130156.3309199-3-jon.mason@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230605130156.3309199-1-jon.mason@arm.com>
References: <20230605130156.3309199-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 05 Jun 2023 13:02:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4723

There are cases where a developer might want to enable things, like
debug-tweaks, which are useful in their testing but not something we
would want in a production environment.  Create a file where these can
be added without affecting other things.

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 ci/debug.yml     | 7 +++++++
 ci/testimage.yml | 3 ++-
 2 files changed, 9 insertions(+), 1 deletion(-)
 create mode 100644 ci/debug.yml

diff --git a/ci/debug.yml b/ci/debug.yml
new file mode 100644
index 00000000..757f6d1d
--- /dev/null
+++ b/ci/debug.yml
@@ -0,0 +1,7 @@
+header:
+  version: 11
+
+# Add universally helpful features when testing boards
+local_conf_header:
+  debug: |
+    EXTRA_IMAGE_FEATURES:append =3D " debug-tweaks"
diff --git a/ci/testimage.yml b/ci/testimage.yml
index b4b5599b..5d402f0f 100644
--- a/ci/testimage.yml
+++ b/ci/testimage.yml
@@ -1,9 +1,10 @@
 header:
   version: 11
+  includes:
+    - ci/debug.yml
=20
 local_conf_header:
   testimage: |
-    EXTRA_IMAGE_FEATURES:append =3D " debug-tweaks"
     IMAGE_CLASSES +=3D "testimage"
     TESTIMAGE_AUTO =3D "1"
   kvm: |
--=20
2.30.2



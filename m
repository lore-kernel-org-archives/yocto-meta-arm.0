Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E657CC001B0
	for <webhook@archiver.kernel.org>; Mon, 24 Jul 2023 14:18:51 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.48838.1690208324274070637
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 24 Jul 2023 07:18:44 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 82B15165C
	for <meta-arm@lists.yoctoproject.org>; Mon, 24 Jul 2023 07:19:26 -0700 (PDT)
Received: from debian.lan?044arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 40CF53F67D
	for <meta-arm@lists.yoctoproject.org>; Mon, 24 Jul 2023 07:18:43 -0700 (PDT)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 1/2] CI: add defaults for get-binary-toolchains
Date: Thu, 20 Jul 2023 22:20:30 -0500
Message-Id: <20230721032031.3584730-1-jon.mason@arm.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 24 Jul 2023 14:18:51 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4917

Pre-populate the standard values of get-binary-toolchains so that it
will work without variables in a standard kas container.  This will aid
in ease-of-use for development and testing of binary toolchains.

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 ci/get-binary-toolchains | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/ci/get-binary-toolchains b/ci/get-binary-toolchains
index 23c3bbb1..69a4d38e 100755
--- a/ci/get-binary-toolchains
+++ b/ci/get-binary-toolchains
@@ -5,9 +5,10 @@ BASENAME=3Darm-gnu-toolchain
 VER=3D${VER:-12.2.rel1}
 HOST_ARCH=3D${HOST_ARCH:-$(uname -m)}
=20
-DOWNLOAD_DIR=3D$1
-TOOLCHAIN_DIR=3D$2
-TOOLCHAIN_LINK_DIR=3D$3
+# Use the standard kas container locations if nothing is passed into the=
 script
+DOWNLOAD_DIR=3D"${1:-/builds/persist/downloads/}"
+TOOLCHAIN_DIR=3D"${2:-/builds/persist//toolchains/}"
+TOOLCHAIN_LINK_DIR=3D"${3:-build/toolchains/}"
=20
 # These should be already created by .gitlab-ci.yml, but do here if run =
outside of that env
 mkdir -p $DOWNLOAD_DIR $TOOLCHAIN_DIR $TOOLCHAIN_LINK_DIR
--=20
2.30.2



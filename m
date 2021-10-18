Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E638C433FE
	for <webhook@archiver.kernel.org>; Mon, 18 Oct 2021 15:41:02 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.38530.1634571661953701239
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 18 Oct 2021 08:41:02 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8883A106F
	for <meta-arm@lists.yoctoproject.org>; Mon, 18 Oct 2021 08:41:01 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 343663F694
	for <meta-arm@lists.yoctoproject.org>; Mon, 18 Oct 2021 08:41:01 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 5/6] CI: install telnet into the images
Date: Mon, 18 Oct 2021 16:40:55 +0100
Message-Id: <20211018154056.1552230-5-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211018154056.1552230-1-ross.burton@arm.com>
References: <20211018154056.1552230-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 18 Oct 2021 15:41:02 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2278

runfvp currently needs telnet to communicate with the guest, so install
telnet into the image.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .gitlab-ci.yml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 04e65ffe..f00bdcf8 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -27,6 +27,7 @@ stages:
     - mkdir --verbose --parents $KAS_WORK_DIR $KAS_REPO_REF_DIR $SSTATE_=
DIR $DL_DIR $TOOLCHAIN_DIR $TOOLCHAIN_LINK_DIR
     # Must do this here, as it's the only way to make sure the toolchain=
 is installed on the same builder
     - ./ci/get-binary-toolchains $DL_DIR $TOOLCHAIN_DIR $TOOLCHAIN_LINK_=
DIR
+    - sudo apt update && sudo apt install telnet -y
=20
 # Generalised fragment to do a Kas build
 .build:
--=20
2.25.1



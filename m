Return-Path: <Michael.safwat@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61838F9D0C8
	for <webhook@archiver.kernel.org>; Tue, 14 Apr 2026 11:43:01 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16830.1776166980089624510
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 14 Apr 2026 04:43:00 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=jMVDen0u;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: michael.safwat@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B2AC34ECD;
	Tue, 14 Apr 2026 04:42:53 -0700 (PDT)
Received: from e142473.cambridge.arm.com (e142473.arm.com [10.1.198.48])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DC3043F7B4;
	Tue, 14 Apr 2026 04:42:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1776166979; bh=v5Z/sOArwjv5i6pcXVTpzJtj2YsXT9xYv93EoEAr1lM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=jMVDen0ufJJK1Lj0yUAWcsak+bc3AihkkqSGb/2p/djLLrl4xNJ9xZ6cq4YsYlk/S
	 ei3tUcNgDE+jjTva018cXhoZ1Ah4mgo12WiwQ0Y+VB5sZHYwe0+hPTTgqpgY7+Gz8M
	 +bkvszBKMHJO/+6fz5+g7uuLdu5AaIdH7H3b1BCM=
From: Michael Safwat <michael.safwat@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Michael Safwat <michael.safwat@arm.com>
Subject: [PATCH 2/2] arm-bsp/docs: corstone1000: Drop A320 reboot workaround note
Date: Tue, 14 Apr 2026 12:42:53 +0100
Message-ID: <20260414114253.1031986-2-michael.safwat@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260414114253.1031986-1-michael.safwat@arm.com>
References: <20260414114253.1031986-1-michael.safwat@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 14 Apr 2026 11:43:01 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/7014

Remove the user-guide warning and rebuild steps for the
disable_module_autoloading workaround on Corstone-1000 with Cortex-A320.

With the NPU reset issue fixed, this workaround is no longer
needed.

Signed-off-by: Michael Safwat <michael.safwat@arm.com>
---
 .../documentation/corstone1000/user-guide.rst | 39 -------------------
 1 file changed, 39 deletions(-)

diff --git a/meta-arm-bsp/documentation/corstone1000/user-guide.rst b/met=
a-arm-bsp/documentation/corstone1000/user-guide.rst
index ef1f48b7..e38fd1e8 100644
--- a/meta-arm-bsp/documentation/corstone1000/user-guide.rst
+++ b/meta-arm-bsp/documentation/corstone1000/user-guide.rst
@@ -865,45 +865,6 @@ The results can be fetched from the `acs_results` fo=
lder in the ``BOOT`` partiti
 Capsule Update
 --------------
=20
-.. warning::
-
-    The **Corstone-1000 with Cortex-A320 FVP** becomes unresponsive when=
 the Linux kernel driver for the
-    Ethos-U85 NPU loads automatically after a software reboot.
-    This behavior results from a power reset control issue in the **Cors=
tone-1000 with Cortex-A320 FVP** model.
-    To prevent the failure and complete the test successfully,
-    rebuild the **Corstone-1000 with Cortex-A320** firmware image using =
the following steps:
-
-
-    #. Clone the `iot-platform-assets` repository to your ``${WORKSPACE}=
``.
-
-        .. code-block:: console
-
-            cd ${WORKSPACE}
-            git clone https://git.gitlab.arm.com/arm-reference-solutions=
/iot-platform-assets.git \
-            -b CORSTONE1000-2025.12
-
-    #. Copy the disable ethosu driver Git patch file to your copy of `me=
ta-arm`.
-
-        .. code-block:: console
-
-            cp -f iot-platform-assets/corstone1000/disable_module_autolo=
ading/0001-arm-bsp-linux-corstone1000-a320-disable-ethosu-confi.patch \
-            ${WORKSPACE}/meta-arm/
-
-    #. Apply the Git patch to `meta-arm`.
-
-        .. code-block:: console
-
-            cd ${WORKSPACE}/meta-arm/
-            git apply 0001-arm-bsp-linux-corstone1000-a320-disable-ethos=
u-confi.patch
-            cd ${WORKSPACE}
-
-    #. Re-Build the **Corstone-1000 with Cortex-A320 FVP** software stac=
k as follows:
-
-        .. code-block:: console
-
-            kas build meta-arm/kas/corstone1000-fvp.yml:meta-arm/ci/debu=
g.yml:meta-arm/kas/corstone1000-a320.yml
-
-
 .. important::
=20
     Payload GUIDs (``${BL2_GUID}``, ``${TFM_S_GUID}``, ``${FIP_GUID}``, =
and ``${INITRAMFS_GUID}``)


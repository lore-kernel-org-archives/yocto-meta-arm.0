Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5398AC021A0
	for <webhook@archiver.kernel.org>; Thu, 13 Feb 2025 15:49:32 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.14321.1739461765226617566
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 13 Feb 2025 07:49:25 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8166126AC
	for <meta-arm@lists.yoctoproject.org>; Thu, 13 Feb 2025 07:49:45 -0800 (PST)
Received: from H24V3P4C17.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 7F5223F58B
	for <meta-arm@lists.yoctoproject.org>; Thu, 13 Feb 2025 07:49:24 -0800 (PST)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 2/2] arm/trusted-firmware-a: move qemuarm64-secureboot file to the correct location
Date: Thu, 13 Feb 2025 10:49:22 -0500
Message-Id: <20250213154922.46233-2-jon.mason@arm.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20250213154922.46233-1-jon.mason@arm.com>
References: <20250213154922.46233-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 13 Feb 2025 15:49:32 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6372

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 .../qemuarm64-secureboot}/0001-Add-spmc_manifest-for-qemu.patch   | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename {meta-arm-bsp/recipes-bsp/trusted-firmware-a/files =3D> meta-arm/=
recipes-bsp/trusted-firmware-a/files/qemuarm64-secureboot}/0001-Add-spmc_=
manifest-for-qemu.patch (100%)

diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/0001-Add-s=
pmc_manifest-for-qemu.patch b/meta-arm/recipes-bsp/trusted-firmware-a/fil=
es/qemuarm64-secureboot/0001-Add-spmc_manifest-for-qemu.patch
similarity index 100%
rename from meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/0001-Add-sp=
mc_manifest-for-qemu.patch
rename to meta-arm/recipes-bsp/trusted-firmware-a/files/qemuarm64-secureb=
oot/0001-Add-spmc_manifest-for-qemu.patch
--=20
2.39.5 (Apple Git-154)



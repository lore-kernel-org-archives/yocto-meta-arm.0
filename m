Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED2E4F46C53
	for <webhook@archiver.kernel.org>; Mon,  6 Apr 2026 15:16:28 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.57327.1775488581464258873
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 06 Apr 2026 08:16:21 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=o/7nr9EL;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 103E11BA8
	for <meta-arm@lists.yoctoproject.org>; Mon,  6 Apr 2026 08:16:15 -0700 (PDT)
Received: from H24V3P4C17.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id AF5A03F632
	for <meta-arm@lists.yoctoproject.org>; Mon,  6 Apr 2026 08:16:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1775488580; bh=giSzDvSjEAiExslLfvXhhe/DlW2igXZUeIRtJI/8ig4=;
	h=From:To:Subject:Date:From;
	b=o/7nr9ELmnqwtargAuJM1yJ73C0dnzylsunZ5JgpTQ8A4KqAPyHBAaRA14FZNp5+A
	 BFeyTOQVynUlxdJTJGrA1hYWM0ufg60JEczVtsZBdSd+dSxGlqsa7sOxeLAZJeLl2/
	 HHVHhHdaxLcFW+8Qtdp9E1ZdhptUKOOe1x4h8HN4=
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 1/2] arm-bsp/sbsa-ref: workaround CPU topology warning
Date: Mon,  6 Apr 2026 11:16:19 -0400
Message-ID: <20260406151620.99679-1-jon.mason@arm.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 06 Apr 2026 15:16:28 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/7004

To workaround the CPU topology issue with edk2-firmware, we can specify
the number of processors being used, which seems to setup the CPU
topology mask correctly (and thus no errors).  With this addressed, we
can use the latest edk2 firmware, which allows us to use the latest TF-A
version.

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 meta-arm-bsp/conf/machine/sbsa-ref.conf | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/meta-arm-bsp/conf/machine/sbsa-ref.conf b/meta-arm-bsp/conf/=
machine/sbsa-ref.conf
index d05e44677e0d..1f86cdb6e0e7 100644
--- a/meta-arm-bsp/conf/machine/sbsa-ref.conf
+++ b/meta-arm-bsp/conf/machine/sbsa-ref.conf
@@ -25,19 +25,12 @@ EFI_PROVIDER ?=3D "${@bb.utils.contains("DISTRO_FEATU=
RES", "systemd", "systemd-boo
=20
 SERIAL_CONSOLES ?=3D "115200;ttyAMA0 115200;hvc0"
=20
-# FIXME - when compiling edk2, we're seeing an error of fip.bin being la=
rger than the region size.
-# Pin the version back until this can be resolved
-PREFERRED_VERSION_trusted-firmware-a ?=3D "2.12.%"
-
 EXTRA_IMAGEDEPENDS +=3D "edk2-firmware"
-# FIXME - Currently seeing a kernel warning for the CPU topology when bu=
mping
-# the version past this.  The issue is being tracked in
-# https://github.com/tianocore/edk2-platforms/issues/752
-PREFERRED_VERSION_edk2-firmware ?=3D "202408%"
=20
 QB_SYSTEM_NAME =3D "qemu-system-aarch64"
 QB_MACHINE =3D "-machine sbsa-ref"
 QB_CPU =3D "-cpu neoverse-n2"
+QB_SMP =3D "-smp 4"
 QB_MEM =3D "-m 1024"
 QB_DEFAULT_FSTYPE =3D "wic.qcow2"
 QB_NETWORK_DEVICE =3D "-device e1000e,netdev=3Dnet0,mac=3D@MAC@"
--=20
2.50.1 (Apple Git-155)



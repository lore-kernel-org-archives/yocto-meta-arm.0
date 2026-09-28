Return-Path: <harsimransingh.tungal@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF1E5CA5FA7
	for <webhook@archiver.kernel.org>; Mon, 28 Sep 2026 15:30:33 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.60338.1790609430833841456
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 28 Sep 2026 08:30:31 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=UIjqISxi;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: harsimransingh.tungal@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B209F1655;
	Mon, 28 Sep 2026 08:30:26 -0700 (PDT)
Received: from e142474.cambridge.arm.com (e142474.arm.com [10.2.203.50])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AC25B3F763;
	Mon, 28 Sep 2026 08:30:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790609430; bh=BGwGo8bhyvV21odb9r2F3dYefajf8fhSPighRrGyyNE=;
	h=From:To:Cc:Subject:Date:From;
	b=UIjqISxihny27o35I2pIX5zl4tUH0qJSdCIDNWiO46QFefH9r8NIr0YIdiXX3z7Rh
	 iuxlb5/cfPaVjg0jyd9TnmTxgwTn6m8b6tFPXm5ReyfNIH/vo52qLr2JGj+7MRNXEw
	 zlXcKUd28x1Pn9n1agrrwVlba8oE2SvPeRKk8GJI=
From: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
Subject: [PATCH 0/1] arm/trusted-firmware-a: fix cot-dt2c parser failure
Date: Mon, 28 Sep 2026 16:30:21 +0100
Message-ID: <20260928153022.1966815-1-harsimransingh.tungal@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 28 Sep 2026 15:30:33 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/7176

Provide a TF-A fix to normalise CoT DTS cell expressions before cot-dt2c
parses the generated descriptor.
This avoids build failures where cot-dt2c reports "not a valid CoT DT fil=
e"
when parsing arithmetic expressions in generated CoT descriptors.

Harsimran Singh Tungal (1):
  arm/trusted-firmware-a: fix cot-dt2c parser failure

 .../trusted-firmware-a/cot-dt2c_0.1.0.bb      |  4 +-
 ...ormalise-arithmetic-cell-expressions.patch | 77 +++++++++++++++++++
 2 files changed, 80 insertions(+), 1 deletion(-)
 create mode 100644 meta-arm/recipes-bsp/trusted-firmware-a/files/0001-co=
t-dt2c-normalise-arithmetic-cell-expressions.patch



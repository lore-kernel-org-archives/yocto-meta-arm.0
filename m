Return-Path: <frazer.carsley@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 552ECFED3EE
	for <webhook@archiver.kernel.org>; Fri, 24 Apr 2026 15:38:20 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.25305.1777045093091596360
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 24 Apr 2026 08:38:13 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=a1/aY9bV;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: frazer.carsley@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E1530358A;
	Fri, 24 Apr 2026 08:38:06 -0700 (PDT)
Received: from e138143.arm.com (unknown [10.57.18.238])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C923B3F7B4;
	Fri, 24 Apr 2026 08:38:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1777045092; bh=ceX5FHVtaWsF52KeuNlRKgguQ6XYXFUY6gW8qhGRtes=;
	h=From:To:Cc:Subject:Date:From;
	b=a1/aY9bVJrg/JOxapyrSaTy5+oUkBLB6nvz5GVrj2LrAp/H73qf6Zhoh2zrKOVZSe
	 oHqTIsvm6Cn7QNPtIYcugPkIie1C1bnt4PTv5BqUALsk0TFiawtw7BH1E9v2tIDhfU
	 60EFpTxzSWjTD3aVA45EMeRGb9i4yiIwgDqFXpD0=
From: Frazer Carsley <frazer.carsley@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Frazer Carsley <frazer.carsley@arm.com>
Subject: [PATCH 0/3] Add GPT library fixes and duplicate features
Date: Fri, 24 Apr 2026 16:36:53 +0100
Message-ID: <20260424153656.774555-1-frazer.carsley@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 24 Apr 2026 15:38:20 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/7023

* Backport bug fixes for library
* Adds new duplicate partition feature
* Adds redundant flash erase protections

Frazer Carsley (3):
  arm-bsp/trusted-firmware-m:cs1k: Add fixes for GPT library
  arm-bsp/trusted-firmware-m:cs1k: Add extra GPT library operations
  arm-bsp/trusted-firmware-m:cs1k: Use new GPT duplicate functionality

 ...pt-Fix-final-entry-not-being-removed.patch | 114 +++
 ...lib-gpt-Replace-warnings-with-errors.patch |  37 +
 ...-gpt-Enforce-entry-size-of-128-bytes.patch | 268 +++++++
 ...Ensure-block-size-complies-with-spec.patch |  38 +
 ...0050-lib-gpt-Expand-table-validation.patch | 352 +++++++++
 ...ent-of-GUIDs-in-unittests-more-clear.patch | 216 ++++++
 ...Provide-macro-identifying-free-space.patch | 157 ++++
 ...t-Add-operation-to-duplicate-entries.patch | 255 +++++++
 ...ively-erase-blocks-when-moving-parti.patch | 240 ++++++
 .../0055-lib-gpt-Clarify-API-operation.patch  |  38 +
 ...gpt-Add-metadata-only-API-operations.patch | 701 ++++++++++++++++++
 ...plat-cs1k-Add-flash-erase-protection.patch |  98 +++
 ...-unused-FWU-partitions-upon-version-.patch | 153 ++++
 ...lat-cs1k-Duplicate-old-images-in-FWU.patch | 217 ++++++
 .../trusted-firmware-m-corstone1000.inc       |  14 +
 15 files changed, 2898 insertions(+)
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/cor=
stone1000/0046-lib-gpt-Fix-final-entry-not-being-removed.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/cor=
stone1000/0047-lib-gpt-Replace-warnings-with-errors.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/cor=
stone1000/0048-lib-gpt-Enforce-entry-size-of-128-bytes.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/cor=
stone1000/0049-lib-gpt-Ensure-block-size-complies-with-spec.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/cor=
stone1000/0050-lib-gpt-Expand-table-validation.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/cor=
stone1000/0051-lib-gpt-Show-intent-of-GUIDs-in-unittests-more-clear.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/cor=
stone1000/0052-lib-gpt-Provide-macro-identifying-free-space.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/cor=
stone1000/0053-lib-gpt-Add-operation-to-duplicate-entries.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/cor=
stone1000/0054-lib-gpt-Consecutively-erase-blocks-when-moving-parti.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/cor=
stone1000/0055-lib-gpt-Clarify-API-operation.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/cor=
stone1000/0056-lib-gpt-Add-metadata-only-API-operations.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/cor=
stone1000/0057-plat-cs1k-Add-flash-erase-protection.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/cor=
stone1000/0058-plat-cs1k-Remove-unused-FWU-partitions-upon-version-.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/cor=
stone1000/0059-plat-cs1k-Duplicate-old-images-in-FWU.patch



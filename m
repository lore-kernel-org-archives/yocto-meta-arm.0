Return-Path: <drew.reed@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13AFECDB47E
	for <webhook@archiver.kernel.org>; Wed, 18 Oct 2023 14:24:17 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.282470.1697639056015225194
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 18 Oct 2023 07:24:16 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: drew.reed@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 315B42F4;
	Wed, 18 Oct 2023 07:24:56 -0700 (PDT)
Received: from C02DP1BVML7H.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5CDAA3F64C;
	Wed, 18 Oct 2023 07:24:14 -0700 (PDT)
From: drew.reed@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com
Cc: nd@arm.com,
	Drew Reed <Drew.Reed@arm.com>
Subject: [PATCH 0/2] Enable TFTF test build for additional boards
Date: Wed, 18 Oct 2023 15:24:07 +0100
Message-ID: <20231018142409.5807-1-drew.reed@arm.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 18 Oct 2023 14:24:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5143

From: Drew Reed <Drew.Reed@arm.com>

Enable building an image with the TF-A TFTF tests in place of the TF-A
BL31 payload so the tests are run from normal world on the N1SDP
platform.
Include in the CI configuration the building of this new image for the
N1SDP board
Include the building of a Corstone-1000 MPS3 board TFTF test image into
the CI pipeline

Drew Reed (2):
  arm-bsp: Enable TF-A test building for the N1SDP
  CI: Enable TF-A TFTF test builds

 .gitlab-ci.yml                                             | 7 +++++--
 ci/tftf.yml                                                | 1 +
 meta-arm-bsp/conf/machine/n1sdp.conf                       | 4 ++++
 .../recipes-bsp/trusted-firmware-a/tf-a-tests_%.bbappend   | 2 ++
 .../trusted-firmware-a/trusted-firmware-a-n1sdp.inc        | 6 ++----
 5 files changed, 14 insertions(+), 6 deletions(-)

--=20
2.34.1



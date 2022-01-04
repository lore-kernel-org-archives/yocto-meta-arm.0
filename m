Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78462C433EF
	for <webhook@archiver.kernel.org>; Tue,  4 Jan 2022 21:06:03 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.188.1641330361978278313
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 04 Jan 2022 13:06:02 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6DEC611D4
	for <meta-arm@lists.yoctoproject.org>; Tue,  4 Jan 2022 13:06:00 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 17F393F66F
	for <meta-arm@lists.yoctoproject.org>; Tue,  4 Jan 2022 13:05:59 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 1/2] arm-bsp/trusted-firmware-a: use full option names in
 sgdisk call
Date: Tue,  4 Jan 2022 21:05:57 +0000
Message-Id: <20220104210558.3504309-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 04 Jan 2022 21:06:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2792

The TC appends include a long sgdisk invocation which can be made a lot
clearer by using the full option names (e.g. --change-name) instead of
short (e.g. -c).

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../trusted-firmware-a-tc.inc                 | 26 +++++++++++++++----
 1 file changed, 21 insertions(+), 5 deletions(-)

diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware=
-a-tc.inc b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-=
a-tc.inc
index 1074d143..f47856b2 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-tc.i=
nc
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-tc.i=
nc
@@ -101,11 +101,27 @@ do_generate_gpt() {
     dd if=3D/dev/zero of=3D$gpt_image bs=3D$gpt_size count=3D1
=20
     # create the GPT layout
-    sgdisk -a 1 -U $location_uuid \
-           -n 1:$start_sector_1:+$num_sectors_fip -c 1:FIP_A -t 1:$fip_t=
ype_uuid -u 1:$FIP_A_uuid \
-           -n 2:$start_sector_2:+$num_sectors_fip -c 2:FIP_B -t 2:$fip_t=
ype_uuid -u 2:$FIP_B_uuid \
-           -n 3:$start_sector_3:+$num_sectors_metadata -c 3:FWU-Metadata=
 -t 3:$metadata_type_uuid \
-           -n 4:$start_sector_4:+$num_sectors_metadata -c 4:Bkup-FWU-Met=
adata -t 4:$metadata_type_uuid $gpt_image
+    sgdisk $gpt_image \
+           --set-alignment 1 \
+           --disk-guid $location_uuid \
+           \
+           --new 1:$start_sector_1:+$num_sectors_fip \
+           --change-name 1:FIP_A \
+           --typecode 1:$fip_type_uuid \
+           --partition-guid 1:$FIP_A_uuid \
+           \
+           --new 2:$start_sector_2:+$num_sectors_fip \
+           --change-name 2:FIP_B \
+           --typecode 2:$fip_type_uuid \
+           --partition-guid 2:$FIP_B_uuid \
+           \
+           --new 3:$start_sector_3:+$num_sectors_metadata \
+           --change-name 3:FWU-Metadata \
+           --typecode 3:$metadata_type_uuid \
+           \
+           --new 4:$start_sector_4:+$num_sectors_metadata \
+           --change-name 4:Bkup-FWU-Metadata \
+           --typecode 4:$metadata_type_uuid
=20
     # populate the GPT partitions
     dd if=3D$fip_bin of=3D$gpt_image bs=3D$sector_size seek=3D$start_sec=
tor_1 count=3D$num_sectors_fip conv=3Dnotrunc
--=20
2.25.1



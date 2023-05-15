Return-Path: <emekcan.aras@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60505C77B75
	for <webhook@archiver.kernel.org>; Mon, 15 May 2023 16:02:43 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.92646.1684166559723842813
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 15 May 2023 09:02:39 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: emekcan.aras@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CD0262F4;
	Mon, 15 May 2023 09:03:23 -0700 (PDT)
Received: from cassini-003.cambridge.arm.com (cassini-003.cambridge.arm.com [10.1.194.57])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 5AF3E3F663;
	Mon, 15 May 2023 09:02:38 -0700 (PDT)
From: emekcan.aras@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com,
	Jon.Mason@arm.com
Cc: nd@arm.com,
	Emekcan Aras <emekcan.aras@arm.com>
Subject: [PATCH mickledore 2/2] arm-bsp/wic: corstone1000: Fix and limit the partition size for corstone1000
Date: Mon, 15 May 2023 17:02:30 +0100
Message-Id: <20230515160230.54917-3-emekcan.aras@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230515160230.54917-1-emekcan.aras@arm.com>
References: <20230515160230.54917-1-emekcan.aras@arm.com>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 15 May 2023 16:02:43 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4653

From: Emekcan Aras <emekcan.aras@arm.com>

It fixes and limits the partition size to fix capsule update feature
after the GPT changes.
The partitions in the second bank needs to have correct size and
the partitions in first bank should have a fixed size since corstone1000 does
not support partial update and has a limited flash to support variable size.

Signed-off-by: Emekcan Aras <emekcan.aras@arm.com>
---
 .../wic/corstone1000-image.corstone1000.wks    | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/meta-arm-bsp/wic/corstone1000-image.corstone1000.wks b/meta-arm-bsp/wic/corstone1000-image.corstone1000.wks
index 5668071a..71ab20f2 100644
--- a/meta-arm-bsp/wic/corstone1000-image.corstone1000.wks
+++ b/meta-arm-bsp/wic/corstone1000-image.corstone1000.wks
@@ -4,6 +4,8 @@
 
 # The entries with --offset parameter should not be relocated
 # because BL1 code is statically configured for the given positions
+# Partition sizes are fixed since corstone1000 does not support partial update
+# and has a limit for each partition to grow.
 
 part --source empty --size 3k --offset 17k --part-name="reserved_1" --uuid B1F2FC8C-A7A3-4485-87CB-16961B8847D7
 
@@ -13,21 +15,21 @@ part --source empty --size 4k --align 4 --offset 24k --part-name="Bkup-FWU-Metad
 part --source empty --size 4k --align 4 --offset 28k --part-name="private_metadata_replica_2" --uuid 3CC3B456-DEC8-4CE3-BC5C-965483CE4828 --part-type ECB55DC3-8AB7-4A84-AB56-EB0A9974DB42
 part --source empty --size 4k --align 4 --offset 32k --part-name="private_metadata_replica_2" --uuid DCE9C503-8DFD-4DCB-8889-647E49641552 --part-type ECB55DC3-8AB7-4A84-AB56-EB0A9974DB42
 
-part --source rawcopy --sourceparams="file=bl2_signed.bin" --offset 36k --align 4 --part-name="bl2_primary" --uuid 9A3A8FBF-55EF-439C-80C9-A3F728033929 --part-type 64BD8ADB-02C0-4819-8688-03AB4CAB0ED9
+part --source rawcopy --size 100k --sourceparams="file=bl2_signed.bin" --offset 36k --align 4 --part-name="bl2_primary" --uuid 9A3A8FBF-55EF-439C-80C9-A3F728033929 --part-type 64BD8ADB-02C0-4819-8688-03AB4CAB0ED9
 
-part --source rawcopy --sourceparams="file=tfm_s_signed.bin" --align 4 --part-name="tfm_primary" --uuid 07F9616C-1233-439C-ACBA-72D75421BF70 --part-type D763C27F-07F6-4FF0-B2F3-060CB465CD4E
+part --source rawcopy --size 376k --sourceparams="file=tfm_s_signed.bin" --align 4 --part-name="tfm_primary" --uuid 07F9616C-1233-439C-ACBA-72D75421BF70 --part-type D763C27F-07F6-4FF0-B2F3-060CB465CD4E
 
 # Rawcopy of the FIP binary
-part --source rawcopy --sourceparams="file=signed_fip-corstone1000.bin" --align 4 --part-name="FIP_A" --uuid B9C7AC9D-40FF-4675-956B-EEF4DE9DF1C5 --part-type B5EB19BD-CF56-45E8-ABA7-7ADB228FFEA7
+part --source rawcopy --size 2 --sourceparams="file=signed_fip-corstone1000.bin" --align 4 --part-name="FIP_A" --uuid B9C7AC9D-40FF-4675-956B-EEF4DE9DF1C5 --part-type B5EB19BD-CF56-45E8-ABA7-7ADB228FFEA7
 
 # Rawcopy of kernel with initramfs
-part --source rawcopy --sourceparams="file=Image.gz-initramfs-${MACHINE}.bin" --align 4 --part-name="kernel_primary" --uuid BF7A6142-0662-47FD-9434-6A8811980816 --part-type 8197561D-6124-46FC-921E-141CC5745B05
+part --source rawcopy --size 12 --sourceparams="file=Image.gz-initramfs-${MACHINE}.bin" --align 4 --part-name="kernel_primary" --uuid BF7A6142-0662-47FD-9434-6A8811980816 --part-type 8197561D-6124-46FC-921E-141CC5745B05
 
 
-part --source empty --size 100k --offset 16392k --align 4 --part-name="bl2_secondary" --uuid 3F0C49A4-48B7-4D1E-AF59-3E4A3CE1BA9F --part-type 64BD8ADB-02C0-4819-8688-03AB4CAB0ED9
-part --source empty --size 4k --align 4 --part-name="tfm_secondary" --uuid 009A6A12-64A6-4F0F-9882-57CD79A34A3D --part-type D763C27F-07F6-4FF0-B2F3-060CB465CD4E
-part --source empty --size 4k --align 4 --part-name="FIP_B" --uuid 9424E370-7BC9-43BB-8C23-71EE645E1273 --part-type B5EB19BD-CF56-45E8-ABA7-7ADB228FFEA7
-part --source empty --size 4k --align 4 --part-name="kernel_secondary" --uuid A2698A91-F9B1-4629-9188-94E4520808F8 --part-type 8197561D-6124-46FC-921E-141CC5745B05
+part --source empty --size 100k --offset 16492k --align 4 --part-name="bl2_secondary" --uuid 3F0C49A4-48B7-4D1E-AF59-3E4A3CE1BA9F --part-type 64BD8ADB-02C0-4819-8688-03AB4CAB0ED9
+part --source empty --size 376k --align 4 --part-name="tfm_secondary" --uuid 009A6A12-64A6-4F0F-9882-57CD79A34A3D --part-type D763C27F-07F6-4FF0-B2F3-060CB465CD4E
+part --source empty --size 2 --align 4 --part-name="FIP_B" --uuid 9424E370-7BC9-43BB-8C23-71EE645E1273 --part-type B5EB19BD-CF56-45E8-ABA7-7ADB228FFEA7
+part --source empty --size 12 --align 4 --part-name="kernel_secondary" --uuid A2698A91-F9B1-4629-9188-94E4520808F8 --part-type 8197561D-6124-46FC-921E-141CC5745B05
 
 
 part --source empty --size 3k --offset 32748k --part-name="reserved_2" --uuid CCB18569-C0BA-42E0-A429-FE1DC862D660
-- 
2.17.1



Received: from EUR03-DB5-obe.outbound.protection.outlook.com (EUR03-DB5-obe.outbound.protection.outlook.com [40.107.4.48])
 by mx.groups.io with SMTP id smtpd.web10.8307.1586338596454042804
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 08 Apr 2020 02:36:36 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=cNLDLgSe;
 spf=pass (domain: arm.com, ip: 40.107.4.48, mailfrom: diego.sueiro@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0WTZJ+Txxjf0dvrFmdqa+KykmmWLFgjByH6BvLbvISo=;
 b=cNLDLgSevVbFXOSBzoU1jduzufyxC5MgbC+oweJ+6frXesbuWfE83pM3X8NDn7Jci5p/tdt9CFG4z2T3DODi2HoVplw3A8M05Z5X5KPsXouyY+9/e6R6Pj/jFUAV7wCtbJ0tjvgqQQtNcfU9xTAUGY2sJmh4T+baWds628TZeTY=
Received: from AM6PR04CA0050.eurprd04.prod.outlook.com (2603:10a6:20b:f0::27)
 by VE1PR08MB4895.eurprd08.prod.outlook.com (2603:10a6:802:ac::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2878.20; Wed, 8 Apr
 2020 09:36:33 +0000
Received: from AM5EUR03FT028.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:f0:cafe::cc) by AM6PR04CA0050.outlook.office365.com
 (2603:10a6:20b:f0::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2900.15 via Frontend
 Transport; Wed, 8 Apr 2020 09:36:33 +0000
Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT028.mail.protection.outlook.com (10.152.16.118) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2856.17 via Frontend Transport; Wed, 8 Apr 2020 09:36:33 +0000
Received: ("Tessian outbound eadf07c3b4bb:v50"); Wed, 08 Apr 2020 09:36:33 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: dec5263e34d59d55
X-CR-MTA-TID: 64aa7808
Received: from fcd938568303.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id CE62C45D-FB88-4631-9407-8A42FA2B06D0.1;
	Wed, 08 Apr 2020 09:36:27 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id fcd938568303.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Wed, 08 Apr 2020 09:36:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gO3vJMj37E7DhwgNxsU7WDMvPmbG2Z7jXoTMV5j5Q0cH/rW+xdHlf4cRcCwb970dMoDoFwTqV5G8GJqgXVWUYT/T88C+vC41xXpxdh1CAd5qpe0hiXZJLyGRYtg7L3ylBYD+0I7Te2V4Z4boeM1R+5NkpDlCCYumF4tpvG3SlGYOUhA/n7JKxE4cl65+GWaMUdNFfkmVo4SkRJsKuhlkvdE4KVGbpP7+dNEO7mdm81gqArtdPKUPNnAow7Bg5Kh3homZtXfvTNmFryE8UabIZmd/t9I7+xFfZNgY3Yz+9UFyTM+wDmnMwAA5+jUR4mUzYUQ9ZnZlBD32+ad/xKuUYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0WTZJ+Txxjf0dvrFmdqa+KykmmWLFgjByH6BvLbvISo=;
 b=Qp89L8vyoau9TBHLDYfsBVxrr/sYoZj6QoTLuMafMnyF2CcbO5b6VcnnRoE3QmtJfK4TfLm0BOlehsl/rx7i+9dMTGhuiAko6qiehvaz1azj99MPtnBnA+Ez6SlWqnqMZ1lUpaBNzZkYkBimxO66xA73tcIEpYDiW6ZUzptHoYsXbyN3vjR7kmWD17W3mcl8BjG++v2PdBUMyFetrh7S18kaob7QdfmkLXpz+LGz9luL8VNw8KPrBBtHJZ36Q50Eigm0Buz9t6UFtLa1KPEagzr9lCRQwt0RKbFCq3Diig4xso5lW/8gLQ0Hm4ZUgkOozRzDH1fHNjcnNcUy4q0YuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0WTZJ+Txxjf0dvrFmdqa+KykmmWLFgjByH6BvLbvISo=;
 b=cNLDLgSevVbFXOSBzoU1jduzufyxC5MgbC+oweJ+6frXesbuWfE83pM3X8NDn7Jci5p/tdt9CFG4z2T3DODi2HoVplw3A8M05Z5X5KPsXouyY+9/e6R6Pj/jFUAV7wCtbJ0tjvgqQQtNcfU9xTAUGY2sJmh4T+baWds628TZeTY=
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Diego.Sueiro@arm.com; 
Received: from VI1PR08MB3998.eurprd08.prod.outlook.com (2603:10a6:803:e5::27)
 by VI1PR08MB4320.eurprd08.prod.outlook.com (2603:10a6:803:100::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2878.15; Wed, 8 Apr
 2020 09:36:25 +0000
Received: from VI1PR08MB3998.eurprd08.prod.outlook.com
 ([fe80::18b3:4e3f:17e9:b358]) by VI1PR08MB3998.eurprd08.prod.outlook.com
 ([fe80::18b3:4e3f:17e9:b358%7]) with mapi id 15.20.2878.022; Wed, 8 Apr 2020
 09:36:25 +0000
From: "Diego Sueiro" <diego.sueiro@arm.com>
To: meta-arm@lists.yoctoproject.org
CC: nd@arm.com,
	Diego Sueiro <diego.sueiro@arm.com>
Subject: [PATCH 2/2] arm-autonomy: Add Xen specifics from meta-arm-bsp
Date: Wed,  8 Apr 2020 10:36:13 +0100
Message-ID: <1586338573-27238-3-git-send-email-diego.sueiro@arm.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1586338573-27238-1-git-send-email-diego.sueiro@arm.com>
References: <1586338573-27238-1-git-send-email-diego.sueiro@arm.com>
X-ClientProxiedBy: LO2P265CA0448.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:e::28) To VI1PR08MB3998.eurprd08.prod.outlook.com
 (2603:10a6:803:e5::27)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from e120809-lin.cambridge.arm.com (217.140.106.50) by LO2P265CA0448.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:e::28) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.2900.15 via Frontend Transport; Wed, 8 Apr 2020 09:36:24 +0000
X-Mailer: git-send-email 2.7.4
X-Originating-IP: [217.140.106.50]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 2e8e81b5-c3ed-4191-44b5-08d7dba0531a
X-MS-TrafficTypeDiagnostic: VI1PR08MB4320:|VI1PR08MB4320:|VE1PR08MB4895:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<VE1PR08MB4895E9655D4DD81E9B27AE4A92C00@VE1PR08MB4895.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;OLM:8882;
X-Forefront-PRVS: 0367A50BB1
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR08MB3998.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(10009020)(4636009)(376002)(346002)(39860400002)(136003)(366004)(396003)(2616005)(66556008)(44832011)(478600001)(316002)(66946007)(956004)(66476007)(30864003)(52116002)(4326008)(7696005)(6916009)(81166007)(86362001)(16526019)(6486002)(26005)(36756003)(66574012)(8676002)(5660300002)(8936002)(81156014)(6666004)(2906002)(186003);DIR:OUT;SFP:1101;
Received-SPF: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: XPVisgf+cbSZCLaCyFBIlSaryyw9qEHcm0wNXXjNeotYq8Kyj38sq1xfCKpJekLIyq1v5o15pTC+k4wp/e2fGm2pTyiI0qg4sShoLhlmKP3UNP8XYs6R3NGiT8ZrF1bJGATVy8zcOdTTHAdeOsVBo/bUjgJG2VvxcF40N3Lo99TBpiOUS6CRkQuNXA8PJjcTW+87NWyEabKAQr0en4cOXZf68rdrKwwaFS2ws3N/YQvGmhqXlgoPgy1md86p7L0C9RZdidVA5kySZihjCFuc/xZ44/5tkKt2OFdOINEaFQNIxicJi7mlgVabFLiR34JejWQ9Td5AFE5AjRKQgn7X4hwVuFBVwIvBbA3Y7SriEGliNseQgeF9FdwKneA3a5+NZ835ASuuRIRiOaib6I0E4l1j1Bt+8lS8Ckul3Xh/ZgIfqDdx4kEwAvMbdlosbKgX
X-MS-Exchange-AntiSpam-MessageData: WjFK7dtz4HovlaPK42U+ZeE1DAZF/l9Zzkom3RqrQWwQ59t0PDqELLF+GEbzFc7Ol4FB06h/g1dnjYaY/OOGs13/Xi0P50wNjFLh53J3zFmmwRWItgOImJatSUP42akwh7ID0UPig4E814sDRBvy3w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB4320
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Diego.Sueiro@arm.com; 
Return-Path: Diego.Sueiro@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM5EUR03FT028.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFTY:;SFS:(10009020)(4636009)(136003)(396003)(376002)(346002)(39860400002)(46966005)(86362001)(4326008)(186003)(82740400003)(47076004)(478600001)(26005)(2906002)(70206006)(26826003)(70586007)(16526019)(6916009)(66574012)(30864003)(81156014)(2616005)(956004)(336012)(44832011)(8676002)(8936002)(36756003)(5660300002)(81166007)(6486002)(6666004)(7696005)(356004)(36906005)(316002);DIR:OUT;SFP:1101;
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	85ec4419-90d7-427a-9a4a-08d7dba04e38
X-Forefront-PRVS: 0367A50BB1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	maWjeuXf3TKC/SM61mRqdfFe03O89Any4PdN4Y5GYkRBZbmHi4S6n2ipUT/zXv0BLRAx3OJN/j6b+3RjF1iB997F88b2nbPno56OIzU5CS5sDFAAlMJCpZdLoSd+QmQ+NCDwnS/CXy+m38A4auL8Bstf/bENXzPiA0xlf8WBxlKmy6iFd61TupJ9/ssy7stJZdJj56svQIlZt4QGLDx8q3TO17b/4mwI4geUtgRDtJ0VQdHcGiDQUa/Oqnu7srclSDII2C9nXqhxIez6B7wi/hzEX9dia83xxNmCbaD6LFwJy1FGq/O5SqaFQjIw49WX5fOlMu5Zb9AEBUgJrvYlpgST1b1EC2QS5+UItBPW4Tgj1HfYSQui75f5r8reP2vdQVtGmpNcFOW3P4gDJHro0EHIKBNoYqXa3c4L7t4kp0wP+dmFPNAM9nGVgBg+tSqDMmaAP2wBY5gpT9CWjOzyTehOci0xvsrGMWFxisXYD2iWpXFqHE1nZ5DkGlOco5octqWt89zZSpbTIGxf8kdoVg==
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2020 09:36:33.0704
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e8e81b5-c3ed-4191-44b5-08d7dba0531a
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB4895
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Variables, settings and operations specific to Xen should be located
at meta-arm-autonomy.

Change-Id: Ida86119e9d196ce8a498b53890b16fefaa3d8d8b
Issue-Id: SCM-769
Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>
---
 .../boot-wrapper-aarch64_%.bbappend                | 32 +++++++++
 .../trusted-firmware-a/files/juno/images-r0.txt    | 78 ++++++++++++++++++=
++++
 .../trusted-firmware-a/files/juno/images-r1.txt    | 78 ++++++++++++++++++=
++++
 .../trusted-firmware-a/files/juno/images-r2.txt    | 78 ++++++++++++++++++=
++++
 .../trusted-firmware-a/files/juno/uEnv.txt         | 15 +++++
 .../trusted-firmware-a_2.%.bbappend                | 13 ++++
 .../4.12.0/0001-trace-fix-build-with-gcc9.patch    | 56 ++++++++++++++++
 ...ap-the-number-of-interrupt-lines-for-dom0.patch | 44 ++++++++++++
 .../recipes-extended/xen/files/fvp/defconfig       | 73 ++++++++++++++++++=
++
 .../recipes-extended/xen/files/juno/defconfig      | 73 ++++++++++++++++++=
++
 .../recipes-extended/xen/xen_4.%.bbappend          | 33 +++++++++
 .../recipes-extended/xen/xen_4.12.0.bbappend       | 10 +++
 .../features/arm-autonomy/disable-arm64-sve.cfg    |  4 ++
 .../features/arm-autonomy/disable-arm64-sve.scc    |  3 +
 .../recipes-kernel/linux/linux-arm-autonomy.inc    | 14 +++-
 15 files changed, 603 insertions(+), 1 deletion(-)
 create mode 100644 meta-arm-autonomy/recipes-bsp/boot-wrapper-aaarch64/boo=
t-wrapper-aarch64_%.bbappend
 create mode 100644 meta-arm-autonomy/recipes-bsp/trusted-firmware-a/files/=
juno/images-r0.txt
 create mode 100644 meta-arm-autonomy/recipes-bsp/trusted-firmware-a/files/=
juno/images-r1.txt
 create mode 100644 meta-arm-autonomy/recipes-bsp/trusted-firmware-a/files/=
juno/images-r2.txt
 create mode 100644 meta-arm-autonomy/recipes-bsp/trusted-firmware-a/files/=
juno/uEnv.txt
 create mode 100644 meta-arm-autonomy/recipes-bsp/trusted-firmware-a/truste=
d-firmware-a_2.%.bbappend
 create mode 100644 meta-arm-autonomy/recipes-extended/xen/files/4.12.0/000=
1-trace-fix-build-with-gcc9.patch
 create mode 100644 meta-arm-autonomy/recipes-extended/xen/files/4.12.0/000=
1-xen-arm-Cap-the-number-of-interrupt-lines-for-dom0.patch
 create mode 100644 meta-arm-autonomy/recipes-extended/xen/files/fvp/defcon=
fig
 create mode 100644 meta-arm-autonomy/recipes-extended/xen/files/juno/defco=
nfig
 create mode 100644 meta-arm-autonomy/recipes-extended/xen/xen_4.%.bbappend
 create mode 100644 meta-arm-autonomy/recipes-extended/xen/xen_4.12.0.bbapp=
end
 create mode 100644 meta-arm-autonomy/recipes-kernel/linux/arm-autonomy-kme=
ta/features/arm-autonomy/disable-arm64-sve.cfg
 create mode 100644 meta-arm-autonomy/recipes-kernel/linux/arm-autonomy-kme=
ta/features/arm-autonomy/disable-arm64-sve.scc

diff --git a/meta-arm-autonomy/recipes-bsp/boot-wrapper-aaarch64/boot-wrapp=
er-aarch64_%.bbappend b/meta-arm-autonomy/recipes-bsp/boot-wrapper-aaarch64=
/boot-wrapper-aarch64_%.bbappend
new file mode 100644
index 0000000..3b93b3b
--- /dev/null
+++ b/meta-arm-autonomy/recipes-bsp/boot-wrapper-aaarch64/boot-wrapper-aarc=
h64_%.bbappend
@@ -0,0 +1,32 @@
+# Use OVERRIDES to minimize the usage of
+# ${@bb.utils.contains('DISTRO_FEATURES', 'xen', ...
+OVERRIDES_append =3D "${@bb.utils.contains('DISTRO_FEATURES', 'xen', ':xen=
', '', d)}"
+
+# Xen image to put in the image
+# This should point to a file in the deploy image directory
+BOOT_WRAPPER_AARCH64_XEN ??=3D "xen-${MACHINE}"
+
+# Xen command line for the image
+BOOT_WRAPPER_AARCH64_XEN_CMDLINE ??=3D "noreboot dom0_mem=3D256M"
+
+BOOT_WRAPPER_AARCH64_XEN_CMDLINE_gem5-arm64 =3D "noreboot dom0_mem=3D256M =
console=3Ddtuart \
+    dtuart=3D/uart@1c090000 bootscrub=3D0"
+
+# Fix command line in the axf file for gem5-arm64 when Xen is present
+BOOT_WRAPPER_AARCH64_CMDLINE_xen_gem5-arm64 =3D "console=3Dhvc0 root=3D/de=
v/vda rw"
+
+# Image generated by boot wrapper when Xen is present
+BOOT_WRAPPER_AARCH64_IMAGE_xen ?=3D "xen-system.axf"
+
+EXTRA_OECONF_append_xen =3D " \
+--with-xen=3D${WORKDIR}/kernel/arch/arm64/boot/Image \
+--with-xen-cmdline=3D"" \
+"
+
+EXTRA_OEMAKE_append_xen =3D " \
+XEN_IMAGE=3D${DEPLOY_DIR_IMAGE}/${BOOT_WRAPPER_AARCH64_XEN} \
+XEN_CMDLINE=3D"${BOOT_WRAPPER_AARCH64_XEN_CMDLINE}" \
+"
+
+# We need xen if it is activated
+do_deploy[depends] +=3D "${@bb.utils.contains('DISTRO_FEATURES', 'xen', 'x=
en:do_deploy', '', d)}"
diff --git a/meta-arm-autonomy/recipes-bsp/trusted-firmware-a/files/juno/im=
ages-r0.txt b/meta-arm-autonomy/recipes-bsp/trusted-firmware-a/files/juno/i=
mages-r0.txt
new file mode 100644
index 0000000..177cf09
--- /dev/null
+++ b/meta-arm-autonomy/recipes-bsp/trusted-firmware-a/files/juno/images-r0=
.txt
@@ -0,0 +1,78 @@
+TITLE: Versatile Express Images Configuration File
+
+[IMAGES]
+TOTALIMAGES: 11                  ;Number of Images (Max: 32)
+
+NOR0UPDATE: AUTO                 ;Image Update:NONE/AUTO/FORCE
+NOR0ADDRESS: 0x00000000          ;Image Flash Address
+NOR0FILE: \SOFTWARE\fip.bin      ;Image File Name
+NOR0LOAD: 00000000               ;Image Load Address
+NOR0ENTRY: 00000000              ;Image Entry Point
+
+NOR1UPDATE: AUTO                 ;Image Update:NONE/AUTO/FORCE
+NOR1ADDRESS: 0x03EC0000          ;Image Flash Address
+NOR1FILE: \SOFTWARE\bl1.bin      ;Image File Name
+NOR1LOAD: 00000000               ;Image Load Address
+NOR1ENTRY: 00000000              ;Image Entry Point
+
+NOR2UPDATE: AUTO                 ;Image Update:NONE/AUTO/FORCE
+NOR2ADDRESS: 0x00500000          ;Image Flash Address
+NOR2FILE: \SOFTWARE\Image        ;Image File Name
+NOR2NAME: norkern                ;Rename kernel to norkern
+NOR2LOAD: 00000000               ;Image Load Address
+NOR2ENTRY: 00000000              ;Image Entry Point
+
+NOR3UPDATE: AUTO                 ;Image Update:NONE/AUTO/FORCE
+NOR3ADDRESS: 0x02700000          ;Image Flash Address
+NOR3FILE: \SOFTWARE\juno.dtb     ;Image File Name
+NOR3NAME: board.dtb              ;Specify target filename to preserve file=
 extension
+NOR3LOAD: 00000000               ;Image Load Address
+NOR3ENTRY: 00000000              ;Image Entry Point
+
+NOR4UPDATE: AUTO                 ;Image Update:NONE/AUTO/FORCE
+NOR4ADDRESS: 0x01D00000          ;Image Flash Address
+NOR4FILE: \SOFTWARE\xen          ;Image File Name
+NOR4NAME: xen
+NOR4LOAD: 00000000               ;Image Load Address
+NOR4ENTRY: 00000000              ;Image Entry Point
+
+NOR5UPDATE: AUTO                 ;Image Update:NONE/AUTO/FORCE
+NOR5ADDRESS: 0x025C0000          ;Image Flash Address
+NOR5FILE: \SOFTWARE\hdlcdclk.dat ;Image File Name
+NOR5LOAD: 00000000               ;Image Load Address
+NOR5ENTRY: 00000000              ;Image Entry Point
+
+NOR6UPDATE: AUTO                 ;Image Update:NONE/AUTO/FORCE
+NOR6ADDRESS: 0x03E40000          ;Image Flash Address
+NOR6FILE: \SOFTWARE\scp_bl1.bin  ;Image File Name
+NOR6LOAD: 00000000               ;Image Load Address
+NOR6ENTRY: 00000000              ;Image Entry Point
+
+NOR7UPDATE: AUTO                 ;Image Update:NONE/AUTO/FORCE
+NOR7ADDRESS: 0x0BF00000          ;Image Flash Address
+NOR7FILE: \SOFTWARE\startup.nsh  ;Image File Name
+NOR7NAME: startup.nsh
+NOR7LOAD: 00000000               ;Image Load Address
+NOR7ENTRY: 00000000              ;Image Entry Point
+
+NOR8UPDATE: AUTO                 ;Image Update:NONE/AUTO/FORCE
+NOR8ADDRESS: 0x0BFC0000          ;Image Flash Address
+NOR8FILE: \SOFTWARE\blank.img    ;Image File Name
+NOR8NAME: BOOTENV
+NOR8LOAD: 00000000               ;Image Load Address
+NOR8ENTRY: 00000000              ;Image Entry Point
+
+NOR9UPDATE: AUTO                 ;Image Update:NONE/AUTO/FORCE
+NOR9ADDRESS: 0x02600000          ;Image Flash Address
+NOR9FILE: \SOFTWARE\selftest     ;Image File Name
+NOR9LOAD: 00000000               ;Image Load Address
+NOR9ENTRY: 00000000              ;Image Entry Point
+
+NOR10UPDATE: AUTO                 ;Image Update:NONE/AUTO/FORCE
+NOR10ADDRESS: 0x02780000          ;Image Flash Address
+NOR10NAME: uEnv.txt
+NOR10FILE: \SOFTWARE\uEnv.txt     ;Image File Name
+NOR10LOAD: 00000000               ;Image Load Address
+NOR10ENTRY: 00000000              ;Image Entry Point
+
+
diff --git a/meta-arm-autonomy/recipes-bsp/trusted-firmware-a/files/juno/im=
ages-r1.txt b/meta-arm-autonomy/recipes-bsp/trusted-firmware-a/files/juno/i=
mages-r1.txt
new file mode 100644
index 0000000..ac40bf0
--- /dev/null
+++ b/meta-arm-autonomy/recipes-bsp/trusted-firmware-a/files/juno/images-r1=
.txt
@@ -0,0 +1,78 @@
+TITLE: Versatile Express Images Configuration File
+
+[IMAGES]
+TOTALIMAGES: 11                  ;Number of Images (Max: 32)
+
+NOR0UPDATE: AUTO                 ;Image Update:NONE/AUTO/FORCE
+NOR0ADDRESS: 0x00000000          ;Image Flash Address
+NOR0FILE: \SOFTWARE\fip.bin      ;Image File Name
+NOR0LOAD: 00000000               ;Image Load Address
+NOR0ENTRY: 00000000              ;Image Entry Point
+
+NOR1UPDATE: AUTO                 ;Image Update:NONE/AUTO/FORCE
+NOR1ADDRESS: 0x03EC0000          ;Image Flash Address
+NOR1FILE: \SOFTWARE\bl1.bin      ;Image File Name
+NOR1LOAD: 00000000               ;Image Load Address
+NOR1ENTRY: 00000000              ;Image Entry Point
+
+NOR2UPDATE: AUTO                 ;Image Update:NONE/AUTO/FORCE
+NOR2ADDRESS: 0x00500000          ;Image Flash Address
+NOR2FILE: \SOFTWARE\Image        ;Image File Name
+NOR2NAME: norkern                ;Rename kernel to norkern
+NOR2LOAD: 00000000               ;Image Load Address
+NOR2ENTRY: 00000000              ;Image Entry Point
+
+NOR3UPDATE: AUTO                 ;Image Update:NONE/AUTO/FORCE
+NOR3ADDRESS: 0x02700000          ;Image Flash Address
+NOR3FILE: \SOFTWARE\juno-r1.dtb  ;Image File Name
+NOR3NAME: board.dtb              ;Specify target filename to preserve file=
 extension
+NOR3LOAD: 00000000               ;Image Load Address
+NOR3ENTRY: 00000000              ;Image Entry Point
+
+NOR4UPDATE: AUTO                 ;Image Update:NONE/AUTO/FORCE
+NOR4ADDRESS: 0x01D00000          ;Image Flash Address
+NOR4FILE: \SOFTWARE\xen          ;Image File Name
+NOR4NAME: xen
+NOR4LOAD: 00000000               ;Image Load Address
+NOR4ENTRY: 00000000              ;Image Entry Point
+
+NOR5UPDATE: AUTO                 ;Image Update:NONE/AUTO/FORCE
+NOR5ADDRESS: 0x025C0000          ;Image Flash Address
+NOR5FILE: \SOFTWARE\hdlcdclk.dat ;Image File Name
+NOR5LOAD: 00000000               ;Image Load Address
+NOR5ENTRY: 00000000              ;Image Entry Point
+
+NOR6UPDATE: AUTO                 ;Image Update:NONE/AUTO/FORCE
+NOR6ADDRESS: 0x03E40000          ;Image Flash Address
+NOR6FILE: \SOFTWARE\scp_bl1.bin  ;Image File Name
+NOR6LOAD: 00000000               ;Image Load Address
+NOR6ENTRY: 00000000              ;Image Entry Point
+
+NOR7UPDATE: AUTO                 ;Image Update:NONE/AUTO/FORCE
+NOR7ADDRESS: 0x0BF00000          ;Image Flash Address
+NOR7FILE: \SOFTWARE\startup.nsh  ;Image File Name
+NOR7NAME: startup.nsh
+NOR7LOAD: 00000000               ;Image Load Address
+NOR7ENTRY: 00000000              ;Image Entry Point
+
+NOR8UPDATE: AUTO                 ;Image Update:NONE/AUTO/FORCE
+NOR8ADDRESS: 0x0BFC0000          ;Image Flash Address
+NOR8FILE: \SOFTWARE\blank.img    ;Image File Name
+NOR8NAME: BOOTENV
+NOR8LOAD: 00000000               ;Image Load Address
+NOR8ENTRY: 00000000              ;Image Entry Point
+
+NOR9UPDATE: AUTO                 ;Image Update:NONE/AUTO/FORCE
+NOR9ADDRESS: 0x02600000          ;Image Flash Address
+NOR9FILE: \SOFTWARE\selftest     ;Image File Name
+NOR9LOAD: 00000000               ;Image Load Address
+NOR9ENTRY: 00000000              ;Image Entry Point
+
+NOR10UPDATE: AUTO                 ;Image Update:NONE/AUTO/FORCE
+NOR10ADDRESS: 0x02780000          ;Image Flash Address
+NOR10NAME: uEnv.txt
+NOR10FILE: \SOFTWARE\uEnv.txt     ;Image File Name
+NOR10LOAD: 00000000               ;Image Load Address
+NOR10ENTRY: 00000000              ;Image Entry Point
+
+
diff --git a/meta-arm-autonomy/recipes-bsp/trusted-firmware-a/files/juno/im=
ages-r2.txt b/meta-arm-autonomy/recipes-bsp/trusted-firmware-a/files/juno/i=
mages-r2.txt
new file mode 100644
index 0000000..423a574
--- /dev/null
+++ b/meta-arm-autonomy/recipes-bsp/trusted-firmware-a/files/juno/images-r2=
.txt
@@ -0,0 +1,78 @@
+TITLE: Versatile Express Images Configuration File
+
+[IMAGES]
+TOTALIMAGES: 11                  ;Number of Images (Max: 32)
+
+NOR0UPDATE: AUTO                 ;Image Update:NONE/AUTO/FORCE
+NOR0ADDRESS: 0x00000000          ;Image Flash Address
+NOR0FILE: \SOFTWARE\fip.bin      ;Image File Name
+NOR0LOAD: 00000000               ;Image Load Address
+NOR0ENTRY: 00000000              ;Image Entry Point
+
+NOR1UPDATE: AUTO                 ;Image Update:NONE/AUTO/FORCE
+NOR1ADDRESS: 0x03EC0000          ;Image Flash Address
+NOR1FILE: \SOFTWARE\bl1.bin      ;Image File Name
+NOR1LOAD: 00000000               ;Image Load Address
+NOR1ENTRY: 00000000              ;Image Entry Point
+
+NOR2UPDATE: AUTO                 ;Image Update:NONE/AUTO/FORCE
+NOR2ADDRESS: 0x00500000          ;Image Flash Address
+NOR2FILE: \SOFTWARE\Image        ;Image File Name
+NOR2NAME: norkern                ;Rename kernel to norkern
+NOR2LOAD: 00000000               ;Image Load Address
+NOR2ENTRY: 00000000              ;Image Entry Point
+
+NOR3UPDATE: AUTO                 ;Image Update:NONE/AUTO/FORCE
+NOR3ADDRESS: 0x02700000          ;Image Flash Address
+NOR3FILE: \SOFTWARE\juno-r2.dtb  ;Image File Name
+NOR3NAME: board.dtb              ;Specify target filename to preserve file=
 extension
+NOR3LOAD: 00000000               ;Image Load Address
+NOR3ENTRY: 00000000              ;Image Entry Point
+
+NOR4UPDATE: AUTO                 ;Image Update:NONE/AUTO/FORCE
+NOR4ADDRESS: 0x01D00000          ;Image Flash Address
+NOR4FILE: \SOFTWARE\xen          ;Image File Name
+NOR4NAME: xen
+NOR4LOAD: 00000000               ;Image Load Address
+NOR4ENTRY: 00000000              ;Image Entry Point
+
+NOR5UPDATE: AUTO                 ;Image Update:NONE/AUTO/FORCE
+NOR5ADDRESS: 0x025C0000          ;Image Flash Address
+NOR5FILE: \SOFTWARE\hdlcdclk.dat ;Image File Name
+NOR5LOAD: 00000000               ;Image Load Address
+NOR5ENTRY: 00000000              ;Image Entry Point
+
+NOR6UPDATE: AUTO                 ;Image Update:NONE/AUTO/FORCE
+NOR6ADDRESS: 0x03E40000          ;Image Flash Address
+NOR6FILE: \SOFTWARE\scp_bl1.bin  ;Image File Name
+NOR6LOAD: 00000000               ;Image Load Address
+NOR6ENTRY: 00000000              ;Image Entry Point
+
+NOR7UPDATE: AUTO                 ;Image Update:NONE/AUTO/FORCE
+NOR7ADDRESS: 0x0BF00000          ;Image Flash Address
+NOR7FILE: \SOFTWARE\startup.nsh  ;Image File Name
+NOR7NAME: startup.nsh
+NOR7LOAD: 00000000               ;Image Load Address
+NOR7ENTRY: 00000000              ;Image Entry Point
+
+NOR8UPDATE: AUTO                 ;Image Update:NONE/AUTO/FORCE
+NOR8ADDRESS: 0x0BFC0000          ;Image Flash Address
+NOR8FILE: \SOFTWARE\blank.img    ;Image File Name
+NOR8NAME: BOOTENV
+NOR8LOAD: 00000000               ;Image Load Address
+NOR8ENTRY: 00000000              ;Image Entry Point
+
+NOR9UPDATE: AUTO                 ;Image Update:NONE/AUTO/FORCE
+NOR9ADDRESS: 0x02600000          ;Image Flash Address
+NOR9FILE: \SOFTWARE\selftest     ;Image File Name
+NOR9LOAD: 00000000               ;Image Load Address
+NOR9ENTRY: 00000000              ;Image Entry Point
+
+NOR10UPDATE: AUTO                 ;Image Update:NONE/AUTO/FORCE
+NOR10ADDRESS: 0x02780000          ;Image Flash Address
+NOR10NAME: uEnv.txt
+NOR10FILE: \SOFTWARE\uEnv.txt     ;Image File Name
+NOR10LOAD: 00000000               ;Image Load Address
+NOR10ENTRY: 00000000              ;Image Entry Point
+
+
diff --git a/meta-arm-autonomy/recipes-bsp/trusted-firmware-a/files/juno/uE=
nv.txt b/meta-arm-autonomy/recipes-bsp/trusted-firmware-a/files/juno/uEnv.t=
xt
new file mode 100644
index 0000000..4307b69
--- /dev/null
+++ b/meta-arm-autonomy/recipes-bsp/trusted-firmware-a/files/juno/uEnv.txt
@@ -0,0 +1,15 @@
+xen_name=3Dxen
+xen_addr=3D0x84000000
+uenvcmd=3Drun mybootcmd
+mybootcmd=3Decho Loading custom boot command; \
+echo Loading kernel; \
+afs load ${kernel_name} ${kernel_addr} ; \
+if test $? -eq 1; then echo Loading ${kernel_alt_name} instead of ${kernel=
_name}; afs load ${kernel_alt_name} ${kernel_addr}; fi; \
+echo Loading device tree; \
+afs load  ${fdtfile} ${fdt_addr}; \
+if test $? -eq 1; then echo Loading ${fdt_alt_name} instead of ${fdtfile};=
 \
+afs load ${fdt_alt_name} ${fdt_addr}; fi; fdt addr ${fdt_addr}; fdt resize=
; \
+echo Loading Xen; \
+afs load  ${xen_name} ${xen_addr}; \
+if test $? -eq 0; then echo Booting Xen; bootefi ${xen_addr} ${fdt_addr}; =
fi;
+
diff --git a/meta-arm-autonomy/recipes-bsp/trusted-firmware-a/trusted-firmw=
are-a_2.%.bbappend b/meta-arm-autonomy/recipes-bsp/trusted-firmware-a/trust=
ed-firmware-a_2.%.bbappend
new file mode 100644
index 0000000..49a8228
--- /dev/null
+++ b/meta-arm-autonomy/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2=
.%.bbappend
@@ -0,0 +1,13 @@
+FILESEXTRAPATHS_prepend_juno :=3D "${@bb.utils.contains('DISTRO_FEATURES',=
 'xen', '${THISDIR}/files/juno:', '', d)}"
+
+JUNO_EXTRA_DEPS_append =3D "${@bb.utils.contains('DISTRO_FEATURES', 'xen',=
 ' xen:do_deploy', '', d)}"
+
+do_deploy_append_juno() {
+
+    if [ "${@bb.utils.contains('DISTRO_FEATURES', 'xen', 'yes', 'no', d)}"=
 =3D "yes" ]; then
+        cp -a \
+            ${DEPLOY_DIR_IMAGE}/xen-${COMPATIBLE_MACHINE}.efi \
+            ${WORKDIR}/juno-oe-uboot/SOFTWARE/xen
+    fi
+
+}
diff --git a/meta-arm-autonomy/recipes-extended/xen/files/4.12.0/0001-trace=
-fix-build-with-gcc9.patch b/meta-arm-autonomy/recipes-extended/xen/files/4=
.12.0/0001-trace-fix-build-with-gcc9.patch
new file mode 100644
index 0000000..8ecc904
--- /dev/null
+++ b/meta-arm-autonomy/recipes-extended/xen/files/4.12.0/0001-trace-fix-bu=
ild-with-gcc9.patch
@@ -0,0 +1,56 @@
+From 0dcd945a675cd12d283121e9b7f1626104b60bcc Mon Sep 17 00:00:00 2001
+From: Jan Beulich <jbeulich@suse.com>
+Date: Tue, 4 Jun 2019 15:32:55 +0200
+Subject: [PATCH] trace: fix build with gcc9
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
+While I've not observed this myself, gcc 9 (imo validly) reportedly may
+complain
+
+trace.c: In function '__trace_hypercall':
+trace.c:826:19: error: taking address of packed member of 'struct <anonymo=
us>' may result in an unaligned pointer value [-Werror=3Daddress-of-packed-=
member]
+  826 |     uint32_t *a =3D d.args;
+
+and the fix is rather simple - remove the __packed attribute. Introduce
+a BUILD_BUG_ON() as replacement, for the unlikely case that Xen might
+get ported to an architecture where array alignment higher that that of
+its elements.
+
+Reported-by: Martin Li=C5=A1ka <martin.liska@suse.com>
+Signed-off-by: Jan Beulich <jbeulich@suse.com>
+Acked-by: George Dunlap <george.dunlap@citrix.com>
+master commit: 3fd3b266d4198c06e8e421ca515d9ba09ccd5155
+master date: 2019-05-13 09:51:23 +0200
+---
+ xen/common/trace.c | 8 +++++++-
+ 1 file changed, 7 insertions(+), 1 deletion(-)
+
+diff --git a/xen/common/trace.c b/xen/common/trace.c
+index cc294fc384..d1ef81407b 100644
+--- a/xen/common/trace.c
++++ b/xen/common/trace.c
+@@ -819,12 +819,18 @@ unlock:
+ void __trace_hypercall(uint32_t event, unsigned long op,
+                        const xen_ulong_t *args)
+ {
+-    struct __packed {
++    struct {
+         uint32_t op;
+         uint32_t args[6];
+     } d;
+     uint32_t *a =3D d.args;
+=20
++    /*
++     * In lieu of using __packed above, which gcc9 legitimately doesn't
++     * like in combination with the address of d.args[] taken.
++     */
++    BUILD_BUG_ON(offsetof(typeof(d), args) !=3D sizeof(d.op));
++
+ #define APPEND_ARG32(i)                         \
+     do {                                        \
+         unsigned i_ =3D (i);                      \
+--=20
+2.17.1
+
diff --git a/meta-arm-autonomy/recipes-extended/xen/files/4.12.0/0001-xen-a=
rm-Cap-the-number-of-interrupt-lines-for-dom0.patch b/meta-arm-autonomy/rec=
ipes-extended/xen/files/4.12.0/0001-xen-arm-Cap-the-number-of-interrupt-lin=
es-for-dom0.patch
new file mode 100644
index 0000000..792bc9e
--- /dev/null
+++ b/meta-arm-autonomy/recipes-extended/xen/files/4.12.0/0001-xen-arm-Cap-=
the-number-of-interrupt-lines-for-dom0.patch
@@ -0,0 +1,44 @@
+From a41feccdb6c03f12bddb4fb650a0465f0ed6eeca Mon Sep 17 00:00:00 2001
+From: Lukas Juenger <juenger@ice.rwth-aachen.de>
+Date: Fri, 5 Apr 2019 15:54:04 +0200
+Subject: [PATCH] xen/arm: Cap the number of interrupt lines for dom0
+
+Dom0 vGIC will use the same number of interrupt lines as the hardware GIC.
+While the hardware GIC can support up to 1020 interrupt lines,
+the vGIC is only supporting up to 992 interrupt lines.
+This means that Xen will not be able to boot on platforms where the hardwa=
re
+GIC supports more than 992 interrupt lines.
+While it would make sense to increase the limits in the vGICs, this is not
+trivial because of the design choices.
+At the moment, only models seem to report the maximum of interrupt lines.
+They also do not have any interrupt wired above the 992 limit.
+So it should be fine to cap the number of interrupt lines for dom0 to 992 =
lines.
+
+Signed-off-by: Lukas Juenger <juenger@ice.rwth-aachen.de>
+Acked-by: Julien Grall <julien.grall@arm.com>
+---
+ xen/arch/arm/setup.c | 8 +++++++-
+ 1 file changed, 7 insertions(+), 1 deletion(-)
+
+diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
+index 444857a967..ccb0f181ea 100644
+--- a/xen/arch/arm/setup.c
++++ b/xen/arch/arm/setup.c
+@@ -888,7 +888,13 @@ void __init start_xen(unsigned long boot_phys_offset,
+     /* Create initial domain 0. */
+     /* The vGIC for DOM0 is exactly emulating the hardware GIC */
+     dom0_cfg.arch.gic_version =3D XEN_DOMCTL_CONFIG_GIC_NATIVE;
+-    dom0_cfg.arch.nr_spis =3D gic_number_lines() - 32;
++    /*
++     * Xen vGIC supports a maximum of 992 interrupt lines.
++     * 32 are substracted to cover local IRQs.
++     */
++    dom0_cfg.arch.nr_spis =3D min(gic_number_lines(), (unsigned int) 992)=
 - 32;
++    if ( gic_number_lines() > 992 )
++        printk(XENLOG_WARNING "Maximum number of vGIC IRQs exceeded.\n");
+     dom0_cfg.max_vcpus =3D dom0_max_vcpus();
+=20
+     dom0 =3D domain_create(0, &dom0_cfg, true);
+--=20
+2.17.1
+
diff --git a/meta-arm-autonomy/recipes-extended/xen/files/fvp/defconfig b/m=
eta-arm-autonomy/recipes-extended/xen/files/fvp/defconfig
new file mode 100644
index 0000000..f13327c
--- /dev/null
+++ b/meta-arm-autonomy/recipes-extended/xen/files/fvp/defconfig
@@ -0,0 +1,73 @@
+#
+# Automatically generated file; DO NOT EDIT.
+# Xen/arm 4.12.0 Configuration
+#
+CONFIG_64BIT=3Dy
+CONFIG_ARM_64=3Dy
+CONFIG_ARM=3Dy
+CONFIG_ARCH_DEFCONFIG=3D"arch/arm/configs/arm64_defconfig"
+
+#
+# Architecture Features
+#
+CONFIG_NR_CPUS=3D128
+CONFIG_GICV3=3Dy
+CONFIG_HVM=3Dy
+# CONFIG_NEW_VGIC is not set
+CONFIG_SBSA_VUART_CONSOLE=3Dy
+CONFIG_ARM_SSBD=3Dy
+CONFIG_HARDEN_BRANCH_PREDICTOR=3Dy
+
+#
+# ARM errata workaround via the alternative framework
+#
+CONFIG_ARM64_ERRATUM_827319=3Dy
+CONFIG_ARM64_ERRATUM_824069=3Dy
+CONFIG_ARM64_ERRATUM_819472=3Dy
+CONFIG_ARM64_ERRATUM_832075=3Dy
+CONFIG_ARM64_ERRATUM_834220=3Dy
+CONFIG_ARM64_HARDEN_BRANCH_PREDICTOR=3Dy
+CONFIG_ALL_PLAT=3Dy
+# CONFIG_QEMU is not set
+# CONFIG_RCAR3 is not set
+# CONFIG_MPSOC is not set
+# CONFIG_NO_PLAT is not set
+CONFIG_ALL64_PLAT=3Dy
+# CONFIG_ALL32_PLAT is not set
+CONFIG_MPSOC_PLATFORM=3Dy
+
+#
+# Common Features
+#
+CONFIG_HAS_ALTERNATIVE=3Dy
+CONFIG_HAS_DEVICE_TREE=3Dy
+CONFIG_MEM_ACCESS=3Dy
+CONFIG_HAS_PDX=3Dy
+# CONFIG_XSM is not set
+CONFIG_SCHED_CREDIT=3Dy
+CONFIG_SCHED_CREDIT2=3Dy
+CONFIG_SCHED_RTDS=3Dy
+# CONFIG_SCHED_ARINC653 is not set
+CONFIG_SCHED_NULL=3Dy
+CONFIG_SCHED_DEFAULT=3D"credit2"
+# CONFIG_LIVEPATCH is not set
+CONFIG_SUPPRESS_DUPLICATE_SYMBOL_WARNINGS=3Dy
+CONFIG_CMDLINE=3D""
+CONFIG_DOM0_MEM=3D""
+
+#
+# Device Drivers
+#
+CONFIG_HAS_NS16550=3Dy
+CONFIG_HAS_CADENCE_UART=3Dy
+CONFIG_HAS_MVEBU=3Dy
+CONFIG_HAS_PL011=3Dy
+CONFIG_HAS_SCIF=3Dy
+CONFIG_HAS_PASSTHROUGH=3Dy
+CONFIG_ARM_SMMU=3Dy
+CONFIG_DEFCONFIG_LIST=3D"arch/arm/configs/arm64_defconfig"
+
+#
+# Debugging Options
+#
+# CONFIG_DEBUG is not set
diff --git a/meta-arm-autonomy/recipes-extended/xen/files/juno/defconfig b/=
meta-arm-autonomy/recipes-extended/xen/files/juno/defconfig
new file mode 100644
index 0000000..f13327c
--- /dev/null
+++ b/meta-arm-autonomy/recipes-extended/xen/files/juno/defconfig
@@ -0,0 +1,73 @@
+#
+# Automatically generated file; DO NOT EDIT.
+# Xen/arm 4.12.0 Configuration
+#
+CONFIG_64BIT=3Dy
+CONFIG_ARM_64=3Dy
+CONFIG_ARM=3Dy
+CONFIG_ARCH_DEFCONFIG=3D"arch/arm/configs/arm64_defconfig"
+
+#
+# Architecture Features
+#
+CONFIG_NR_CPUS=3D128
+CONFIG_GICV3=3Dy
+CONFIG_HVM=3Dy
+# CONFIG_NEW_VGIC is not set
+CONFIG_SBSA_VUART_CONSOLE=3Dy
+CONFIG_ARM_SSBD=3Dy
+CONFIG_HARDEN_BRANCH_PREDICTOR=3Dy
+
+#
+# ARM errata workaround via the alternative framework
+#
+CONFIG_ARM64_ERRATUM_827319=3Dy
+CONFIG_ARM64_ERRATUM_824069=3Dy
+CONFIG_ARM64_ERRATUM_819472=3Dy
+CONFIG_ARM64_ERRATUM_832075=3Dy
+CONFIG_ARM64_ERRATUM_834220=3Dy
+CONFIG_ARM64_HARDEN_BRANCH_PREDICTOR=3Dy
+CONFIG_ALL_PLAT=3Dy
+# CONFIG_QEMU is not set
+# CONFIG_RCAR3 is not set
+# CONFIG_MPSOC is not set
+# CONFIG_NO_PLAT is not set
+CONFIG_ALL64_PLAT=3Dy
+# CONFIG_ALL32_PLAT is not set
+CONFIG_MPSOC_PLATFORM=3Dy
+
+#
+# Common Features
+#
+CONFIG_HAS_ALTERNATIVE=3Dy
+CONFIG_HAS_DEVICE_TREE=3Dy
+CONFIG_MEM_ACCESS=3Dy
+CONFIG_HAS_PDX=3Dy
+# CONFIG_XSM is not set
+CONFIG_SCHED_CREDIT=3Dy
+CONFIG_SCHED_CREDIT2=3Dy
+CONFIG_SCHED_RTDS=3Dy
+# CONFIG_SCHED_ARINC653 is not set
+CONFIG_SCHED_NULL=3Dy
+CONFIG_SCHED_DEFAULT=3D"credit2"
+# CONFIG_LIVEPATCH is not set
+CONFIG_SUPPRESS_DUPLICATE_SYMBOL_WARNINGS=3Dy
+CONFIG_CMDLINE=3D""
+CONFIG_DOM0_MEM=3D""
+
+#
+# Device Drivers
+#
+CONFIG_HAS_NS16550=3Dy
+CONFIG_HAS_CADENCE_UART=3Dy
+CONFIG_HAS_MVEBU=3Dy
+CONFIG_HAS_PL011=3Dy
+CONFIG_HAS_SCIF=3Dy
+CONFIG_HAS_PASSTHROUGH=3Dy
+CONFIG_ARM_SMMU=3Dy
+CONFIG_DEFCONFIG_LIST=3D"arch/arm/configs/arm64_defconfig"
+
+#
+# Debugging Options
+#
+# CONFIG_DEBUG is not set
diff --git a/meta-arm-autonomy/recipes-extended/xen/xen_4.%.bbappend b/meta=
-arm-autonomy/recipes-extended/xen/xen_4.%.bbappend
new file mode 100644
index 0000000..e7ddce9
--- /dev/null
+++ b/meta-arm-autonomy/recipes-extended/xen/xen_4.%.bbappend
@@ -0,0 +1,33 @@
+# xen settings
+
+FILESEXTRAPATHS_prepend :=3D "${THISDIR}/files:"
+
+#
+# Define early console based on board parameters
+#
+
+XEN_CONFIG_EARLY_PRINTK ??=3D "disable"
+
+# Machine specific settings
+XEN_CONFIG_EARLY_PRINTK_juno =3D "juno"
+XEN_CONFIG_EARLY_PRINTK_gem5-arm64 =3D "vexpress"
+XEN_CONFIG_EARLY_PRINTK_fvp-base =3D "fastmodel"
+XEN_CONFIG_EARLY_PRINTK_foundation-armv8 =3D "fastmodel"
+
+EXTRA_OEMAKE +=3D "${@bb.utils.contains('XEN_CONFIG_EARLY_PRINTK', 'disabl=
e', \
+    '', ' CONFIG_DEBUG=3Dy CONFIG_EARLY_PRINTK=3D${XEN_CONFIG_EARLY_PRINTK=
}',d)}"
+
+# Foundation-armv8 support
+COMPATIBLE_MACHINE_foundation-armv8 =3D "foundation-armv8"
+
+SRC_URI_append_foundation-armv8 =3D " file://fvp/defconfig"
+
+# FVP Base support
+COMPATIBLE_MACHINE_fvp-base =3D "fvp-base"
+
+SRC_URI_append_fvp-base =3D " file://fvp/defconfig"
+
+# Juno support
+COMPATIBLE_MACHINE_juno =3D "juno"
+
+SRC_URI_append_juno =3D " file://juno/defconfig"
diff --git a/meta-arm-autonomy/recipes-extended/xen/xen_4.12.0.bbappend b/m=
eta-arm-autonomy/recipes-extended/xen/xen_4.12.0.bbappend
new file mode 100644
index 0000000..87b1f63
--- /dev/null
+++ b/meta-arm-autonomy/recipes-extended/xen/xen_4.12.0.bbappend
@@ -0,0 +1,10 @@
+# xen version specific patch information
+
+FILESEXTRAPATHS_prepend :=3D "${THISDIR}/files:"
+
+# Solve trace.c compilation error on 4.12.0
+# This should only be applied for 4.12.0 (solved in greater versions)
+SRC_URI +=3D "file://4.12.0/0001-trace-fix-build-with-gcc9.patch"
+
+# Fix problem with number of interrupts on gem5
+SRC_URI_append_gem5-arm64 =3D " file://4.12.0/0001-xen-arm-Cap-the-number-=
of-interrupt-lines-for-dom0.patch"
diff --git a/meta-arm-autonomy/recipes-kernel/linux/arm-autonomy-kmeta/feat=
ures/arm-autonomy/disable-arm64-sve.cfg b/meta-arm-autonomy/recipes-kernel/=
linux/arm-autonomy-kmeta/features/arm-autonomy/disable-arm64-sve.cfg
new file mode 100644
index 0000000..7e87cab
--- /dev/null
+++ b/meta-arm-autonomy/recipes-kernel/linux/arm-autonomy-kmeta/features/ar=
m-autonomy/disable-arm64-sve.cfg
@@ -0,0 +1,4 @@
+# We need to turn off SVE support in the Linux kernel otherwise Xen is sto=
pping
+# Linux kernel with a coredump while trying to access ZEN bit of CPACR1 co=
re
+# register.
+# CONFIG_ARM64_SVE is not set
diff --git a/meta-arm-autonomy/recipes-kernel/linux/arm-autonomy-kmeta/feat=
ures/arm-autonomy/disable-arm64-sve.scc b/meta-arm-autonomy/recipes-kernel/=
linux/arm-autonomy-kmeta/features/arm-autonomy/disable-arm64-sve.scc
new file mode 100644
index 0000000..6bc769c
--- /dev/null
+++ b/meta-arm-autonomy/recipes-kernel/linux/arm-autonomy-kmeta/features/ar=
m-autonomy/disable-arm64-sve.scc
@@ -0,0 +1,3 @@
+define KFEATURE_DESCRIPTION "Disable SVE support"
+
+kconf non-hardware disable-arm64-sve.cfg
diff --git a/meta-arm-autonomy/recipes-kernel/linux/linux-arm-autonomy.inc =
b/meta-arm-autonomy/recipes-kernel/linux/linux-arm-autonomy.inc
index 8191079..bb48950 100644
--- a/meta-arm-autonomy/recipes-kernel/linux/linux-arm-autonomy.inc
+++ b/meta-arm-autonomy/recipes-kernel/linux/linux-arm-autonomy.inc
@@ -1,12 +1,24 @@
 # Add arm-autonomy specific features to the kernel
=20
-FILESEXTRAPATHS_prepend :=3D "${THISDIR}:"
+FILESEXTRAPATHS_prepend :=3D "${THISDIR}:${THISDIR}/files:"
=20
 #
 # arm-autonomy kmeta
 #
 SRC_URI_append =3D " file://arm-autonomy-kmeta;type=3Dkmeta;name=3Darm-aut=
onomy-kmeta;destsuffix=3Darm-autonomy-kmeta"
=20
+# We need to turn off SVE support in the Linux kernel otherwise Xen is sto=
pping
+# Linux kernel with a coredump while trying to access XEN bit of CPACR1 co=
re
+# register.
+LINUX_ARM_AUTONOMY_DISABLE_ARM64_SVE =3D "${@bb.utils.contains_any('DISTRO=
_FEATURES', \
+                                         'arm-autonomy-host arm-autonomy-g=
uest', \
+                                         ' features/arm-autonomy/disable-a=
rm64-sve.scc','',d)}"
+
+KERNEL_FEATURES_append_gem5-arm64 =3D "${LINUX_ARM_AUTONOMY_DISABLE_ARM64_=
SVE}"
+KERNEL_FEATURES_append_fvp-base =3D "${LINUX_ARM_AUTONOMY_DISABLE_ARM64_SV=
E}"
+KERNEL_FEATURES_append_foundation-armv8 =3D "${LINUX_ARM_AUTONOMY_DISABLE_=
ARM64_SVE}"
+
+
 # Add xen host drivers to kernel if arm-autonomy-host is activated
 KERNEL_FEATURES +=3D "${@bb.utils.contains('DISTRO_FEATURES', \
         'arm-autonomy-host', 'features/arm-autonomy/xen-host.scc', '', d)}=
"
--=20
2.7.4


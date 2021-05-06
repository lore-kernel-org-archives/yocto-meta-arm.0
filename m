Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.77])
 by mx.groups.io with SMTP id smtpd.web12.1255.1620316275822659358
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 06 May 2021 08:51:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=PMqYKXlL;
 spf=pass (domain: arm.com, ip: 40.107.20.77, mailfrom: diego.sueiro@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ua0JJK9GmiTQfA4q6fkvRzHzgF0NpPqJHbLAx+6T1BE=;
 b=PMqYKXlLAbNO0XAvCnmh2feO88EIsT4Hn0LYrFYQMJidZKqcdV3/gKE9KJpT5gkrSGSmN6MAoB2MlnVnzVXPaM2u0oC59hUBfEGLitTjd7FruS5Q/I5eTDs9E2EgJPaHlaBGd1DJ3A3bGE1jVrKmsOv/zSqC6hLcEsXJpqKTc48=
Received: from DB6PR0301CA0080.eurprd03.prod.outlook.com (2603:10a6:6:30::27)
 by DB6PR08MB2758.eurprd08.prod.outlook.com (2603:10a6:6:1c::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.25; Thu, 6 May
 2021 15:51:12 +0000
Received: from DB5EUR03FT042.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:6:30:cafe::3d) by DB6PR0301CA0080.outlook.office365.com
 (2603:10a6:6:30::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.25 via Frontend
 Transport; Thu, 6 May 2021 15:51:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT042.mail.protection.outlook.com (10.152.21.123) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4108.25 via Frontend Transport; Thu, 6 May 2021 15:51:11 +0000
Received: ("Tessian outbound aff50003470c:v91"); Thu, 06 May 2021 15:51:11 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: a91f606a55f604fb
X-CR-MTA-TID: 64aa7808
Received: from 05876351bc25.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 446FDBE5-FC6A-400F-977F-CBC6FB66B06E.1;
	Thu, 06 May 2021 15:51:04 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 05876351bc25.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 06 May 2021 15:51:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DdZJ5Z7NRmW+XbLKZiRBtaTEX4ctTLAhW5mbtzFj7feO2fU+RAYqPo4Q3GDtmXCQqI/mD21MAWnGmFkEbPR+zog5QZKUBj3TLnuAX2DaE6Pyc7Oi1/HrZSmWWjnZtTnzEmRoOByiC9UA0RcbR17T09p2RB7agXneMy+dTUfECDKQk0hsKov9XxdK2w48Q5ZjDjOdlNuNM8t9/NEqhaqKES1wq2PONN1+CBv7W0nNh+EBNyYZ3IQx6temdI8yJ9rN/p0z4D/FghfqF5AzSMSZcQGHFo0N5ajGNqPuZwMYAtcAlBeJrMS51Y3r4woPKoq1GJWrjvU8OrueUBUDpwj9RA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ua0JJK9GmiTQfA4q6fkvRzHzgF0NpPqJHbLAx+6T1BE=;
 b=l9kKDAykYcF4ctfH63Zqxwglu/vZ1VROEJq4IKVP1FRVTG8bmG2m+Lh+wULMRXzkCrHY9okc1catrVG7ewErhVGtCr3Jx/jZ5FqdcM83P3bl0LFvBo3kl32wKEHtU2wQ7wezKfPDH1LP1LRI0Ahw0JopJ/efLF3TJtbsSrj1foi+p9Aey5s6UA4F3MIxcDIq7lpQ5Hr8iLRO95BwoUnbS7M0dg71+yrLK6DS8kYusTG4zfHOSPZST27EvSjvYBQWnQ4pu526m07Qxa5u2WRjlYWrjVoQDN1k3MG00FtK31zw2+eQExC4jwEGLY/YZDIRjPI4zRBb+K2juR4JGN9XQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ua0JJK9GmiTQfA4q6fkvRzHzgF0NpPqJHbLAx+6T1BE=;
 b=PMqYKXlLAbNO0XAvCnmh2feO88EIsT4Hn0LYrFYQMJidZKqcdV3/gKE9KJpT5gkrSGSmN6MAoB2MlnVnzVXPaM2u0oC59hUBfEGLitTjd7FruS5Q/I5eTDs9E2EgJPaHlaBGd1DJ3A3bGE1jVrKmsOv/zSqC6hLcEsXJpqKTc48=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from AM6PR08MB3461.eurprd08.prod.outlook.com (2603:10a6:20b:47::28)
 by AM6PR08MB3654.eurprd08.prod.outlook.com (2603:10a6:20b:4d::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.24; Thu, 6 May
 2021 15:51:03 +0000
Received: from AM6PR08MB3461.eurprd08.prod.outlook.com
 ([fe80::185d:c3b0:a5c8:de4b]) by AM6PR08MB3461.eurprd08.prod.outlook.com
 ([fe80::185d:c3b0:a5c8:de4b%4]) with mapi id 15.20.4087.044; Thu, 6 May 2021
 15:51:02 +0000
From: "Diego Sueiro" <diego.sueiro@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH 1/2] arm-autonomy/fvp-base: Make usage of wic images
Date: Thu,  6 May 2021 16:50:56 +0100
Message-Id: <be74f8544e42eb50283c1e447c244f0895f5ec0d.1620316175.git.diego.sueiro@arm.com>
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [217.140.106.51]
X-ClientProxiedBy: LO2P265CA0350.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:d::26) To AM6PR08MB3461.eurprd08.prod.outlook.com
 (2603:10a6:20b:47::28)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from e120809.cambridge.arm.com (217.140.106.51) by LO2P265CA0350.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:d::26) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.24 via Frontend Transport; Thu, 6 May 2021 15:51:02 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f3312c9b-e10e-4249-a8ad-08d910a6c5c4
X-MS-TrafficTypeDiagnostic: AM6PR08MB3654:|DB6PR08MB2758:
X-Microsoft-Antispam-PRVS: 
	<DB6PR08MB2758572C3B74E689B7E4BA7C92589@DB6PR08MB2758.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 spsxCpqaL0WLXLuJFIJ1QG5QwrbMnBOKV1EREFNBfN6V44FBmuhrqOApeFKTaikS8BPvSjbZvG/5ExaS7i5Vn89ACjoUao1PNkJBRnYa5MXfjGh3hkNb6w4q57lNc/FFQRBnGO9g+/iM78sXUP7snmC4FIDsCQKHjqkCVyObU8xENlJL4IF84cWGP4xKO3+0GJZotpXjqRCrNjIGPj9/bhA99mrK3eVqNjsz3SfJoiIfakoOMoaQrQgY+4Vk7bYM1+HRvLDRqGNLfXfZubW4z/7S7cX+AvVlddv1qdm3tYrMY+o/tGOsytKQrhfyHT3C4V/itidOda6U3IJcRTZuoRV4DfTwpateG32pAkjQ/sxBOKl7U3q04iwbBbsn5/F7D+4ar+NIYmPSc70mTie1ZWT0VYbEif+aIZ2GmKrOabgNHz/NXrdNcREs7kvK2/VFSRQQI3xwqhNT6DmOf2QXG78X0tmq78Hs98FwXjQf6M5dexPBSUxVSEXjGdhZH7/DCPQF8dlu+lCdn69SVMdqD6bjsxxwASQJhXJ4hDJcB+Rp06mnFSYB6jWsvLgJZiLjFNaLglAhv6g0u39RzeNVa8eBL+3ljsNrycBk8f97T6cgFXc6zThZ8pHbNlPWSo7zgeSdoHtF35Y+2DTFGBLsaNMXi7i330U8RDryk3KK19E=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3461.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(376002)(39860400002)(346002)(366004)(136003)(6916009)(5660300002)(2906002)(66476007)(66556008)(4326008)(316002)(66946007)(86362001)(36756003)(6486002)(26005)(8676002)(16526019)(83380400001)(186003)(2616005)(38100700002)(478600001)(956004)(7696005)(52116002)(38350700002)(8936002)(44832011)(6666004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 =?us-ascii?Q?jYwhd1EkGsgwP0CLXju49sARoRscHHA6CF3JgmT8Q+biUsrBoGRdtuPLf6A+?=
 =?us-ascii?Q?imZqya5sOrHr628uaodqLChsQlh+OLv5RxaaDJOrqPdddgbo63Y6oMpGG9ll?=
 =?us-ascii?Q?6790of6JGraUEKQFriJNAOmRpXNJWYULs/zQLdREF7u+nvkhwfLNFw3feevh?=
 =?us-ascii?Q?va18EJJ5zrnxIrfJdeHtlnpl8HQ2DhTIafAtyUSEKv8JwdP+I0mxoCEgWjeW?=
 =?us-ascii?Q?lvBIUVKFF6NlGxMpl9MmOA4laTjde3eYAiyxXSNT1aYZ8fF6KAsNCB7bP8X3?=
 =?us-ascii?Q?1Y+SSBsEx9oZgW1QyVzUK0mBp+ykxVyj+N8F66T8ja43/XVmjVkZJT9xhXLw?=
 =?us-ascii?Q?0HBqpkxOQYKujbj5DxBYN7bCpE1f0WtCp4aotaw4Ob7DZU9RLbf+SOnIKto+?=
 =?us-ascii?Q?pbb2Fe0O/p8xFpyo7yQ/cvkKyNhg+h8Sy0AabW8a6LynUrs9VPZ7os5SKgOH?=
 =?us-ascii?Q?y7syRq14vLZlVsR5JBsCSH2U7A/DjHbG0sKJ/hzGejyBwtIKZZCnOjYwXQmD?=
 =?us-ascii?Q?dv+j1SXN7VOtkZ9/cORIefTY8oEs/UwJr5sqqggd5Spkmr0W3cAvO5Hvglsg?=
 =?us-ascii?Q?qZO2zaVgtJ+RoXGh3i7E5KQcKYmjlhaRHUtqJcJQUpvfzMRAF5rcwR9XaK9D?=
 =?us-ascii?Q?nHgtqdvYD9yEHEqVU7YFxogvDaMbpIWnB276Ez9xmAO1co2WoTXoWgxwHVF3?=
 =?us-ascii?Q?MtJ9NzGY0QUMXQUgevaGyUllPceNzDwdG9JT1nakW84Nbr+DC6CjuP5P0ITQ?=
 =?us-ascii?Q?GNMhpKgsGDkhTB0Pu4cLvT7wJLVI0dP5jACpl3Ibt2RQTU0+D94VIouUPA7j?=
 =?us-ascii?Q?3Il3OrehAQs413z8/Xi4edTHLyM/1uwlJ/eWRLQX9cqhbpxcdiUfl+9QnaG2?=
 =?us-ascii?Q?piWNAyrn+/iATrc1yEx2zdOB61FRzwL+4EAux7cidSH/NgWcNMPd8dpRH7fJ?=
 =?us-ascii?Q?GKMr1iSo0J4MBCL5H+ABM3SeNAFnj2+h6wGDEFs5ThDnxyAMyCXtCbGocQFU?=
 =?us-ascii?Q?hdY0EPQxisBpHzVJKPLtJ3EXd3dy15dUeQ6wc04O3ATu5J4AA131feqfChvl?=
 =?us-ascii?Q?CZTbfWv1glIIORveTt45jTHOFG61K934U3wXm6MqmySsi940MnfpRIpFHSpX?=
 =?us-ascii?Q?KbJ2q+MMerLJV5XBX09Ew7/l3uK8qrv1WJT/ZYKPq+uVyy0gM58lgz+kzirZ?=
 =?us-ascii?Q?OZdc0rmXdPX00DFKtRe05Jz+iHYM0f2BW73Mg6MZQqW+b9I2G8cwKeenBILP?=
 =?us-ascii?Q?QCAdpmiUtSYma1khDMuHRlETNcimkYZPYUtaq5J7+7txJgMSC4+U+TjXxBRY?=
 =?us-ascii?Q?C00rY0Be/Mg/MpnqZ0aEQIm1?=
X-MS-Exchange-Transport-Forked: True
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3654
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Diego.Sueiro@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5EUR03FT042.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	8a35c96a-6357-491e-4f6c-08d910a6c063
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	4EWCsXZVOFryGJL0Od4sg2KNeMtokMn3tcrEl8aJ6r0IkXLW4kQRLW1wtXkSHey/jlsc0p2Akvc5HOgYFzRXtr2dS8ijDnbZQ97gmXRRdi7eAOTIxI44crzwoMIyepu04Ja4cLAcYY24fvDPnP/6i5E1C4PcRmbX5JMSUtX4ChzCAorv8n9Bc6cKz0w5RO9jUhqEt1YKeyt7UDVVBGAV7qodFrPQdEn94xnCesgzMHAgx3SrBjN7QzCIq/cZqfqIBDF1WQjNTP41c7OsB04SXfZHNfzRA4ikHdZSe5y9cHPE9sd7BmgUicwpOQ7Ye2u3swpzZ2Sv3onASHlZWWIAyhxLUq+SbToXRFXOIlhidQ0Rr2j9eULiuo+V9YcfFwNKVQHokvKAVZSt1FQEz4QyMTOB2qazEdqTZMnjjZEyU0sEpPn6Dxn/+2ykK7IS7vLPZ1tti7j4UV/5w1aeeGChw7hyXVEK7xFjn8DxGFx5HdAy/RtS/iwxvavCcARKg/LoEzxZeTi3yinoLMaKKL/I5KRv7d143hrOPdTNWx4wjS2Aw6mgyFd5wMLjcZA9O335Ov5tkT7jQSyHc4qAPhRLW0s7RFVjkUR3egqc+IiKBjBXttMbmzjJkKbd+Ykj3CivBnjXdbhgL9vzI/k4jsxPJuRN1mkwh7bHkGpHmM7kyI4=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(39860400002)(136003)(376002)(396003)(346002)(36840700001)(46966006)(2906002)(26005)(7696005)(44832011)(6666004)(82310400003)(36860700001)(81166007)(316002)(70206006)(2616005)(47076005)(956004)(70586007)(6486002)(8936002)(86362001)(478600001)(16526019)(82740400003)(83380400001)(5660300002)(356005)(336012)(36756003)(4326008)(186003)(8676002)(6916009);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2021 15:51:11.8171
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f3312c9b-e10e-4249-a8ad-08d910a6c5c4
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5EUR03FT042.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR08MB2758
Content-Type: text/plain

In meta-arm-bsp fvp-base switched to wic images. Hence, make the appropriate
changes to also use wic images in meta-arm-autonomy.

Change-Id: I34d68fee11ea339fb52a97d7593e373aa69faa1c
Issue-Id: SCM-2329
Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>
---
 .../conf/machine/fvp-base-extra-settings.inc  | 22 ++++++++++++++++---
 .../xen-devicetree/xen-devicetree.bbappend    |  2 +-
 .../wic/arm-autonomy-fvp-base-disk.wks.in     | 14 ++++++++++++
 3 files changed, 34 insertions(+), 4 deletions(-)
 create mode 100644 meta-arm-autonomy/dynamic-layers/meta-arm-bsp/wic/arm-autonomy-fvp-base-disk.wks.in

diff --git a/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/conf/machine/fvp-base-extra-settings.inc b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/conf/machine/fvp-base-extra-settings.inc
index eb16bc8..ee547c2 100644
--- a/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/conf/machine/fvp-base-extra-settings.inc
+++ b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/conf/machine/fvp-base-extra-settings.inc
@@ -1,7 +1,23 @@
 # Extra machine settings for fvp-base
 
-# FVP uses vda as hard drive and partition 2 is the
-# default rootfs, so use vda3 for guest lvm
-XENGUEST_MANAGER_VOLUME_DEVICE ?= "/dev/vda3"
+# FVP uses vda as hard drive and partition 1 is the
+# default rootfs, so use vda2 for guest lvm
+XENGUEST_MANAGER_VOLUME_DEVICE ?= "/dev/vda2"
+
+# We need to extend the wks search path to be able to find the wks file set in
+# ARM_AUTONOMY_WKS_FILE.
+WKS_SEARCH_PATH_prepend := "${ARM_AUTONOMY_ARM_BSP_DYNAMIC_DIR}/wic:"
+
+ARM_AUTONOMY_WKS_FILE ?= "arm-autonomy-fvp-base-disk.wks.in"
+# set wks file only if INITRAMFS_IMAGE_BUNDLE is not set
+WKS_FILE = "${@bb.utils.contains('INITRAMFS_IMAGE_BUNDLE', '1', '',\
+                                 '${ARM_AUTONOMY_WKS_FILE}', d)}"
+
+# Set the wks guest partition size and unit. It must be aligned with the sum of
+# all XENGUEST_IMAGE_DISK_SIZE set for the guests. By default, LVM2 metadata is
+# 1 MiB per physical volume, hence it needs to be taken into account when
+# setting GUEST_PART_SIZE. The XENGUEST_IMAGE_DISK_SIZE default value is 4GiB.
+GUEST_PART_SIZE ?= "4097"
+GUEST_PART_SIZE_UNIT ?= "M"
 
 XENGUEST_NETWORK_BRIDGE_MEMBERS ?= "eth0"
diff --git a/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-extended/xen-devicetree/xen-devicetree.bbappend b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-extended/xen-devicetree/xen-devicetree.bbappend
index 2c875a9..af632e2 100644
--- a/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-extended/xen-devicetree/xen-devicetree.bbappend
+++ b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-extended/xen-devicetree/xen-devicetree.bbappend
@@ -19,5 +19,5 @@ XEN_DEVICETREE_XEN_BOOTARGS_append_juno = " console=dtuart dtuart=serial0 bootsc
 XEN_DEVICETREE_DOM0_BOOTARGS_append_n1sdp = " root=/dev/sda2 rootwait"
 XEN_DEVICETREE_XEN_BOOTARGS_append_n1sdp = " console=dtuart dtuart=serial0 bootscrub=0 iommu=no"
 
-XEN_DEVICETREE_DOM0_BOOTARGS_append_fvp-base = " root=/dev/vda2"
+XEN_DEVICETREE_DOM0_BOOTARGS_append_fvp-base = " root=/dev/vda1"
 XEN_DEVICETREE_XEN_BOOTARGS_append_fvp-base = " console=dtuart dtuart=serial0 bootscrub=0"
diff --git a/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/wic/arm-autonomy-fvp-base-disk.wks.in b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/wic/arm-autonomy-fvp-base-disk.wks.in
new file mode 100644
index 0000000..809a5c2
--- /dev/null
+++ b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/wic/arm-autonomy-fvp-base-disk.wks.in
@@ -0,0 +1,14 @@
+# short-description: Create a disk image
+# long-description: Creates a partitioned disk image that the user
+# can directly dd to boot media.
+
+# For FVP Base first partition is rootfs normally populated as /dev/vda1
+part / --source rootfs --ondisk sda --fstype=ext4 --label root --align 1024
+
+# Second partition to accomodate guests images normally populated as /dev/vda2 (used by XENGUEST_MANAGER_VOLUME_DEVICE)
+part --label guests --source empty --ondisk sda --size="${GUEST_PART_SIZE}${GUEST_PART_SIZE_UNIT}" --system-id 8e --align 1024
+
+# Third partition is user defined entry normally populated as /dev/vda3
+${AUTONOMY_HOST_EXTRA_PARTITION}
+
+bootloader --ptable msdos
-- 
2.17.1


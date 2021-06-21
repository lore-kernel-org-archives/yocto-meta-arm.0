Received: from EUR04-DB3-obe.outbound.protection.outlook.com (EUR04-DB3-obe.outbound.protection.outlook.com [40.107.6.40])
 by mx.groups.io with SMTP id smtpd.web08.49723.1624292628966472126
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 21 Jun 2021 09:23:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=ObmAdJld;
 spf=pass (domain: arm.com, ip: 40.107.6.40, mailfrom: kamil.dziezyk@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FDgj3+SEWTfjTb/9IkVMytn3xR0sSRUPmzkw33z+XX0=;
 b=ObmAdJld8sqvYtpECqtuTdmp75J941SJ5kvmdAIndF1ddt/o4LOwuMndyubjGx7JXXhYafekUIGR1g1uJEjDtdfsolBRatYvhQPa2sFIJ0FK7u+xiqAOkMTyodAF/XUSJCQDWfy4PG2NPf8GQNTL0fe/r6/RF/bKXAQyTi7K0Cs=
Received: from AM6PR05CA0031.eurprd05.prod.outlook.com (2603:10a6:20b:2e::44)
 by AM0PR08MB3460.eurprd08.prod.outlook.com (2603:10a6:208:de::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.22; Mon, 21 Jun
 2021 16:23:46 +0000
Received: from VE1EUR03FT033.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:2e:cafe::2f) by AM6PR05CA0031.outlook.office365.com
 (2603:10a6:20b:2e::44) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.18 via Frontend
 Transport; Mon, 21 Jun 2021 16:23:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT033.mail.protection.outlook.com (10.152.18.147) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4242.16 via Frontend Transport; Mon, 21 Jun 2021 16:23:45 +0000
Received: ("Tessian outbound d6f95fd272ef:v96"); Mon, 21 Jun 2021 16:23:45 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: c34746dc5b6bed13
X-CR-MTA-TID: 64aa7808
Received: from 5626b2a4e1c8.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 6AB1E133-A319-47A0-A856-47413C5656DA.1;
	Mon, 21 Jun 2021 16:23:39 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 5626b2a4e1c8.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Mon, 21 Jun 2021 16:23:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CRytYyBAHVu6EdQqQx0GuI9EhdXPMG/DOEgDv78lEBalQbwVdD89DXEFE3LdjXp7+LwVcfi3YuflgcvGXwWWRZzlmqA+MBMzesemp7tq7VZVVS2BOkuUDqylBOOCQjBvMmrfd7SdXiVcfpcofJ1+2zNP8WblXjc183nNTXj6RlQdAIdSpHHX3wCytYXdvGYryzhvVUClDTKRkHXwgufeej2r+8aExBdYIjQvCoTQJ9pOaH3BzYrhTBsDEPsZVjUUDuIW+S2KmR2DZja/TMeq/pCDLheT6zyOcK2zlPg//fKLN0FpSOwHGTw6wxBADovo8ccxHFAmzGU7o+HDAOo2Yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FDgj3+SEWTfjTb/9IkVMytn3xR0sSRUPmzkw33z+XX0=;
 b=XF9S+SEbpFp1hX8TxsJsVw7iRvLBpgxyWGpUShPMTazZmrQWGuyr5R/htFpD2JIwIpTgWMBx33v1uL+LFe+faXRg73WWzl/gHjLdvJ/uLqAlBPhoH19ycYN8Fpp2xciKgSQi+m+NkgHjc6kFQ25AZOwOakNhzoe3tu2VnQE15rdSOQXi7HhrGaXpgRUXeXmUI6sVWd4j0Hw6egbbAIuaK5+3KWsGRCiC6MOzXWPyz5ZpXs30lomrsqq6lBUIbXVv5JqymCovU3+4zlSyejBIqOwY/7uswKTtQOqDRyeEa99uojy58opZtD6Y65zOPiFt6keZcQMEwr3c/rl3owclAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FDgj3+SEWTfjTb/9IkVMytn3xR0sSRUPmzkw33z+XX0=;
 b=ObmAdJld8sqvYtpECqtuTdmp75J941SJ5kvmdAIndF1ddt/o4LOwuMndyubjGx7JXXhYafekUIGR1g1uJEjDtdfsolBRatYvhQPa2sFIJ0FK7u+xiqAOkMTyodAF/XUSJCQDWfy4PG2NPf8GQNTL0fe/r6/RF/bKXAQyTi7K0Cs=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from DBBPR08MB4696.eurprd08.prod.outlook.com (2603:10a6:10:f3::13)
 by DBBPR08MB4299.eurprd08.prod.outlook.com (2603:10a6:10:ce::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.21; Mon, 21 Jun
 2021 16:23:36 +0000
Received: from DBBPR08MB4696.eurprd08.prod.outlook.com
 ([fe80::318b:e684:6888:bb60]) by DBBPR08MB4696.eurprd08.prod.outlook.com
 ([fe80::318b:e684:6888:bb60%3]) with mapi id 15.20.4242.023; Mon, 21 Jun 2021
 16:23:36 +0000
From: "Kamil Dziezyk" <kamil.dziezyk@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com,
	Diego Sueiro <diego.sueiro@arm.com>,
	Jon Mason <jon.mason@arm.com>
Subject: [hardknott][PATCH v2 2/2] arm-autonomy/fvp-base: Make usage of wic images
Date: Mon, 21 Jun 2021 18:22:35 +0200
Message-Id: <20210621162235.23245-2-kamil.dziezyk@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210621162235.23245-1-kamil.dziezyk@arm.com>
References: <20210621162235.23245-1-kamil.dziezyk@arm.com>
X-Originating-IP: [217.140.99.251]
X-ClientProxiedBy: LO4P123CA0084.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:190::17) To DBBPR08MB4696.eurprd08.prod.outlook.com
 (2603:10a6:10:f3::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from e120195-lin.arm.com (217.140.99.251) by LO4P123CA0084.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:190::17) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.15 via Frontend Transport; Mon, 21 Jun 2021 16:23:35 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 42f7add9-a395-44b6-2674-08d934d0f178
X-MS-TrafficTypeDiagnostic: DBBPR08MB4299:|AM0PR08MB3460:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<AM0PR08MB3460C23D15FD8435ED004C0BFD0A9@AM0PR08MB3460.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:1824;OLM:1824;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 xWNH5R9lZxlmoBMDuJKhK+kmEPMmAZFjq29Zhtq2qBn7+yIYQU8hHS01hx4xwgr+zDEu9+dU61NCKGCV/tr0MRF3AE0pG7MxMFKtVnKMR29sN1rLbWd0+pdbqVdMQkcG+BcjCF2cNyRqjBuBnf/plFHrRMfoG3I6PVg7r/gg/cA/gUCwhSR4lQVunRtzmNoKigb/9UFu14U9/t5iqmHQBYhHLtsP4vTzazJeNWSGKk13w4jFUzr9edjPu5iVL3xksD5dEFUpcb0LNNXH3QDfjQe2tENohQ6eR9RbBe58sHN0QNJQ+5GGR+KfXqd/cYPkdU+1PoaPggDubwIQisBidmK6SCUZVJxoN6D+qVrVu4bnCvfuT3LWafgb5tOIYbe1oWAKiAVBO73Abh4HKPXY9OpmkBbmluKaPbekGwHSOsWu5FCV6+IXmztygy8SF8EefMI/ar9xg/522M0ySvNEh3+xt7nKpn8dEQItvidzxbi5cxS27YvwjVm+epC90c2/JAFrShNTRoSDs+u61yFpHOMGaqbqWvbA91Y56Y6EvhAfX0IyfEEXSuRdfoo0kS5assE1O71FQ7oXymEjF6tPvre5AbriQRvbICUaqQTqhcQYzuARjEQGzOB4c7sApZY8IyV12R4aMOuwVOOqfpT8+HpSW76Vnn0h99hQ/zfzaFo=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR08MB4696.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(366004)(136003)(346002)(396003)(376002)(5660300002)(86362001)(52116002)(316002)(26005)(44832011)(16526019)(478600001)(7696005)(186003)(54906003)(6916009)(2616005)(66556008)(66476007)(83380400001)(6486002)(2906002)(36756003)(1076003)(66946007)(4326008)(38350700002)(8936002)(38100700002)(8676002)(956004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
 =?us-ascii?Q?9Cg8Idmr2Q1ImlrVJBin2mQoYde7GxQcbWFZ/BpvNCemUrLtZJH7o4XdjF8l?=
 =?us-ascii?Q?e+5Dcp6fJJ2+g7PLDPktHeMk1lxk1858mY9jzVgjlGdIuuuZFoVUPcYN9KQ4?=
 =?us-ascii?Q?TQXxHEZ448Gx6LYunPCocsW7kcTNDxv7bRRrIlzpkAA90tuu/P0koh7Vh3lT?=
 =?us-ascii?Q?n7ZMW0nKWPflS1oGmgiO54NnghPkJlt907mp0IVAMAVOIq8eHQx8l28+SRAs?=
 =?us-ascii?Q?WVKqvgh0GWVaWwMGBBDjEtGUFz9yQdxsV7VRztek7cqej6eoXd2q2kmrhK/H?=
 =?us-ascii?Q?8VB1gBb21yVp5cIXhN4eSb6wL18OgIAs5zaSDDOIXEtaJpWZwks31F/w6KH7?=
 =?us-ascii?Q?6u2vOL44xvV5iA+O+vhyzUj8wKpYHWhsV0lHhcMdSsCF2S7KzqBmK2KhSQlP?=
 =?us-ascii?Q?grGjBdhgEDhE80anVakIeUwtynU1KpiqEWdBOAlpmUM10xckMJK3MDNYsuFd?=
 =?us-ascii?Q?0qXZ+PrkkGi/99p6W5+dFRQBMXuyh+vUpPd5i+C4xwXKzuw/IhLBT4UHSQOZ?=
 =?us-ascii?Q?O+78cXHujlAmGm7ENpZtQOXI5zVI9U9rN/PRyjoKakfdFa9La/XtP4MSCGwg?=
 =?us-ascii?Q?vD1shX/QxvvifgFoxYEaJhc8yBbwk3u2DdKSRq7WYlrjfgwoOctVtEL5Uwpu?=
 =?us-ascii?Q?0Vh17xux+Th7Z/S4YeoKD8D1YYHrgtCPlscZoQFieDTiGSYFKfog1H4UAQuz?=
 =?us-ascii?Q?xj7fw+N4M44j2ZXkPmUiK503o1PmJWSUpt3CwF3y/x4JwGSSc9qobh1e0SAx?=
 =?us-ascii?Q?qUmyZa1nQ8Au8a0jtd4NRpzmRwrRmMzPlK41B5KsFRzs2rhUZfVbagsyF4dx?=
 =?us-ascii?Q?aeOK8lnXmh53ywmxo1LeGQewgEF3PqSNmdBWHGylJoH1XKVcIWeWZORiUlQK?=
 =?us-ascii?Q?E+LPE0BcB0yRX7CCIooH6dW1k40Kmeec2ZNs44yWlRNbCvrHmfEj/o/3i5IR?=
 =?us-ascii?Q?4UZTszgL7LsIiyd9er8sUCvNRS//kZHtQUqibGGp/RwWU8N9oaTfdG4LCBlV?=
 =?us-ascii?Q?sjBkRkV+IBMWttxyOnzRcE5sEolE5+k8OIRpolyHtO4xotr6CW3ujMPzF8Y+?=
 =?us-ascii?Q?iHKKs64rRVN5SEl4Z4aFlAROF6OLWO5SUq4IZ5WdfhU5JIE19poCXdrYPxCL?=
 =?us-ascii?Q?1EsFiB7Q6CtDmKM07B7qPsgq7s+OEuSSfDRgaD4/gO6R2DbNgy0fBNnlbjtL?=
 =?us-ascii?Q?6VNV3V2qRJSBnj59o/LrePcDnqUJQMTL7Fq1fnnZuLk7dwnQAi78DVs2YxGq?=
 =?us-ascii?Q?+Uks+fU1+FERW+q4jmNoX4PobwKuZfccqureMzjw2moHOHK0c4IKzwgrazUV?=
 =?us-ascii?Q?94Bpzl+z2orFeyjyUbnBZwDX?=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB4299
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Kamil.Dziezyk@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 VE1EUR03FT033.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	5bcc82bc-234e-4d93-f14c-08d934d0eb89
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	FAH+x30tBids/Jd+6jHg3UAyTG9cAZPwkTpSe2v+05kR8ubjkhFSN7Es3prYGZVFA+ykabLjhUoPcXrwI5WfTXpdFsEn097CvfJa98p0B5jE0hSGe4tXdVqnqogYZEJ/YGms2MkAd2n3V3CYI63qdCB9CHssqqiPpBQds2YGVb1kYSl04yRgCc25xFDbFUc4zlD8L5WxlsViGxd99qP9Ddd4ytHugDN9sS7HVWwUrAHrmex42fXUVHeh7/j0iPutR/K8TVOQcKT1iPN/htDOGuCzz3eb/PIhDXG/dCZ9WwsIUa3dKFeowFBGodF2F03cHjCrnYyCV9wS83aa2pEaMKFDjKA7zgx56iRCkkfrbiPS6ueRFrb4N6syi+wkoIoLXjWqEr4QS9JFual8lX04gd9nwrs48mor6tUIDZkGR2kQH98Ytk0o91n0314IFINej2Vi4yxDsSpIzaA2jkuq9q7UcEfjk+Rv1XOEN0lDNjr+xu+ZpzxbrNEyIaPI48Djy9zRuBKy1HjC28sVo49+m/rcbHfBH1jF1YMIsTDjePTqruUDZ6g7PQ7qyOm4v32O4AcOyFAFB3bycr2VGCQ6oCTqlV2dySPXCn9ud/Pv8phkdk6l1d/kZyra494/kQkqF1ibPF+shzdLf9BjUgqstZZIUOpH+3FsdsbBIbNzy0M=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(136003)(396003)(39860400002)(376002)(346002)(46966006)(36840700001)(83380400001)(36860700001)(478600001)(4326008)(1076003)(82310400003)(6486002)(70586007)(70206006)(5660300002)(81166007)(356005)(82740400003)(2906002)(86362001)(316002)(47076005)(16526019)(336012)(186003)(26005)(8936002)(956004)(2616005)(6916009)(36756003)(8676002)(44832011)(54906003)(7696005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jun 2021 16:23:45.7471
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 42f7add9-a395-44b6-2674-08d934d0f178
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	VE1EUR03FT033.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3460
Content-Type: text/plain

From: Diego Sueiro <diego.sueiro@arm.com>

In meta-arm-bsp fvp-base switched to wic images. Hence, make the appropriate
changes to also use wic images in meta-arm-autonomy.

Change-Id: I34d68fee11ea339fb52a97d7593e373aa69faa1c
Issue-Id: SCM-2329
Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>
Signed-off-by: Jon Mason <jon.mason@arm.com>
(cherry picked from commit b2031ed7ca8faaf82cf74208825999ed8cbd44af)
---
 .../conf/machine/fvp-base-extra-settings.inc    | 16 ++++++++++++++++
 .../wic/arm-autonomy-fvp-base-disk.wks.in       | 17 +++++++++++++++++
 2 files changed, 33 insertions(+)
 create mode 100644 meta-arm-autonomy/dynamic-layers/meta-arm-bsp/wic/arm-autonomy-fvp-base-disk.wks.in

diff --git a/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/conf/machine/fvp-base-extra-settings.inc b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/conf/machine/fvp-base-extra-settings.inc
index eb16bc8..91a9c2e 100644
--- a/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/conf/machine/fvp-base-extra-settings.inc
+++ b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/conf/machine/fvp-base-extra-settings.inc
@@ -4,4 +4,20 @@
 # default rootfs, so use vda3 for guest lvm
 XENGUEST_MANAGER_VOLUME_DEVICE ?= "/dev/vda3"
 
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
+
 XENGUEST_NETWORK_BRIDGE_MEMBERS ?= "eth0"
diff --git a/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/wic/arm-autonomy-fvp-base-disk.wks.in b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/wic/arm-autonomy-fvp-base-disk.wks.in
new file mode 100644
index 0000000..dfd4c23
--- /dev/null
+++ b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/wic/arm-autonomy-fvp-base-disk.wks.in
@@ -0,0 +1,17 @@
+# short-description: Create a disk image
+# long-description: Creates a partitioned disk image that the user
+# can directly dd to boot media.
+
+# For FVP Base first partition is empty to keep compatibility with disk.img
+part --label empty --source empty --ondisk sda --size="1M" --system-id 8e --align 1024
+
+# Second partition is rootfs normally populated as /dev/vda2
+part / --source rootfs --ondisk sda --fstype=ext4 --label root --align 1024
+
+# Third partition to accomodate guests images normally populated as /dev/vda3 (used by XENGUEST_MANAGER_VOLUME_DEVICE)
+part --label guests --source empty --ondisk sda --size="${GUEST_PART_SIZE}${GUEST_PART_SIZE_UNIT}" --system-id 8e --align 1024
+
+# Fourth partition is user defined entry normally populated as /dev/vda4
+${AUTONOMY_HOST_EXTRA_PARTITION}
+
+bootloader --ptable msdos
-- 
2.17.1


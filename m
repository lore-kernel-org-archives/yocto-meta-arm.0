Return-Path: <diego.sueiro@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B70E8C433FE
	for <webhook@archiver.kernel.org>; Fri, 29 Oct 2021 13:42:19 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.75])
 by mx.groups.io with SMTP id smtpd.web10.5522.1635514936499202721
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 29 Oct 2021 06:42:18 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@armh.onmicrosoft.com
 header.s=selector2-armh-onmicrosoft-com header.b=b6IMoo9+;
 spf=pass (domain: arm.com, ip: 40.107.22.75, mailfrom: diego.sueiro@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q1wvSWv+/xBzCIdlxUsSITTXwdXq2t/+6fTavhNzQCA=;
 b=b6IMoo9+q63zaf+GT1Mv9Zbs/5pdv3SKddo7OcutRsfmOwp81sL58vn6jQGh0JGCPCgkPSy32GMZbdAlMH55DVTFYY6HL/7x37VjFilU+e5yjk0XiaVhZsF9wOcphh+TOQlr80ZMBak4/XRCKmjUGWm/8FPKt3hhiLLT2bU7kXU=
Received: from DB6PR07CA0163.eurprd07.prod.outlook.com (2603:10a6:6:43::17) by
 PAXPR08MB6893.eurprd08.prod.outlook.com (2603:10a6:102:13f::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4649.15; Fri, 29 Oct 2021 13:42:08 +0000
Received: from DB5EUR03FT028.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:6:43:cafe::52) by DB6PR07CA0163.outlook.office365.com
 (2603:10a6:6:43::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.4 via Frontend
 Transport; Fri, 29 Oct 2021 13:42:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT028.mail.protection.outlook.com (10.152.20.99) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4649.14 via Frontend Transport; Fri, 29 Oct 2021 13:42:08 +0000
Received: ("Tessian outbound 4ce13939bd4a:v108");
 Fri, 29 Oct 2021 13:42:08 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 7ef07a6516900a39
X-CR-MTA-TID: 64aa7808
Received: from cbf48a5442ee.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 17203E48-9C42-4229-84DB-93D3654ABF28.1;
	Fri, 29 Oct 2021 13:42:01 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 cbf48a5442ee.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Fri, 29 Oct 2021 13:42:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lbxEgFpQHmrUf6KND6X8L77sSj15TmeUZPZOXG7CMyPe6+pFFhTaAYlepL2JotmXMSUDmH0djoKybh/VbZygKcJw+OrczQn8ZxJmn7CoUcWndvd3bKM2NFYKRDWeFtJeimeKn/udOc4gewb4KNCf+C/Ke4gVrVGDgbq/42X1v6XM7LGTHqkHr5wdxUMwwYRxbNzsvfmw7uAAwvEwTeF+jYJ5Pel2mJ7Ttxj8qZI5+RapJrqLuvvOQQh+vC1Z0iCQW1grKd7Gqcc0Aih7o50cMaJ2C5F92GTsVaeJfyewldhbkHhuH8mpcXSLKyp7T2E3eXmkrVDa4g/7z6renxg8NA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q1wvSWv+/xBzCIdlxUsSITTXwdXq2t/+6fTavhNzQCA=;
 b=HaGa1z23U1FJffsTK467QhwC2TtOXYY4tHaxqW6s/6TMi1vpMxLIVX7EqCqXUBR0/ypKDxTcrREeyOF/yL/l1ObmkT4uCh3lutGhnq5rFw4uU4pN+KWVy2RLkz0M3uSzDia/RMu1gGEyNmWhjKZqxe44vCym7ryZ3IOaa5ht92j2fj9UUw/Reagk7WDoWKLpMobVX+N3uE6pzxuNTWUXKptydDhXMXZja7pZa3XfnPSikL8exAXSwyzy2WkXtxCa/XxZB1io8KY16UReIf+nynC2Fvrl6zz/F3Dv80UPBLaPWmuPme+17jEQt0xj6ZBFAxFtOnuzLgTOS27bbJaJ9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q1wvSWv+/xBzCIdlxUsSITTXwdXq2t/+6fTavhNzQCA=;
 b=b6IMoo9+q63zaf+GT1Mv9Zbs/5pdv3SKddo7OcutRsfmOwp81sL58vn6jQGh0JGCPCgkPSy32GMZbdAlMH55DVTFYY6HL/7x37VjFilU+e5yjk0XiaVhZsF9wOcphh+TOQlr80ZMBak4/XRCKmjUGWm/8FPKt3hhiLLT2bU7kXU=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from AM6PR08MB3461.eurprd08.prod.outlook.com (2603:10a6:20b:47::28)
 by AM5PR0801MB1809.eurprd08.prod.outlook.com (2603:10a6:203:3a::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.15; Fri, 29 Oct
 2021 13:41:52 +0000
Received: from AM6PR08MB3461.eurprd08.prod.outlook.com
 ([fe80::ecb2:1815:d244:58ba]) by AM6PR08MB3461.eurprd08.prod.outlook.com
 ([fe80::ecb2:1815:d244:58ba%7]) with mapi id 15.20.4649.015; Fri, 29 Oct 2021
 13:41:52 +0000
From: Diego Sueiro <diego.sueiro@arm.com>
To: meta-arm@lists.yoctoproject.org
CC: nd@arm.com,
	Diego Sueiro <diego.sueiro@arm.com>
Subject: [PATCH] arm-autonomy: Remove code from master as part of the
 deprecation plan
Date: Fri, 29 Oct 2021 14:41:31 +0100
Message-ID: 
 <afc4f694d6fefdf38c2df1dc83435e7b383bc135.1635514846.git.diego.sueiro@arm.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: LO2P265CA0053.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:60::17) To AM6PR08MB3461.eurprd08.prod.outlook.com
 (2603:10a6:20b:47::28)
MIME-Version: 1.0
Received: from e120809.cambridge.arm.com (217.140.106.51) by
 LO2P265CA0053.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:60::17) with Microsoft
 SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.15 via Frontend
 Transport; Fri, 29 Oct 2021 13:41:52 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0763da40-a591-4097-23ef-08d99ae1e725
X-MS-TrafficTypeDiagnostic: AM5PR0801MB1809:|PAXPR08MB6893:
X-Microsoft-Antispam-PRVS: 
	<PAXPR08MB68930B49679B144A92A10D9A92879@PAXPR08MB6893.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;OLM:4714;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 ih3ct/UrqlGpCKi16LwRUgcDhXvDSklAqpJIAu9xjr5J9KYEcEFRDmJq909OUJn3bfctQ+sAJS+shaFehbSxzD7CgV1Cb2uclqypfFbQ3xdklZFjRUl2bsHqzTabhzFMEFXxv+94Cer7pxdCRgg53DbTHd/T0nrB9kjyLrN7YZDDj3NVamnQNRAnNxVJ1R+iQQL+ucUP2U1najy1Eem3hpguOB3Dc5cRG6lnM7hAb3eNSNNvLPBpq2w7NYUmdrt4sApQOW04G35AWY4CSsP3QdW6vwS4P2spbSMTewQvTcMaUHnKPhwmfjOm/vsfPds1EvnNzj6Yp9gIdNxFUjJOf6jjNfWhlhGeIut5ObnXx0aM8JsUCy3VY3qBvldgk6XMXgbU93p1OhJJoeEQ7WpSx94EQWF4LrdwZ9l0BkMQqruHLBcUe0z+zdG9x7CsO3bWtC6P70XF5vMgPa9t7uluVHN7G0I1a8itkH00LmWViK75+Vtx3HC1n/g19qidDEv5D/f9wv+kFMovsXHuoX9QMVPn5d3bwYLrRCTIJNepo+B5CmiNramrLihS3efJC0Q4zghvX3kUJWXsjwG6QUavOqTL2tBEzpf3iLghzYQoQv55/+EKgCvAqOJ3Tn6J5ykUwop5Ey4Aa4+w4iZ1XYL4ZYVkYsZlX0hxkKGiybz2SRDCBVXud9kSL9306E/D+9PF+09wSuY9laXVMR8r1dM4yCxnm3WSrTXmMnnHUdIG2DWRJJ1C0z5Moq9+k0r3nEU0wB+Gl/TZ2VQi+XfIyNjyTtP7PM5qqib+XyuqO9Sr5VK1FTcCzLAYqVpv62kvBY4LzEobWJYb4rWjchYFPtNTfpWAAA+39An0l86v5+7G4l/V50HCbZcshW1rG2BLnSVM
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3461.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(8936002)(66574015)(7696005)(86362001)(186003)(4326008)(26005)(45080400002)(6666004)(52116002)(6486002)(30864003)(966005)(38100700002)(4001150100001)(66556008)(508600001)(8676002)(5660300002)(83380400001)(38350700002)(956004)(36756003)(2616005)(66476007)(316002)(66946007)(6916009)(2906002)(44832011)(579004)(569008)(559001)(414714003)(473944003);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB1809
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5EUR03FT028.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	c9ecf398-d40b-4108-b6e2-08d99ae1dd91
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	PE2Gzwmq9YMG6D+0d4g1Uy81RRxxBWrG4e40yJdcH0Kx4XJViZ05RdTDEgF6xo+3FBL6ftslOsyKRzLmpBpvwVdHftCtXn9zCQ2k+I+yQec0r68l5DSItsnrzRApcj6JWxQQ9gT05bLeZTGHBG3Ov6e4T2bWs0Jjb9gJV+e65lsfaPRV3AY0r9Q6q17KjF3jUHQ3KTxsD5q+iU3+twkUZ2ASOYdUVfesrorznOwa3mXR1Uv5GuZETJXeVFAhRTe4peiY/vNla54uHWYr3rUnnCRy4kWyXDVyRzftnBfz/+QU8FLwaQMLk/x6I9z94Kr8Vs2snqPs9oHnoaiCt1LNg0agsTZagXCctwYQPV3rHJJ1hxM9cuSK+7QFSiH8OH2k/1ljGFuPeOOlKOcnuCNs+G4MX5E1oLcW4l6zMMmVODwtop9DYssDhNge4L1JbNRB0h7v4wHuaH1OFBoRR4Ls01/+FX7nPDFe9JyF7SaaHyx64Vq4fNxkssmHe9nGc78V8IF+STSnX5oqgTYEI5meCDeyUQHY/wARTp/HPsYChLXwusMsJzOAb5DBQRxi5uNKwaRB1UP4tiB7rSfCKX96EIzFFSUF8O12ZMTg7w9Ssl0L5PjrmoYez3Xykyh3BbNegjbXY3/yy/vEw85A0qCazCiVQNG9fSxco0EpWQhFu9AVOfj9gh5ATcI/B9Y+MxHQn6ek6hgT70AKi8RpEWXYQFnMjaO1h8YcPJur76JWU3o1fQ6fQPYI19y1vr6w5KbXLmRpBLuGv3uscDPsk9Za28ZJwNk1zjHBpVnBuMjxZC1cMppFjDhgN8QS9nunJpMM9jX+AC/SKtueWKuflhz69dyjq+WgNU8HkMRyGxLvI59zrVd8s2cf58geX478i6dr
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(66574015)(4001150100001)(36756003)(508600001)(316002)(2616005)(8676002)(956004)(30864003)(966005)(86362001)(36860700001)(6486002)(6666004)(4326008)(7696005)(82310400003)(5660300002)(186003)(356005)(70206006)(45080400002)(44832011)(6916009)(26005)(81166007)(2906002)(336012)(47076005)(8936002)(70586007)(83380400001)(579004)(569008)(559001)(473944003)(414714003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2021 13:42:08.5835
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 0763da40-a591-4097-23ef-08d99ae1e725
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5EUR03FT028.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6893
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 29 Oct 2021 13:42:19 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2327

The meta-arm-autonomy layer is being deprecated from master, with bug fixes
only being applied to the following branches. Additionally, all support and
maintenance of meta-arm-autonomy will stop as per the schedule below.

    honister: End-of-life scheduled to June 2022
    hardknot: End-of-life scheduled to December 2021
    gatesgarth: End-of-life scheduled to October 2021
    dunfell: End-of-life scheduled to October 2021
    master: End-of-life scheduled to October 2021 and code removed

Issue-Id: SCM-3552
Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>
Change-Id: I3ca58f8c13b1ecb3dbaf0d60f0f52b016292633d
---
 .gitlab-ci.yml                                |    2 +-
 ci/check-layers.yml                           |    6 -
 ci/meta-arm-autonomy.yml                      |   10 -
 meta-arm-autonomy/README.md                   |   86 +-
 .../classes/alternate-kernel.bbclass          |   26 -
 .../classes/arm-autonomy-features.bbclass     |    5 -
 .../classes/docker_extern_containers.bbclass  |  115 --
 .../classes/image_types_xenguest.bbclass      |  169 ---
 .../classes/kernel-xenguest.bbclass           |   37 -
 .../classes/set_src_uri_from_var.bbclass      |  224 ----
 .../classes/xenguest_image.bbclass            |  251 ----
 .../classes/xenguest_image_extra.bbclass      |  123 --
 .../distro/include/arm-autonomy-guest.inc     |   15 -
 .../conf/distro/include/arm-autonomy-host.inc |   23 -
 meta-arm-autonomy/conf/layer.conf             |   39 -
 .../conf/machine/arm64-autonomy-guest.conf    |   17 -
 meta-arm-autonomy/conf/xenguest.conf          |    5 -
 .../documentation/arm-autonomy-multiconfig.md |  226 ----
 .../documentation/arm-autonomy-quickstart.md  |  272 ----
 .../n1sdp-image-customization.md              |   34 -
 .../documentation/xen-devicetree.md           |  110 --
 .../documentation/xenguest-manager.md         |  144 ---
 .../documentation/xenguest-mkimage.md         |  128 --
 .../documentation/xenguest-network.md         |   80 --
 .../arm-autonomy-machine-extra-settings.inc   |    7 -
 .../conf/machine/fvp-base-extra-settings.inc  |   39 -
 .../conf/machine/juno-extra-settings.inc      |   26 -
 .../conf/machine/n1sdp-extra-settings.inc     |   94 --
 .../images/firmware-image-juno.bbappend       |   50 -
 .../firmware-image-juno/add-xen-support.patch |  173 ---
 .../fvp-base/xen_u-boot_kernel_addr.patch     |   16 -
 .../recipes-bsp/u-boot/u-boot_%.bbappend      |   10 -
 .../xen-devicetree/files/xen-juno.dtsi        |   11 -
 .../xen-devicetree/files/xen-n1sdp.dtsi       |   41 -
 .../xen-devicetree/xen-devicetree.bbappend    |   23 -
 .../xen/files/fvp-base/early-printk.cfg       |    2 -
 .../xen/files/juno/early-printk.cfg           |    2 -
 .../xen/files/n1sdp/early-printk.cfg          |    3 -
 .../xen/files/n1sdp/n1sdp.cfg                 |    5 -
 .../recipes-extended/xen/xen_%.bbappend       |   15 -
 .../wic/arm-autonomy-fvp-base-disk.wks.in     |   14 -
 .../wic/arm-autonomy-juno-disk.wks.in         |   14 -
 .../wic/arm-autonomy-n1sdp-efidisk.wks.in     |   17 -
 .../wic/arm-autonomy-n1sdp-grub.cfg           |   28 -
 .../wic/arm-autonomy-n1sdp-rt-grub.cfg        |   28 -
 .../recipes-bsp/grub/grub-efi_%.bbappend      |    3 -
 .../files/import_containers.sh                |   70 -
 .../import-docker-containers.bb               |   36 -
 .../packagegroup-docker-runtime-minimal.bb    |   19 -
 .../busybox/feature_tar_long_options.cfg      |    1 -
 .../recipes-core/busybox/busybox_%.bbappend   |    8 -
 .../images/arm-autonomy-host-image-minimal.bb |   35 -
 .../init-ifupdown/init-ifupdown_1.0.bbappend  |   20 -
 .../sysvinit/sysvinit-inittab_2.%.bbappend    |   20 -
 .../qemu/qemu-autonomy-host.inc               |    8 -
 .../recipes-devtools/qemu/qemu_%.bbappend     |    3 -
 .../xen-devicetree/files/xen.dtsi.in          |   17 -
 .../xen-devicetree/xen-devicetree.bb          |  130 --
 ...ssages-for-unknown-FP-SIMD-implement.patch |   51 -
 .../0001-vif-nat-fix-hostname.patch           |   34 -
 .../recipes-extended/xen/xen-tools_%.bbappend |    4 -
 .../xen/xen-tools_4.14.bbappend               |    7 -
 .../recipes-extended/xen/xen_%.bbappend       |   10 -
 .../recipes-extended/xen/xen_4.14.bbappend    |    9 -
 .../xenguest/files/00-vif-xenguest.hook       |  138 --
 .../files/00-xenguest-nat-port-forward.hook   |   48 -
 .../xenguest/files/kea-dhcp4.conf             |   30 -
 .../xenguest/files/kea-restore-default-config |   29 -
 .../xenguest/files/kea-subnet4.json           |   35 -
 .../xenguest/files/logrotate-xenguest         |    6 -
 .../xenguest/files/network-bridge.sh.in       |   26 -
 .../xenguest/files/xenguest-init              |   90 --
 .../xenguest/files/xenguest-manager           | 1139 -----------------
 .../xenguest/files/xenguest-mkimage           |  938 --------------
 .../files/xenguest-network-bridge-dhcp.cfg.in |    3 -
 .../xenguest/files/xenguest-network-bridge.in |   44 -
 .../files/xenguest-network-init-post.sh       |   45 -
 .../xenguest/xenguest-base-image.bb           |  157 ---
 .../xenguest/xenguest-extern-guests.bb        |   85 --
 .../xenguest/xenguest-manager.bb              |   63 -
 .../xenguest/xenguest-mkimage.bb              |   36 -
 .../xenguest/xenguest-network.bb              |   96 --
 .../xenguest/xenguest-nodisk-image.bb         |   38 -
 .../arm64-autonomy-guest-standard.scc         |    5 -
 .../bsp/arm-autonomy/arm64-autonomy-guest.cfg |    2 -
 .../bsp/arm-autonomy/arm64-autonomy-guest.scc |    6 -
 .../features/arm-autonomy/docker-minimal.cfg  |   27 -
 .../features/arm-autonomy/docker-minimal.scc  |    5 -
 .../features/arm-autonomy/netfilter-extra.cfg |    2 -
 .../features/arm-autonomy/xen-common.cfg      |   31 -
 .../features/arm-autonomy/xen-common.scc      |    3 -
 .../features/arm-autonomy/xen-guest.cfg       |   28 -
 .../features/arm-autonomy/xen-guest.scc       |    3 -
 .../arm-autonomy/xen-host-iptables.scc        |   10 -
 .../features/arm-autonomy/xen-host.cfg        |   10 -
 .../features/arm-autonomy/xen-host.scc        |    3 -
 ...x-to-convert-percpu-address-to-gfn-c.patch |  147 ---
 ...etup-the-runstate-info-page-if-kpti-.patch |   83 --
 .../recipes-kernel/linux/linux-%.bbappend     |    5 -
 .../linux/linux-arm-autonomy.inc              |   51 -
 100 files changed, 9 insertions(+), 6708 deletions(-)
 delete mode 100644 ci/meta-arm-autonomy.yml
 delete mode 100644 meta-arm-autonomy/classes/alternate-kernel.bbclass
 delete mode 100644 meta-arm-autonomy/classes/arm-autonomy-features.bbclass
 delete mode 100644 meta-arm-autonomy/classes/docker_extern_containers.bbcl=
ass
 delete mode 100644 meta-arm-autonomy/classes/image_types_xenguest.bbclass
 delete mode 100644 meta-arm-autonomy/classes/kernel-xenguest.bbclass
 delete mode 100644 meta-arm-autonomy/classes/set_src_uri_from_var.bbclass
 delete mode 100644 meta-arm-autonomy/classes/xenguest_image.bbclass
 delete mode 100644 meta-arm-autonomy/classes/xenguest_image_extra.bbclass
 delete mode 100644 meta-arm-autonomy/conf/distro/include/arm-autonomy-gues=
t.inc
 delete mode 100644 meta-arm-autonomy/conf/distro/include/arm-autonomy-host=
.inc
 delete mode 100644 meta-arm-autonomy/conf/layer.conf
 delete mode 100644 meta-arm-autonomy/conf/machine/arm64-autonomy-guest.con=
f
 delete mode 100644 meta-arm-autonomy/conf/xenguest.conf
 delete mode 100644 meta-arm-autonomy/documentation/arm-autonomy-multiconfi=
g.md
 delete mode 100644 meta-arm-autonomy/documentation/arm-autonomy-quickstart=
.md
 delete mode 100644 meta-arm-autonomy/documentation/n1sdp-image-customizati=
on.md
 delete mode 100644 meta-arm-autonomy/documentation/xen-devicetree.md
 delete mode 100644 meta-arm-autonomy/documentation/xenguest-manager.md
 delete mode 100644 meta-arm-autonomy/documentation/xenguest-mkimage.md
 delete mode 100644 meta-arm-autonomy/documentation/xenguest-network.md
 delete mode 100644 meta-arm-autonomy/dynamic-layers/meta-arm-bsp/conf/mach=
ine/arm-autonomy-machine-extra-settings.inc
 delete mode 100644 meta-arm-autonomy/dynamic-layers/meta-arm-bsp/conf/mach=
ine/fvp-base-extra-settings.inc
 delete mode 100644 meta-arm-autonomy/dynamic-layers/meta-arm-bsp/conf/mach=
ine/juno-extra-settings.inc
 delete mode 100644 meta-arm-autonomy/dynamic-layers/meta-arm-bsp/conf/mach=
ine/n1sdp-extra-settings.inc
 delete mode 100644 meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-b=
sp/images/firmware-image-juno.bbappend
 delete mode 100644 meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-b=
sp/images/firmware-image-juno/add-xen-support.patch
 delete mode 100644 meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-b=
sp/u-boot/u-boot/fvp-base/xen_u-boot_kernel_addr.patch
 delete mode 100644 meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-b=
sp/u-boot/u-boot_%.bbappend
 delete mode 100644 meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-e=
xtended/xen-devicetree/files/xen-juno.dtsi
 delete mode 100644 meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-e=
xtended/xen-devicetree/files/xen-n1sdp.dtsi
 delete mode 100644 meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-e=
xtended/xen-devicetree/xen-devicetree.bbappend
 delete mode 100644 meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-e=
xtended/xen/files/fvp-base/early-printk.cfg
 delete mode 100644 meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-e=
xtended/xen/files/juno/early-printk.cfg
 delete mode 100644 meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-e=
xtended/xen/files/n1sdp/early-printk.cfg
 delete mode 100644 meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-e=
xtended/xen/files/n1sdp/n1sdp.cfg
 delete mode 100644 meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-e=
xtended/xen/xen_%.bbappend
 delete mode 100644 meta-arm-autonomy/dynamic-layers/meta-arm-bsp/wic/arm-a=
utonomy-fvp-base-disk.wks.in
 delete mode 100644 meta-arm-autonomy/dynamic-layers/meta-arm-bsp/wic/arm-a=
utonomy-juno-disk.wks.in
 delete mode 100644 meta-arm-autonomy/dynamic-layers/meta-arm-bsp/wic/arm-a=
utonomy-n1sdp-efidisk.wks.in
 delete mode 100644 meta-arm-autonomy/dynamic-layers/meta-arm-bsp/wic/arm-a=
utonomy-n1sdp-grub.cfg
 delete mode 100644 meta-arm-autonomy/dynamic-layers/meta-arm-bsp/wic/arm-a=
utonomy-n1sdp-rt-grub.cfg
 delete mode 100644 meta-arm-autonomy/recipes-bsp/grub/grub-efi_%.bbappend
 delete mode 100755 meta-arm-autonomy/recipes-containers/import-docker-cont=
ainers/files/import_containers.sh
 delete mode 100644 meta-arm-autonomy/recipes-containers/import-docker-cont=
ainers/import-docker-containers.bb
 delete mode 100644 meta-arm-autonomy/recipes-containers/packagegroups/pack=
agegroup-docker-runtime-minimal.bb
 delete mode 100644 meta-arm-autonomy/recipes-core/busybox/busybox/feature_=
tar_long_options.cfg
 delete mode 100644 meta-arm-autonomy/recipes-core/busybox/busybox_%.bbappe=
nd
 delete mode 100644 meta-arm-autonomy/recipes-core/images/arm-autonomy-host=
-image-minimal.bb
 delete mode 100644 meta-arm-autonomy/recipes-core/init-ifupdown/init-ifupd=
own_1.0.bbappend
 delete mode 100644 meta-arm-autonomy/recipes-core/sysvinit/sysvinit-initta=
b_2.%.bbappend
 delete mode 100644 meta-arm-autonomy/recipes-devtools/qemu/qemu-autonomy-h=
ost.inc
 delete mode 100644 meta-arm-autonomy/recipes-devtools/qemu/qemu_%.bbappend
 delete mode 100644 meta-arm-autonomy/recipes-extended/xen-devicetree/files=
/xen.dtsi.in
 delete mode 100644 meta-arm-autonomy/recipes-extended/xen-devicetree/xen-d=
evicetree.bb
 delete mode 100644 meta-arm-autonomy/recipes-extended/xen/xen-4.14/0001-xe=
n-arm-Throw-messages-for-unknown-FP-SIMD-implement.patch
 delete mode 100644 meta-arm-autonomy/recipes-extended/xen/xen-tools-4.14/0=
001-vif-nat-fix-hostname.patch
 delete mode 100644 meta-arm-autonomy/recipes-extended/xen/xen-tools_%.bbap=
pend
 delete mode 100644 meta-arm-autonomy/recipes-extended/xen/xen-tools_4.14.b=
bappend
 delete mode 100644 meta-arm-autonomy/recipes-extended/xen/xen_%.bbappend
 delete mode 100644 meta-arm-autonomy/recipes-extended/xen/xen_4.14.bbappen=
d
 delete mode 100755 meta-arm-autonomy/recipes-extended/xenguest/files/00-vi=
f-xenguest.hook
 delete mode 100755 meta-arm-autonomy/recipes-extended/xenguest/files/00-xe=
nguest-nat-port-forward.hook
 delete mode 100644 meta-arm-autonomy/recipes-extended/xenguest/files/kea-d=
hcp4.conf
 delete mode 100755 meta-arm-autonomy/recipes-extended/xenguest/files/kea-r=
estore-default-config
 delete mode 100644 meta-arm-autonomy/recipes-extended/xenguest/files/kea-s=
ubnet4.json
 delete mode 100644 meta-arm-autonomy/recipes-extended/xenguest/files/logro=
tate-xenguest
 delete mode 100755 meta-arm-autonomy/recipes-extended/xenguest/files/netwo=
rk-bridge.sh.in
 delete mode 100755 meta-arm-autonomy/recipes-extended/xenguest/files/xengu=
est-init
 delete mode 100755 meta-arm-autonomy/recipes-extended/xenguest/files/xengu=
est-manager
 delete mode 100755 meta-arm-autonomy/recipes-extended/xenguest/files/xengu=
est-mkimage
 delete mode 100644 meta-arm-autonomy/recipes-extended/xenguest/files/xengu=
est-network-bridge-dhcp.cfg.in
 delete mode 100755 meta-arm-autonomy/recipes-extended/xenguest/files/xengu=
est-network-bridge.in
 delete mode 100755 meta-arm-autonomy/recipes-extended/xenguest/files/xengu=
est-network-init-post.sh
 delete mode 100644 meta-arm-autonomy/recipes-extended/xenguest/xenguest-ba=
se-image.bb
 delete mode 100644 meta-arm-autonomy/recipes-extended/xenguest/xenguest-ex=
tern-guests.bb
 delete mode 100644 meta-arm-autonomy/recipes-extended/xenguest/xenguest-ma=
nager.bb
 delete mode 100644 meta-arm-autonomy/recipes-extended/xenguest/xenguest-mk=
image.bb
 delete mode 100644 meta-arm-autonomy/recipes-extended/xenguest/xenguest-ne=
twork.bb
 delete mode 100644 meta-arm-autonomy/recipes-extended/xenguest/xenguest-no=
disk-image.bb
 delete mode 100644 meta-arm-autonomy/recipes-kernel/linux/arm-autonomy-kme=
ta/bsp/arm-autonomy/arm64-autonomy-guest-standard.scc
 delete mode 100644 meta-arm-autonomy/recipes-kernel/linux/arm-autonomy-kme=
ta/bsp/arm-autonomy/arm64-autonomy-guest.cfg
 delete mode 100644 meta-arm-autonomy/recipes-kernel/linux/arm-autonomy-kme=
ta/bsp/arm-autonomy/arm64-autonomy-guest.scc
 delete mode 100644 meta-arm-autonomy/recipes-kernel/linux/arm-autonomy-kme=
ta/features/arm-autonomy/docker-minimal.cfg
 delete mode 100644 meta-arm-autonomy/recipes-kernel/linux/arm-autonomy-kme=
ta/features/arm-autonomy/docker-minimal.scc
 delete mode 100644 meta-arm-autonomy/recipes-kernel/linux/arm-autonomy-kme=
ta/features/arm-autonomy/netfilter-extra.cfg
 delete mode 100644 meta-arm-autonomy/recipes-kernel/linux/arm-autonomy-kme=
ta/features/arm-autonomy/xen-common.cfg
 delete mode 100644 meta-arm-autonomy/recipes-kernel/linux/arm-autonomy-kme=
ta/features/arm-autonomy/xen-common.scc
 delete mode 100644 meta-arm-autonomy/recipes-kernel/linux/arm-autonomy-kme=
ta/features/arm-autonomy/xen-guest.cfg
 delete mode 100644 meta-arm-autonomy/recipes-kernel/linux/arm-autonomy-kme=
ta/features/arm-autonomy/xen-guest.scc
 delete mode 100644 meta-arm-autonomy/recipes-kernel/linux/arm-autonomy-kme=
ta/features/arm-autonomy/xen-host-iptables.scc
 delete mode 100644 meta-arm-autonomy/recipes-kernel/linux/arm-autonomy-kme=
ta/features/arm-autonomy/xen-host.cfg
 delete mode 100644 meta-arm-autonomy/recipes-kernel/linux/arm-autonomy-kme=
ta/features/arm-autonomy/xen-host.scc
 delete mode 100644 meta-arm-autonomy/recipes-kernel/linux/files/0001-arm-a=
rm64-xen-Fix-to-convert-percpu-address-to-gfn-c.patch
 delete mode 100644 meta-arm-autonomy/recipes-kernel/linux/files/0001-xen-a=
rm-do-not-setup-the-runstate-info-page-if-kpti-.patch
 delete mode 100644 meta-arm-autonomy/recipes-kernel/linux/linux-%.bbappend
 delete mode 100644 meta-arm-autonomy/recipes-kernel/linux/linux-arm-autono=
my.inc

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 4a2b336..934543a 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -89,7 +89,7 @@ check-layers:
   extends: .setup
   coverage: '/Coverage: \d+/'
   script:
-    - kas shell --update --force-checkout ci/base.yml:ci/meta-arm-autonomy=
.yml:ci/meta-openembedded.yml --command \
+    - kas shell --update --force-checkout ci/base.yml:ci/meta-openembedded=
.yml --command \
       "$CI_PROJECT_DIR/ci/check-layers.py $CI_PROJECT_DIR/ci/check-layers.=
yml $CI_PROJECT_DIR $KAS_WORK_DIR"
=20
 pending-updates:
diff --git a/ci/check-layers.yml b/ci/check-layers.yml
index 2383565..7d2820c 100644
--- a/ci/check-layers.yml
+++ b/ci/check-layers.yml
@@ -3,11 +3,5 @@ layers:
   - meta-arm-bsp
   - meta-arm-toolchain
   - meta-gem5
-  - meta-arm-autonomy
 dependencies:
   - meta-openembedded/meta-oe
-  - meta-openembedded/meta-networking
-  - meta-openembedded/meta-python
-  - meta-openembedded/meta-filesystems
-  - poky/meta-poky
-  - meta-virtualization
diff --git a/ci/meta-arm-autonomy.yml b/ci/meta-arm-autonomy.yml
deleted file mode 100644
index 260750a..0000000
--- a/ci/meta-arm-autonomy.yml
+++ /dev/null
@@ -1,10 +0,0 @@
-header:
-  version: 9
-  includes:
-    - meta-openembedded.yml
-    - meta-virtualization.yml
-
-repos:
-  meta-arm:
-    layers:
-      meta-arm-autonomy:
diff --git a/meta-arm-autonomy/README.md b/meta-arm-autonomy/README.md
index b6b8538..2e02a7f 100644
--- a/meta-arm-autonomy/README.md
+++ b/meta-arm-autonomy/README.md
@@ -1,85 +1,16 @@
 meta-arm-autonomy Yocto Layer
 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
=20
-Introduction
-------------
-This layer provides an hypervisor based solution (currently based on Xen) =
for
-autonomous system. It contains recipes and classes to build host and guest
-images.
-
-To start using this layer, please check the
-[Quick Start Guide](documentation/arm-autonomy-quickstart.md).
-
-Dependencies
-------------
-This layer depends on several other Yocto layers:
-* meta-openembedded (https://git.openembedded.org/meta-openembedded)
-* poky (https://git.yoctoproject.org/poky)
-* meta-virtualization (https://git.yoctoproject.org/meta-virtualization)
-* meta-networking (git://git.openembedded.org/meta-openembedded)
-
-Distribution Features
----------------------
-This layer adds the following Yocto DISTRO_FEATURES:
-
-* arm-autonomy-host: this feature activates functionalities required to bu=
ild
-  an autonomy host system. It has the following effects:
-  - add 'xen' and 'ipv4' to DISTRO_FEATURES.
-  - add xen backend drivers to linux kernel configuration.
-  - To reduce the root filesystem image size the kernel image is not insta=
lled.
-
-* arm-autonomy-guest: this feature activates functionalities to run as gue=
st
-  of an autonomy system. It is doing the following:
-  - add 'ipv4' to DISTRO_FEATURES.
-  - add xen frontend drivers to linux kernel configuration.
-  - add console on hvc0 during init.
-
-Bitbake variables
------------------
-Some recipes and classes in this layer are introducing variables which can=
 be
-modified by the user in local.conf.
-Each recipe introducing such variables has a chapter "Bitbake parameters" =
in
-its documentation.
-
-Those documentation files should be checked for variables:
-- [xen-devicetree](documentation/xen-devicetree.md)
-- [xenguest-manager](documentation/xenguest-manager.md)
-- [xenguest-network](documentation/xenguest-network.md)
-
-BSPs
-----
-This layer adds the following machine:
-
-* arm64-autonomy-guest: This machine creates a minimal BSP suitable to be =
used
-  as an autonomy guest. It is in fact only activating ARM64 architecture a=
nd
-  SMP in the linux kernel and is enabling the DISTRO_FEATURE
-  'arm-autonomy-guest'.
-
-Images
-------
-This layer is adding the following images:
-
-* arm-autonomy-host-image-minimal: This image includes all elements requir=
ed
-  to create a minimal arm-autonomy-host system. This includes xen, and too=
ls to
-  manage xen guests and xenguest images. This image depends on
- 'arm-autonomy-host' distribution feature.
-
-Recipes and classes
--------------------
-This layer adds the following recipes and classes:
-
-* [xen-devicetree](documentation/xen-devicetree.md): This is a recipe to m=
odify
-  a device tree blob to add information required to boot xen and a Dom0 li=
nux.
-
-* [xenguest-mkimage](documentation/xenguest-mkimage.md): This is a tool us=
ed to
-  create and modify images to be used as Xen guests.
+The meta-arm-autonomy layer is being deprecated from master, with bug fixe=
s
+only being applied to the following branches. Additionally, all support an=
d
+maintenance of meta-arm-autonomy will stop as per the schedule below.
=20
-* [xenguest-manager](documentation/xenguest-manager.md): This is a tool us=
ed to
-  create/remove/start/stop xen guest generated using xenguest-mkimage.
+    honister: End-of-life scheduled to June 2022
+    hardknot: End-of-life scheduled to December 2021
+    gatesgarth: End-of-life scheduled to October 2021
+    dunfell: End-of-life scheduled to October 2021
+    master: End-of-life scheduled to October 2021 and code removed
=20
-* [xenguest-network](documentation/xenguest-network.md): This
-  recipe add tools and init scripts to create a bridge connected to the
-  external network on the host and allow guests to be connected to it.
=20
 Contributing
 ------------
@@ -90,4 +21,3 @@ would like to contribute, please contact the maintainers
 Maintainer(s)
 -------------
 * Diego Sueiro <diego.sueiro@arm.com>
-* Bertrand Marquis <bertrand.marquis@arm.com>
diff --git a/meta-arm-autonomy/classes/alternate-kernel.bbclass b/meta-arm-=
autonomy/classes/alternate-kernel.bbclass
deleted file mode 100644
index b25dfc7..0000000
--- a/meta-arm-autonomy/classes/alternate-kernel.bbclass
+++ /dev/null
@@ -1,26 +0,0 @@
-# This class is to be inherited by image recipes that want to build and in=
stall
-# an alternate kernel (set via PREFERRED_PROVIDER_alternate/kernel).
-#
-# It is mandatory to also set the KERNEL_PACKAGE_NAME for the alternate ke=
rnel
-# recipe via KERNEL_PACKAGE_NAME:pn-${PREFERRED_PROVIDER_alternate/kernel}=
 and
-# its value needs to be different from "kernel" since this is the default =
set
-# for PREFERRED_PROVIDER_virtual/kernel.
-#
-# An example of these settings can be found at meta-arm-autonomy/dynamic-l=
ayers/meta-arm-bsp/conf/machine/n1sdp-extra-settings.inc
-#
-# When building and installing an alternate kernel, the kernel-modules pac=
kages
-# for both virtual/kernel and alternate/kernel will be installed.
-
-PREFERRED_PROVIDER_alternate/kernel ??=3D ""
-
-python () {
-    alternate_kernel =3D d.getVar('PREFERRED_PROVIDER_alternate/kernel')
-    if alternate_kernel:
-        alternate_kernel_pkg_name =3D d.getVar('KERNEL_PACKAGE_NAME:pn-%s'=
 % alternate_kernel)
-        if alternate_kernel_pkg_name:
-            d.appendVar('EXTRA_IMAGEDEPENDS', ' ' + alternate_kernel)
-            d.appendVar('IMAGE_INSTALL', ' kernel-modules')
-            d.appendVar('IMAGE_INSTALL', ' ' + alternate_kernel_pkg_name +=
 '-modules')
-        else:
-            raise bb.parse.SkipRecipe("No KERNEL_PACKAGE_NAME:pn-%s set" %=
 alternate_kernel )
-}
diff --git a/meta-arm-autonomy/classes/arm-autonomy-features.bbclass b/meta=
-arm-autonomy/classes/arm-autonomy-features.bbclass
deleted file mode 100644
index 15549d8..0000000
--- a/meta-arm-autonomy/classes/arm-autonomy-features.bbclass
+++ /dev/null
@@ -1,5 +0,0 @@
-# Include arm-autonomy distro config files if the distro features are set
-
-require ${@bb.utils.contains('DISTRO_FEATURES', 'arm-autonomy-host', '${AR=
M_AUTONOMY_DISTRO_CFGDIR}/arm-autonomy-host.inc', '', d)}
-require ${@bb.utils.contains('DISTRO_FEATURES', 'arm-autonomy-guest', '${A=
RM_AUTONOMY_DISTRO_CFGDIR}/arm-autonomy-guest.inc', '', d)}
-
diff --git a/meta-arm-autonomy/classes/docker_extern_containers.bbclass b/m=
eta-arm-autonomy/classes/docker_extern_containers.bbclass
deleted file mode 100644
index 57ac85f..0000000
--- a/meta-arm-autonomy/classes/docker_extern_containers.bbclass
+++ /dev/null
@@ -1,115 +0,0 @@
-# Docker Extern Containers
-#
-# This class allows docker image tarballs to be installed in the rootfs
-#
-# The images can be selected using the variable CONTAINER_IMAGE_FILES whic=
h
-# should contain a space seperated list of absolute paths or yocto urls fo=
r
-# docker images that have been exported using docker export:
-# - https://docs.docker.com/engine/reference/commandline/export/
-#
-# src_uri_parse_var.bbclass is used to parse CONTAINER_IMAGE_FILES
-#
-# There are 4 supported formats for CONTAINER_IMAGE_FILES entries:
-#
-# - http/https url
-#   - CONTAINER_IMAGE_FILES =3D "https://[url]:[port]/alpine.tar;md5sum=3D=
..."
-#
-# - file:// absolute local path from root
-#   - CONTAINER_IMAGE_FILES =3D "file:///containers/alpine2.tar"
-#
-# - file:// path relative to FILESEXTRAPATHS
-#   - CONTAINER_IMAGE_FILES =3D "file://foo/alpine3.tar"
-#     FILESEXTRAPATHS .=3D "/containers:"
-#
-# - plain absolute local path from root
-#   - CONTAINER_IMAGE_FILES =3D "/containers/foo/bar/alpine4.tar"
-#
-# It is not recommended to use other yocto URL types, as they may result i=
n
-# undefined behaviour.
-#
-# A semicolon seperated list of install arguments can follow each image pa=
th:
-# - conname : the name that will be attached when the image is imported
-#             (default: [filename, without extension])
-# - contag  : the tag that will be attached when the image is imported
-#             (default: local)
-# - conkeep : Flag for whether the exported container image file should be
-#             kept once the import has been completed
-#             (default: 0)
-#
-# Any other arguments, for example an md5sum, will be assumed to be fetch
-# arguments, and will be kept when the path is added to the SRC_URI
-#
-# e.g.  CONTAINER_IMAGE_FILES =3D "\
-# https://[url]:[port]/alpine.tar;md5sum=3D[checksum];conkeep=3D1 \
-# file:///containers/alpine2.tar;contag=3Dlatest;conname=3Ddocker2 \
-# file://foo/alpine3.tar \
-# /containers/foo/bar/alpine4.tar;contag=3D1.0;conkeep=3D1 "
-#
-# Resulting Manifest:
-# ARCHIVE     NAME    TAG    KEEP
-# alpine.tar  alpine  local  1
-# alpine2.tar docker2 latest 0
-# alpine3.tar alpine3 local  0
-# alpine4.tar alpine4 1.0    1
-#
-# Other configurable variables:
-# CONTAINERS_INSTALL_DIR  : The folder underneath ${WORKDIR} where the doc=
ker
-#                           images will be stored
-#                           (default: "/usr/share/docker/images")
-# CONTAINERS_MANIFEST     : The name of the manifest file containing image
-#                           parameters, also stored in CONTAINERS_INSTALL_=
DIR
-#                           (default: "containers.manifest")
-# CONTAINERS_TAG_DEFAULT  : Use this to change the value that will be used=
 as
-#                           contag if no value is provided
-#                           (default: "local")
-# CONTAINERS_KEEP_DEFAULT : Use this to change the value that will be used=
 for
-#                           conkeep if no value is provided
-#                           (default: "0")
-#
-
-inherit features_check
-
-REQUIRED_DISTRO_FEATURES =3D "docker"
-
-RDEPENDS:${PN} =3D "packagegroup-docker-runtime-minimal"
-
-CONTAINER_IMAGE_FILES ??=3D ""
-CONTAINERS_INSTALL_DIR ??=3D "${datadir}/docker/images"
-CONTAINERS_MANIFEST ??=3D "containers.manifest"
-CONTAINERS_TAG_DEFAULT ??=3D "local"
-CONTAINERS_KEEP_DEFAULT ??=3D "0"
-
-inherit set_src_uri_from_var
-
-SRC_URI_FROM_VAR_NAME =3D "CONTAINER_IMAGE_FILES"
-# Define installation params
-SRC_URI_FROM_VAR_MANIFEST_PARAMS =3D "conname=3D[basename] \
-contag=3D${CONTAINERS_TAG_DEFAULT} conkeep=3D${CONTAINERS_KEEP_DEFAULT}"
-
-SRC_URI_FROM_VAR_UNPACK_DIR =3D "containers"
-
-# Read manifest and install container images
-do_install() {
-    local archive name tag keep
-
-    if [ -f "${WORKDIR}/${SRC_URI_FROM_VAR_UNPACK_DIR}/manifest" ]; then
-
-        install -d "${D}${CONTAINERS_INSTALL_DIR}"
-        install -m 644 \
-            "${WORKDIR}/${SRC_URI_FROM_VAR_UNPACK_DIR}/manifest" \
-            "${D}${CONTAINERS_INSTALL_DIR}/${CONTAINERS_MANIFEST}"
-
-        while read -r archive name tag keep _; do
-            [ -f "${WORKDIR}/${SRC_URI_FROM_VAR_UNPACK_DIR}/${archive}" ] =
||
-                bbfatal "${archive} does not exist"
-
-            install -m 644 \
-                "${WORKDIR}/${SRC_URI_FROM_VAR_UNPACK_DIR}/${archive}" \
-                "${D}${CONTAINERS_INSTALL_DIR}/${archive}"
-        done < "${D}${CONTAINERS_INSTALL_DIR}/${CONTAINERS_MANIFEST}"
-    fi
-}
-
-do_install[vardeps] +=3D "CONTAINER_IMAGE_FILES"
-
-FILES:${PN} +=3D "${CONTAINERS_INSTALL_DIR}"
diff --git a/meta-arm-autonomy/classes/image_types_xenguest.bbclass b/meta-=
arm-autonomy/classes/image_types_xenguest.bbclass
deleted file mode 100644
index 152658f..0000000
--- a/meta-arm-autonomy/classes/image_types_xenguest.bbclass
+++ /dev/null
@@ -1,169 +0,0 @@
-# Create a xenguest image with kernel and filesystem produced by Yocto
-# This will create a .xenguest file that the xenguest-manager can use.
-
-inherit xenguest_image
-
-# We are creating our guest in a local subdirectory
-# force the value so that we are not impacted if the user is changing it
-XENGUEST_IMAGE_DEPLOY_DIR =3D "${WORKDIR}/tmp-xenguest"
-
-# Name of deployed file (keep standard image name and add .xenguest)
-XENGUEST_IMAGE_DEPLOY ??=3D "${IMAGE_NAME}"
-
-# Add kernel XENGUEST_IMAGE_KERNEL from DEPLOY_DIR_IMAGE to image
-xenguest_image_add_kernel() {
-    srcfile=3D"${1:-}"
-    if [ -z "${srcfile}" ]; then
-        srcfile=3D"${DEPLOY_DIR_IMAGE}/${XENGUEST_IMAGE_KERNEL}"
-    fi
-    call_xenguest_mkimage partial --xen-kernel=3D$srcfile
-}
-
-# Add rootfs file to the image
-xenguest_image_add_rootfs() {
-    call_xenguest_mkimage partial \
-        --disk-add-file=3D${IMGDEPLOYDIR}/${IMAGE_LINK_NAME}.${IMAGE_TYPED=
EP:xenguest}:rootfs.${IMAGE_TYPEDEP:xenguest}
-}
-
-# Pack xenguest image
-xenguest_image_pack() {
-    mkdir -p ${IMGDEPLOYDIR}
-    rm -f ${IMGDEPLOYDIR}/${XENGUEST_IMAGE_DEPLOY}.xenguest
-    call_xenguest_mkimage pack \
-        ${IMGDEPLOYDIR}/${XENGUEST_IMAGE_DEPLOY}.xenguest
-}
-
-#
-# Task finishing the bootimg
-# We need this task to actually create the symlinks
-#
-python do_bootimg_xenguest() {
-    subtasks =3D d.getVarFlag('do_bootimg_xenguest', 'subtasks')
-
-    bb.build.exec_func('xenguest_image_clone', d)
-    if subtasks:
-        for tk in subtasks.split():
-            bb.build.exec_func(tk, d)
-    bb.build.exec_func('xenguest_image_pack', d)
-    bb.build.exec_func('create_symlinks', d)
-}
-# This is used to add sub-tasks to do_bootimg_xenguest
-do_bootimg_xenguest[subtasks] =3D ""
-# Those are required by create_symlinks to find our image
-do_bootimg_xenguest[subimages] =3D "xenguest"
-do_bootimg_xenguest[imgsuffix] =3D "."
-do_bootimg_xenguest[depends] +=3D "xenguest-base-image:do_deploy"
-# Need to have rootfs so all recipes have deployed their content
-do_bootimg_xenguest[depends] +=3D "${PN}:do_rootfs"
-
-# This set in python anonymous after, just set a default value here
-IMAGE_TYPEDEP:xenguest ?=3D "tar"
-
-# We must not be built at rootfs build time because we need the kernel
-IMAGE_TYPES_MASKED +=3D "xenguest"
-IMAGE_TYPES +=3D "xenguest"
-
-XENGUEST_IMAGE_RECIPE =3D "${PN}"
-XENGUEST_IMAGE_VARS +=3D "XENGUEST_IMAGE_RECIPE"
-
-# Merge intermediate env files from all recipes into a single file
-python do_merge_xenguestenv () {
-
-    import re
-
-    # Open final merged file in DEPLOY_DIR_IMAGE for writing, or create
-    outdir =3D d.getVar('DEPLOY_DIR_IMAGE')
-    with open(os.path.join(outdir,'xenguest.env'), 'w') as merged_file:
-
-        # Adds vars from xenguest_image to list
-        merged_env =3D []
-        xenguest_vars =3D d.getVar('XENGUEST_IMAGE_VARS')
-        for var in xenguest_vars.split():
-            value =3D d.getVar(var)
-            if value:
-                merged_env.append(var + "=3D" + " ".join(value.split()) + =
"\n")
-
-        # Resolve dependencies for this task to find names of intermediate
-        # .xenguestenv files
-        taskdepdata =3D d.getVar('BB_TASKDEPDATA')
-        task_mc =3D d.getVar('BB_CURRENT_MC')
-        task_file =3D d.getVar('FILE')
-
-        # See runqueue.py function build_taskdepdata
-        DEPS_INDEX =3D 3
-
-        depdata_key =3D task_file + ":do_merge_xenguestenv"
-
-        # If in a multiconfig, need to add that to the key
-        if task_mc !=3D "default":
-            depdata_key =3D "mc:" + task_mc + ":" + depdata_key
-
-        # Retrieve filename using regex
-        get_filename =3D re.compile(r'/([^/]+\.bb):do_deploy_xenguestenv$'=
)
-        env_dir =3D d.getVar('XENGUEST_ENV_STAGING_DIR')
-
-        for task_dep in taskdepdata[depdata_key][DEPS_INDEX]:
-            if task_dep.endswith(":do_deploy_xenguestenv"):
-                filename =3D re.search(get_filename, task_dep).group(1) + =
".xenguestenv"
-                bb.note("Merging: " + filename)
-                try:
-                    with open(env_dir + "/" + filename, 'r') as f:
-                        # Eliminate duplicates
-                        merged_env =3D list(set(merged_env + f.readlines()=
))
-                except (FileNotFoundError, IOError):
-                    bb.note(" " + filename + " has no extra vars")
-
-        # Sort Alphabetically and write
-        merged_env.sort()
-        merged_file.write("".join(merged_env))
-}
-do_merge_xenguestenv[dirs] =3D "${DEPLOY_DIR_IMAGE}"
-do_merge_xenguestenv[vardeps] +=3D "${XENGUEST_IMAGE_VARS}"
-do_merge_xenguestenv[vardepsexclude] +=3D "BB_TASKDEPDATA"
-do_merge_xenguestenv[recrdeptask] +=3D "do_deploy_xenguestenv"
-
-addtask merge_xenguestenv before do_populate_lic_deploy after do_image_com=
plete
-
-python __anonymous() {
-    # Do not do anything if we are not in the want FSTYPES
-    if bb.utils.contains_any('IMAGE_FSTYPES', 'xenguest', '1', '0', d):
-
-        # Check the coherency of the configuration
-        rootfs_needed =3D False
-        rootfs_file =3D ''
-        kernel_needed =3D False
-
-        rootfs_file =3D xenguest_image_rootfs_file(d)
-        if rootfs_file:
-            rootfs_needed =3D True
-
-        if d.getVar('XENGUEST_IMAGE_KERNEL') and not d.getVar('INITRAMFS_I=
MAGE'):
-            # If INITRAMFS_IMAGE is set, even if INITRAMFS_IMAGE_BUNDLE is=
 not
-            # set to 1 to bundle the initramfs with the kernel, kernel.bbc=
lass
-            # is setting a dependency on ${PN}:do_image_complete. We canno=
t
-            # in this case depend on do_deploy as it would create a circul=
ar
-            # dependency:
-            # do_image_complete would depend on kernel:do_deploy which wou=
ld
-            # depend on ${PN}:do_image_complete
-            # In the case INITRAMFS_IMAGE_BUNDLE =3D 1, the kernel-xengues=
t class
-            # will handle the creation of a xenguest image with the kernel=
.
-            # In the other case the kernel can be added manually to the im=
age.
-            kernel_needed =3D True
-
-        bb.build.addtask('do_bootimg_xenguest', 'do_image_complete', None,=
 d)
-
-        if rootfs_needed:
-            # tell do_bootimg_xenguest to call add_rootfs
-            d.appendVarFlag('do_bootimg_xenguest', 'subtasks', ' xenguest_=
image_add_rootfs')
-            # do_bootimg_xenguest will need the tar file
-            d.appendVarFlag('do_bootimg_xenguest', 'depends', ' %s:do_imag=
e_tar' % (d.getVar('PN')))
-            # set our TYPEDEP to the proper compression
-            d.setVar('IMAGE_TYPEDEP:xenguest', 'tar' + (rootfs_file.split(=
'.tar', 1)[1] or ''))
-
-        if kernel_needed:
-            # Tell do_bootimg_xenguest to call xenguest_image_add_kernel
-            d.appendVarFlag('do_bootimg_xenguest', 'subtasks', ' xenguest_=
image_add_kernel')
-            # we will need kernel do_deploy
-            d.appendVarFlag('do_bootimg_xenguest', 'depends', ' virtual/ke=
rnel:do_deploy')
-}
-
diff --git a/meta-arm-autonomy/classes/kernel-xenguest.bbclass b/meta-arm-a=
utonomy/classes/kernel-xenguest.bbclass
deleted file mode 100644
index 59eb9d7..0000000
--- a/meta-arm-autonomy/classes/kernel-xenguest.bbclass
+++ /dev/null
@@ -1,37 +0,0 @@
-# Create a xenguest image containing the kernel with initramfs when
-# initramfs is activated
-# This is done using kernel-fitimage as model
-# To activate this, kernel-xenguest must be added to KERNEL_CLASSES
-
-# Add a variable name to XENGUEST_IMAGE_VARS_EXTRA if you want it to
-# appear in xenguest.env when the image is deployed
-
-inherit xenguest_image
-
-# use a local copy to pack all together
-XENGUEST_IMAGE_DEPLOY_DIR =3D "${WORKDIR}/tmp-xenguest"
-
-python __anonymous () {
-    # only if xenguest image type is present
-    if bb.utils.contains('IMAGE_FSTYPES', 'xenguest', '1', '0', d):
-        # only if initramfs bundle is activated
-        if d.getVar('INITRAMFS_IMAGE') and d.getVar('INITRAMFS_IMAGE_BUNDL=
E') =3D=3D "1":
-            if not bb.utils.contains('KERNEL_IMAGETYPES', 'Image', '1', '0=
', d):
-                bb.fatal("xenguest image type with initramfs require Image=
 kernel image type")
-            bb.build.addtask('do_assemble_xenguest_initramfs', 'do_deploy'=
, 'do_bundle_initramfs', d)
-}
-
-do_assemble_xenguest_initramfs() {
-    xenguest_image_clone
-    call_xenguest_mkimage partial --xen-kernel=3D${B}/${KERNEL_OUTPUT_DIR}=
/Image.initramfs
-    rm -f ${B}/${KERNEL_OUTPUT_DIR}/Image-initramfs.xenguest
-    call_xenguest_mkimage pack ${B}/${KERNEL_OUTPUT_DIR}/Image-initramfs.x=
enguest
-}
-do_assemble_xenguest_initramfs[depends] +=3D "${INITRAMFS_IMAGE}:do_merge_=
xenguestenv"
-
-kernel_do_deploy:append() {
-    if [ -f "${B}/${KERNEL_OUTPUT_DIR}/Image-initramfs.xenguest" ]; then
-        install -m 0644 ${B}/${KERNEL_OUTPUT_DIR}/Image-initramfs.xenguest=
 "$deployDir/Image-${INITRAMFS_NAME}.xenguest"
-        ln -snf Image-${INITRAMFS_NAME}.xenguest $deployDir/Image-${INITRA=
MFS_LINK_NAME}.xenguest
-    fi
-}
diff --git a/meta-arm-autonomy/classes/set_src_uri_from_var.bbclass b/meta-=
arm-autonomy/classes/set_src_uri_from_var.bbclass
deleted file mode 100644
index b2d8aec..0000000
--- a/meta-arm-autonomy/classes/set_src_uri_from_var.bbclass
+++ /dev/null
@@ -1,224 +0,0 @@
-# Set SRC_URI from Variable
-
-# This class parses a variable named in SRC_URI_FROM_VAR_NAME for entries =
that
-# should be added to the SRC_URI
-#
-# There are 4 supported formats for entries:
-#
-# - http/https url
-#   - Note that a checksum (md5sum or sha256sum) must be provided for http=
(s)
-#
-# - file:// absolute local path from root
-#   - In this case the filename will be added to SRC_URI and the path from=
 '/'
-#   added to FILESEXTRAPATHS
-#
-# - file:// path relative to FILESEXTRAPATHS
-#   - In this case the filename will be added to SRC_URI and the preceding=
 path
-#   added to FILESOVERRIDES, so that the full path to the file will
-#   be available in FILESPATH when it is generated by combining
-#   FILESEXTRAPATHS and FILESOVERRIDES.
-#
-# - plain absolute local path from root
-#   - This will be treated the same as an file:// path from root. Plain pa=
ths
-#   must be absolute, and cannot be relative to FILESEXTRAPATHS
-#
-# It is not recommended to use other yocto URL types, as they may result i=
n
-# undefined behaviour.
-#
-# These entries will be added to the SRC_URI so that the yocto fetcher can
-# unpack a copy into ${WORKDIR}/${SRC_URI_FROM_VAR_UNPACK_DIR}
-#
-#
-# A list of arguments can follow each entry in the input variable, seperat=
ed
-# by semi-colons (;). Arguments may be FETCH arguments or MANIFEST argumen=
ts.
-#
-# FETCH arguments will be appended to the entry in SRC_URI, for example
-# "downloadfilename" to specify the filename used when storing a
-# downloaded file.
-# Each SRC_URI entry will automatically have the arguments
-# "unpack=3D0;subdir=3D${SRC_URI_FROM_VAR_UNPACK_DIR}" added to them, so d=
o not
-# attempt to set these options.
-#
-# MANIFEST arguments are defined in the variable
-# SRC_URI_FROM_VAR_MANIFEST_PARAMS which should be a space seperated list =
of
-# names, each optionally followed by an equals sign (=3D) and a default va=
lue.
-#
-# The values provided for the manifest arguments will be written to the ma=
nifest
-# file in ${WORKDIR}/${SRC_URI_FROM_VAR_UNPACK_DIR} as columns, in the sam=
e
-# order as they appear in SRC_URI_FROM_VAR_MANIFEST_PARAMS.
-#
-# For entries that do not provide a value for a manifest argument, the def=
ault
-# value will be used if possible.
-# If no default is availale, omitting the parameter on any item will cause
-# an error.
-#
-# "[basename]" is a special case default that will set the value to
-# the filename without the path or file extension.
-#
-# e.g.
-# SRC_URI_FROM_VAR_MANIFEST_PARAMS=3D"conname=3D[basename] contag=3Dlocal =
conkeep"
-#
-# Any arguments that follow an entry in SRC_URI_FROM_VAR_NAME, that are no=
t
-# named in SRC_URI_FROM_VAR_MANIFEST_PARAMS are assumed to be FETCH argume=
nts,
-# so are added to the corresponding entry in the SRC_URI.
-
-SRC_URI_FROM_VAR_NAME ??=3D ""
-SRC_URI_FROM_VAR_MANIFEST_PARAMS ??=3D ""
-SRC_URI_FROM_VAR_UNPACK_DIR ??=3D "items"
-
-python __anonymous() {
-
-    parse_var =3D d.getVar('SRC_URI_FROM_VAR_NAME')
-
-    if not parse_var:
-        return
-
-    parse_var_items =3D d.getVar(parse_var)
-
-    if parse_var_items:
-        for item in parse_var_items.split(' '):
-            if not item:
-                continue
-
-            if item.startswith('/'):
-                # If not a Yocto URL, must be an absolute path
-                yocto_url =3D "file://" + item
-            else:
-                # Otherwise assume valid Yocto URL.
-                # Error case is caught later
-                yocto_url =3D item
-
-            fetcher =3D host =3D path =3D parm =3D None
-            try:
-                # Attempt to parse a Yocto URL
-                fetcher,host,path,_,_,parm =3D bb.fetch.decodeurl(yocto_ur=
l)
-            except:
-                # Something invalid is in the variable!
-                raise bb.parse.SkipRecipe(parse_var + \
-                                          " contains an invalid entry:\n'"=
 + \
-                                          item + "'")
-
-            # This var is space seperated list of parameter names,
-            # with optional default value following an equals sign
-            # (name=3Ddefault)
-            item_params_str =3D d.getVar('SRC_URI_FROM_VAR_MANIFEST_PARAMS=
')
-
-            # remove directories from path
-            filename =3D os.path.basename(path)
-
-            if "downloadfilename" in parm:
-                filename =3D parm["downloadfilename"]
-
-            item_manifest_args =3D {"filename": filename}
-
-            if item_params_str:
-                # required manifest arguments have been provided
-
-                # If no default is given add "=3D" for map parsing
-                item_params_list =3D [ arg + "=3D" if '=3D' not in arg
-                                     else arg
-                                     for arg in item_params_str.split(' ')
-                                   ]
-
-                # Generate key value pairs of argument names and
-                # default values
-                item_params_map =3D dict( (name.strip(), val.strip())
-                                        for name, val in (arg.split('=3D')
-                                        for arg in item_params_list)
-                                      )
-
-                for argname in item_params_map:
-                    # Iterate over required manifest arguments
-
-                    argvalue =3D parm.pop(argname, None)
-                    if argvalue:
-                        # a value has been provided for this item
-                        item_manifest_args[argname] =3D argvalue
-
-                    else:
-                        # No value provided, process default value
-                        default =3D item_params_map[argname]
-                        if default:
-                            # A default value is provided
-                            if default =3D=3D "[basename]":
-                                # use the filename without extension
-                                default =3D os.path.splitext(filename)[0]
-
-                            # store default value in dict
-                            item_manifest_args[argname] =3D default
-
-                        else:
-                            # No default provided
-                            raise bb.fatal(parse_var + \
-                              " entry is missing a required parameter '" +=
 \
-                              argname + "':\n'" + item + "'")
-
-            # Write value to var flags to ensure data structure is preserv=
ed
-            # Each entry of parse_var will have a varflag  where the value
-            # is a dictionary of argument names and values
-            d.setVarFlags(parse_var, {item: item_manifest_args})
-
-            src_uri_entry_suffix =3D ';'
-
-            # HTTP(S) fetcher must provide a checksum
-            if fetcher.startswith('http') and not \
-            ( 'md5sum' in parm or 'sha256sum' in parm ):
-                # Ensure http/https fetchers get a checksum
-                raise bb.parse.SkipRecipe(parse_var + \
-                                          " entry is missing a checksum:\n=
'" + \
-                                          item + "'")
-
-            # add remaining fetch parameters including checksum
-            for arg in parm:
-                src_uri_entry_suffix +=3D ";" + arg + "=3D" + parm[arg]
-
-            # Add default and extra parameters to SRC_URI entry
-            src_uri_entry_suffix +=3D ';unpack=3D0;subdir=3D' + \
-                                    d.getVar('SRC_URI_FROM_VAR_UNPACK_DIR'=
)
-
-            if fetcher =3D=3D 'file':
-                # Prevent local fetcher from re-creating dir structure
-                filedir =3D os.path.split(path)[0]
-                if filedir.startswith('/'):
-                    # Path is from the root
-                    d.appendVar('FILESEXTRAPATHS', filedir + ':')
-                else:
-                    # Path is relative to FILESEXTRAPATHS
-                    d.appendVar('FILESOVERRIDES', ':' + filedir)
-
-                # Add filename without path to SRC_URI
-                d.appendVar('SRC_URI', ' file://' + \
-                                        filename + src_uri_entry_suffix)
-            else:
-                # Add full entry to SRC_URI
-                d.appendVar('SRC_URI', ' ' + fetcher + \
-                            "://" + host + path + src_uri_entry_suffix)
-}
-
-python generate_manifest() {
-
-    parse_var =3D d.getVar('SRC_URI_FROM_VAR_NAME')
-
-    if not parse_var:
-        return
-
-    target_dir =3D os.path.join(d.getVar('WORKDIR'),
-                              d.getVar('SRC_URI_FROM_VAR_UNPACK_DIR'))
-
-    # Write a manifest file containing the parameters so SRC_URI
-    # doesn't need to be parsed by do_install
-    with open (target_dir + "/manifest", 'w') as manifest_file:
-        manifest_args =3D d.getVarFlags(parse_var)
-
-        parse_var_items =3D d.getVar(parse_var)
-
-        if parse_var_items:
-            for item in parse_var_items.split():
-
-                manifest_file.write(" ".join(manifest_args[item].values())=
+"\n")
-
-}
-
-do_unpack[cleandirs] +=3D "${WORKDIR}/${SRC_URI_FROM_VAR_UNPACK_DIR}"
-do_unpack[postfuncs] +=3D "generate_manifest"
-do_unpack[vardeps] +=3D "${SRC_URI_FROM_VAR_NAME}"
diff --git a/meta-arm-autonomy/classes/xenguest_image.bbclass b/meta-arm-au=
tonomy/classes/xenguest_image.bbclass
deleted file mode 100644
index 8cab845..0000000
--- a/meta-arm-autonomy/classes/xenguest_image.bbclass
+++ /dev/null
@@ -1,251 +0,0 @@
-# This class must be used to create, extend or pack a xenguest image.
-# It is using xenguest-mkimage tool to do operations
-
-DEPENDS +=3D "xenguest-mkimage-native"
-
-#
-# Xenguest image parameters
-# All the following parameters can be modified in local.conf or on recipes
-# inheriting this class
-#
-
-# Guest memory size in MB
-XENGUEST_IMAGE_MEMORY_SIZE ??=3D "512"
-
-# Guest number of vcpus
-XENGUEST_IMAGE_NUM_VCPUS ??=3D "1"
-
-# Guest auto boot during init, set to 1 to have guest started during init =
or
-# to 0 if the guest should not be auto started
-XENGUEST_IMAGE_AUTOBOOT ??=3D "1"
-
-# Partition containing the root file system
-# Xen will actually add root=3D${XENGUEST_IMAGE_ROOT} to your guest kernel
-# command line
-# You can let this empty if the root filesystem is specified in an other w=
ay
-# and have root=3D option added to the command line for example or if you =
don't
-# need a root filesystem mounted for your guest (initrd for example)
-XENGUEST_IMAGE_ROOT ??=3D "/dev/xvda1"
-
-# Guest kernel command line arguments
-XENGUEST_IMAGE_CMDLINE ??=3D "earlyprintk=3Dxenboot console=3Dhvc0 rw"
-
-# Extra commands to add to xenguest_image when creating the image
-XENGUEST_IMAGE_EXTRA_CMD ??=3D ""
-
-# Kernel binary
-# This value is used by the xenguest image type but is declared here to ha=
ve
-# all variables in the same place
-# If this value is empty no kernel will be added to the image
-XENGUEST_IMAGE_KERNEL ??=3D "Image"
-
-# Size of the disk to create (if 0 no disk will be created and rootfs will=
 not
-# be included in the xenguest image)
-XENGUEST_IMAGE_DISK_SIZE ??=3D "${@ '4' if not d.getVar('INITRAMFS_IMAGE')=
 else '0'}"
-
-# set empty partition to be used by xenguest-manager for this image
-XENGUEST_IMAGE_DISK_DEVICE ??=3D ""
-
-#
-# XENGUEST_IMAGE_DISK_PARTITIONS is used to describe the partitions to set=
up
-# and their content.
-# It must be set to a space separated list of entries with each entry havi=
ng
-# the format num:sz:[fs]:[file] where:
-# - num is a partition number
-# - sz is the partition size in MB or GB(default), e.g 1000M or 1[G]
-# - fs is optional filesystem to use for the partition
-# - file is optionally pointing to a file to use as content of the partiti=
on
-#   Please check image_types_xenguest.bbclass for rootfs handling of files
-#
-# Default value creates a partition 1 using the full disk, formated with e=
xt4
-# and containing the root filesystem produced by Yocto
-XENGUEST_IMAGE_DISK_PARTITIONS ??=3D "1:${XENGUEST_IMAGE_DISK_SIZE}:ext4:r=
ootfs.tar.gz"
-
-# XENGUEST_IMAGE_NETWORK_TYPE can be set to "bridge", "nat" or "none".
-# The "bridge" type will share the physical eth interface from dom0 with t=
he
-# domU. This will allow the domU to have access to the external network.
-# The "nat" type will setup a virtual network between dom0 and domU and al=
so
-# configure and run the kea dhcp4 server on dom0 to serve the domU.
-# The "none" type will not affect any networking setting between on dom0 a=
nd
-# domU.
-XENGUEST_IMAGE_NETWORK_TYPE ??=3D "bridge"
-
-# Sub-directory in wich the guest is created. This is create in deploy as =
a
-# subdirectory and must be coherent between all components using this clas=
s so
-# it must only be modified from local.conf if needed
-XENGUEST_IMAGE_DEPLOY_SUBDIR ?=3D "xenguest"
-
-# Directory in which the xenguest should be deployed
-# a sub-directory named ${XENGUEST_IMAGE_DEPLOY_SUBDIR} will be created th=
ere.
-# This should be set to:
-# - ${DEPLOYDIR} (default) if creating or extending the xenguest for a nor=
mal
-#   recipe.
-# - something in ${WORKDIR} if you need to clone and manipulate an image
-XENGUEST_IMAGE_DEPLOY_DIR ??=3D "${DEPLOYDIR}"
-
-# These vars are used by image_types_xenguest.bbclass to generate the
-# xenguest.env file. In a recipe that inherits this class and extra variab=
les
-# that should be included in xenguest.env need to be added to
-# XENGUEST_IMAGE_VARS_EXTRA
-XENGUEST_IMAGE_VARS ?=3D "\
- MACHINE DISTRO DISTRO_VERSION DISTRO_FEATURES TUNE_FEATURES TARGET_FPU \
- IMAGE_FEATURES INITRAMFS_IMAGE_BUNDLE INITRAMFS_IMAGE \
- XENGUEST_IMAGE_MEMORY_SIZE XENGUEST_IMAGE_NUM_VCPUS XENGUEST_IMAGE_AUTOBO=
OT \
- XENGUEST_IMAGE_ROOT XENGUEST_IMAGE_CMDLINE XENGUEST_IMAGE_EXTRA_CMD \
- XENGUEST_IMAGE_KERNEL XENGUEST_IMAGE_DISK_SIZE XENGUEST_IMAGE_DISK_DEVICE=
 \
- XENGUEST_IMAGE_DISK_PARTITIONS XENGUEST_IMAGE_NETWORK_TYPE"
-
-#
-# Wrapper to call xenguest-mkimage
-# It is using XENGUEST_IMAGE_DEPLOY_DIR and XENGUEST_IMAGE_DEPLOY_SUBDIR
-# to find the image to operate on
-#
-# Usage: call_xenguest_mkimage [operation] [args]
-call_xenguest_mkimage() {
-    local cmd=3D"${1}"
-    local img=3D"${XENGUEST_IMAGE_DEPLOY_DIR}/${XENGUEST_IMAGE_DEPLOY_SUBD=
IR}"
-    shift
-
-    echo "xenguest-mkimage $cmd $img $@"
-    xenguest-mkimage $cmd $img $@
-}
-
-#
-# Create an initial xenguest image.
-# This is a task which must be added in a recipe inheriting deploy
-# It is using XENGUEST_IMAGE_MEMORY_SIZE, XENGUEST_IMAGE_NUM_VCPUS,
-#  XENGUEST_IMAGE_AUTOBOOT, XENGUEST_IMAGE_ROOT, XENGUEST_IMAGE_EXTRA_CMD,
-#  XENGUEST_IMAGE_CMDLINE, XENGUEST_IMAGE_DISK_SIZE and
-#  XENGUEST_IMAGE_DISK_PARTITIONS to customize the initial guest
-#
-xenguest_image_create() {
-    if [ -z "${XENGUEST_IMAGE_DEPLOY_DIR}" -o \
-        -z "${XENGUEST_IMAGE_DEPLOY_SUBDIR}" ]; then
-        die "Configuration error: XENGUEST_IMAGE_DEPLOY_DIR or XENGUEST_IM=
AGE_DEPLOY_SUBDIR is empty"
-    fi
-
-    rm -rf ${XENGUEST_IMAGE_DEPLOY_DIR}/${XENGUEST_IMAGE_DEPLOY_SUBDIR}
-
-    mkdir -p ${XENGUEST_IMAGE_DEPLOY_DIR}/${XENGUEST_IMAGE_DEPLOY_SUBDIR}
-
-    # Create the image
-    call_xenguest_mkimage create --xen-memory=3D${XENGUEST_IMAGE_MEMORY_SI=
ZE} \
-        --xen-vcpus=3D${XENGUEST_IMAGE_NUM_VCPUS} \
-        --xen-root=3D${XENGUEST_IMAGE_ROOT} \
-        ${XENGUEST_IMAGE_EXTRA_CMD}
-
-    # add command line
-    if [ -n "${XENGUEST_IMAGE_CMDLINE}" ]; then
-        call_xenguest_mkimage update --xen-clean-extra
-        for arg in ${XENGUEST_IMAGE_CMDLINE}; do
-            call_xenguest_mkimage update --xen-extra=3D$arg
-        done
-    fi
-
-    # create disk if needed
-    disksize=3D"${XENGUEST_IMAGE_DISK_SIZE}"
-    case ${disksize:=3D0} in
-        0|0M|0G)
-            ;;
-        *)
-            # setup disk size
-            call_xenguest_mkimage update --disk-reset-config --disk-size=
=3D$disksize
-
-            diskparts=3D"${XENGUEST_IMAGE_DISK_PARTITIONS}"
-            if [ -n "$diskparts" ]; then
-                for arg in $diskparts; do
-                    call_xenguest_mkimage update --disk-add-part=3D$arg
-                done
-            fi
-            diskdevice=3D"${XENGUEST_IMAGE_DISK_DEVICE}"
-            if [ -n "$diskdevice" ]; then
-                call_xenguest_mkimage update --disk-device=3D"${diskdevice=
}"
-            fi
-
-            ;;
-    esac
-
-
-    if [ "${XENGUEST_IMAGE_AUTOBOOT}" =3D "1" ]; then
-        call_xenguest_mkimage update --set-param=3DGUEST_AUTOBOOT=3D1
-    else
-        call_xenguest_mkimage update --set-param=3DGUEST_AUTOBOOT=3D0
-    fi
-
-    if [ -n "${XENGUEST_IMAGE_NETWORK_TYPE}" ]; then
-        call_xenguest_mkimage update --set-param=3DXENGUEST_NETWORK_TYPE=
=3D"${XENGUEST_IMAGE_NETWORK_TYPE}"
-    else
-        call_xenguest_mkimage update --set-param=3DXENGUEST_NETWORK_TYPE=
=3D"none"
-    fi
-}
-
-XENGUEST_ENV_STAGING_DIR ??=3D "${STAGING_DIR}/${MACHINE}/xenguestenv"
-
-# Create an intermediary file containing all variables used to by a
-# particular recipe that inherits this class
-
-# File will contain the values of all variables listed in:
-#   XENGUEST_IMAGE_VARS_EXTRA
-python do_deploy_xenguestenv () {
-    xenguest_vars =3D d.getVar('XENGUEST_IMAGE_VARS_EXTRA')
-    if not xenguest_vars:
-        return
-
-    outdir =3D d.getVar('XENGUEST_ENV_STAGING_DIR')
-
-    # Writes file to tmp/sysroots/${MACHINE}/xenguestenv/ by default
-    filename =3D os.path.basename(d.getVar('FILE')) + '.xenguestenv'
-    with open(os.path.join(outdir, filename), 'w') as envf:
-        for var in xenguest_vars.split():
-            value =3D d.getVar(var)
-            if value:
-                # Write value only if set
-                envf.write('%s=3D"%s"\n' % (var, " ".join(value.split())))
-        envf.close()
-}
-
-# Since the intermediary file is deleted by do_merge_xenguestenv it
-# must be re-created every time
-do_deploy_xenguestenv[vardeps] +=3D "${XENGUEST_IMAGE_VARS_EXTRA}"
-do_deploy_xenguestenv[dirs] =3D "${XENGUEST_ENV_STAGING_DIR}"
-
-addtask deploy_xenguestenv before do_populate_sysroot
-
-# Clone the current xenguest from deploy to manipulate it locally
-# This is required if you need to change things before packing an image
-# To set the local directory where to clone you must set
-# XENGUEST_IMAGE_DEPLOY_DIR if you don't want to use do_deploy to modify t=
he
-# image
-#
-xenguest_image_clone() {
-    if [ -z "${XENGUEST_IMAGE_DEPLOY_DIR}" -o \
-        -z "${XENGUEST_IMAGE_DEPLOY_SUBDIR}" ]; then
-        die "Configuration error: XENGUEST_IMAGE_DEPLOY_DIR or XENGUEST_IM=
AGE_DEPLOY_SUBDIR is empty"
-    fi
-
-    if [ ! -f ${DEPLOY_DIR_IMAGE}/${XENGUEST_IMAGE_DEPLOY_SUBDIR}/guest.cf=
g ]; then
-        die "xenguest_image: ${DEPLOY_DIR_IMAGE}/${XENGUEST_IMAGE_DEPLOY_S=
UBDIR} does not contain a valid guest"
-    fi
-
-    rm -rf ${XENGUEST_IMAGE_DEPLOY_DIR}/${XENGUEST_IMAGE_DEPLOY_SUBDIR}
-    mkdir -p ${XENGUEST_IMAGE_DEPLOY_DIR}
-    cp -rf ${DEPLOY_DIR_IMAGE}/${XENGUEST_IMAGE_DEPLOY_SUBDIR} \
-        ${XENGUEST_IMAGE_DEPLOY_DIR}/${XENGUEST_IMAGE_DEPLOY_SUBDIR}
-}
-
-# Helper function to retrieve rootfs file if present in one partition
-# This can return an empty string or rootfs.tar[.COMP]
-def xenguest_image_rootfs_file(d):
-    disksize =3D d.getVar('XENGUEST_IMAGE_DISK_SIZE')
-    # if disksize is 0, we don't create anything
-    if not disksize or disksize =3D=3D '0':
-        return ""
-    # Find first partition with file=3Drootfs.tar*
-    partlist =3D d.getVar('XENGUEST_IMAGE_DISK_PARTITIONS')
-    if partlist:
-        for partdesc in partlist.split():
-            partelems =3D partdesc.split(':', 3)
-            if partelems[3]:
-                if partelems[3].startswith('rootfs.tar'):
-                    return partelems[3]
-    return ""
diff --git a/meta-arm-autonomy/classes/xenguest_image_extra.bbclass b/meta-=
arm-autonomy/classes/xenguest_image_extra.bbclass
deleted file mode 100644
index a2c2dcf..0000000
--- a/meta-arm-autonomy/classes/xenguest_image_extra.bbclass
+++ /dev/null
@@ -1,123 +0,0 @@
-# This class must be used to extend the xenguest image
-# It provides variables to add init scripts, a dtb, xen files or disk file=
s.
-#
-# The class is extending deploy function so you recipe must inherit deploy=
 and
-# have a do_deploy function (even if it is empty)
-
-# Add a variable name to XENGUEST_IMAGE_VARS_EXTRA if you want it to
-# appear in xenguest.env when the image is deployed
-
-# Use standard xenguest_image
-inherit xenguest_image
-
-# Add a DTB file for the guest
-# Only one file should be added, if this is set multiple times or in sever=
al
-# recipes, the last recipe setting it will prevail.
-XENGUEST_EXTRA_DTB ??=3D ""
-
-# Add a ramdisk file for the guest
-# Only one file should be added, if this is set multiple times or in sever=
al
-# recipes, the last recipe setting it will prevail.
-XENGUEST_EXTRA_RAMDISK ??=3D ""
-
-# Append something to the guest xen configuration
-# All files here will be merged together in the final xen configuration
-# This can contain several files or be used in several recipes
-XENGUEST_EXTRA_XENCONFIG ??=3D ""
-
-# Add a xenguest init, init-pre or init-post script
-XENGUEST_EXTRA_INIT_PRE ??=3D ""
-XENGUEST_EXTRA_INIT ??=3D ""
-XENGUEST_EXTRA_INIT_POST ??=3D ""
-
-# Add xenguest files, (to be used in extra xen config for example)
-# several files may be added, space separated, the path will be kept on th=
e
-# generated xenguest image (if dir1/file1 is added, it can be used as
-# dir1/file1 file in the xen configuration).
-XENGUEST_EXTRA_FILES ??=3D ""
-
-# Add xenguest disk files (to be used as disk partition content)
-# several files may be added, space separated, the path will be kept on th=
e
-# generated xenguest image (if dir1/file1 is added, it can be used as
-# dir1/file1 file in the disk content parameters).
-XENGUEST_EXTRA_DISK_FILES ??=3D ""
-
-# Extra vars to be written to xenguest.env
-XENGUEST_IMAGE_VARS_EXTRA +=3D "\
- XENGUEST_EXTRA_DTB XENGUEST_EXTRA_RAMDISK XENGUEST_EXTRA_XENCONFIG \
- XENGUEST_EXTRA_INIT_PRE XENGUEST_EXTRA_INIT XENGUEST_EXTRA_INIT_POST \
- XENGUEST_EXTRA_FILES XENGUEST_EXTRA_DISK_FILES"
-
-do_deploy:append() {
-    if [ -z "${XENGUEST_IMAGE_DEPLOY_DIR}" -o \
-        -z "${XENGUEST_IMAGE_DEPLOY_SUBDIR}" ]; then
-        die "Configuration error: XENGUEST_IMAGE_DEPLOY_DIR or XENGUEST_IM=
AGE_DEPLOY_SUBDIR is empty"
-    fi
-    rm -rf ${XENGUEST_IMAGE_DEPLOY_DIR}/${XENGUEST_IMAGE_DEPLOY_SUBDIR}
-    mkdir -p ${XENGUEST_IMAGE_DEPLOY_DIR}/${XENGUEST_IMAGE_DEPLOY_SUBDIR}
-
-    if [ -n "${XENGUEST_EXTRA_DTB}" ]; then
-        if [ ! -f ${XENGUEST_EXTRA_DTB} ]; then
-            die "xenguest_image: DTB file ${XENGUEST_EXTRA_DTB} does not e=
xist"
-        fi
-        call_xenguest_mkimage partial --xen-device-tree=3D${XENGUEST_EXTRA=
_DTB}
-    fi
-
-    if [ -n "${XENGUEST_EXTRA_RAMDISK}" ]; then
-        if [ ! -f ${XENGUEST_EXTRA_RAMDISK} ]; then
-            die "xenguest_image: DTB file ${XENGUEST_EXTRA_RAMDISK} does n=
ot exist"
-        fi
-        call_xenguest_mkimage partial --xen-ramdisk=3D${XENGUEST_EXTRA_RAM=
DISK}
-    fi
-
-    if [ -n "${XENGUEST_EXTRA_XENCONFIG}" ]; then
-        for f in ${XENGUEST_EXTRA_XENCONFIG}; do
-            if [ ! -f $f ]; then
-                die "xenguest_image: Xen config $f does not exist"
-            fi
-            call_xenguest_mkimage partial --xen-append=3D$f
-        done
-    fi
-
-    if [ -n "${XENGUEST_EXTRA_INIT_PRE}" ]; then
-        if [ ! -f ${XENGUEST_EXTRA_INIT_PRE} ]; then
-            die "xenguest_image: Init script ${XENGUEST_EXTRA_INIT_PRE} do=
es not exist"
-        fi
-        call_xenguest_mkimage partial --init-pre=3D${XENGUEST_EXTRA_INIT_P=
RE}
-    fi
-
-    if [ -n "${XENGUEST_EXTRA_INIT}" ]; then
-        if [ ! -f ${XENGUEST_EXTRA_INIT} ]; then
-            die "xenguest_image: Init script ${XENGUEST_EXTRA_INIT} does n=
ot exist"
-        fi
-        call_xenguest_mkimage partial --init-script=3D${XENGUEST_EXTRA_INI=
T}
-    fi
-
-    if [ -n "${XENGUEST_EXTRA_INIT_POST}" ]; then
-        if [ ! -f ${XENGUEST_EXTRA_INIT_POST} ]; then
-            die "xenguest_image: Init script ${XENGUEST_EXTRA_INIT_POST} d=
oes not exist"
-        fi
-        call_xenguest_mkimage partial --init-post=3D${XENGUEST_EXTRA_INIT_=
POST}
-    fi
-
-    if [ -n "${XENGUEST_EXTRA_FILES}" ]; then
-        for f in ${XENGUEST_EXTRA_FILES}; do
-            if [ ! -f $f ]; then
-                die "xenguest_image: Xen file $f does not exist"
-            fi
-            call_xenguest_mkimage partial --xen-add-file=3D$f
-        done
-    fi
-
-    if [ -n "${XENGUEST_EXTRA_DISK_FILES}" ]; then
-        for f in ${XENGUEST_EXTRA_DISK_FILES}; do
-            if [ ! -f $f ]; then
-                die "xenguest_image: Disk file $f does not exist"
-            fi
-            call_xenguest_mkimage partial --disk-add-file=3D$f
-        done
-    fi
-}
-# Need to have xenguest_image tool
-do_deploy[depends] +=3D "xenguest-base-image:do_deploy"
-
diff --git a/meta-arm-autonomy/conf/distro/include/arm-autonomy-guest.inc b=
/meta-arm-autonomy/conf/distro/include/arm-autonomy-guest.inc
deleted file mode 100644
index 6ffcdb5..0000000
--- a/meta-arm-autonomy/conf/distro/include/arm-autonomy-guest.inc
+++ /dev/null
@@ -1,15 +0,0 @@
-# This files is added when DISTRO_FEATURES contains arm-autonomy-guest
-
-# We need to have ipv4 activated
-DISTRO_FEATURES:append =3D " ipv4"
-
-# Build a xenguest type image
-IMAGE_CLASSES +=3D "image_types_xenguest"
-IMAGE_FSTYPES +=3D "xenguest"
-
-# xenguest kernel extension to handle initramfs
-KERNEL_CLASSES +=3D "kernel-xenguest"
-
-IMAGE_INSTALL:append =3D "${@bb.utils.contains('DISTRO_FEATURES', 'docker'=
, \
-                        ' packagegroup-docker-runtime-minimal', \
-                        '', d)}"
diff --git a/meta-arm-autonomy/conf/distro/include/arm-autonomy-host.inc b/=
meta-arm-autonomy/conf/distro/include/arm-autonomy-host.inc
deleted file mode 100644
index 8c14a1f..0000000
--- a/meta-arm-autonomy/conf/distro/include/arm-autonomy-host.inc
+++ /dev/null
@@ -1,23 +0,0 @@
-# This files is added when DISTRO_FEATURES contains arm-autonomy-host
-
-ARM_AUTONOMY_HOST_OVERRIDES =3D ":autonomy-host"
-
-# We need to have xen and ipv4 activated
-DISTRO_FEATURES:append =3D " xen ipv4"
-DISTRO_FEATURES_NATIVE:append =3D " arm-autonomy-host"
-
-# Don't include kernels in standard images when building arm-autonomy-host
-# If the kernel image is needed in the rootfs the following should be set =
from
-# a bbappend: RDEPENDS:${KERNEL_PACKAGE_NAME}-base =3D "${KERNEL_PACKAGE_N=
AME}-image"
-RDEPENDS:${KERNEL_PACKAGE_NAME}-base ?=3D ""
-
-# Require extra machine specific settings from meta-arm-bsp dynamic-layers=
 only
-# if meta-arm-bsp is in the bblayers.conf
-# Directory for meta-arm-autonomy/dynamic-layers/meta-arm-bsp machine extr=
a settings
-ARM_AUTONOMY_ARM_BSP_DYNAMIC_EXTRA_CFGDIR =3D "${ARM_AUTONOMY_ARM_BSP_DYNA=
MIC_DIR}/conf/machine"
-ARM_AUTONOMY_MACHINE_EXTRA_REQUIRE ?=3D \
-"${ARM_AUTONOMY_ARM_BSP_DYNAMIC_EXTRA_CFGDIR}/arm-autonomy-machine-extra-s=
ettings.inc"
-
-require ${@bb.utils.contains('BBFILE_COLLECTIONS', 'meta-arm-bsp', \
-                             '${ARM_AUTONOMY_MACHINE_EXTRA_REQUIRE}' , \
-                             '', d)}
diff --git a/meta-arm-autonomy/conf/layer.conf b/meta-arm-autonomy/conf/lay=
er.conf
deleted file mode 100644
index a77e802..0000000
--- a/meta-arm-autonomy/conf/layer.conf
+++ /dev/null
@@ -1,39 +0,0 @@
-# Add layer to BBPATH
-BBPATH .=3D ":${LAYERDIR}"
-
-# Add recipes-* directories to BBFILES
-BBFILES +=3D " \
-    ${LAYERDIR}/recipes-*/*/*.bb \
-    ${LAYERDIR}/recipes-*/*/*.bbappend \
-    "
-
-BBFILE_COLLECTIONS +=3D "meta-arm-autonomy"
-BBFILE_PATTERN_meta-arm-autonomy =3D "^${LAYERDIR}/"
-BBFILE_PRIORITY_meta-arm-autonomy =3D "5"
-LAYERDEPENDS_meta-arm-autonomy =3D " \
-   core \
-   yocto \
-   openembedded-layer \
-   networking-layer \
-   virtualization-layer \
-"
-LAYERSERIES_COMPAT_meta-arm-autonomy =3D "honister"
-
-# We don't activate virtualization feature from meta-virtualization as it
-# brings in lots of stuff we don't need. We need to disable the sanity che=
ck
-# otherwise the user will see a warning on each build.
-SKIP_META_VIRT_SANITY_CHECK =3D "1"
-
-ARM_AUTONOMY_LAYERDIR :=3D "${LAYERDIR}"
-# Directory of our distro config files
-ARM_AUTONOMY_DISTRO_CFGDIR =3D "${ARM_AUTONOMY_LAYERDIR}/conf/distro/inclu=
de/"
-
-# Add class to handle arm-autonomy distro extensions
-USER_CLASSES:append =3D " arm-autonomy-features"
-
-BBFILES_DYNAMIC +=3D " \
-    meta-arm-bsp:${LAYERDIR}/dynamic-layers/meta-arm-bsp/*/*/*.bbappend \
-    meta-arm-bsp:${LAYERDIR}/dynamic-layers/meta-arm-bsp/*/*/*.bb \
-"
-# Root directory for the meta-arm-autonomy/dynamic-layers/meta-arm-bsp
-ARM_AUTONOMY_ARM_BSP_DYNAMIC_DIR =3D "${ARM_AUTONOMY_LAYERDIR}/dynamic-lay=
ers/meta-arm-bsp"
diff --git a/meta-arm-autonomy/conf/machine/arm64-autonomy-guest.conf b/met=
a-arm-autonomy/conf/machine/arm64-autonomy-guest.conf
deleted file mode 100644
index c04fc23..0000000
--- a/meta-arm-autonomy/conf/machine/arm64-autonomy-guest.conf
+++ /dev/null
@@ -1,17 +0,0 @@
-#@TYPE: Machine
-#@NAME: Autonomy Guest ARM64 machine
-#@DESCRIPTION: Machine configuration for ARM64 Autonomy Guest
-
-TUNE_FEATURES =3D "aarch64"
-
-require conf/machine/include/arm/arch-armv8a.inc
-
-KERNEL_IMAGETYPE =3D "Image"
-
-IMAGE_FSTYPES:append =3D " tar.bz2"
-
-PREFERRED_PROVIDER_virtual/kernel =3D "linux-yocto"
-PREFERRED_VERSION_linux-yocto ?=3D "5.10%"
-
-DISTRO_FEATURES +=3D "arm-autonomy-guest"
-
diff --git a/meta-arm-autonomy/conf/xenguest.conf b/meta-arm-autonomy/conf/=
xenguest.conf
deleted file mode 100644
index 3c18cc5..0000000
--- a/meta-arm-autonomy/conf/xenguest.conf
+++ /dev/null
@@ -1,5 +0,0 @@
-# This file will be required by different xenguest recipes to provide
-# common variables, which can be configured in local.conf
-
-# Xenguest image file install location
-XENGUEST_MANAGER_GUEST_DIR ?=3D "${datadir}/guests/"
diff --git a/meta-arm-autonomy/documentation/arm-autonomy-multiconfig.md b/=
meta-arm-autonomy/documentation/arm-autonomy-multiconfig.md
deleted file mode 100644
index 046c149..0000000
--- a/meta-arm-autonomy/documentation/arm-autonomy-multiconfig.md
+++ /dev/null
@@ -1,226 +0,0 @@
-arm-autonomy Multiconfig Build Environment Instructions
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-
-This documentation explains how to simplify the process of building hosts
-and guests in a single bitbake command, rather than in seperate build
-folders. You can read more about multiconfig in the bitbake documentation:
-
- - [bitbake user manual](https://www.yoctoproject.org/docs/latest/bitbake-=
user-manual/bitbake-user-manual.html)
-
-To achieve a multiconfig build, a number of different config files need to
-be created in a single build directory.
-
-Create a new project
-----------------
-
-Before you start, you will need to follow the instructions in
-"Create a project" from the quickstart guide, to create a new project
-directory with
-  ```
-  oe-init-build-env my-mc-project
-  ```
-Ensure it has all the required layers in bblayers.conf as listed in
-`arm-autonomy-quickstart.md`. The result should be a directory containing:
-
-```
--- conf
- | -- bblayers.conf
- | -- local.conf
- | -- templateconf.cfg
-```
-
-Add multiconfig
-----------------
-
-The steps required to make the project build both the host and any
-number of guests as required are:
-
-1. Create a new directory under `conf/` named `multiconfig/`
-
-2. Create two new files in this directory:
-`multiconfig/host.conf`
-`multiconfig/guest.conf`
-These files will contain any configurations that are specific to either th=
e
-host or the guest. The resulting directory tree should be:
-
-```
--- conf
- | -- bblayers.conf
- | -- local.conf
- | -- templateconf.cfg
- | -- multiconfig
-    | -- host.conf
-    | -- guest.conf
-```
-
-3. In `local.conf` the following config variables must be added:
-
-```
-MACHINE ?=3D "fvp-base"
-
-# ---Guest Config Start--- #
-MC_GUEST =3D "guest"
-
-MC_GUEST_NAME =3D "guest1"
-
-MC_GUEST_IMAGERECIPE =3D "core-image-minimal"
-MC_GUEST_MACHINE =3D "arm64-autonomy-guest"
-
-MC_GUEST_INITRAMFS_IMAGE_BUNDLE ?=3D ""
-MC_GUEST_INITRAMFS_IMAGE ?=3D ""
-
-# Uncomment for initramfs
-#MC_GUEST_INITRAMFS_IMAGE_BUNDLE =3D "1"
-#MC_GUEST_INITRAMFS_IMAGE =3D "${MC_GUEST_IMAGERECIPE}"
-
-# These variables are set automatically, don't override them!
-MC_GUEST_FILENAME_PREFIX =3D "${@ 'Image-initramfs' if d.getVar('MC_GUEST_=
INITRAMFS_IMAGE_BUNDLE',d) else '${MC_GUEST_IMAGERECIPE}' }"
-
-MC_GUEST_FILENAME =3D "${MC_GUEST_FILENAME_PREFIX}-${MC_GUEST_MACHINE}.xen=
guest"
-
-MC_GUEST_DEP =3D "${@ 'virtual/kernel:do_deploy' if d.getVar('MC_GUEST_INI=
TRAMFS_IMAGE_BUNDLE',d) else '${MC_GUEST_IMAGERECIPE}:do_merge_xenguestenv'=
}"
-
-MC_DOIMAGE_MCDEPENDS +=3D "mc:${MC_HOST}:${MC_GUEST}:${MC_GUEST_DEP} "
-
-BBMULTICONFIG +=3D "${MC_GUEST} "
-
-ARM_AUTONOMY_HOST_IMAGE_EXTERN_GUESTS +=3D "file://${TOPDIR}/${MC_GUEST}/d=
eploy/images/${MC_GUEST_MACHINE}/${MC_GUEST_FILENAME};guestname=3D${MC_GUES=
T_NAME} "
-# ---Guest Config End--- #
-
-# ---Host Config Start--- #
-MC_HOST =3D "host"
-
-BBMULTICONFIG +=3D "${MC_HOST} "
-# ---Host Config End--- #
-```
-
-These variables will be used in both of the multiconf files. `MC_HOST` and
-`MC_GUEST` should not be altered without renaming the conf files, but most
-`MC_GUEST_*` variables can be customised if you desire.
-
-4. Next set the contents of `multiconfig/guest.conf`:
-
-```
-TMPDIR =3D "${TOPDIR}/${MC_GUEST}"
-
-MACHINE =3D "${MC_GUEST_MACHINE}"
-DISTRO_FEATURES +=3D " arm-autonomy-guest"
-
-INITRAMFS_IMAGE_BUNDLE =3D "${MC_GUEST_INITRAMFS_IMAGE_BUNDLE}"
-INITRAMFS_IMAGE =3D "${MC_GUEST_INITRAMFS_IMAGE}"
-
-IMAGE_FSTYPES +=3D "${@ 'cpio' if d.getVar('MC_GUEST_INITRAMFS_IMAGE_BUNDL=
E',d) else ''}"
-
-# ANY OTHER GUEST CONFIG
-```
-
-To modify the MACHINE or INITRAMFS variables change the equivalent
-config in local.conf rather than modifying this file directly. You can als=
o
-append any other config desired for the guest after "ANY OTHER GUEST CONFI=
G",
-for example `XENGUEST_IMAGE_DISK_SIZE`.
-
-Make sure not to change `${DEPLOY_DIR_IMAGE}` to anything other than
-`${TMPDIR}/deploy/images`, as this is assumed by local.conf.
-
-5. Lastly set the contents of `multiconfig/host.conf`:
-
-```
-TMPDIR =3D "${TOPDIR}/${MC_HOST}"
-
-DISTRO_FEATURES +=3D " arm-autonomy-host"
-
-# ANY OTHER HOST CONFIG
-```
-
-Building the image
-----------------
-
-To build the multiconfig image the command is:
-```
-bitbake mc:host:arm-autonomy-host-image-minimal
-```
-
-The first time this is run you may see a warning related to the SRC_URI:
-```
-Unable to get checksum for xenguest-extern-guests SRC_URI entry foo.xengue=
st: file could not be found
-```
-
-This is expected, and only indicates that the guest image has not yet been
-generated when the host parses the SRC_URI. By the time it is needed by th=
e
-host recipe fetch task it will be present.
-
-During the build you should see that guest tasks are also being executed i=
n
-parallel. Once the build completes the guest will already be in the rootfs=
 of
-the host thanks to `ARM_AUTONOMY_HOST_IMAGE_EXTERN_GUEST`
-
-The final host image including the guests will be deployed in
-`host/deploy/images/`
-
-
-Multiple Guests
-----------------
-
-To have multiple guests with the same config the line which appends to
-`ARM_AUTONOMY_HOST_IMAGE_EXTERN_GUESTS` just needs to pass the argument
-'guestcount=3D#' to install symlink copies of the xenguest file on the hos=
t.
-Documentation for the guestcount parameter can be found in
-documentation/arm-autonomy-quickstart.md in the section titled
-'Include guests directly in the host image'. This will ensure that the gue=
st
-is still only built once, despite resulting in multiple copies on the targ=
et.
-
-If guests are required to have different configurations, each will need it=
s own
-config file, e.g. 'netguest.conf'. Ensure that the name of the conf file d=
oes
-not contain any hyphens, as this will create errors when it becomes part o=
f a
-function name. In this file the values of TMPDIR, MACHINE, DISTRO_FEATURES=
 etc.
-should be the same as above, but with the prefix "MC_GUEST_*" modified to
-something different to avoid collisions (e.g. MC_GUEST_2_*).
-
-As before, your additional config for the guest type should
-follow "ANY OTHER GUEST CONFIG"
-
-In your local.conf, everything between `---Guest Config Start---` and
-`---Guest Config End---` will need to be duplicated for each desired guest=
 type.
-All copies of variables that start `MC_GUEST` must be modified with the sa=
me
-prefix as in the new guest config file (e.g. `MC_GUEST_2_*`).
-
-Each chunk of guest config in local.conf has automatic guest variables
-(found after the line "These variables are set automatically...").
-These should all use the same prefix as their chunk in their values,
-for example:
-```
-MC_GUEST_2_FILENAME_PREFIX =3D "${@ 'Image-initramfs' if d.getVar('MC_GUES=
T_2_INITRAMFS_IMAGE_BUNDLE',d) else '${MC_GUEST_2_IMAGERECIPE}' }"
-```
-
-Guest with provisioned disk
-----------------
-
-To add guest rootfs partition to host wic image,
-set `AUTONOMY_HOST_EXTRA_PARTITION` with proper wks partition entry, e.g:
-
-```
-AUTONOMY_HOST_EXTRA_PARTITION =3D "part --label provisioned-guest --source=
 rawcopy --fstype=3Dext4 --ondisk sda --align 1024 \
---sourceparams=3Dfile=3D${TOPDIR}/${MC_GUEST}/deploy/images/${MC_GUEST_MAC=
HINE}/${MC_GUEST_FILENAME_PREFIX}-${MC_GUEST_MACHINE}.ext4"
-```
-
-inside your host.conf file.
-
-The rest of the configuration has to be appended to guest.conf file:
-
-```
-# ANY OTHER GUEST CONFIG
-XENGUEST_IMAGE_DISK_SIZE =3D "0"
-XENGUEST_IMAGE_SRC_URI_XEN_CONFIG =3D "file://\${TOPDIR}/path/to/rootdisk.=
cfg"
-XENGUEST_IMAGE_DISK_DEVICE =3D "_GUEST_DISK_DEVICE_"
-XENGUEST_IMAGE_ROOT =3D "/dev/xvda"
-IMAGE_ROOTFS_SIZE =3D "102400"
-IMAGE_FSTYPES =3D "ext4"
-```
-
-Example content of rootdisk.cfg:
-
-```
-disk =3D ["phy:_GUEST_DISK_DEVICE_,xvda,w"]
-```
-
-`_GUEST_DISK_DEVICE_` should be substituted with `/dev/sdaX`,
-according to wks file.
diff --git a/meta-arm-autonomy/documentation/arm-autonomy-quickstart.md b/m=
eta-arm-autonomy/documentation/arm-autonomy-quickstart.md
deleted file mode 100644
index 392449e..0000000
--- a/meta-arm-autonomy/documentation/arm-autonomy-quickstart.md
+++ /dev/null
@@ -1,272 +0,0 @@
-arm-autonomy Quick Start
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-
-This documentation explains how to quickly start with the arm-autonomy lay=
er,
-and the main features provided.
-In the documentation directory you will find some more detailed documentat=
ion
-for each of the functionalites provided by this layer.
-
-What to use this layer for?
----------------------------
-Using this layer, you can easily and rapidly create a system based on Xen =
with
-one or more guests created using Yocto.
-
-For this you will need to create at least 2 Yocto projects:
-- a host project: This one will compile Xen and create a Linux system to b=
e
-  used as Xen Dom0. The Linux system will contain all functionalities requ=
ired
-  to start and manage guests.
-- one or several guest projects: Those will create Linux systems with the
-  required Linux kernel configuration to run as Xen DomU.
-
-Prepare your system
--------------------
-
-First you must download the Yocto layers needed:
- - [meta-openembedded](https://git.openembedded.org/meta-openembedded)
- - [poky](https://git.yoctoproject.org/poky)
- - [meta-virtualization](https://git.yoctoproject.org/meta-virtualization)
- - [meta-arm](https://git.yoctoproject.org/meta-arm)
- - all other layers you might want to use
-
-For each of the downloaded layer make sure you checkout the release of Yoc=
to
-you want to use (for example honister using `git checkout honister`).
-
-Please follow [Yocto documentation](https://www.yoctoproject.org/docs/late=
st/brief-yoctoprojectqs/brief-yoctoprojectqs.html)
-in order to have the required dependencies.
-
-
-Create a project
-----------------
-
-Here are the main steps to create an arm-autonomy project:
-
-1. create a new Yocto project using `oe-init-build-env` in a new directory=
:
-  ```
-  oe-init-build-env my-project
-  ```
-
-2. Add `meta-arm/meta-arm-autonomy` layer to the list of layers of your
-  project in the `conf/bblayers.conf`. Also add any other layers you
-  might need (for example `meta-arm/meta-arm-bsp` and `meta-arm/meta-arm` =
to
-  use Arm boards like Juno or FVP emulator). You can achieve this by using
-  the `bitbake-layers add-layer layerdir [layerdir ...]` command.
-  For example:
-  ```
-  export LAYERDIR_BASE=3D"/home/user/arm-autonomy/"
-  bitbake-layers add-layer $LAYERDIR_BASE/meta-poky $LAYERDIR_BASE/meta-yo=
cto-bsp \
-   $LAYERDIR_BASE/meta-openembedded/meta-oe $LAYERDIR_BASE/meta-openembedd=
ed/meta-python \
-   $LAYERDIR_BASE/meta-openembedded/meta-filesystems $LAYERDIR_BASE/meta-o=
penembedded/meta-networking \
-   $LAYERDIR_BASE/meta-arm/meta-arm $LAYERDIR_BASE/meta-arm/meta-arm-toolc=
hain \
-   $LAYERDIR_BASE/meta-arm/meta-arm-bsp $LAYERDIR_BASE/meta-arm/meta-arm-a=
utonomy \
-  ```
-
-  Example of a `conf/bblayers.conf`:
-  ```
-  BBLAYERS ?=3D " \
-    /home/user/arm-autonomy/poky/meta \
-    /home/user/arm-autonomy/poky/meta-poky \
-    /home/user/arm-autonomy/poky/meta-yocto-bsp \
-    /home/user/arm-autonomy/meta-openembedded/meta-oe \
-    /home/user/arm-autonomy/meta-openembedded/meta-python \
-    /home/user/arm-autonomy/meta-openembedded/meta-filesystems \
-    /home/user/arm-autonomy/meta-openembedded/meta-networking \
-    /home/user/arm-autonomy/meta-virtualization \
-    /home/user/arm-autonomy/meta-arm/meta-arm \
-    /home/user/arm-autonomy/meta-arm/meta-arm-toolchain \
-    /home/user/arm-autonomy/meta-arm/meta-arm-bsp \
-    /home/user/arm-autonomy/meta-arm/meta-arm-autonomy \
-    "
-  ```
-
-  Be aware that changing the order may break some dependencies if editing =
the
-  config file manually.
-
-Those steps will have to be done for each project you will have to create.
-
-Host project
-------------
-The host project will build Xen and the Dom0 Linux. It will be the only pr=
oject
-that will be specific to the board (MACHINE) you will be running on.
-
-To create a host project:
-1. Follow the steps of "Create a project"
-
-2. Add the layers in `bblayers.conf` required to build a Yocto project for=
 the
-   board you want to use.
-   For example to use Arm FVP Base emulator, add `meta-arm/meta-arm` and
-   `meta-arm/meta-arm-bsp`.
-
-3. edit conf/local.conf to add `arm-autonomy-host` to the DISTRO_FEATURES =
and
-   set MACHINE to the board you want to use.
-   For example, add the following lines:
-  ```
-  MACHINE =3D "fvp-base"
-  DISTRO_FEATURES +=3D "arm-autonomy-host"
-  ```
-
-4. build the image using `bitbake arm-autonomy-host-image-minimal`
-
-The project will generate a Linux kernel, a root filesystem, a Xen binary =
and
-a DTB modified to include the required entries to boot Xen and Linux as Do=
m0
-(this DTB has the extension `-xen.dtb`).
-
-To boot the system using a u-boot base board for machines other than FVP-B=
ase
-you will need to:
-- Load the kernel (by default at 0x80080000 unless you modify
-  XEN_DEVICETREE_DOM0_ADDR value)
-- Load the xen device tree (for example at 0x83000000)
-- Load the xen-efi binary (for example at 0x84000000)
-- run using `booti 0x84000000 - 0x83000000`
-
-In this example the addresses might need to be adapted depending on your b=
oard.
-
-For arm-autonomy host on FVP-Base, u-boot has been modified such that
-`booti 0x84000000 - 0x83000000` is the default boot command. If FVP-Base i=
s your
-MACHINE target there should be no need to interfere with u-boot.
-
-Guest project
--------------
-The guest projects are not target specific and will instead use a Yocto MA=
CHINE
-defined in meta-arm-autonomy to include only the Linux configuration requi=
red to
-run a xen guest.
-
-To create a guest project:
-
-1. Follow the steps of "Create a project"
-
-2. Optionally add layers required to build the guest image, and any featur=
es you
-   need.
-
-3. Edit conf/local.conf to add `arm-autonomy-guest` to the DISTRO_FEATURES=
 and
-   set MACHINE to `arm64-autonomy-guest`:
-  ```
-  MACHINE =3D "arm64-autonomy-guest"
-  DISTRO_FEATURES +=3D "arm-autonomy-guest"
-  ```
-
-4. Build the image you want.
-   For example `bitbake core-image-minimal`
-
-The build will create a ".xenguest" image that can be use on an host proje=
ct
-with the xenguest-manager, as well as a file "xenguest.env" containing the
-variables used to configure and generate the guest image.
-
-The guest can also be built as a 'multiconfig' sub project of the host, se=
e
-`meta-arm-autonomy/documentation/arm-autonomy-multiconfig.md` for more
- information
-
-Include guests directly in the host image
------------------------------------------
-The layer provides a way to directly include one or more images generated =
by
-guest projects in the host project.
-
-To use this feature, you must edit your host project `local.conf` file and
-add set the value of 'ARM_AUTONOMY_HOST_IMAGE_EXTERN_GUESTS' to the list o=
f
-paths to xenguest images you want to include in your host.
-
-There are 4 supported formats for ARM_AUTONOMY_HOST_IMAGE_EXTERN_GUESTS
-entries:
-
-- http/https url
-  - "https://[url]:[port]/foo.xenguest;md5sum=3D..."
-
-- file:// absolute local path from root
-  - "file:///xenguests/bar.xenguest"
-
-- file:// path relative to FILESEXTRAPATHS
- - "file://relative/baz.xenguest"
-
-- plain absolute local path from root
-  - "/xenguests/absolute/xyzzy.xenguest"
-
-It is not recommended to use other bitbake URL types, as they may result i=
n
-undefined behaviour.
-
-A semicolon seperated list of install arguments can follow each image path=
:
-- guestname  : the name that will be attached when the image is imported
-               (default: [filename, without extension])
-- guestcount : the number of copies of the guest to install, with
-               incrementing numbers appended to the name
-               (default: 1)
-
-Any other arguments, for example an md5sum, will be assumed to be fetch
-arguments, and will be appended to the path in the SRC_URI.
-For example:
-```
-ARM_AUTONOMY_HOST_IMAGE_EXTERN_GUESTS =3D "\
-https://[url]:[port]/base.xenguest;md5sum=3D[checksum];guestname=3Dhttp \
-file:///guests/base.xenguest;guestname=3Dfile_abs \
-file://foo/base.xenguest;guestname=3Dfile_rel;guestcount=3D2 \
-/guests/foo/bar/base.xenguest;guestname=3Dno_fetcher \ "
-```
-
-Documentation for setting up a multiconfig build can be found in:
-meta-arm-autonomy/documentation/arm-autonomy-multiconfig.md
-
-Add support for your board
---------------------------
-Most of arm-autonomy layer is board independent but some functionalities
-might need to be customized for your board:
-
-### Add the kernel configuration for the host
-The layer is using KERNEL_FEATURES to add drivers required to be a Xen Dom=
0
-system.
-Depending on the kernel used by your BSP and how it is configured you migh=
t
-need to add the required drivers to your kernel configuration:
-- if KERNEL_FEATURES system is supported by your kernel, make sure that th=
e
-file `recipes-kernel/linux/linux-arm-autonomy.inc` from the layer is inclu=
ded
-by your kernel recipe.
-- if it is not supported, you must add the proper drivers inside your kern=
el
-(modules are possible but they must be loaded before xenguest-manager is
-started). You can find the complete list of the kernel configuration eleme=
nts
-required in `recipes-kernel/linux/arm-autonomy-kmeta/features/arm-autonomy=
/xen-host.cfg`.
-
-### Define the drive and partition to use for the LVM volume
-The xenguest-manager creates guest storage drives using LVM on an empty
-partition. The default value is set to use /dev/sda2.
-You can change this for your board by setting XENGUEST_MANAGER_VOLUME_DEVI=
CE.
-
-Check `recipes-extended/xenguest/xenguest-manager.bbappend` for examples.
-
-Please also read xenguest-manager.md.
-
-### Define the interface to add to xenguest network bridge
-xenguest-network bridge creates a bridge on the host and adds network
-interfaces to it so that guests connected to it have access to external ne=
twork.
-By default `eth0` is set as the list of interfaces to be added to the brid=
ge.
-Depending on your board or use case you might want to use an other interfa=
ce
-or use multiple interfaces.
-You can change this for your board by setting XENGUEST_NETWORK_BRIDGE_MEMB=
ERS.
-
-Check `recipes-extended/xenguest/xenguest-network.bbappend` for
-exmaples.
-
-Please also read xenguest-network-bridge.md.
-
-### Define the network configuration of the xenguest network bridge
-xenguest-network puts the host network interfaces in a bridge and configur=
es it
-by default to use dhcp.
-If you need a different type of configuration you can set
-XENGUEST_NETWORK_BRIDGE_CONFIG in your xenguest-network-bridge.bbappend to=
 use
-a different file.
-The recipe will look for the file in ${WORKDIR}, so you will need to add i=
t to
-the SRC_URI in your bbappend.
-The recipe will also substitute `###BRIDGE_NAME###` with the bridge name
-configured in ${XENGUEST_NETWORK_BRIDGE_NAME} when the config file is inst=
alled.
-
-You can find an example configuration file in
-`recipes-extended/xenguest/files/xenguest-network-bridge-dhcp.cfg.in`.
-
-Please also read xenguest-network.md.
-
-### Customize Dom0 and Xen boot arguments for you board
-xen-devicetree modifies the generated DTB Xen and Linux boot arguments,
-as long as the address where Dom0 Linux kernel can be found.
-You might need to have different values for your board or depending on you=
r
-use case.
-
-You can find examples to customize this in
-`recipes-extended/xen-devicetree/xen-devicetree.bbappend`.
-
-Please also read xen-devicetree.md.
-
diff --git a/meta-arm-autonomy/documentation/n1sdp-image-customization.md b=
/meta-arm-autonomy/documentation/n1sdp-image-customization.md
deleted file mode 100644
index c67b626..0000000
--- a/meta-arm-autonomy/documentation/n1sdp-image-customization.md
+++ /dev/null
@@ -1,34 +0,0 @@
-Customizing Arm Autonomy Host image layout for N1SDP
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
-
-When buiding with `DISTRO_FEATURES +=3D "arm-autonomy-host"` the user can
-perform a couple of customizations in the generated wic image:
-
-1. Set the guest partition size (default: 4iG) via `GUEST_PART_SIZE` and
-   `GUEST_PART_SIZE_UNIT` (M or G) variables to be set in any conf file. T=
he
-   value of these variables should be aligned with the sum of all
-   XENGUEST_IMAGE_DISK_SIZE set for the guests. By default, LVM2 metadata =
is
-   1 MiB per physical volume, hence it needs to be taken into account when
-   setting GUEST_PART_SIZE.
-
-2. Set the boot partition size (default: 100M) via `BOOT_PART_SIZE` and
-   `BOOT_PART_SIZE_UNIT` (M or G) variables in any conf file. The default
-   bootimg is ~44M so 100M leaves just over 50M of free space.
-
-3. The wic image partition layout and contents with a custom wks file via
-   `ARM_AUTONOMY_WKS_FILE` variable (default:
-   arm-autonomy-n1sdp-efidisk.wks.in which is affected by GUEST_PART_SIZE,
-   GUEST_PART_SIZE_UNIT, BOOT_PART_SIZE, BOOT_PART_SIZE_UNIT and
-   GRUB_CFG_FILE variables).
-
-4. Custom grub.cfg file via `GRUB_CFG_FILE` (default:
-   arm-autonomy-n1sdp-grub.cfg) variable to be set in any conf file. The f=
ull
-   path or relative to `ARM_AUTONOMY_WKS_FILE` should be set.
-
-The `arm-autonomy-n1sdp-efidisk.wks.in` and `arm-autonomy-n1sdp-grub.cfg` =
files
-are located at `meta-arm-autonomy/dynamic-layers/meta-arm-bsp/wic`.
-
-Other variables can also be customized to set what files need to be includ=
ed
-in the wic image boot partition. Please refer to
-`meta-arm-autonomy/dynamic-layers/meta-arm-bsp/conf/machine/n1sdp-extra-se=
ttings.inc`
-for more details.
diff --git a/meta-arm-autonomy/documentation/xen-devicetree.md b/meta-arm-a=
utonomy/documentation/xen-devicetree.md
deleted file mode 100644
index efe72ec..0000000
--- a/meta-arm-autonomy/documentation/xen-devicetree.md
+++ /dev/null
@@ -1,110 +0,0 @@
-Xen device tree
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-
-Introduction
-------------
-
-xen-devicetree recipe can be used to modify an existing Device Tree Blob,
-produced by Linux kernel or another recipe, to include in it entries requi=
red
-to start Xen and a Dom0 Linux on top of it.
-
-The recipe will do the following processing:
-- generate a xen.dtsi file with entries required for xen based on paramete=
rs
-- turn DTBs in ${XEN_DEVICETREE_DTBS} back to dts
-- include in xen.dtsi and all other dtsi from
-  ${XEN_DEVICETREE_DTSI_MERGE} (check Bitbake parameters for more informat=
ion
-  on this).
-- use dtc to create a new DTB file
-
-The recipe will generate new files in deploy/images and name them with the
-extension "-xen.dtb".
-For example **machine.dtb** will generate **machine-xen.dtb**.
-
-Entries added to the DTBs
--------------------------
-
-When a DTB is processed by the recipe, the following block is added:
-```
-    chosen {
-        xen,dom0-bootargs =3D "VAL";
-        xen,xen-bootargs =3D "VAL";
-
-        modules {
-            #size-cells =3D <0x00000001>;
-            #address-cells =3D <0x00000001>;
-
-            module@0 {
-                reg =3D <VAL VAL>;
-                compatible =3D "multiboot,module";
-            };
-        };
-    };
-```
-Each occurence of **VAL** is replaced by the content of the variables list=
ed in
-this documentation.
-
-Bitbake parameters
-------------------
-
-Several parameters are available to configure the xen-devicetree during Yo=
cto
-project compilation (those can be set in your project local.conf, for exmp=
le).
-
-The following parameters are available:
-
-- XEN_DEVICETREE_DEPEND: This variable can be used to indicate which recip=
e
-  task is generating the DTBs that xen-devicetree will modify. This makes =
sure
-  the xen devicetrees are properly regenerated if the source DTBs are chan=
ged.
-  This variable is set by default to "virtual/kernel:do_deploy" to use DTB=
s
-  generated during the compilation of the Linux kernel. This must be chang=
ed
-  if the machine you are using is not using a DTB listed in
-  KERNEL_DEVICETREE.
-
-- XEN_DEVICETREE_DTBS: This should be set to the list of DTBs you want to =
be
-  modified by xen-devicetree. Those must be files that xen-devicetree can =
find
-  in the ${DEPLOY_DIR_IMAGE} directory using only the basename of the entr=
ies.
-  For example "mydir/board.dtb" will make the recipe look for
-  ${DEPLOY_DIR_IMAGE}/board.dtb.
-  This variable is set by default to "${KERNEL_DEVICETREE}" to process the=
 DTBs
-  generated by the Linux kernel.
-
-- XEN_DEVICETREE_DOM0_MEM: Memory size to allocate to Dom0.
-  This variable is only used if XEN_DEVICETREE_XEN_BOOTARGS has a value
-  containing "dom0_mem=3D${XEN_DEVICETREE_DOM0_MEM}" as the memory assigne=
d to
-  dom0 is defined using Xen boot arguments.
-  This variable is set by default to "1024M,max:1024", and cannot be empty=
.
-  The value can simply specify a size, e.g. "1024M", but best practice is =
to
-  also provide a max, documented here:
-  https://wiki.xenproject.org/wiki/Xen_Project_Best_Practices
-
-- XEN_DEVICETREE_DOM0_BOOTARGS: Boot arguments to pass to Dom0 Linux when
-  booting it.
-  This variable is set by default to "console=3Dhvc0 earlycon=3Dxen".
-
-- XEN_DEVICETREE_XEN_BOOTARGS: this variable should be set with the boot
-  arguments to be passed to Xen on boot.
-  This variable is set by default to
-  "noreboot dom0_mem=3D${XEN_DEVICETREE_DOM0_MEM}".
-
-- XEN_DEVICETREE_DOM0_ADDR: This is the address from which the Linux kerne=
l to
-  be used for Dom0 will be copied. When using u-boot, this is the address =
at
-  which you will load the kernel Image before starting Xen.
-  This variable is set by default to "0x80080000", and cannot be empty.
-  Values for this variable can be in hex (prefixed with '0x') or in decima=
l.
-
-- XEN_DEVICETREE_DOM0_SIZE: This is the size of the kernel loaded at
-  ${XEN_DEVICETREE_DOM0_ADDR}. Xen will copy this amount of data inside th=
e
-  guest before starting it so the size must be at least equal to the kerne=
l
-  size but can be bigger. You must be careful not to have a value too big =
as it
-  could slow down boot or copy other parts with it (like the DTB).
-  You might need to increase this if you use a kernel with a bundled initr=
amfs.
-  This variable is set by default to "0x01000000" and cannot be empty.
-  Values for this variable can be in hex (prefixed with '0x') or in decima=
l.
-
-- XEN_DEVICETREE_DTSI_MERGE: This variable contains the list of dtsi files=
 that
-  must be included inside the generated DTB file. By default the only one
-  include is the "xen.dtsi" generated by the recipe.
-  If your board or project needs to include more fixes or entries in the D=
TB,
-  this variable can be appended from a bbappend file to include other dtsi=
. The
-  files must be inside the recipe workspace during Yocto compilation.
-  You can check xen-devicetree.bbappend for an example.
-
diff --git a/meta-arm-autonomy/documentation/xenguest-manager.md b/meta-arm=
-autonomy/documentation/xenguest-manager.md
deleted file mode 100644
index 7a83eee..0000000
--- a/meta-arm-autonomy/documentation/xenguest-manager.md
+++ /dev/null
@@ -1,144 +0,0 @@
-Xenguest Manager
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-
-Introduction
-------------
-
-xenguest-manager is a tool to manage Xenguest images generated by
-[xenguest-mkimage](xenguest-mkimage.md).
-
-On a Xen Dom0 system it can:
-- create a xen guest from a xenguest image: extract its components, create=
 a
-  disk for the guest using LVM volumes.
-- start/stop a xen guest (during init or using xenguest-manager directly).
-- check guest status
-
-xenguest-manager is composed of 2 shell scripts:
-- xenguest-manager which can be used from command line to start/stop/check
-guests and create or remove guest using xenguest images.
-- xenguest-init which is called during init to automatically create and st=
art
-some guests as part of the host init process.
-
-Usage
------
-
-xenguest-manager must be called like this:
-`xenguest-manager [-v(v)] OPERATION [OPTIONS]`
-The following operations are available:
-- create XENGUEST_IMAGE [GUESTNAME]: create a guest from a xenguest image =
file
-  as guest GUESTNAME. If GUESTNAME is not given the image file name is use=
d
-  without the xenguest extension.
-- remove GUESTNAME: remove the guest GUESTNAME.
-- start GUESTNAME: start the guest GUESTNAME.
-- stop GUESTNAME: stop the guest GUESTNAME (this is using `xl stop` which =
is
-  sending a stop signal to the running guest).
-- kill GUESTNAME: force stopping the guest GUESTNAME.
-- list: list the available guests.
-- status [GUESTNAME]: print the current status of GUESTNAME. If GUESTNAME =
is
-  not given, print the status of all guests.
-
-Passing -v or -vv will increase the logging written to the logfile.
-The terminal will always show only error messages, regardless of the logfi=
le.
-
-For a detailed help on available options please use:
-`xenguest-manager --help`
-
-Bitbake parameters
-------------------
-
-Several parameters are available to configure the xenguest manager during =
Yocto
-project compilation (those can be set in your project local.conf, for exam=
ple).
-This config will be written to a file xenguest-manager.conf in /etc/xengue=
st/.
-
-The following parameters are available:
-
-- XENGUEST_MANAGER_VOLUME_DEVICE: This is the device path used by the
-  xenguest-manager on the device to create LVM disks when guests have a di=
sk
-  configuration.
-  This is set by default to "/dev/sda2".
-
-- XENGUEST_MANAGER_VOLUME_NAME: This is the LVM volume name that the
-  xenguest-manager will create and use to create guest LVM disks.
-  This is set by default to "vg-xen".
-
-- XENGUEST_MANAGER_GUEST_DIR: This is the directory on Dom0 where the
-  xenguest-manager will look for xenguest images to create during init. Th=
at's
-  the place where xenguest images can be added to have them automatically
-  created during next Dom0 boot. The xenguests found there will only be cr=
eated
-  if they were not already before (the basename of the files is used as gu=
est
-  name).
-  This is set by default to "/usr/share/guests".
-
-- XENGUEST_MANAGER_LOG_LEVEL: Set the default log level for xenguest manag=
er.
-  Must be one of ERROR, INFO, VERBOSE (default: ERROR). The logs will be
-  written to /var/log/xenguest.
-
-  If a verbosity argument (-v or -vv) is passed to xenguest-manager direct=
ly, it
-  will override the setting in xenguest-manager.conf
-
-  Since /var/log is by default a volatile location, extra configuration is
-  required if logs are desired to be kept between reboots:
-    VOLATILE_LOG_DIR=3D"no"
-
-  Read more here: https://www.yoctoproject.org/docs/latest/mega-manual/meg=
a-manual.html#var-VOLATILE_LOG_DIR
-
-  When this is enabled, logrotate will monitor the file to ensure it does =
not
-  grow excessively large. See recipes-extended/xenguest/files/logrotate-xe=
nguest
-
-Init scripts
-------------
-
-Shell scripts can be executed on the host when a guest is started. Dependi=
ng on
-when the script should be executed it should be installed in a different
-directory on the target:
-
-- /etc/xenguest/init.pre  : Executed first, prior to guest creation
-
-- /etc/xenguest/init.d    : Executed after guest creation, but before it i=
s started
-
-- /etc/xenguest/init.post : Executed after starting the guest
-
-Inside the directory, scripts will be executed in alphabetical order.
-
-Since these scripts are sourced by xenguest-manager, they can acccess func=
tions
-and variables from the parent file's scope, including:
-
-- ${guestname}    : The name of the guest being created
-
-- ${guestdir}     : The path to the guest directory
-
-- ${guestcfgfile} : The name of the config file for the starting guest
-
-- log()           : Used to write a log to the logfile, default level INFO=
.
-                    Takes an optional log level and a message body
-                    e.g. log ERROR "blah"
-
-                    Options for log level: ERROR, INFO, VERBOSE,
-                    and FATAL which will call exit 1 immediately after log=
ging
-                    the message at level ERROR.
-
-- log_command()   : Used to call a shell command and log that it has been
-                    called, as well as capturing both stdout and stderr.
-
-                    By default the command output is dumped to the logfile=
 as an
-                    error if the command returns a status > 0, or as a ver=
bose
-                    message if the whole script is running in verbose mode=
.
-
-                    An optional log level can be passed to alter the level=
 the
-                    log should be if the command returns a status >0, whic=
h may
-                    be useful if the command is expected to return a non-z=
ero
-                    result.
-                    e.g. log_command INFO "ls -lh ~"
-
-                    Options for log level: ERROR, INFO, and VERBOSE
-
-Attempting to call any other functions from xenguest_manager in an init sc=
ript
-may result in a fatal error, from which cleanup is not guarenteed.
-
-
-Init scripts also have access to config variables defined in params.cfg.
-
-An example of how to create the directory and install an init shell script=
 can
-be found in:
-  recipes-extended/xenguest/xenguest-network.bb
-Where network-bridge.sh is installed from network-bridge.sh.in
diff --git a/meta-arm-autonomy/documentation/xenguest-mkimage.md b/meta-arm=
-autonomy/documentation/xenguest-mkimage.md
deleted file mode 100644
index e1e2a8a..0000000
--- a/meta-arm-autonomy/documentation/xenguest-mkimage.md
+++ /dev/null
@@ -1,128 +0,0 @@
-Xenguest mkimage
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-
-Introduction
-------------
-
-xenguest-mkimage is a tool to create and modify images to be used as a Gue=
st
-with Xen. It defines a format to store completely defined guests as a file=
 or as
-a directory, and provides options to create and modify those images.
-
-A xenguest image contains all elements required to create a xen guest.
-This is the base elements like a Xen configuration and a Linux kernel bina=
ry
-but also some more advanced elements like init scripts or a disk definitio=
n.
-
-The format is made to be deployable easily by storing everything in a sing=
le
-file and provide tools to easily manipulate the images. It can also easily=
 be
-extended to have features like encryption or signature of images, updates =
or
-complex configurations by providing the ability to have init scripts embed=
ded
-inside the image that will be executed on the host when the guest is start=
ed.
-
-Xenguest images content
------------------------
-
-### params.cfg
-
-This file contains parameters that can be used by tools to configure some
-functionalities on the host. This can be used by init scripts to have
-configurable parameters as it is sourced before calling init scripts.
-
-### guest.cfg and guest.d
-
-guest.cfg is the main xen configuration and guest.d contains optional
-configuration parts. All those will be merged into one final xen configura=
tion
-before starting the guest.
-
-### files
-This directory contains files that can be used by the xen configuration, f=
or
-example the kernel image referenced in xen configuration.
-This is where the kernel binary, the dtb or a ramdisk will be stored.
-
-### init.pre, init.d and init.post
-These directories contain init scripts that will be executed on the host
-during the guest startup. Those must be shell scripts and each directory
-contains scripts called at a different time:
- - init.pre: scripts executed before the guest is created. This can be use=
d
-     to prepare some features required to create the guest in xen or to
-     generate part of the xen configuration dynamically.
- - init.d: scripts executed when the guest has been created but before it =
is
-     started. This can be used to do some xenstore operations or configure=
 the
-     guest behaviour, using xl for example.
- - init.post: scripts executed just after starting the guest. This can be
-     used to configure things created by xen for the guest like network
-     network interfaces.
-
-When a directory contains several scripts, those will be called in alphabe=
tical
-order.
-
-### disk.cfg and disk-files
-disk.cfg contains the guest disk description (disk size and disk partition=
s).
-The file contains the following entries:
-- `DISK_SIZE=3DX`: size of the disk to create in MB or GB(default),
-   e.g. 1000M or 4[G]
-- `DISK_PARTX=3DSIZE:FS:CONTENT`: create a partition number X (1 to 4) wit=
h a
-  size of SIZE MB or GB(default), e.g 1000M or 2[G].
-  Format it with filesystem FS (can be ext2, ext3, ext4, vfat or swap)
-  and extract CONTENT as initial partition content (.tar[.gz|.xz|.bz2] fil=
e
-  or img[.gz|.bz2] file to be dumped in the partition).
-  FS and CONTENT can be empty.
-- `DISK_DEVICE=3DX`: disk or partition to be used by lvm. Setting this opt=
ion
-  allows to bind guest disk with any partition or disk available on host,
-  e.g. /dev/sda3 or /dev/sdb.
-  This variable is not set by default, but if set, it overrides disk setti=
ngs
-  inside xenguest-manager.conf - 'XENGUEST_VOLUME_DEVICE'.
-
-The disk-files contain files to be used for initializing the disk partitio=
ns
-content. Those should be used to create a LVM or a physical disk and initi=
alize
-it (create partitions, format them and put the initial content).
-
-Usage
------
-
-xenguest-mkimage is a shell script which must be called like this:
-`xenguest-mkimage OPERATION XENGUEST [OPTIONS]`
-
-### Operations
-- create: create a xenguest image. If XENGUEST is an existing empty direct=
ory,
-  the image is created as a directory otherwise it will be created as a fi=
le.
-- check: verify that XENGUEST is a valid xenguest image.
-- update: modify a xenguest image (see --help for a list of operations).
-- pack: pack a xenguest image directory into a xenguest image file. The fi=
le to
-  be created must be given as 3rd argument.
-- extract: extract a xenguest image file into a directory. The destination
-  directory must be given as 3rd argument.
-- dump-xenconfig: dump xenguest image xen configuration.
-- dump-diskconfig: dump xenguest image disk configuration.
-- dump-paramsconfig: dump xenguest image parameters configuration.
-
-For a detailed help on available operations, please use:
-`xenguest-mkimage --help`
-
-### Options
-- --kernel=3DFILE: add kernel FILE as guest kernel. This is both adding th=
e file
-  to the image and modifying the xen configuration to use it.
-- --xen-memory=3DSIZE: set the guest memory size in MB.
-- --xen-extra: add a kernel command line argument. This can be called seve=
ral
-  times to add several command line options.
-- --xen-device-tree=3DFILE: add dtb FILE as device tree. This both adding =
the
-  file to the image and modifying the xen configuration to use it.
-- --xen-ramdisk=3DFILE: add ramdisk FILE as guest ramdisk. This both addin=
g the
-  file to the image and modifying the xen configuration to use it.
-- --init-script=3DFILE: add guest init script. The script is embedded insi=
de the
-  image file. Several script can be added and the basename of FILE is used=
 to
-  distinguish them (calling the option twice with the same file will updat=
e the
-  script in the image with the second one).
- --disk-size=3DSIZE: set the guest disk size to SIZE in MB or GB(default),
-   e.g 1000M or 2[G]. Calling this with 0 disable the guest disk.
-- --disk-add-part=3DNUM:SIZE:FS:CONTENT: This is adding a partition to the
-  xenguest image disk. The partition is described with the arguments:
-  - NUM: partition number.
-  - SIZE: partition size in MB or GB(default), e.g 1000M or 2[G].
-  - FS: filesystem to format the partition with. This can be ext2, ext3, e=
xt4,
-    vfat of swap. If empty the partition is not formated.
-  - CONTENT: tar of img file to use to initialize the partition. The file =
must
-    be added to the image using --disk-add-file=3DFILE:CONTENT.
-
-For a detailed help on available options, please use:
-`xenguest-mkimage OPERATION --help`
-
diff --git a/meta-arm-autonomy/documentation/xenguest-network.md b/meta-arm=
-autonomy/documentation/xenguest-network.md
deleted file mode 100644
index dad2698..0000000
--- a/meta-arm-autonomy/documentation/xenguest-network.md
+++ /dev/null
@@ -1,80 +0,0 @@
-Xenguest Network
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-
-Introduction
-------------
-
-The xenguest-network package is primarly creating a network bridge to shar=
e
-the host eth physical interfaces with the guests virtual interfaces (vif).
-This way the guests can have access to the external network.
-
-At the moment 3 types of network arrangements are provided:
-
-- Bridge: where the guest vif is added to the created bridge interface;
-
-- NAT: where a private subnet is created for the guest,
-  a kea dhcp4 server is started on the host to serve the guest
-  and the proper iptables rules are created
-  to allow the guest to access the external network;
-
-- None: the guest vif is not connected to the bridge.
-
-Usage
------
-
-On the host project the package xenguest-network must be included in your
-image, and on the guest project the XENGUEST_NETWORK_TYPE needs to be set =
to
-"bridge", "nat" or "none".
-
-Bitbake parameters
-------------------
-
-Several parameters are available to configure the xenguest network bridge
-during Yocto project compilation (those can be set in your project local.c=
onf
-or xenguest-network.bbappend, for example).
-
-The following parameters are available:
-
-- XENGUEST_NETWORK_BRIDGE_NAME: This variable defines the name of the netw=
ork
-  bridge that is created on the host during init.
-  This is set by default to "xenbr0".
-
-- XENGUEST_NETWORK_BRIDGE_MEMBERS: This variable defines the list of the
-  physical network interfaces that are added to the bridge when it is crea=
ted
-  on the host during init.
-  By default no physical interfaces are added.
-
-- XENGUEST_NETWORK_BRIDGE_CONFIG: This variable defines the configuration =
file
-  to use to configure the bridge network. By default it points to have fil=
e
-  configuring the network using dhcp.
-  You can provide a different file using a bbappend and make this variable
-  point to it if you want to customize your network configuration.
-
-- XENGUEST_IMAGE_NETWORK_TYPE: This variable can be set to "bridge" (defau=
lt),
-  "nat" or "none".
-  The **bridge** type will add the domU vif interface to a bridge which al=
so
-  contains the dom0 physical interface giving the guest direct access to t=
he
-  external network.
-  The **nat** type will setup a private network between dom0 and domU, set=
up
-  the appropriate routing table, configure and run the kea dhcp4 server
-  on dom0 to serve the domU and apply the iptables rules to allow the gues=
t
-  to acess the external network. The kea dhcp4 server configuration for
-  the guest can be customised by replacing the
-  "meta-arm-autonomy/recipes-extended/xenguest/files/kea-subnet4.json" fil=
e
-  in a xenguest-network.bbappend. The kea-subnet4.json file is installed i=
n
-  the xenguest image and copied to
-  "/etc/xenguest/guests/${guestname}/files/kea-subnet4.json" when the gues=
t
-  image is created. It will be consumed by the
-  "/etc/xen/scripts/vif-post.d/00-vif-xenguest.hook" script which is calle=
d by
-  "/etc/xen/scripts/vif-nat" script when starting/stopping the xenguest.
-  After guest start, "/etc/xenguest/init.post/xenguest-network-init-post.s=
h"
-  script is called to reload kea dhcp4 server with updated configuration,
-  after virtual network interface is ready.
-  In the guest project, the NAT port forward can be customised by changing
-  the XENGUEST_IMAGE_HOST_PORT (default: "1000 + ${domid}") and
-  XENGUEST_IMAGE_GUEST_PORT (default: "22") variables in local.conf or
-  xenguest-base-image.bbappend. This configuration is implemented and inst=
alled
-  in "/etc/xenguest/guests/${guestname}/files/00-xenguest-nat-port-forward=
.hook"
-  script which is called by "/etc/xen/scripts/vif-post.d/00-vif-xenguest.h=
ook".
-  The **none** type will not affect any networking setting between on dom0=
 and
-  domU.
diff --git a/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/conf/machine/arm=
-autonomy-machine-extra-settings.inc b/meta-arm-autonomy/dynamic-layers/met=
a-arm-bsp/conf/machine/arm-autonomy-machine-extra-settings.inc
deleted file mode 100644
index 44930c9..0000000
--- a/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/conf/machine/arm-autono=
my-machine-extra-settings.inc
+++ /dev/null
@@ -1,7 +0,0 @@
-# Require extra machine specific settings
-ARM_BSP_DYN_MACHINE_EXTRA_REQUIRE ?=3D ""
-ARM_BSP_DYN_MACHINE_EXTRA_REQUIRE:n1sdp =3D "n1sdp-extra-settings.inc"
-ARM_BSP_DYN_MACHINE_EXTRA_REQUIRE:fvp-base =3D "fvp-base-extra-settings.in=
c"
-ARM_BSP_DYN_MACHINE_EXTRA_REQUIRE:juno =3D "juno-extra-settings.inc"
-
-require ${ARM_BSP_DYN_MACHINE_EXTRA_REQUIRE}
diff --git a/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/conf/machine/fvp=
-base-extra-settings.inc b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/co=
nf/machine/fvp-base-extra-settings.inc
deleted file mode 100644
index 54544ed..0000000
--- a/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/conf/machine/fvp-base-e=
xtra-settings.inc
+++ /dev/null
@@ -1,39 +0,0 @@
-# Extra machine settings for fvp-base
-
-# FVP uses vda as hard drive and partition 1 is the
-# default rootfs, so use vda2 for guest lvm
-XENGUEST_MANAGER_VOLUME_DEVICE ?=3D "/dev/vda2"
-
-# We need to extend the wks search path to be able to find the wks file se=
t in
-# ARM_AUTONOMY_WKS_FILE.
-WKS_SEARCH_PATH:prepend :=3D "${ARM_AUTONOMY_ARM_BSP_DYNAMIC_DIR}/wic:"
-
-ARM_AUTONOMY_WKS_FILE ?=3D "arm-autonomy-fvp-base-disk.wks.in"
-# set wks file only if INITRAMFS_IMAGE_BUNDLE is not set
-WKS_FILE =3D "${@bb.utils.contains('INITRAMFS_IMAGE_BUNDLE', '1', '',\
-                                 '${ARM_AUTONOMY_WKS_FILE}', d)}"
-
-XEN_FILE ?=3D "xen-fvp-base"
-DTB_FILE ?=3D "${@ get_xen_dtb_filename(d)}"
-XEN_ADDR ?=3D "0x84000000"
-DTB_ADDR ?=3D "0x83000000"
-
-FVP_DATA    +=3D "cluster0.cpu0=3D${DEPLOY_DIR_IMAGE}/${XEN_FILE}@${XEN_AD=
DR} \
-                cluster0.cpu0=3D${DEPLOY_DIR_IMAGE}/${DTB_FILE}@${DTB_ADDR=
}"
-
-# Set the wks guest partition size and unit. It must be aligned with the s=
um of
-# all XENGUEST_IMAGE_DISK_SIZE set for the guests. By default, LVM2 metada=
ta is
-# 1 MiB per physical volume, hence it needs to be taken into account when
-# setting GUEST_PART_SIZE. The XENGUEST_IMAGE_DISK_SIZE default value is 4=
GiB.
-GUEST_PART_SIZE ?=3D "4097"
-GUEST_PART_SIZE_UNIT ?=3D "M"
-
-XENGUEST_NETWORK_BRIDGE_MEMBERS ?=3D "eth0"
-
-# This function uses the "KERNEL_DEVICETREE" variable and manipulates it t=
o
-# return the xen kernel device tree file name.
-def get_xen_dtb_filename(d):
-    kernel_dtb_filename =3D d.getVar('KERNEL_DEVICETREE',d)
-    xen_dtb_filename =3D os.path.splitext(os.path.basename(kernel_dtb_file=
name))[0] + '-xen.dtb'
-    return xen_dtb_filename
-
diff --git a/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/conf/machine/jun=
o-extra-settings.inc b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/conf/m=
achine/juno-extra-settings.inc
deleted file mode 100644
index 6255c98..0000000
--- a/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/conf/machine/juno-extra=
-settings.inc
+++ /dev/null
@@ -1,26 +0,0 @@
-# Extra machine settings for juno
-KERNEL_ALT_IMAGETYPE =3D "Image.lzma"
-
-# Juno board has 2 network interfaces, add both of them to the bridge
-XENGUEST_NETWORK_BRIDGE_MEMBERS ?=3D "eth0 eth1"
-XEN_DEVICETREE_DOM0_SIZE ?=3D "0x02400000"
-
-# We need to extend the wks search path to be able to find the wks file se=
t in
-# ARM_AUTONOMY_WKS_FILE.
-WKS_SEARCH_PATH:prepend :=3D "${ARM_AUTONOMY_ARM_BSP_DYNAMIC_DIR}/wic:"
-
-ARM_AUTONOMY_WKS_FILE ?=3D "arm-autonomy-juno-disk.wks.in"
-# set wks file only if INITRAMFS_IMAGE_BUNDLE is not set
-WKS_FILE =3D "${@bb.utils.contains('INITRAMFS_IMAGE_BUNDLE', '1', '',\
-                                 '${ARM_AUTONOMY_WKS_FILE}', d)}"
-
-# Set the wks guest partition size and unit. It must be aligned with the s=
um of
-# all XENGUEST_IMAGE_DISK_SIZE set for the guests. By default, LVM2 metada=
ta is
-# 1 MiB per physical volume, hence it needs to be taken into account when
-# setting GUEST_PART_SIZE. The XENGUEST_IMAGE_DISK_SIZE default value is 4=
GiB.
-GUEST_PART_SIZE ?=3D "4097"
-GUEST_PART_SIZE_UNIT ?=3D "M"
-
-# set wic image type only if INITRAMFS_IMAGE_BUNDLE is not set
-IMAGE_FSTYPES +=3D "${@bb.utils.contains('INITRAMFS_IMAGE_BUNDLE', '1', ''=
,\
-                                       'wic wic.gz wic.bmap', d)}"
diff --git a/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/conf/machine/n1s=
dp-extra-settings.inc b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/conf/=
machine/n1sdp-extra-settings.inc
deleted file mode 100644
index c2916b8..0000000
--- a/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/conf/machine/n1sdp-extr=
a-settings.inc
+++ /dev/null
@@ -1,94 +0,0 @@
-# Extra machine settings for n1sdp
-
-# We need to extent the wks search path to be able to find the wks file se=
t in
-# ARM_AUTONOMY_WKS_FILE.
-WKS_SEARCH_PATH:prepend :=3D "${ARM_AUTONOMY_ARM_BSP_DYNAMIC_DIR}/wic:"
-
-ARM_AUTONOMY_WKS_FILE ?=3D "arm-autonomy-n1sdp-efidisk.wks.in"
-WKS_FILE =3D "${ARM_AUTONOMY_WKS_FILE}"
-
-# Set the wks guest partition size and unit. It must be aligned with the s=
um of
-# all XENGUEST_IMAGE_DISK_SIZE set for the guests. By default, LVM2 metada=
ta is
-# 1 MiB per physical volume, hence it needs to be taken into account when
-# setting GUEST_PART_SIZE. The XENGUEST_IMAGE_DISK_SIZE default value is 4=
GiB.
-GUEST_PART_SIZE ?=3D "4097"
-GUEST_PART_SIZE_UNIT ?=3D "M"
-
-# Set default boot partition size and unit
-BOOT_PART_SIZE ?=3D "100"
-BOOT_PART_SIZE_UNIT ?=3D "M"
-
-# The GRUB_CFG_FILE affects arm-autonomy-n1sdp-efidisk.wks.in file
-#
-# When alternate-kernel DISTRO_FEATURE is present we set the
-# arm-autonomy-n1sdp-rt-grub.cfg by default. This GRUB config file has
-# additional entries for booting with the PREEMPT_RT kernel.
-GRUB_CFG_FILE ?=3D "${@bb.utils.contains('DISTRO_FEATURES','alternate-kern=
el', \
-                     '${ARM_AUTONOMY_ARM_BSP_DYNAMIC_DIR}/wic/arm-autonomy=
-n1sdp-rt-grub.cfg', \
-                     '${ARM_AUTONOMY_ARM_BSP_DYNAMIC_DIR}/wic/arm-autonomy=
-n1sdp-grub.cfg' \
-                     , d)}"
-
-# From arm-autonomy-n1sdp-efidisk.wks.in, the /boot partition is /dev/sda1=
, and
-# the "/" partition is /dev/sda2.
-XENGUEST_MANAGER_VOLUME_DEVICE ?=3D "/dev/sda3"
-
-XENGUEST_NETWORK_BRIDGE_MEMBERS ?=3D "eth0"
-
-# The XEN_DEVICETREE_DEPEND and XEN_DEVICETREE_DTBS variables aftect the
-# xen-devicetree.bb recipe
-XEN_DEVICETREE_DEPEND =3D "virtual/trusted-firmware-a:do_deploy"
-XEN_DEVICETREE_DTBS ?=3D "n1sdp-single-chip.dtb"
-# XEN_MOD_DEVICETREE_DTBS are the generated devicetrees for Xen. By defaul=
t the
-# xen-devicetree.bb recipe adds '-xen' suffix to it
-XEN_MOD_DEVICETREE_DTBS ?=3D "n1sdp-single-chip-xen.dtb"
-
-# When generating the wic image we need to have the xen deployed
-do_image_wic[depends] +=3D "xen:do_deploy"
-
-# Select the extra files to be included in the boot partition
-IMAGE_EFI_BOOT_FILES +=3D "xen-n1sdp.efi;xen.efi"
-IMAGE_EFI_BOOT_FILES +=3D "${XEN_MOD_DEVICETREE_DTBS}"
-
-# When alternate-kernel DISTRO_FEATURE is present we set the linux-yocto-r=
t
-# by default
-PREFERRED_PROVIDER_alternate/kernel ?=3D "\
-${@bb.utils.contains('DISTRO_FEATURES', 'alternate-kernel', \
-'linux-yocto-rt', '', d)}"
-
-KERNEL_PACKAGE_NAME_alternate/kernel ?=3D "kernel-rt"
-# When alternate-kernel DISTRO_FEATURE is present we set the kernel-rt by
-# default
-KERNEL_PACKAGE_NAME:pn-linux-yocto-rt =3D "\
-${@ d.getVar('KERNEL_PACKAGE_NAME_alternate/kernel') \
-if bb.utils.contains('DISTRO_FEATURES', 'alternate-kernel', True, False, d=
) \
-else 'kernel' }"
-
-# Relative path from DEPLOY_DIR_IMAGE of the Kernel PREEMPT_RT deployed Im=
age
-KERNEL_RT_IMAGE ?=3D "kernel-rt/Image-n1sdp.bin;Image-preempt-rt"
-# Only include the Kernel PREEMPT_RT Image if we are building with
-# alternate-kernel DISTRO_FEATURE
-IMAGE_EFI_BOOT_FILES +=3D "\
-${@ d.getVar('KERNEL_RT_IMAGE',d) or '' \
-if bb.utils.contains('DISTRO_FEATURES', 'alternate-kernel', True, False, d=
) and \
-d.getVar('PREFERRED_PROVIDER_alternate/kernel') else ''}"
-
-
-EFIDIR ?=3D "/EFI/BOOT"
-GRUB_CFG_EXTRA_FILE ?=3D "${ARM_AUTONOMY_ARM_BSP_DYNAMIC_DIR}/wic/arm-auto=
nomy-n1sdp-grub.cfg;.${EFIDIR}}"
-
-# When alternate-kernel DISTRO_FEATURE is present we set the
-# arm-autonomy-n1sdp-rt-grub.cfg by default. This GRUB config file has
-# additional entries for booting with the PREEMPT_RT kernel and also inclu=
des
-# the main GRUB config file set by GRUB_CFG_EXTRA_FILE.
-IMAGE_EFI_BOOT_FILES +=3D "\
-${@ d.getVar('GRUB_CFG_EXTRA_FILE',d) or '' \
-if bb.utils.contains('DISTRO_FEATURES', 'alternate-kernel', True, False, d=
) and \
-d.getVar('PREFERRED_PROVIDER_alternate/kernel') else ''}"
-
-# Additionnal kernel modules are necessary for n1sdp to be able to mount F=
AT
-# filesystems using CP437.
-MACHINE_ESSENTIAL_EXTRA_RDEPENDS:append =3D " kernel-module-nls-cp437 kern=
el-module-nls-iso8859-1"
-
-# '-mcpu=3D' and '-march=3D' conflicts for xen build
-# lets not set '-march=3D' and let xen to overwrite '-mcpu=3D'
-TUNE_CCARGS:remove:pn-xen =3D "${TUNE_CCARGS_MARCH}${TUNE_CCARGS_MARCH_OPT=
S}"
diff --git a/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-bsp/imag=
es/firmware-image-juno.bbappend b/meta-arm-autonomy/dynamic-layers/meta-arm=
-bsp/recipes-bsp/images/firmware-image-juno.bbappend
deleted file mode 100644
index 324c0c5..0000000
--- a/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-bsp/images/firm=
ware-image-juno.bbappend
+++ /dev/null
@@ -1,50 +0,0 @@
-# Use OVERRIDES to minimize the usage of
-# ${@bb.utils.contains('DISTRO_FEATURES', 'autonomy-host', ...
-OVERRIDES:append =3D "${ARM_AUTONOMY_HOST_OVERRIDES}"
-
-FILESEXTRAPATHS:prepend:autonomy-host :=3D "${THISDIR}/${PN}:"
-
-DEPENDS:append:autonomy-host =3D " dos2unix-native"
-
-SRC_URI:append:autonomy-host =3D " file://add-xen-support.patch;patchdir=
=3D../"
-
-do_install:append:autonomy-host() {
-    mv -v ${D}/${UNPACK_DIR}/SOFTWARE/uEnv.txt \
-          ${D}/${UNPACK_DIR}/SOFTWARE/uenvfile
-    for dir in $(ls ${D}/${UNPACK_DIR}/SITE1/)
-    do
-        unix2dos ${D}/${UNPACK_DIR}/SITE1/${dir}/images.txt
-    done
-}
-
-DEPLOY_EXTRA_DEPS ??=3D ""
-DEPLOY_EXTRA_DEPS:autonomy-host =3D "xen:do_deploy xen-devicetree:do_deplo=
y"
-
-do_deploy[depends] +=3D "${DEPLOY_EXTRA_DEPS}"
-
-do_deploy:prepend:autonomy-host() {
-    # To avoid dependency loop between firmware-image-juno:do_install,
-    # xen:do_deploy and xen-devicetree:do_deploy when
-    # INITRAMFS_IMAGE_BUNDLE =3D "1", we need to handle the xen and
-    # xen-devicetree binaries copying in the do_deploy task.
-
-    mkdir -p ${D}/${UNPACK_DIR}/SOFTWARE/XEN
-    cp  -v ${DEPLOY_DIR_IMAGE}/xen-${COMPATIBLE_MACHINE}.efi \
-        ${D}/${UNPACK_DIR}/SOFTWARE/XEN/xen
-
-    for dtb in $(basename -s .dtb ${KERNEL_DEVICETREE})
-    do
-        cp -v ${DEPLOY_DIR_IMAGE}/${dtb}-xen.dtb \
-            ${D}/${UNPACK_DIR}/SOFTWARE/XEN/${dtb}.dtb
-    done
-
-    bbnote "Xen binaries added under SOFTWARE/XEN directory"
-
-    if [ "${INITRAMFS_IMAGE_BUNDLE}" !=3D "1" -a "${KERNEL_ALT_IMAGETYPE}"=
 =3D "Image.lzma" ]; then
-        # KERNEL_ALT_IMAGETYPE is expected to be Image.lzma,
-        # however NOR flash filesystem is DOS compatible with 8.3 naming,
-        # so we need to replace ".lzma" with ".lzm"
-        cp -L -f ${DEPLOY_DIR_IMAGE}/${KERNEL_ALT_IMAGETYPE} \
-                 ${D}/${UNPACK_DIR}/SOFTWARE/Image.lzm
-    fi
-}
diff --git a/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-bsp/imag=
es/firmware-image-juno/add-xen-support.patch b/meta-arm-autonomy/dynamic-la=
yers/meta-arm-bsp/recipes-bsp/images/firmware-image-juno/add-xen-support.pa=
tch
deleted file mode 100644
index 29f1e06..0000000
--- a/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-bsp/images/firm=
ware-image-juno/add-xen-support.patch
+++ /dev/null
@@ -1,173 +0,0 @@
-arm-bsp/firmware-image-juno: add xen support
-
-This patch adds xen and dtbs binaries entries to images-r[012].txt files.
-These images-r[012].txt files contain NOR filesystem entries details,
-like file offset, name, path etc.
-
-It also adds customization for uEnv.txt file, that allows to autoboot xen.
-
-Upstream-Status: Inappropriate [configuration]
-Signed-off-by: Kamil Dziezyk <kamil.dziezyk@arm.com>
-
-diff -u a/images-r0.txt b/images-r0.txt
---- a/images-r0.txt	2020-11-25 20:25:38.677687712 +0100
-+++ b/images-r0.txt	2020-11-25 20:36:55.482194294 +0100
-@@ -1,7 +1,7 @@
- TITLE: Versatile Express Images Configuration File
-=20
- [IMAGES]
--TOTALIMAGES: 10                  ;Number of Images (Max: 32)
-+TOTALIMAGES: 11                  ;Number of Images (Max: 32)
-=20
- NOR0UPDATE: AUTO                 ;Image Update:NONE/AUTO/FORCE
- NOR0ADDRESS: 0x00000000          ;Image Flash Address
-@@ -17,14 +17,14 @@
-=20
- NOR2UPDATE: AUTO                 ;Image Update:NONE/AUTO/FORCE
- NOR2ADDRESS: 0x00500000          ;Image Flash Address
--NOR2FILE: \SOFTWARE\Image        ;Image File Name
--NOR2NAME: norkern                ;Rename kernel to norkern
-+NOR2FILE: \SOFTWARE\Image.lzm    ;Image File Name
-+NOR2NAME: norkern.lzm            ;Rename kernel to norkern.lzm
- NOR2LOAD: 00000000               ;Image Load Address
- NOR2ENTRY: 00000000              ;Image Entry Point
-=20
- NOR3UPDATE: AUTO                 ;Image Update:NONE/AUTO/FORCE
- NOR3ADDRESS: 0x02900000          ;Image Flash Address
--NOR3FILE: \SOFTWARE\juno.dtb     ;Image File Name
-+NOR3FILE: \SOFTWARE\XEN\juno.dtb ;Image File Name
- NOR3NAME: board.dtb              ;Specify target filename to preserve fil=
e extension
- NOR3LOAD: 00000000               ;Image Load Address
- NOR3ENTRY: 00000000              ;Image Entry Point
-@@ -64,8 +64,13 @@
- NOR9UPDATE: AUTO                 ;Image Update:NONE/AUTO/FORCE
- NOR9ADDRESS: 0x02A80000          ;Image Flash Address
- NOR9NAME: uEnv.txt
--NOR9FILE: \SOFTWARE\uEnv.txt     ;Image File Name
-+NOR9FILE: \SOFTWARE\uenvfile     ;Image File Name
- NOR9LOAD: 00000000               ;Image Load Address
- NOR9ENTRY: 00000000              ;Image Entry Point
-=20
--
-+NOR10UPDATE: AUTO                ;Image Update:NONE/AUTO/FORCE
-+NOR10ADDRESS: 0x03000000         ;Image Flash Address
-+NOR10FILE: \SOFTWARE\XEN\xen     ;Image File Name
-+NOR10NAME: xen
-+NOR10LOAD: 00000000              ;Image Load Address
-+NOR10ENTRY: 00000000             ;Image Entry Point
-diff -u a/images-r1.txt b/images-r1.txt
---- a/images-r1.txt	2020-11-25 20:40:19.005177152 +0100
-+++ b/images-r1.txt	2020-11-25 20:41:17.500886263 +0100
-@@ -1,7 +1,7 @@
- TITLE: Versatile Express Images Configuration File
-=20
- [IMAGES]
--TOTALIMAGES: 10                  ;Number of Images (Max: 32)
-+TOTALIMAGES: 11                  ;Number of Images (Max: 32)
-=20
- NOR0UPDATE: AUTO                 ;Image Update:NONE/AUTO/FORCE
- NOR0ADDRESS: 0x00000000          ;Image Flash Address
-@@ -17,14 +17,14 @@
-=20
- NOR2UPDATE: AUTO                 ;Image Update:NONE/AUTO/FORCE
- NOR2ADDRESS: 0x00500000          ;Image Flash Address
--NOR2FILE: \SOFTWARE\Image        ;Image File Name
--NOR2NAME: norkern                ;Rename kernel to norkern
-+NOR2FILE: \SOFTWARE\Image.lzm    ;Image File Name
-+NOR2NAME: norkern.lzm            ;Rename kernel to norkern.lzm
- NOR2LOAD: 00000000               ;Image Load Address
- NOR2ENTRY: 00000000              ;Image Entry Point
-=20
- NOR3UPDATE: AUTO                 ;Image Update:NONE/AUTO/FORCE
- NOR3ADDRESS: 0x02900000          ;Image Flash Address
--NOR3FILE: \SOFTWARE\juno-r1.dtb  ;Image File Name
-+NOR3FILE: \SOFTWARE\XEN\juno-r1.dtb ;Image File Name
- NOR3NAME: board.dtb              ;Specify target filename to preserve fil=
e extension
- NOR3LOAD: 00000000               ;Image Load Address
- NOR3ENTRY: 00000000              ;Image Entry Point
-@@ -64,8 +64,13 @@
- NOR9UPDATE: AUTO                 ;Image Update:NONE/AUTO/FORCE
- NOR9ADDRESS: 0x02A80000          ;Image Flash Address
- NOR9NAME: uEnv.txt
--NOR9FILE: \SOFTWARE\uEnv.txt     ;Image File Name
-+NOR9FILE: \SOFTWARE\uenvfile     ;Image File Name
- NOR9LOAD: 00000000               ;Image Load Address
- NOR9ENTRY: 00000000              ;Image Entry Point
-=20
--
-+NOR10UPDATE: AUTO                ;Image Update:NONE/AUTO/FORCE
-+NOR10ADDRESS: 0x03000000         ;Image Flash Address
-+NOR10FILE: \SOFTWARE\XEN\xen     ;Image File Name
-+NOR10NAME: xen
-+NOR10LOAD: 00000000              ;Image Load Address
-+NOR10ENTRY: 00000000             ;Image Entry Point
-diff -u a/images-r2.txt b/images-r2.txt
---- a/images-r2.txt	2020-11-25 20:40:30.625119321 +0100
-+++ b/images-r2.txt	2020-11-25 20:41:30.720820597 +0100
-@@ -1,7 +1,7 @@
- TITLE: Versatile Express Images Configuration File
-=20
- [IMAGES]
--TOTALIMAGES: 10                  ;Number of Images (Max: 32)
-+TOTALIMAGES: 11                  ;Number of Images (Max: 32)
-=20
- NOR0UPDATE: AUTO                 ;Image Update:NONE/AUTO/FORCE
- NOR0ADDRESS: 0x00000000          ;Image Flash Address
-@@ -17,14 +17,14 @@
-=20
- NOR2UPDATE: AUTO                 ;Image Update:NONE/AUTO/FORCE
- NOR2ADDRESS: 0x00500000          ;Image Flash Address
--NOR2FILE: \SOFTWARE\Image        ;Image File Name
--NOR2NAME: norkern                ;Rename kernel to norkern
-+NOR2FILE: \SOFTWARE\Image.lzm    ;Image File Name
-+NOR2NAME: norkern.lzm            ;Rename kernel to norkern.lzm
- NOR2LOAD: 00000000               ;Image Load Address
- NOR2ENTRY: 00000000              ;Image Entry Point
-=20
- NOR3UPDATE: AUTO                 ;Image Update:NONE/AUTO/FORCE
- NOR3ADDRESS: 0x02900000          ;Image Flash Address
--NOR3FILE: \SOFTWARE\juno-r2.dtb  ;Image File Name
-+NOR3FILE: \SOFTWARE\XEN\juno-r2.dtb ;Image File Name
- NOR3NAME: board.dtb              ;Specify target filename to preserve fil=
e extension
- NOR3LOAD: 00000000               ;Image Load Address
- NOR3ENTRY: 00000000              ;Image Entry Point
-@@ -64,8 +64,13 @@
- NOR9UPDATE: AUTO                 ;Image Update:NONE/AUTO/FORCE
- NOR9ADDRESS: 0x02A80000          ;Image Flash Address
- NOR9NAME: uEnv.txt
--NOR9FILE: \SOFTWARE\uEnv.txt     ;Image File Name
-+NOR9FILE: \SOFTWARE\uenvfile     ;Image File Name
- NOR9LOAD: 00000000               ;Image Load Address
- NOR9ENTRY: 00000000              ;Image Entry Point
-=20
--
-+NOR10UPDATE: AUTO                ;Image Update:NONE/AUTO/FORCE
-+NOR10ADDRESS: 0x03000000         ;Image Flash Address
-+NOR10FILE: \SOFTWARE\XEN\xen     ;Image File Name
-+NOR10NAME: xen
-+NOR10LOAD: 00000000              ;Image Load Address
-+NOR10ENTRY: 00000000             ;Image Entry Point
-diff -u a/uEnv.txt b/uEnv.txt
---- a/uEnv.txt	2020-11-20 13:48:31.845078690 +0100
-+++ b/uEnv.txt	2020-11-25 20:30:00.572306675 +0100
-@@ -1,11 +1,16 @@
-+xen_name=3Dxen
-+xen_addr=3D0x84000000
- uenvcmd=3Drun mybootcmd
-+kernel_alt_name=3Dnorkern.lzm
-+kernel_comp_addr_r=3D0x88080000
- mybootcmd=3Decho Loading custom boot command; \
- echo Loading kernel; \
- afs load ${kernel_name} ${kernel_addr_r} ; \
--if test $? -eq 1; then echo Loading ${kernel_alt_name} instead of ${kerne=
l_name}; afs load ${kernel_alt_name} ${kernel_addr_r}; fi; \
-+if test $? -eq 1; then echo Loading ${kernel_alt_name} instead of ${kerne=
l_name}; afs load ${kernel_alt_name} ${kernel_comp_addr_r}; lzmadec ${kerne=
l_comp_addr_r} ${kernel_addr_r}; fi; \
- echo Loading device tree; \
- afs load  ${fdtfile} ${fdt_addr_r}; \
- if test $? -eq 1; then echo Loading ${fdt_alt_name} instead of ${fdtfile}=
; \
- afs load ${fdt_alt_name} ${fdt_addr_r}; fi; fdt addr ${fdt_addr_r}; fdt r=
esize; \
--booti ${kernel_addr_r} - ${fdt_addr_r};
--
-+echo Loading Xen; \
-+afs load  ${xen_name} ${xen_addr}; \
-+if test $? -eq 0; then echo Booting Xen; bootefi ${xen_addr} ${fdt_addr_r=
}; fi;
-
diff --git a/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-bsp/u-bo=
ot/u-boot/fvp-base/xen_u-boot_kernel_addr.patch b/meta-arm-autonomy/dynamic=
-layers/meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-base/xen_u-boot_kernel_a=
ddr.patch
deleted file mode 100644
index 6ea7afa..0000000
--- a/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-bsp/u-boot/u-bo=
ot/fvp-base/xen_u-boot_kernel_addr.patch
+++ /dev/null
@@ -1,16 +0,0 @@
-Upstream-Status: Inappropriate [meta-arm-autonomy specific u-boot config]
-Signed-off-by: Nathan Dunne <nathan.dunne@arm.com>
-
-diff --git a/include/configs/vexpress_aemv8a.h b/include/configs/vexpress_=
aemv8a.h
-index e63c335f85..9ee050a4a6 100644
---- a/include/configs/vexpress_aemv8a.h
-+++ b/include/configs/vexpress_aemv8a.h
-@@ -162,7 +162,7 @@
- #elif CONFIG_TARGET_VEXPRESS64_BASE_FVP
- #define CONFIG_EXTRA_ENV_SETTINGS	\
- 				"kernel_name=3DImage\0"		\
--				"kernel_addr=3D0x80080000\0"	\
-+				"kernel_addr=3D0x84000000\0"	\
- 				"initrd_name=3Dramdisk.img\0"	\
- 				"initrd_addr=3D0x88000000\0"	\
- 				"fdtfile=3Ddevtree.dtb\0"		\
diff --git a/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-bsp/u-bo=
ot/u-boot_%.bbappend b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipe=
s-bsp/u-boot/u-boot_%.bbappend
deleted file mode 100644
index 7409213..0000000
--- a/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-bsp/u-boot/u-bo=
ot_%.bbappend
+++ /dev/null
@@ -1,10 +0,0 @@
-# Use OVERRIDES to minimize the usage of
-# ${@bb.utils.contains('DISTRO_FEATURES', 'autonomy-host', ...
-OVERRIDES:append =3D "${ARM_AUTONOMY_HOST_OVERRIDES}"
-
-FILESEXTRAPATHS:prepend:autonomy-host:fvp-base :=3D "${THISDIR}/${PN}:"
-
-#
-# FVP BASE
-#
-SRC_URI:append:autonomy-host:fvp-base =3D " file://xen_u-boot_kernel_addr.=
patch"
diff --git a/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-extended=
/xen-devicetree/files/xen-juno.dtsi b/meta-arm-autonomy/dynamic-layers/meta=
-arm-bsp/recipes-extended/xen-devicetree/files/xen-juno.dtsi
deleted file mode 100644
index 0f9af21..0000000
--- a/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-extended/xen-de=
vicetree/files/xen-juno.dtsi
+++ /dev/null
@@ -1,11 +0,0 @@
-/*
- * Disable IOMMU on juno board when Xen is used
- */
-
-/ {
-
-	/* turn off iommu */
-	iommu@2b600000 {
-		status =3D "disabled";
-	};
-};
diff --git a/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-extended=
/xen-devicetree/files/xen-n1sdp.dtsi b/meta-arm-autonomy/dynamic-layers/met=
a-arm-bsp/recipes-extended/xen-devicetree/files/xen-n1sdp.dtsi
deleted file mode 100644
index e3c3294..0000000
--- a/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-extended/xen-de=
vicetree/files/xen-n1sdp.dtsi
+++ /dev/null
@@ -1,41 +0,0 @@
-/*
- * Modify N1SDP DTB to work properly when Xen is used
- */
-
-/ {
-
-    /*
-     * pmu is using PPI interrupts which are reserved by xen
-     * remove pm nodes
-     */
-    /delete-node/ pmu;
-    /delete-node/ spe-pmu;
-
-    soc {
-        /*
-         * disable IOMMU until we have a proper support in xen
-         */
-        /delete-node/ iommu@4f000000;
-        /delete-node/ iommu@4f400000;
-
-        /*
-         * Set extra registers required for PCI quirks to communicate with=
 SCP
-         * and remove invalid properties due to removal
-        */
-        pcie@68000000 {
-            reg =3D <0 0x68000000 0 0x1200000>,
-                    <0 0x06000000 0 0x80000>,
-                    <0 0x62000000 0 0x80000>;
-            /delete-property/ msi-map;
-            /delete-property/ iommu-map;
-        };
-
-        pcie@70000000 {
-            reg =3D <0 0x70000000 0 0x1200000>,
-                    <0 0x06000000 0 0x80000>,
-                    <0 0x60000000 0 0x80000>;
-            /delete-property/ msi-map;
-            /delete-property/ iommu-map;
-        };
-    };
-};
diff --git a/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-extended=
/xen-devicetree/xen-devicetree.bbappend b/meta-arm-autonomy/dynamic-layers/=
meta-arm-bsp/recipes-extended/xen-devicetree/xen-devicetree.bbappend
deleted file mode 100644
index 34e40b4..0000000
--- a/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-extended/xen-de=
vicetree/xen-devicetree.bbappend
+++ /dev/null
@@ -1,23 +0,0 @@
-# Platform dependent parameters
-
-FILESEXTRAPATHS:prepend :=3D "${THISDIR}/files:"
-
-# Add a dtb snippet to turn off iommu in dom0 on Juno board
-SRC_URI:append:juno =3D " file://xen-juno.dtsi"
-XEN_DEVICETREE_DTSI_MERGE:append:juno =3D " xen-juno.dtsi"
-
-# Add a dtb snippet to remove pmu and iommu in dom0 on N1SDP
-SRC_URI:append:n1sdp =3D " file://xen-n1sdp.dtsi"
-XEN_DEVICETREE_DTSI_MERGE:append:n1sdp =3D " xen-n1sdp.dtsi"
-# For N1SDP, the XEN_DEVICETREE_DEPEND and XEN_DEVICETREE_DTBS variables a=
re
-# being set in meta-arm-autonomy/dynamic-layers/meta-arm-bsp/conf/machine/=
n1sdp-extra-settings.inc
-
-# Board specific configs
-XEN_DEVICETREE_DOM0_BOOTARGS:append:juno =3D " root=3D/dev/sda1 rootwait"
-XEN_DEVICETREE_XEN_BOOTARGS:append:juno =3D " console=3Ddtuart dtuart=3Dse=
rial0 bootscrub=3D0 iommu=3Dno"
-
-XEN_DEVICETREE_DOM0_BOOTARGS:append:n1sdp =3D " root=3D/dev/sda2 rootwait"
-XEN_DEVICETREE_XEN_BOOTARGS:append:n1sdp =3D " console=3Ddtuart dtuart=3Ds=
erial0 bootscrub=3D0 iommu=3Dno"
-
-XEN_DEVICETREE_DOM0_BOOTARGS:append:fvp-base =3D " root=3D/dev/vda1"
-XEN_DEVICETREE_XEN_BOOTARGS:append:fvp-base =3D " console=3Ddtuart dtuart=
=3Dserial0 bootscrub=3D0"
diff --git a/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-extended=
/xen/files/fvp-base/early-printk.cfg b/meta-arm-autonomy/dynamic-layers/met=
a-arm-bsp/recipes-extended/xen/files/fvp-base/early-printk.cfg
deleted file mode 100644
index 590ae3a..0000000
--- a/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-extended/xen/fi=
les/fvp-base/early-printk.cfg
+++ /dev/null
@@ -1,2 +0,0 @@
-CONFIG_DEBUG=3Dy
-CONFIG_EARLY_PRINTK_FASTMODEL=3Dy
diff --git a/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-extended=
/xen/files/juno/early-printk.cfg b/meta-arm-autonomy/dynamic-layers/meta-ar=
m-bsp/recipes-extended/xen/files/juno/early-printk.cfg
deleted file mode 100644
index 35b4741..0000000
--- a/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-extended/xen/fi=
les/juno/early-printk.cfg
+++ /dev/null
@@ -1,2 +0,0 @@
-CONFIG_DEBUG=3Dy
-CONFIG_EARLY_PRINTK_JUNO=3Dy
diff --git a/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-extended=
/xen/files/n1sdp/early-printk.cfg b/meta-arm-autonomy/dynamic-layers/meta-a=
rm-bsp/recipes-extended/xen/files/n1sdp/early-printk.cfg
deleted file mode 100644
index 56ab0e2..0000000
--- a/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-extended/xen/fi=
les/n1sdp/early-printk.cfg
+++ /dev/null
@@ -1,3 +0,0 @@
-CONFIG_DEBUG=3Dy
-CONFIG_EARLY_UART_CHOICE_PL011=3Dy
-CONFIG_EARLY_UART_BASE_ADDRESS=3D0x2a400000
diff --git a/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-extended=
/xen/files/n1sdp/n1sdp.cfg b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/=
recipes-extended/xen/files/n1sdp/n1sdp.cfg
deleted file mode 100644
index d4d7c60..0000000
--- a/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-extended/xen/fi=
les/n1sdp/n1sdp.cfg
+++ /dev/null
@@ -1,5 +0,0 @@
-CONFIG_EXPERT=3Dy
-# Enable ACPI support
-CONFIG_ACPI=3Dy
-# Enable ARM Interrupt Translation Service (ITS) emulation
-CONFIG_HAS_ITS=3Dy
diff --git a/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-extended=
/xen/xen_%.bbappend b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes=
-extended/xen/xen_%.bbappend
deleted file mode 100644
index 1581ae6..0000000
--- a/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-extended/xen/xe=
n_%.bbappend
+++ /dev/null
@@ -1,15 +0,0 @@
-# FVP Base support
-COMPATIBLE_MACHINE:fvp-base =3D "fvp-base"
-FILESEXTRAPATHS:prepend:fvp-base :=3D "${THISDIR}/files:"
-SRC_URI:append:fvp-base =3D " file://early-printk.cfg"
-
-# Juno support
-COMPATIBLE_MACHINE:juno =3D "juno"
-FILESEXTRAPATHS:prepend:juno :=3D "${THISDIR}/files:"
-SRC_URI:append:juno =3D " file://early-printk.cfg"
-
-# N1SDP support
-COMPATIBLE_MACHINE:n1sdp =3D "n1sdp"
-FILESEXTRAPATHS:prepend:n1sdp :=3D "${THISDIR}/files:"
-SRC_URI:append:n1sdp =3D " file://n1sdp.cfg \
-                         file://early-printk.cfg"
diff --git a/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/wic/arm-autonomy=
-fvp-base-disk.wks.in b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/wic/a=
rm-autonomy-fvp-base-disk.wks.in
deleted file mode 100644
index 809a5c2..0000000
--- a/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/wic/arm-autonomy-fvp-ba=
se-disk.wks.in
+++ /dev/null
@@ -1,14 +0,0 @@
-# short-description: Create a disk image
-# long-description: Creates a partitioned disk image that the user
-# can directly dd to boot media.
-
-# For FVP Base first partition is rootfs normally populated as /dev/vda1
-part / --source rootfs --ondisk sda --fstype=3Dext4 --label root --align 1=
024
-
-# Second partition to accomodate guests images normally populated as /dev/=
vda2 (used by XENGUEST_MANAGER_VOLUME_DEVICE)
-part --label guests --source empty --ondisk sda --size=3D"${GUEST_PART_SIZ=
E}${GUEST_PART_SIZE_UNIT}" --system-id 8e --align 1024
-
-# Third partition is user defined entry normally populated as /dev/vda3
-${AUTONOMY_HOST_EXTRA_PARTITION}
-
-bootloader --ptable msdos
diff --git a/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/wic/arm-autonomy=
-juno-disk.wks.in b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/wic/arm-a=
utonomy-juno-disk.wks.in
deleted file mode 100644
index bfacb20..0000000
--- a/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/wic/arm-autonomy-juno-d=
isk.wks.in
+++ /dev/null
@@ -1,14 +0,0 @@
-# short-description: Create a disk image
-# long-description: Creates a partitioned disk image that the user
-# can directly dd to boot media.
-
-# For Juno first partition is rootfs normally populated as /dev/sda1
-part / --source rootfs --ondisk sda --fstype=3Dext4 --label root --align 1=
024
-
-# Second partition to accomodate guests images normally populated as /dev/=
sda2 (used by XENGUEST_MANAGER_VOLUME_DEVICE)
-part --label guests --source empty --ondisk sda --size=3D"${GUEST_PART_SIZ=
E}${GUEST_PART_SIZE_UNIT}" --system-id 8e --align 1024
-
-# Third partition is user defined entry normally populated as /dev/sda3
-${AUTONOMY_HOST_EXTRA_PARTITION}
-
-bootloader --ptable msdos
diff --git a/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/wic/arm-autonomy=
-n1sdp-efidisk.wks.in b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/wic/a=
rm-autonomy-n1sdp-efidisk.wks.in
deleted file mode 100644
index b48ec77..0000000
--- a/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/wic/arm-autonomy-n1sdp-=
efidisk.wks.in
+++ /dev/null
@@ -1,17 +0,0 @@
-# short-description: Create an EFI disk image
-# long-description: Creates a partitioned EFI disk image that the user
-# can directly dd to boot media. Uses a custom grub.cfg file to configure =
the boot.
-
-# First boot partition normally populated as /dev/sda1
-part /boot --source bootimg-efi --sourceparams=3D"loader=3Dgrub-efi" --ond=
isk sda --size=3D"${BOOT_PART_SIZE}${BOOT_PART_SIZE_UNIT}" --label msdos --=
active --align 1024
-
-# Second rootfs partition normally populated as /dev/sda2
-part / --source rootfs --ondisk sda --fstype=3Dext4 --label root --align 1=
024
-
-# Third partition to accomodate guests images normally populated as /dev/s=
da3 (used by XENGUEST_MANAGER_VOLUME_DEVICE)
-part --label guests --source empty --ondisk sda --size=3D"${GUEST_PART_SIZ=
E}${GUEST_PART_SIZE_UNIT}" --system-id 8e --align 1024
-
-# Fourth partition is user defined entry normally populated as /dev/sda4
-${AUTONOMY_HOST_EXTRA_PARTITION}
-
-bootloader --ptable msdos --configfile=3D"${GRUB_CFG_FILE}"
diff --git a/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/wic/arm-autonomy=
-n1sdp-grub.cfg b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/wic/arm-aut=
onomy-n1sdp-grub.cfg
deleted file mode 100644
index f4f8cd0..0000000
--- a/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/wic/arm-autonomy-n1sdp-=
grub.cfg
+++ /dev/null
@@ -1,28 +0,0 @@
-set term=3D"vt100"
-set default=3D"3"
-set timeout=3D"5"
-
-set kernel_cmdline=3D"earlycon=3Dpl011,0x2A400000 console=3DttyAMA0,115200=
 root=3D/dev/sda2 rootwait"
-
-menuentry 'N1SDP ACPI Boot' {
-    linux /Image $kernel_cmdline acpi=3Dforce
-}
-
-menuentry 'N1SDP Single-Chip Boot (Device Tree)' {
-    devicetree /n1sdp-single-chip.dtb
-    linux /Image $kernel_cmdline
-}
-
-menuentry 'N1SDP Multi-Chip Boot (Device Tree)' {
-    devicetree /n1sdp-multi-chip.dtb
-    linux /Image $kernel_cmdline
-}
-
-menuentry 'N1SDP Arm Autonomy (Xen) Single-Chip Boot (Device Tree)' {
-    # no_argumants under here is a workaround for a bug
-    # also any kernel or dom0 cmdline arguments has to be passed via dtb
-    # because any arguments put here will be ignored by xen
-    xen_hypervisor /xen.efi no_arguments=3Duse_dtb_for_xen_or_kernel_cmdli=
ne
-    xen_module /Image
-    devicetree /n1sdp-single-chip-xen.dtb
-}
diff --git a/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/wic/arm-autonomy=
-n1sdp-rt-grub.cfg b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/wic/arm-=
autonomy-n1sdp-rt-grub.cfg
deleted file mode 100644
index 31d0bbf..0000000
--- a/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/wic/arm-autonomy-n1sdp-=
rt-grub.cfg
+++ /dev/null
@@ -1,28 +0,0 @@
-set term=3D"vt100"
-set default=3D"3"
-set timeout=3D"5"
-
-source $prefix/arm-autonomy-n1sdp-grub.cfg
-
-menuentry 'N1SDP PREEMPT_RT ACPI Boot' {
-    linux /Image-preempt-rt $kernel_cmdline acpi=3Dforce
-}
-
-menuentry 'N1SDP PREEMPT_RT Single-Chip Boot (Device Tree)' {
-    devicetree /n1sdp-single-chip.dtb
-    linux /Image-preempt-rt $kernel_cmdline
-}
-
-menuentry 'N1SDP PREEMPT_RT Multi-Chip Boot (Device Tree)' {
-    devicetree /n1sdp-multi-chip.dtb
-    linux /Image-preempt-rt $kernel_cmdline
-}
-
-menuentry 'N1SDP PREEMPT_RT Arm Autonomy (Xen) Single-Chip Boot (Device Tr=
ee)' {
-    # no_argumants under here is a workaround for a bug
-    # also any kernel or dom0 cmdline arguments has to be passed via dtb
-    # because any arguments put here will be ignored by xen
-    xen_hypervisor /xen.efi no_arguments=3Duse_dtb_for_xen_or_kernel_cmdli=
ne
-    xen_module /Image-preempt-rt
-    devicetree /n1sdp-single-chip-xen.dtb
-}
diff --git a/meta-arm-autonomy/recipes-bsp/grub/grub-efi_%.bbappend b/meta-=
arm-autonomy/recipes-bsp/grub/grub-efi_%.bbappend
deleted file mode 100644
index 675acea..0000000
--- a/meta-arm-autonomy/recipes-bsp/grub/grub-efi_%.bbappend
+++ /dev/null
@@ -1,3 +0,0 @@
-OVERRIDES:append =3D "${ARM_AUTONOMY_HOST_OVERRIDES}"
-
-GRUB_BUILDIN:append:autonomy-host =3D " xen_boot"
diff --git a/meta-arm-autonomy/recipes-containers/import-docker-containers/=
files/import_containers.sh b/meta-arm-autonomy/recipes-containers/import-do=
cker-containers/files/import_containers.sh
deleted file mode 100755
index ad9664a..0000000
--- a/meta-arm-autonomy/recipes-containers/import-docker-containers/files/i=
mport_containers.sh
+++ /dev/null
@@ -1,70 +0,0 @@
-#!/bin/sh
-
-INSTALL_DIR=3D"###CONTAINERS_INSTALL_DIR###"
-MANIFEST=3D"${INSTALL_DIR}/###CONTAINERS_MANIFEST###"
-
-INIT_DIR=3D"/etc/init.d"
-DOCKER_INIT=3D"docker.init"
-
-find_docker_init() {
-    if [ -f "$INIT_DIR/$DOCKER_INIT" ]; then
-         $INIT_DIR/$DOCKER_INIT "start"
-    else
-        echo "ERROR: Couldn't find docker init script! ($INIT_DIR/$DOCKER_=
INIT)"
-        exit 1
-    fi
-}
-
-is_docker_started() {
-    if ! docker info > /dev/null 2>&1; then
-        find_docker_init
-    fi
-}
-
-check_manifest() {
-    if [ ! -f ${MANIFEST} ]; then
-        echo "No manifest found!"
-        exit 1
-    fi
-}
-
-has_docker_image() {
-    docker image inspect "$1" >/dev/null 2>&1
-}
-
-start() {
-    check_manifest
-    is_docker_started
-
-    while read -r archive name tag keep _; do
-
-        CONTAINER_IMAGE_NAME_AND_TAG=3D"${name}:${tag}"
-
-        # Image does not exist and image file exists: Import the image.
-        if ! has_docker_image "${CONTAINER_IMAGE_NAME_AND_TAG}" && \
-           [ -f "${INSTALL_DIR}/${archive}" ]; then
-            echo "Importing ${CONTAINER_IMAGE_NAME_AND_TAG} container imag=
e..."
-            docker import "${INSTALL_DIR}/${archive}" \
-                   "${CONTAINER_IMAGE_NAME_AND_TAG}" 2>&1 || {
-                echo "Import ${CONTAINER_IMAGE_NAME_AND_TAG} container ima=
ge: Failed."
-                exit $?
-            }
-            echo "Import ${CONTAINER_IMAGE_NAME_AND_TAG} container image: =
Done."
-
-            if [ "${keep}" !=3D "1" ]; then
-                rm "${INSTALL_DIR}/${archive}"
-            fi
-        fi
-    done < ${MANIFEST}
-}
-
-case "$1" in
-    start)
-        start && exit 0
-        ;;
-    *)
-        echo "Usage: $0 {start}"
-        exit 2
-esac
-
-exit $?
diff --git a/meta-arm-autonomy/recipes-containers/import-docker-containers/=
import-docker-containers.bb b/meta-arm-autonomy/recipes-containers/import-d=
ocker-containers/import-docker-containers.bb
deleted file mode 100644
index 04115f7..0000000
--- a/meta-arm-autonomy/recipes-containers/import-docker-containers/import-=
docker-containers.bb
+++ /dev/null
@@ -1,36 +0,0 @@
-#
-# This recipe adds an init script to import the containers added by
-# docker_extern_containers.bbclass at boot time
-# Notes:
-# docker_extern_containers.bbclass creates a manifest file which contains
-# the columns:   archive   name   tag   keep
-# for each container. This file is read by the import_containers
-# script to determine the parameters of the import
-#
-# Since the script needs knowledge of the values of $CONTAINERS_INSTALL_DI=
R
-# and $CONTAINERS_MANIFEST these are substituted for placeholder strings w=
hen
-# the script is installed.
-
-DESCRIPTION =3D "Add init script to import docker images at boot"
-LICENSE =3D "MIT"
-
-LIC_FILES_CHKSUM =3D "file://${COMMON_LICENSE_DIR}/MIT;md5=3D0835ade698e0b=
cf8506ecda2f7b4f302"
-
-inherit docker_extern_containers
-
-SRC_URI =3D "file://import_containers.sh"
-
-inherit update-rc.d
-INITSCRIPT_PARAMS =3D "start 30 2 3 4 5 ."
-INITSCRIPT_NAME =3D "import_containers.sh"
-
-S =3D "${WORKDIR}"
-do_install:append() {
-    install -d ${D}${sysconfdir}/init.d
-    install -m 755 import_containers.sh ${D}${sysconfdir}/init.d
-
-    sed -i "s,###CONTAINERS_INSTALL_DIR###,${CONTAINERS_INSTALL_DIR}," \
-           ${D}${sysconfdir}/init.d/import_containers.sh
-    sed -i "s,###CONTAINERS_MANIFEST###,${CONTAINERS_MANIFEST}," \
-           ${D}${sysconfdir}/init.d/import_containers.sh
-}
diff --git a/meta-arm-autonomy/recipes-containers/packagegroups/packagegrou=
p-docker-runtime-minimal.bb b/meta-arm-autonomy/recipes-containers/packageg=
roups/packagegroup-docker-runtime-minimal.bb
deleted file mode 100644
index f78cc9f..0000000
--- a/meta-arm-autonomy/recipes-containers/packagegroups/packagegroup-docke=
r-runtime-minimal.bb
+++ /dev/null
@@ -1,19 +0,0 @@
-# SPDX-License-Identifier: MIT
-#
-# Copyright (c) 2020 Arm Limited
-#
-
-SUMMARY =3D "Docker runtime minimal requirements"
-DESCRIPTION =3D "The minimal set of packages required for running Docker"
-
-inherit packagegroup
-
-RDEPENDS:${PN} =3D "\
-    docker-ce \
-    docker-ce-contrib \
-    kernel-module-xt-nat \
-    kernel-module-xt-masquerade \
-    kernel-module-xt-addrtype \
-    kernel-module-xt-conntrack \
-    kernel-module-xt-ipvs \
-   "
diff --git a/meta-arm-autonomy/recipes-core/busybox/busybox/feature_tar_lon=
g_options.cfg b/meta-arm-autonomy/recipes-core/busybox/busybox/feature_tar_=
long_options.cfg
deleted file mode 100644
index 151a3df..0000000
--- a/meta-arm-autonomy/recipes-core/busybox/busybox/feature_tar_long_optio=
ns.cfg
+++ /dev/null
@@ -1 +0,0 @@
-CONFIG_FEATURE_TAR_LONG_OPTIONS=3Dy
diff --git a/meta-arm-autonomy/recipes-core/busybox/busybox_%.bbappend b/me=
ta-arm-autonomy/recipes-core/busybox/busybox_%.bbappend
deleted file mode 100644
index 9bf929e..0000000
--- a/meta-arm-autonomy/recipes-core/busybox/busybox_%.bbappend
+++ /dev/null
@@ -1,8 +0,0 @@
-# Use OVERRIDES to minimize the usage of
-# ${@bb.utils.contains('DISTRO_FEATURES', 'arm-autonomy-host', ...
-OVERRIDES:append =3D "${ARM_AUTONOMY_HOST_OVERRIDES}"
-
-FILESEXTRAPATHS:prepend:autonomy-host :=3D "${THISDIR}/${PN}:"
-
-# The --exclude flag in Busybox tar is required by xenguest-mkimage
-SRC_URI:append:autonomy-host =3D " file://feature_tar_long_options.cfg"
diff --git a/meta-arm-autonomy/recipes-core/images/arm-autonomy-host-image-=
minimal.bb b/meta-arm-autonomy/recipes-core/images/arm-autonomy-host-image-=
minimal.bb
deleted file mode 100644
index 71ab5c2..0000000
--- a/meta-arm-autonomy/recipes-core/images/arm-autonomy-host-image-minimal=
.bb
+++ /dev/null
@@ -1,35 +0,0 @@
-# Recipe to create a minimal Arm Autonomy reference stack host image
-
-DESCRIPTION =3D "Arm Autonomy stack host minimal image"
-
-# When alternate-kernel DISTRO_FEATURE is present we will build
-# and install the alternate kernel
-inherit ${@bb.utils.filter('DISTRO_FEATURES', 'alternate-kernel', d)}
-
-inherit core-image features_check
-
-LICENSE =3D "MIT"
-LIC_FILES_CHKSUM =3D "file://${COMMON_LICENSE_DIR}/MIT;md5=3D0835ade698e0b=
cf8506ecda2f7b4f302"
-
-#=C2=A0Includes minimal set required to start and manage guest. The xen sp=
ecific
-# modules are not explicitly included as they are built as part of the ker=
nel
-# image for performance reasons. It doesn't include all kernel modules to
-# reduce the image size. If the kernel-modules packages are needed they ca=
n
-# be appended to IMAGE_INSTALL in a bbappend.
-IMAGE_INSTALL +=3D " \
-    packagegroup-core-boot \
-    packagegroup-core-ssh-openssh \
-    qemu-system-i386 \
-    xenguest-extern-guests \
-    xenguest-manager \
-    xenguest-network \
-    "
-
-# Build xen binary
-EXTRA_IMAGEDEPENDS +=3D "xen"
-
-# Build xen-devicetree to produce a xen ready devicetree
-EXTRA_IMAGEDEPENDS +=3D "xen-devicetree"
-
-REQUIRED_DISTRO_FEATURES +=3D 'arm-autonomy-host'
-REQUIRED_DISTRO_FEATURES +=3D 'xen'
diff --git a/meta-arm-autonomy/recipes-core/init-ifupdown/init-ifupdown_1.0=
.bbappend b/meta-arm-autonomy/recipes-core/init-ifupdown/init-ifupdown_1.0.=
bbappend
deleted file mode 100644
index 64c26a8..0000000
--- a/meta-arm-autonomy/recipes-core/init-ifupdown/init-ifupdown_1.0.bbappe=
nd
+++ /dev/null
@@ -1,20 +0,0 @@
-# Add support for interface configuration via interfaces.d directory. This
-# feature can be used by other packages to add network interface
-# configuration by adding network network interface configuration file und=
er
-# interfaces.d directory.
-
-OVERRIDES:append =3D "${ARM_AUTONOMY_HOST_OVERRIDES}"
-
-do_install:append:autonomy-host() {
-    # Add scan of interfaces.d to interfaces file
-    cp -f ${WORKDIR}/interfaces ${WORKDIR}/interfaces.subdir
-    echo "source-directory ${sysconfdir}/network/interfaces.d/" \
-        >> ${WORKDIR}/interfaces.subdir
-
-    # Create interfaces.d script in case nobody is adding a script
-    # so that there is no error about non existing directory
-    install -d -m 755 ${D}${sysconfdir}/network/interfaces.d
-
-    # Install our file instead of the original one
-    install -m 644 interfaces.subdir ${D}${sysconfdir}/network/interfaces
-}
diff --git a/meta-arm-autonomy/recipes-core/sysvinit/sysvinit-inittab_2.%.b=
bappend b/meta-arm-autonomy/recipes-core/sysvinit/sysvinit-inittab_2.%.bbap=
pend
deleted file mode 100644
index e30e964..0000000
--- a/meta-arm-autonomy/recipes-core/sysvinit/sysvinit-inittab_2.%.bbappend
+++ /dev/null
@@ -1,20 +0,0 @@
-# if arm-autonomy-host or arm-autonomy-guest are activated, we need to ins=
tall
-# the getty-wrapper to spawn the login console on /dev/hvc0.
-# This is normally done in meta-virtualization if virtualization and xen
-# DISTRO_FEATURES are activated.
-
-# In both arm-autonomy-host and arm-autonomy-guest we don't have virtualiz=
ation
-# in DISTRO_FEATURE. Hence, manually include sysvinit-inittab_virtualizati=
on.inc
-# to install the getty-wrapper.
-require ${@bb.utils.contains_any('DISTRO_FEATURES', \
-                                 'arm-autonomy-host arm-autonomy-guest', \
-                                 'recipes-core/sysvinit/sysvinit-inittab_v=
irtualization.inc', \
-                                 '', d)}
-
-# For arm-autonomy-guest we don't have xen in DISTRO_FEATURES. Hence, manu=
ally
-# include sysvinit-inittab_xen.inc to append the getty-wrapper entry to
-# /etc/inittab.
-require ${@bb.utils.contains('DISTRO_FEATURES', \
-                             'arm-autonomy-guest', \
-                             'recipes-core/sysvinit/sysvinit-inittab_xen.i=
nc', \
-                             '', d)}
diff --git a/meta-arm-autonomy/recipes-devtools/qemu/qemu-autonomy-host.inc=
 b/meta-arm-autonomy/recipes-devtools/qemu/qemu-autonomy-host.inc
deleted file mode 100644
index 20573cb..0000000
--- a/meta-arm-autonomy/recipes-devtools/qemu/qemu-autonomy-host.inc
+++ /dev/null
@@ -1,8 +0,0 @@
-# For Xen we only need the i386 binaries
-QEMU_TARGETS =3D "i386"
-
-PACKAGECONFIG[noaudio] =3D "--audio-drv-list=3D'',,"
-PACKAGECONFIG:append =3D " noaudio"
-PACKAGECONFIG:remove =3D "fdt sdl kvm"
-
-require recipes-devtools/qemu/qemu-package-split.inc
diff --git a/meta-arm-autonomy/recipes-devtools/qemu/qemu_%.bbappend b/meta=
-arm-autonomy/recipes-devtools/qemu/qemu_%.bbappend
deleted file mode 100644
index 0be5651..0000000
--- a/meta-arm-autonomy/recipes-devtools/qemu/qemu_%.bbappend
+++ /dev/null
@@ -1,3 +0,0 @@
-require ${@bb.utils.contains('DISTRO_FEATURES', \
-                             'arm-autonomy-host', \
-                             'qemu-autonomy-host.inc', '', d)}
diff --git a/meta-arm-autonomy/recipes-extended/xen-devicetree/files/xen.dt=
si.in b/meta-arm-autonomy/recipes-extended/xen-devicetree/files/xen.dtsi.in
deleted file mode 100644
index 42d12fa..0000000
--- a/meta-arm-autonomy/recipes-extended/xen-devicetree/files/xen.dtsi.in
+++ /dev/null
@@ -1,17 +0,0 @@
-/ {
-    chosen {
-        xen,dom0-bootargs =3D "###XEN_DOM0_BOOTARGS###";
-        xen,xen-bootargs =3D "###XEN_XEN_BOOTARGS###";
-
-        modules {
-            #size-cells =3D <0x00000001>;
-            #address-cells =3D <0x00000001>;
-
-            module@0 {
-                reg =3D <###XEN_DOM0_ADDR### ###XEN_DOM0_SIZE###>;
-                compatible =3D "multiboot,module";
-            };
-        };
-    };
-};
-
diff --git a/meta-arm-autonomy/recipes-extended/xen-devicetree/xen-devicetr=
ee.bb b/meta-arm-autonomy/recipes-extended/xen-devicetree/xen-devicetree.bb
deleted file mode 100644
index 223e237..0000000
--- a/meta-arm-autonomy/recipes-extended/xen-devicetree/xen-devicetree.bb
+++ /dev/null
@@ -1,130 +0,0 @@
-# This recipe can be used to modify one or several DTBS to add
-# entries required to declare and boot Linux as Dom0 from Xen
-
-SRC_URI =3D "file://xen.dtsi.in"
-
-LICENSE =3D "MIT"
-LIC_FILES_CHKSUM =3D "\
-    file://${COMMON_LICENSE_DIR}/MIT;md5=3D0835ade698e0bcf8506ecda2f7b4f30=
2 \
-    "
-
-S =3D "${WORKDIR}"
-
-DESCRIPTION =3D "Add entries in DTB for Xen and Dom0"
-
-# Please refer to documentation/xen-devicetree.md for documentation on the=
se
-# customizable parameters
-# kernel size is passed to xen via xen.dtb so we need to add
-# 'virtual/kernel:do_deploy' as a dependency
-XEN_DEVICETREE_DEPEND:append =3D " virtual/kernel:do_deploy"
-XEN_DEVICETREE_DTBS ?=3D "${KERNEL_DEVICETREE}"
-XEN_DEVICETREE_XEN_BOOTARGS ?=3D "noreboot dom0_mem=3D${XEN_DEVICETREE_DOM=
0_MEM}"
-XEN_DEVICETREE_DOM0_MEM ?=3D "1024M,max:1024M"
-XEN_DEVICETREE_DOM0_BOOTARGS ?=3D "console=3Dhvc0 earlycon=3Dxen"
-XEN_DEVICETREE_DOM0_ADDR ?=3D "0x80080000"
-XEN_DEVICETREE_DOM0_SIZE ?=3D "0x01000000"
-XEN_DEVICETREE_DTSI_MERGE ?=3D "xen.dtsi"
-
-# Our package does not generate any packages for the rootfs, but instead
-# contributes to deploy
-inherit nopackages deploy
-
-DEPENDS +=3D "dtc-native"
-PACKAGE_ARCH =3D "${MACHINE_ARCH}"
-
-do_configure[noexec] =3D "1"
-do_compile[noexec] =3D "1"
-do_install[noexec] =3D "1"
-
-# Validate xen devicetree variables
-python __anonymous() {
-
-    # Compare values of a list of variables to a regex pattern
-    def validate_type(pattern, var_list):
-        for varname in var_list:
-            if d.getVar(varname):
-                if not pattern.match(d.getVar(varname)):
-                    raise bb.parse.SkipRecipe(d.getVar(varname) + "' is no=
t a valid value for " + varname + "!")
-            else:
-                raise bb.parse.SkipRecipe('Required variable ' + varname +=
 ' is empty!')
-
-    import re
-
-    num_vars_to_check =3D ['XEN_DEVICETREE_DOM0_ADDR', 'XEN_DEVICETREE_DOM=
0_SIZE']
-    size_vars_to_check =3D ['XEN_DEVICETREE_DOM0_MEM']
-
-    num_pattern =3D re.compile(r'((0x[0-9a-fA-F]+)|[0-9]+)$')
-    size_pattern =3D re.compile(r'[0-9]+[MG](,max:[0-9]+[MG])?$')
-
-    validate_type(num_pattern, num_vars_to_check)
-    validate_type(size_pattern, size_vars_to_check)
-}
-
-do_deploy() {
-    if [ ! -f ${WORKDIR}/xen.dtsi.in ]; then
-        die "xen.dtsi.in does not exist"
-    fi
-    cat ${WORKDIR}/xen.dtsi.in \
-        | sed -e "s?###XEN_DOM0_BOOTARGS###?${XEN_DEVICETREE_DOM0_BOOTARGS=
}?" \
-        | sed -e "s?###XEN_XEN_BOOTARGS###?${XEN_DEVICETREE_XEN_BOOTARGS}?=
" \
-        | sed -e "s?###XEN_DOM0_ADDR###?${XEN_DEVICETREE_DOM0_ADDR}?" \
-        | sed -e "s?###XEN_DOM0_SIZE###?${XEN_DEVICETREE_DOM0_SIZE}?" \
-        > ${WORKDIR}/xen.dtsi
-
-    # Generate final dtbs
-    for dtbf in ${XEN_DEVICETREE_DTBS}; do
-        rdtb=3D`basename $dtbf`
-        if [ ! -f ${DEPLOY_DIR_IMAGE}/$rdtb ]; then
-            die "Wrong file in XEN_DEVICETREE_DTBS: ${DEPLOY_DIR_IMAGE}/$r=
dtb does not exist"
-        fi
-        dtc -I dtb -O dts -o ${WORKDIR}/dom0-linux.dts ${DEPLOY_DIR_IMAGE}=
/$rdtb
-
-        # Add external includes
-        for inc in ${XEN_DEVICETREE_DTSI_MERGE}; do
-            if [ ! -f ${WORKDIR}/${inc} ]; then
-                die "Wrong file in XEN_DEVICETREE_DTSI_MERGE: ${WORKDIR}/$=
{inc} does not exist"
-            fi
-            echo "/include/ \"$inc\"" >> ${WORKDIR}/dom0-linux.dts
-        done
-
-        rdtbnoextn=3D`basename $dtbf ".dtb"`
-        dtc -I dts -O dtb \
-            -o ${WORKDIR}/${rdtbnoextn}-xen.dtb ${WORKDIR}/dom0-linux.dts
-        install -m 644 ${rdtbnoextn}-xen.dtb ${DEPLOYDIR}/.
-    done
-}
-do_deploy[depends] +=3D "${XEN_DEVICETREE_DEPEND}"
-do_deploy[prefuncs] +=3D "calc_xen_dtb_dom0_size"
-
-addtask deploy after do_install
-
-python calc_xen_dtb_dom0_size() {
-    from math import ceil
-    size =3D 0
-    if d.getVar('KERNEL_IMAGE_MAXSIZE'):
-        bb.note('size calculation based on KERNEL_IMAGE_MAXSIZE')
-        size =3D int(d.getVar('KERNEL_IMAGE_MAXSIZE')) * 1024
-    else:
-        kernel =3D os.path.realpath(d.getVar('DEPLOY_DIR_IMAGE') + '/' +\
-                 d.getVar('KERNEL_IMAGETYPE'))
-        size =3D os.stat(kernel).st_size
-        bb.note('size calculation based on kernel Image file: %s' % kernel=
)
-
-    bb.note('size in bytes: %d' % size)
-    # Ceil to MiB
-    size_required =3D ceil(size / (2 ** 20)) * (2 ** 20)
-    xen_devicetree_dom0_size =3D d.getVar('XEN_DEVICETREE_DOM0_SIZE')
-    if xen_devicetree_dom0_size[:2] =3D=3D "0x":
-        size_defined =3D int(xen_devicetree_dom0_size, 16)
-    else:
-        size_defined =3D int(xen_devicetree_dom0_size)
-
-    if size_required > size_defined:
-        bb.note ("Wrong kernel size setting inside xen dtb!\n"\
-                 "Required:\t%(req)d (%(req)#010X)\n"\
-                 "Requested:\t%(def)d (%(def)#010X)"\
-                 % {"req": size_required, "def": size_defined})
-        bb.note ("Overriding XEN_DEVICETREE_DOM0_SIZE with "\
-                 "%(req)d (%(req)#010X)" % {"req": size_required})
-        d.setVar('XEN_DEVICETREE_DOM0_SIZE', hex(size_required))
-}
diff --git a/meta-arm-autonomy/recipes-extended/xen/xen-4.14/0001-xen-arm-T=
hrow-messages-for-unknown-FP-SIMD-implement.patch b/meta-arm-autonomy/recip=
es-extended/xen/xen-4.14/0001-xen-arm-Throw-messages-for-unknown-FP-SIMD-im=
plement.patch
deleted file mode 100644
index 3679ead..0000000
--- a/meta-arm-autonomy/recipes-extended/xen/xen-4.14/0001-xen-arm-Throw-me=
ssages-for-unknown-FP-SIMD-implement.patch
+++ /dev/null
@@ -1,51 +0,0 @@
-From f4c1a541fa351e4f613471bbf397931f9e1ddd27 Mon Sep 17 00:00:00 2001
-Message-Id: <f4c1a541fa351e4f613471bbf397931f9e1ddd27.1602683707.git.diego=
.sueiro@arm.com>
-From: Wei Chen <wei.chen@arm.com>
-Date: Fri, 28 Aug 2020 02:34:04 +0000
-Subject: [PATCH] xen/arm: Throw messages for unknown FP/SIMD implement ID
-
-Arm ID_AA64PFR0_EL1 register provides two fields to describe CPU
-FP/SIMD implementations. Currently, we exactly know the meaning of
-0x0, 0x1 and 0xf of these fields. Xen treats value < 8 as FP/SIMD
-features presented. If there is a value 0x2 bumped in the future,
-Xen behaviors for value <=3D 0x1 can also take effect. But what Xen
-done for value <=3D 0x1 may not always cover new value 0x2 required.
-We throw these messages to break the silence when Xen detected
-unknown FP/SIMD IDs to notice user to check.
-
-Signed-off-by: Wei Chen <wei.chen@arm.com>
-Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>
-Acked-by: Julien Grall <jgrall@amazon.com>
-
-Upstream-Status: Backport
-Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>
----
- xen/arch/arm/setup.c | 12 ++++++++++++
- 1 file changed, 12 insertions(+)
-
-diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
-index 7968cee..f16b33f 100644
---- a/xen/arch/arm/setup.c
-+++ b/xen/arch/arm/setup.c
-@@ -133,6 +133,18 @@ static void __init processor_id(void)
-            cpu_has_simd ? " AdvancedSIMD" : "",
-            cpu_has_gicv3 ? " GICv3-SysReg" : "");
-=20
-+    /* Warn user if we find unknown floating-point features */
-+    if ( cpu_has_fp && (boot_cpu_feature64(fp) >=3D 2) )
-+        printk(XENLOG_WARNING "WARNING: Unknown Floating-point ID:%d, "
-+               "this may result in corruption on the platform\n",
-+               boot_cpu_feature64(fp));
-+
-+    /* Warn user if we find unknown AdvancedSIMD features */
-+    if ( cpu_has_simd && (boot_cpu_feature64(simd) >=3D 2) )
-+        printk(XENLOG_WARNING "WARNING: Unknown AdvancedSIMD ID:%d, "
-+               "this may result in corruption on the platform\n",
-+               boot_cpu_feature64(simd));
-+
-     printk("  Debug Features: %016"PRIx64" %016"PRIx64"\n",
-            boot_cpu_data.dbg64.bits[0], boot_cpu_data.dbg64.bits[1]);
-     printk("  Auxiliary Features: %016"PRIx64" %016"PRIx64"\n",
---=20
-2.7.4
-
diff --git a/meta-arm-autonomy/recipes-extended/xen/xen-tools-4.14/0001-vif=
-nat-fix-hostname.patch b/meta-arm-autonomy/recipes-extended/xen/xen-tools-=
4.14/0001-vif-nat-fix-hostname.patch
deleted file mode 100644
index d2e52ce..0000000
--- a/meta-arm-autonomy/recipes-extended/xen/xen-tools-4.14/0001-vif-nat-fi=
x-hostname.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-Upstream-Status: Backport
-Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>
-Signed-off-by: Kamil Dziezyk <kamil.dziezyk@arm.com>
-
-From 5499e0fc8082024bf7e2d0facd5c976e82105070 Mon Sep 17 00:00:00 2001
-From: Diego Sueiro <diego.sueiro@arm.com>
-Date: Thu, 20 Aug 2020 11:58:20 +0100
-Subject: [PATCH] tools/hotplug: Fix hostname setting in vif-nat
-
-Setting the hostname is failing because the "$XENBUS_PATH/domain"
-doesn't exist anymore. To fix this we set it to dom$domid
-
-Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>
-Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>
-Acked-by: Wei Liu <wl@xen.org>
----
- tools/hotplug/Linux/vif-nat | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/tools/hotplug/Linux/vif-nat b/tools/hotplug/Linux/vif-nat
-index a76d9c784b..26144350b3 100644
---- a/tools/hotplug/Linux/vif-nat
-+++ b/tools/hotplug/Linux/vif-nat
-@@ -85,7 +85,7 @@ router_ip=3D$(routing_ip "$ip")
- # Split the given IP/bits pair.
- vif_ip=3D`echo ${ip} | awk -F/ '{print $1}'`
-=20
--hostname=3D$(xenstore_read "$XENBUS_PATH/domain" | tr -- '_.:/+' '-----')
-+hostname=3Ddom$domid
- if [ "$vifid" !=3D "1" ]
- then
-   hostname=3D"$hostname-$vifid"
---=20
-2.17.1
diff --git a/meta-arm-autonomy/recipes-extended/xen/xen-tools_%.bbappend b/=
meta-arm-autonomy/recipes-extended/xen/xen-tools_%.bbappend
deleted file mode 100644
index d1f5610..0000000
--- a/meta-arm-autonomy/recipes-extended/xen/xen-tools_%.bbappend
+++ /dev/null
@@ -1,4 +0,0 @@
-PACKAGECONFIG:remove =3D "\
-    ${@bb.utils.contains('DISTRO_FEATURES', \
-                         'arm-autonomy-host', \
-                         'sdl', '', d)}"
diff --git a/meta-arm-autonomy/recipes-extended/xen/xen-tools_4.14.bbappend=
 b/meta-arm-autonomy/recipes-extended/xen/xen-tools_4.14.bbappend
deleted file mode 100644
index 3f8004a..0000000
--- a/meta-arm-autonomy/recipes-extended/xen/xen-tools_4.14.bbappend
+++ /dev/null
@@ -1,7 +0,0 @@
-# Use OVERRIDES to minimize the usage of
-# ${@bb.utils.contains('DISTRO_FEATURES', 'arm-autonomy-host', ...
-OVERRIDES:append =3D "${ARM_AUTONOMY_HOST_OVERRIDES}"
-
-FILESEXTRAPATHS:prepend:autonomy-host :=3D "${THISDIR}/${PN}-4.14:"
-
-SRC_URI:append:autonomy-host =3D " file://0001-vif-nat-fix-hostname.patch"
diff --git a/meta-arm-autonomy/recipes-extended/xen/xen_%.bbappend b/meta-a=
rm-autonomy/recipes-extended/xen/xen_%.bbappend
deleted file mode 100644
index 0cece2b..0000000
--- a/meta-arm-autonomy/recipes-extended/xen/xen_%.bbappend
+++ /dev/null
@@ -1,10 +0,0 @@
-# Use OVERRIDES to minimize the usage of
-# ${@bb.utils.contains('DISTRO_FEATURES', 'arm-autonomy-host', ...
-OVERRIDES:append =3D "${ARM_AUTONOMY_HOST_OVERRIDES}"
-
-# Make Xen machine specific
-# This ensures that sstate is properly handled and that each machine can h=
ave
-# its own configuration
-PACKAGE_ARCH:autonomy-host =3D "${MACHINE_ARCH}"
-
-PACKAGECONFIG:remove:autonomy-host =3D "sdl"
diff --git a/meta-arm-autonomy/recipes-extended/xen/xen_4.14.bbappend b/met=
a-arm-autonomy/recipes-extended/xen/xen_4.14.bbappend
deleted file mode 100644
index 8ac9f0e..0000000
--- a/meta-arm-autonomy/recipes-extended/xen/xen_4.14.bbappend
+++ /dev/null
@@ -1,9 +0,0 @@
-# Use OVERRIDES to minimize the usage of
-# ${@bb.utils.contains('DISTRO_FEATURES', 'arm-autonomy-host', ...
-OVERRIDES:append =3D "${ARM_AUTONOMY_HOST_OVERRIDES}"
-
-FILESEXTRAPATHS:prepend:autonomy-host :=3D "${THISDIR}/${PN}-4.14:"
-
-SRC_URI:append:autonomy-host =3D " \
-    file://0001-xen-arm-Throw-messages-for-unknown-FP-SIMD-implement.patch=
 \
-    "
diff --git a/meta-arm-autonomy/recipes-extended/xenguest/files/00-vif-xengu=
est.hook b/meta-arm-autonomy/recipes-extended/xenguest/files/00-vif-xengues=
t.hook
deleted file mode 100755
index 37ecec0..0000000
--- a/meta-arm-autonomy/recipes-extended/xenguest/files/00-vif-xenguest.hoo=
k
+++ /dev/null
@@ -1,138 +0,0 @@
-#=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
-# ${XEN_SCRIPT_DIR}/vif-post.d/00-vif-xenguest.hook
-#
-# Script for performing local configuration of a vif.
-# This script will be sourced by, e.g., vif-bridge after the hotplugging
-# system calls vif-bridge. The script is here and not simply executed as
-# a udev rule because this allows simple access to several environment
-# variables set by the calling vif-* script.
-#
-# Environment vars:
-# command     (add|remove|online|offline)
-# dev         vif interface name (required).
-# main_ip     IP address of Dom0
-# ip          list of IP networks for the vif, space-separated
-# XENBUS_PATH path to this device's details in the XenStore (required).
-#=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
-
-domid=3D$(xenstore_read "${XENBUS_PATH}/frontend-id")
-guestname=3D$(xenstore_read "/local/domain/${domid}/name")
-bridge=3D$(xenstore_read "${XENBUS_PATH}/bridge")
-mac=3D$(xenstore_read "$XENBUS_PATH/mac")
-kea_conf_file=3D"/etc/kea/kea-dhcp4.conf"
-
-if [ ! -f /etc/xenguest/guests/${guestname}/params.cfg ]; then
-    log debug "No /etc/xenguest/guests/${guestname}/params.cfg. Exiting."
-    return
-fi
-
-# Source the params file to get the choosen XENGUEST_NETWORK_TYPE
-. /etc/xenguest/guests/${guestname}/params.cfg
-
-# We need to get the xenguest subnet prefix to set the subnet and
-# the fixed ip to assing to the guest.
-get_subnet_prefix() {
-    # ${vif_ip} is set in the vif-nat script
-    echo ${vif_ip} | awk -F. '{print $1"."$2"."$3}'
-}
-
-subnetprefix=3D$(get_subnet_prefix)
-
-kea_remove_conf_entry()
-{
-    log debug "kea_remove_conf_entry"
-    claim_lock "vif-nat-kea"
-
-    # Remove the the xenguest kea config file inclusion in the kea main co=
nfig
-    sed -i "/${kea_guest_config//'/'/'\/'}/d" "${kea_conf_file}"
-
-    # Remove interface entry 1st case: [ "dev1", "dev_to_remove" ]
-    sed -i "s/,\ \"$dev\"//" "${kea_conf_file}"
-    # Remove interface entry 2nd case: [ "dev_to_remove", "dev1" ]
-    sed -i "s/\"$dev\",\ //" "${kea_conf_file}"
-    # Remove interface entry 3rd case: [ "dev_to_remove" ]
-    sed -i "s/\[\ \"$dev\"\ \]/\[\ \]/" "${kea_conf_file}"
-
-    # Remove the generated the xenguest kea subnet conf file
-    rm ${XENGUEST_KEA_SUBNET_CONFIG}
-
-    keactrl reload
-
-    release_lock "vif-nat-kea"
-}
-
-kea_add_conf_entries()
-{
-    log debug "kea_add_conf_entries"
-    claim_lock "vif-nat-kea"
-
-    # Include vif in the interfaces 1st case - no other entries:
-    search_for=3D'\"interfaces\": \[ '
-    sed -i "/${search_for}\"*\"\ */ s/\ \]/,\ \"${dev}\"\ \]/g" "${kea_con=
f_file}"
-    sed -i "s/${search_for}]/${search_for}\"${dev}\"\ \]/g" "${kea_conf_fi=
le}"
-
-    # Include the xenguest kea subnet conf file in the kea main config
-    search_for=3D'\"subnet4\": \['
-    sed -i "/$search_for/a $kea_guest_config" "${kea_conf_file}"
-
-    # Generate the xenguest kea subnet conf file
-    echo -e "$(eval "echo -e \"$(cat ${XENGUEST_KEA_SUBNET_TEMPLATE})\"")"=
 \
-            > "${XENGUEST_KEA_SUBNET_CONFIG}"
-
-    release_lock "vif-nat-kea"
-}
-
-call_extra_hooks() {
-    for f in /etc/xenguest/guests/${guestname}/files/*.hook; do
-        if [ -x "$f" ]; then
-            log info "Executing $f"
-            . "$f"
-            if [ $? -ne 0 ]; then
-                log err "$f failed."
-            fi
-        else
-            log info "$f is not executable. Skipping."
-        fi
-    done
-}
-
-case "${XENGUEST_NETWORK_TYPE}" in
-    nat)
-        XENGUEST_KEA_SUBNET_TEMPLATE=3D${XENGUEST_KEA_SUBNET_TEMPLATE:-"/e=
tc/xenguest/guests/${guestname}/files/kea-subnet4.json"}
-        if [ ! -f ${XENGUEST_KEA_SUBNET_TEMPLATE} ]; then
-            log debug "No ${XENGUEST_KEA_SUBNET_TEMPLATE} file. Aborting"
-            return
-        fi
-
-        XENGUEST_KEA_SUBNET_CONFIG=3D"/etc/kea/kea-subnet4.dom$domid.json"
-        if [ ! -d "$(dirname ${XENGUEST_KEA_SUBNET_CONFIG})" ]; then
-            log debug "No kea configuration directory. Aborting"
-            return
-        fi
-        kea_guest_config=3D"\ \ \ \ <?include \"${XENGUEST_KEA_SUBNET_CONF=
IG}\"?>"
-
-        case "$command" in
-            online)
-                kea_add_conf_entries
-
-                # Enable ip forwarding and NAT for the ${bridge} interface
-                sysctl -w net.ipv4.ip_forward=3D1
-                iptables_w -t nat -A POSTROUTING -o ${bridge} -j MASQUERAD=
E -m comment --comment "dom${domid}"
-                ;;
-            offline)
-                kea_remove_conf_entry
-
-                # Remove the NAT iptables rules created for the dom${domid=
}
-                guest_ipt_rule=3D$(iptables_w -t nat -vL POSTROUTING -n --=
line-number | grep -w dom${domid} | awk '{print $1}' | tac)
-                for rule in ${guest_ipt_rule}; do iptables_w -t nat --dele=
te POSTROUTING ${rule}; done
-
-                # If there is no more NAT iptables rules we disable ip for=
warding
-                ipt_nat_rules=3D$(iptables_w -t nat -vL POSTROUTING -n --l=
ine-number | grep MASQUERADE | awk '{print $1}')
-                [ -z "${ipt_nat_rules##*[!0-9]*}" ] && sysctl -w net.ipv4.=
ip_forward=3D0
-               ;;
-        esac
-
-        # We might have extra configs to be applied (e.g.: NAT port forwar=
d).
-        call_extra_hooks
-        ;;
-esac
diff --git a/meta-arm-autonomy/recipes-extended/xenguest/files/00-xenguest-=
nat-port-forward.hook b/meta-arm-autonomy/recipes-extended/xenguest/files/0=
0-xenguest-nat-port-forward.hook
deleted file mode 100755
index 875c181..0000000
--- a/meta-arm-autonomy/recipes-extended/xenguest/files/00-xenguest-nat-por=
t-forward.hook
+++ /dev/null
@@ -1,48 +0,0 @@
-#=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
-# /etc/xenguest/guests/${guestname}/files/00-xenguest-nat-port-forward.hoo=
k
-#
-# Script for performing local configuration related to NAT port forwarding=
 of
-# a vif.
-# This script will be sourced by
-# /etc/xen/scripts/vif-post.d/00-vif-xenguest.hook when
-# XENGUEST_IMAGE_NETWORK_TYPE=3D"nat".
-# The ${bridge} and ${domid} are set in the 00-vif-xenguest.hook context,
-# and ${vip_if} in the vif-nat script context.
-#
-# Environment vars:
-# command     (add|remove|online|offline)
-# dev         vif interface name (required).
-# main_ip     IP address of Dom0
-# ip          list of IP networks for the vif, space-separated
-# XENBUS_PATH path to this device's details in the XenStore (required).
-#=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
-
-host_port=3D"###HOST_PORT###"
-guest_port=3D"###GUEST_PORT###"
-
-port_num_check() {
-    if [ ${host_port} -gt 65535 -o ${guest_port} -gt 65535 ]; then
-        log error "host_port=3D${host_port} or guest_port=3D${guest_port} =
greater than 65535."
-        return 1
-    fi
-    return 0
-}
-
-case "${command}" in
-    online)
-        port_num_check
-        if [ $? -eq 0 ]; then
-            iptables_w -t nat -A PREROUTING -i ${bridge} -p tcp \
-                       --dport ${host_port} -j DNAT \
-                       --to-destination ${vif_ip}:${guest_port} \
-                       -m comment --comment "dom${domid}"
-        fi
-        ;;
-    offline)
-        # Remove the NAT iptables rules created for the dom${domid}
-        guest_ipt_rule=3D$(iptables_w -t nat -vL PREROUTING -n --line-numb=
er \
-                         | grep -w dom${domid} | awk '{print $1}' | tac)
-        for rule in ${guest_ipt_rule}; \
-            do iptables_w -t nat --delete PREROUTING ${rule}; done
-        ;;
-esac
diff --git a/meta-arm-autonomy/recipes-extended/xenguest/files/kea-dhcp4.co=
nf b/meta-arm-autonomy/recipes-extended/xenguest/files/kea-dhcp4.conf
deleted file mode 100644
index 0a1cc6a..0000000
--- a/meta-arm-autonomy/recipes-extended/xenguest/files/kea-dhcp4.conf
+++ /dev/null
@@ -1,30 +0,0 @@
-# This file holds the minimal kea dhcp4 server configuration.
-# It replaces existing kea dhcp configuration file via
-# "/etc/init.d/kea-restore-default-config" on every system boot.
-# The "/etc/xen/scripts/vif-post.d/00-vif-xenguest.hook" called in the end=
 of
-# the vif-nat script will append each xenguest configuration to this file,
-# to generate the final dhcp configuration.
-# This file can be replaced with xenguest-network.bbappend.
-{
-"Dhcp4": {
-    "interfaces-config": {
-        "interfaces": [ ]
-    },
-    "lease-database": {
-        "type": "memfile",
-        "persist": false
-    },
-    "subnet4": [
-        {
-            "subnet": "192.0.2.0/24"
-        }
-    ],
-    "loggers": [
-        {
-            "name": "kea-dhcp4",
-            "output_options": [ { "output": "/var/log/kea-dhcp4.log" } ],
-            "severity": "INFO"
-        }
-    ]
-}
-}
diff --git a/meta-arm-autonomy/recipes-extended/xenguest/files/kea-restore-=
default-config b/meta-arm-autonomy/recipes-extended/xenguest/files/kea-rest=
ore-default-config
deleted file mode 100755
index 9776ddf..0000000
--- a/meta-arm-autonomy/recipes-extended/xenguest/files/kea-restore-default=
-config
+++ /dev/null
@@ -1,29 +0,0 @@
-#!/bin/sh
-#
-# Xenguest Restore default kea dhcp4 configuration
-# This script restores a dhcp4 server configuration, to prevent
-# kea startup failures after random board hangs or powercuts.
-#
-
-case "$1" in
-  start)
-        ret=3D$(keactrl status | grep -i "dhcpv4 server" | cut -d ' ' -f 3=
)
-        if [ "$ret" =3D "active" ]; then
-            echo "WARNING: cowardly refusing to replace dhcp4 configuratio=
n"
-            echo "kea dhcp4 server is up and running!"
-        else
-            echo "Resetting kea dhcp4 configuration."
-            cp -f /etc/kea/kea-dhcp4.conf.original /etc/kea/kea-dhcp4.conf
-        fi
-        ;;
-  status|stop|reload|force-reload|restart)
-        true
-        ;;
-  *)
-        # do not advertise unreasonable commands that there is no reason
-        # to use with this device
-        echo "Usage: $0 {start|stop|status|restart|force-reload}"
-        exit 1
-esac
-
-exit $?
diff --git a/meta-arm-autonomy/recipes-extended/xenguest/files/kea-subnet4.=
json b/meta-arm-autonomy/recipes-extended/xenguest/files/kea-subnet4.json
deleted file mode 100644
index 9dacbb1..0000000
--- a/meta-arm-autonomy/recipes-extended/xenguest/files/kea-subnet4.json
+++ /dev/null
@@ -1,35 +0,0 @@
-# This file holds the guest kea dhcp4 server options running on Dom0.
-# The "/etc/xen/scripts/vif-post.d/00-vif-xenguest.hook" called in the end=
 of
-# the vif-nat script will use this file to generate the final dhcp
-# configuration.
-
-# This file is added in the xenguest image and installed in dom0 under
-# /etc/xenguest/guests/${guestname}/files/kea-subnet4.json when the guest
-# image is created.
-# Any customizations to it should be performed by replacing it via a bbapp=
end.
-
-# The \${vif_ip} and \${router_ip} variables are set in
-# the vif-nat script context. The \${subnetprefix} and \${mac} variable ar=
e set in the
-# 00-vif-xenguest.hook script context.
-
-# The "subnet" configuration node is mandatory in order to have the dhcp
-# properly running.
-        {
-            \"subnet\": \"${subnetprefix}.0/24\",
-            \"option-data\": [
-                {
-                    \"name\": \"routers\",
-                    \"data\": \"${router_ip}\"
-                },
-                {
-                    \"name\": \"domain-name-servers\",
-                    \"data\": \"8.8.8.8, 8.8.4.4\"
-                }
-            ],
-            \"reservations\": [
-                {
-                    \"hw-address\": \"${mac}\",
-                    \"ip-address\": \"${vif_ip}\"
-                }
-            ]
-        },
diff --git a/meta-arm-autonomy/recipes-extended/xenguest/files/logrotate-xe=
nguest b/meta-arm-autonomy/recipes-extended/xenguest/files/logrotate-xengue=
st
deleted file mode 100644
index fefc347..0000000
--- a/meta-arm-autonomy/recipes-extended/xenguest/files/logrotate-xenguest
+++ /dev/null
@@ -1,6 +0,0 @@
-/var/log/xenguest {
-    missingok
-    size 10k
-    copytruncate
-    rotate 2
-}
diff --git a/meta-arm-autonomy/recipes-extended/xenguest/files/network-brid=
ge.sh.in b/meta-arm-autonomy/recipes-extended/xenguest/files/network-bridge=
.sh.in
deleted file mode 100755
index 10bbe36..0000000
--- a/meta-arm-autonomy/recipes-extended/xenguest/files/network-bridge.sh.i=
n
+++ /dev/null
@@ -1,26 +0,0 @@
-#!/bin/sh
-# This script is setting up a virtual network interface connected to the
-# xenguest-network-bridge if NETWORK_BRIDGE is set to 1 in the guest param=
s
-#
-# Since this script is sourced by xenguest-manager, it can access variable=
s
-# such as ${guestname} from the parent file's scope, as well as those in
-# params.cfg, for example XENGUEST_NETWORK_TYPE
-
-BRIDGE_NAME=3D"###BRIDGE_NAME###"
-
-case "${XENGUEST_NETWORK_TYPE:=3D}" in
-    nat)
-        echo "vif =3D ['script=3Dvif-nat']" >> "${guestcfgfile:?}"
-        log info "Network type is NAT"
-        ;;
-    bridge)
-        echo "vif =3D ['script=3Dvif-bridge,bridge=3D${BRIDGE_NAME}']" >> =
"${guestcfgfile:?}"
-        log info "Network type is bridge: ${BRIDGE_NAME}"
-        ;;
-    none)
-        log info "Network type is none"
-        ;;
-    *)
-        log error "XENGUEST_NETWORK_TYPE=3D$XENGUEST_NETWORK_TYPE invalid"
-        ;;
-esac
diff --git a/meta-arm-autonomy/recipes-extended/xenguest/files/xenguest-ini=
t b/meta-arm-autonomy/recipes-extended/xenguest/files/xenguest-init
deleted file mode 100755
index 115b2d6..0000000
--- a/meta-arm-autonomy/recipes-extended/xenguest/files/xenguest-init
+++ /dev/null
@@ -1,90 +0,0 @@
-#!/bin/bash
-#
-# xenguest Init Script to start and stop xenguests during boot
-#
-
-XENGUEST_CONF_BASE=3D"/etc/xenguest"
-
-if [ ! -f ${XENGUEST_CONF_BASE}/xenguest-manager.conf ]; then
-    echo "No xenguest manager configuration !!"
-    exit 1
-fi
-
-source ${XENGUEST_CONF_BASE}/xenguest-manager.conf
-
-# Make sure we properly initialized the Dom0
-/usr/bin/xenguest-manager check-xen || exit $?
-
-# Create guest list
-guestlist=3D$(/usr/bin/xenguest-manager list)
-
-# Unconfigured guests
-
-case "$1" in
-  start)
-        echo "Starting xenguest"
-
-        # Create unconfigured guests
-        if [ -d "${XENGUEST_GUEST_DIR}" ]; then
-            shopt -s nullglob
-            for path in "${XENGUEST_GUEST_DIR}"/*.xenguest; do
-                f=3D$(basename "${path}" .xenguest)
-                if [ ! -f "${XENGUEST_CONF_BASE}/guests/${f}/guest.cfg" ];=
 then
-                    # Check if this guest should be auto booted
-                    autoboot=3D$(/usr/bin/xenguest-mkimage dump-paramsconf=
ig \
-                        "${path}" | \
-                        grep GUEST_AUTOBOOT | sed -e "s,.*=3D,," | tr -d '=
"')
-                    if [ "$autoboot" =3D "0" ]; then
-                        echo "Do not create $f, autoboot disabled"
-                    else
-                        /usr/bin/xenguest-manager create "${path}"
-                        # Update guestlist
-                        if [ $? -eq 0 ]; then
-                            guestlist=3D"${guestlist} ${f}"
-                        fi
-                    fi
-                fi
-            done
-        fi
-        if [ -n "${guestlist}" ]; then
-            for f in ${guestlist}; do
-                GUEST_AUTOBOOT=3D"1"
-                if [ -f "${XENGUEST_CONF_BASE}/guests/${f}/params.cfg" ]; =
then
-                    source "${XENGUEST_CONF_BASE}/guests/${f}/params.cfg"
-                fi
-                if [ "${GUEST_AUTOBOOT}" =3D "1" ]; then
-                    /usr/bin/xenguest-manager start "${f}"
-                fi
-            done
-        else
-            echo "No guest configured"
-        fi
-        ;;
-  status)
-        true
-        ;;
-  stop)
-        echo "Stopping xenguest"
-        # update guest list
-        guestlist=3D$(xenguest-manager status | grep Running | cut -d " " =
-f1)
-        for f in ${guestlist}; do
-            xenguest-manager shutdown "${f}" --kill
-        done
-        ;;
-  reload)
-        echo >&2 'Reload not available; use force-reload'; exit 1
-        ;;
-  force-reload|restart)
-        echo "Restarting xenguest"
-        $0 stop
-        $0 start
-        ;;
-  *)
-        # do not advertise unreasonable commands that there is no reason
-        # to use with this device
-        echo $"Usage: $0 {start|stop|status|restart|force-reload}"
-        exit 1
-esac
-
-exit $?
-
diff --git a/meta-arm-autonomy/recipes-extended/xenguest/files/xenguest-man=
ager b/meta-arm-autonomy/recipes-extended/xenguest/files/xenguest-manager
deleted file mode 100755
index 7e5f868..0000000
--- a/meta-arm-autonomy/recipes-extended/xenguest/files/xenguest-manager
+++ /dev/null
@@ -1,1139 +0,0 @@
-#!/bin/bash
-# This script manages xenguest
-#
-set -u
-this=3D"$0"
-
-XENGUEST_CONF_BASE=3D"/etc/xenguest"
-LOGFILE=3D"/var/log/xenguest"
-
-# Valid values for log level
-LOG_LEVEL_VALID=3D"FATAL ERROR INFO VERBOSE"
-
-# Log levels being written to logfile
-LOG_LEVEL_LIST=3D"ERROR INFO VERBOSE"
-# Affected by -v(v) param and conf file
-
-# Log levels being written to terminal
-VERBOSE_LOG_LEVEL=3D"ERROR"
-# Constant
-
-# Highest Log Level: Default is ERROR only
-LOG_LEVEL=3D"ERROR"
-# Used to update LOG_LEVEL_LIST
-
-
-# This should only be called from either log() or log_command.
-# It expectd $loglevel and $text to already be in scope
-function log_to_file ()
-{
-    if [[ ${LOG_LEVEL_LIST} =3D *${loglevel}* ]]; then
-        tstamp=3D"$(date +"%d-%m-%Y %T")"
-        tag=3D"[${loglevel}]"
-
-        printf "%s %-9s %s\n" "$tstamp" "$tag" "$text" >> ${LOGFILE}
-    fi
-}
-
-# Write a log to the logfile, and to the console
-# Messages are written to the log with the date and a timestamp
-function log ()
-{
-    # Inputs:
-    # $1 - optional level to log at, one of ${LOG_LEVEL_VALID}
-    #      Default: INFO
-    # $@ - log message body
-
-    # get loglevel from parameter and capitalise
-    loglevel=3D${1^^}
-
-    # If no loglevel is passed use INFO
-    if [[ ${LOG_LEVEL_VALID} =3D *${loglevel:-INVALID}* ]]; then
-        shift
-    else
-        loglevel=3D"INFO"
-    fi
-
-    # Kill script immediately after a fatal log
-    killscript=3D0
-    if [ "FATAL" =3D ${loglevel} ]; then
-        killscript=3D1
-        # Log at error level for the user
-        loglevel=3D"ERROR"
-    fi
-
-    text=3D"$*"
-    log_to_file
-
-    # Write to terminal if level is high enough
-    if [[ ${VERBOSE_LOG_LEVEL} =3D *${loglevel}* ]]; then
-        echo "${loglevel}: ${text}"
-    fi
-
-    # if Log was fatal, kill the script
-    if [[ ${killscript} =3D 1 ]]; then
-        exit 1
-    fi
-}
-
-# Write a shell command to the log and execute it
-# The stdout and stderr output of the command is captured in a variable,
-# and written to the logfile in two cases:
-#  1. The script is in verbose mode
-#  2. The command returns a non-zero status AND
-#     The loglevel parameter (default: ERROR) is in $LOG_LEVEL_LIST
-#
-# This means by default a non-zero status results in a log tagged [ERROR],
-# but if a command is expected to fail, the tag can be reduced for visual
-# clarity
-log_command ()
-{
-    # Inputs:
-    # $1 - optional level to write errors at, one of ${LOG_LEVEL_VALID}
-    #      Default: ERROR
-    # $@ - command to execute
-
-    # get loglevel from parameter and capitalise
-    loglevel=3D${1^^}
-
-    # If no level passed, log output on failure at ERROR
-    if [[ ${LOG_LEVEL_VALID} =3D *"${loglevel:-INVALID}"* ]]; then
-        shift
-    else
-        loglevel=3D"ERROR"
-    fi
-
-    # Commands cannot be logged at FATAL.
-    if [ "FATAL" =3D ${loglevel} ]; then
-        loglevel=3D"ERROR"
-    fi
-    local command=3D"$*"
-    local output=3D""
-    local status=3D0
-
-    # Capture stdout and sterr to write to logfile
-    output=3D$(eval "${command} 2>&1")
-    status=3D$?
-    # If command failed, or verbose mode, write log
-    if [[ ${status} -ne 0 ]] || [[ ${LOG_LEVEL_LIST} =3D *VERBOSE* ]]; the=
n
-
-        # if command didn't fail write it at verbose level
-        if [[ ${status} -eq 0 ]]; then
-            loglevel=3D"VERBOSE"
-        fi
-        # otherwise write it at ${loglevel} from arguments
-
-        local append_to=3D"/dev/null"
-        # If we are writing ${loglevel} logs to file, use file as append_t=
o
-        if [[ ${LOG_LEVEL_LIST} =3D *${loglevel}* ]]; then
-            append_to=3D${LOGFILE}
-        fi
-
-        # Log that command was called
-        text=3D"> ${command}"
-        log_to_file
-
-        # Write command output to logfile or /dev/null, indent to match re=
st of logs
-        if [[ -n ${output} ]]; then
-            echo "${output}" | sed 's/^/                              /' >=
> ${append_to}
-        fi
-        # Log exit status
-        text=3D"< Exited with status ${status}"
-        log_to_file
-    fi
-    # Ensure return status is captured
-    return $status
-}
-
-# Sources a shell script and logs it
-log_source ()
-{
-    local script=3D${1}
-    log verbose "> source ${script}"
-
-    ( . ${script} )
-
-    status=3D$?
-    log verbose "< Exited with status ${status}"
-
-    return $status
-}
-
-if [ ! -f ${XENGUEST_CONF_BASE}/xenguest-manager.conf ]; then
-    log fatal "Cannot find xenguest manager configuration"
-fi
-
-# Following variables must be set in configuration:
-# XENGUEST_VOLUME_DEVICE: device to use for lvm
-# XENGUEST_VOLUME_NAME: lvm volume name to create on device
-# Optionally set:
-# XENGUEST_LOG_LEVEL: the loglevel for terminal and logfile
-source ${XENGUEST_CONF_BASE}/xenguest-manager.conf
-
-# Check that VERBOSE level from config file is valid
-if [[ ${LOG_LEVEL_LIST} =3D *${XENGUEST_LOG_LEVEL}* ]]; then
-    LOG_LEVEL=3D${XENGUEST_LOG_LEVEL}
-else
-    log error "Invalid log level '${XENGUEST_LOG_LEVEL}' found in xenguest=
-manager.conf"
-fi
-
-function usage() {
-    cat <<EOF
-Usage $this [-v(v)] ACTION [OPTIONS]
-
-with ACTION being one of:
- help
-   Display this help
-
- create GUESTFILE [GUESTNAME]
-   Create a guest using xenguest image GUESTFILE and name it GUESTNAME.
-   This will extract and configure the guest and will also create the gues=
t
-   disk if guest has one configured.
-   GUESTNAME is set to the basename of GUESTFILE if unspecified.
-   GUESTNAME guest must not exist
-
- remove GUESTNAME
-   Remove GUESTNAME and destroy its disk (if it has one)
-
- start GUESTNAME
-   Start guest GUESTNAME
-
- stop|shutdown GUESTNAME
-   Stop guest GUESTNAME (send stop signal and let it shutdown normally)
-   Pass 'stop|shutdown GUESTNAME --nowait' to return immediately, rather
-   than waiting for success or failure to return.
-   Pass 'stop|shutdown GUESTNAME --kill' to force kill the guest if
-   signalling the graceful shutdown fails for any reason
-
-   These two parameters are incompatible, so only one should be passed
-
- kill|destroy GUESTNAME
-   Kill guest GUESTNAME (stop directly the guest without signaling it)
-
- list
-   List configured guests
-
- status
-   List guests and their current status (running or stopped)
-
-Passing -v will enable INFO logs, and -vv will enable VERBOSE and INFO log=
s.
-Both increase what is written to ${LOGFILE},
-rather than the terminal.
-EOF
-}
-
-# Ensure init scripts in subshells do not call private functions
-function check_private()
-{
-
-    # Return:
-    # 0 - success
-    # 1 - failure
-
-    if [ $BASH_SUBSHELL -ne 0 ]; then
-        log fatal "Attempted to execute private function '${FUNCNAME[1]}()=
' in a subshell!"
-    fi
-}
-
-# Public
-is_integer() {
-
-    if ! [[ "${1}" =3D~ ^[0-9]+$ ]]; then
-        log fatal "invalid number '${1}'"
-    fi
-}
-
-# Public
-# check size and convert it to MB, e.g '1[G]' =3D> '1000M'
-check_size() {
-    local disksize=3D"${1}"
-
-    [ -n "${disksize}" ] || disksize=3D"invalid"
-
-    # disksize may have appended M or G suffix, let's extract it
-    # ${var:offset:length}, where #var is var length
-    local lastchar=3D"${disksize:${#disksize}-1}"
-    case "${lastchar}" in
-        [0-9])
-            # backwards compatibility
-            is_integer "${disksize}"
-            echo -e "$((${disksize} * 1000))M"
-            return
-            ;;
-        G|M)
-            if [ "${#disksize}" -gt "1" ]; then
-                local size=3D"${disksize::${#disksize}-1}"
-                is_integer "${size}"
-                # convert GB to MB
-                [ "${lastchar}" =3D "M" ] || size=3D$((${size} * 1000))
-                echo -e "${size}M"
-                return
-            fi
-            ;;
-        *)
-            ;;
-    esac
-
-    log fatal "Invalid size format '${1}'. Supported size format is e.g 10=
00M or 2[G]"
-}
-
-# Private
-function xenguest_volume_init()
-{
-    # Inputs:
-    # $1 - diskdevice
-    # $2 - volumename
-    #
-    # Outputs:
-    # 0 - success
-    # 1 - failure
-
-    local diskdevice
-    local volumename
-
-    diskdevice=3D"${1}"
-    volumename=3D"${2}"
-
-    log info "Attempting to initialise xenguest volume '${volumename}'"
-
-    check_private
-
-    if [ -z "${diskdevice}" -o ! -b "${diskdevice}" ]; then
-        log error "Invalid volume device in configuration: '${diskdevice}'=
"
-        return 1
-    fi
-
-    if [ -z "${volumename}" ]; then
-        log error "Invalid volume name in configuration: '${volumename}'"
-        return 1
-    fi
-
-    log_command verbose "pvs ${diskdevice}"
-    if [ $? -ne 0 ]; then
-        # Check if there is no filesystem in the block device
-        log verbose "Checking for existing filesystem"
-        filesystem=3D$(lsblk -n -o FSTYPE ${diskdevice})
-        if [[ $? -eq 0 && -z "$filesystem" ]]; then
-            log verbose "No filesystem found"
-            log info "Initializing lvm on ${diskdevice}"
-            log_command "pvcreate -f ${diskdevice}"
-            if [ $? -ne 0 ]; then
-                log error "Initialing lvm on ${diskdevice} failed."
-                return 1
-            fi
-        else
-            [ -z "$filesystem" ] || \
-                log error "${diskdevice} is already formatted as $filesyst=
em."
-            return 1
-        fi
-    fi
-
-    log_command verbose "vgs ${volumename}"
-    if [ $? -ne 0 ]; then
-        log info "Creating ${volumename} volume"
-        log_command "vgcreate ${volumename} ${diskdevice}"
-        if [ $? -ne 0 ]; then
-            log error "Creating ${volumename} volume failed."
-            return 1
-        fi
-    fi
-
-    log info "xenguest volume '${volumename}' initialised successfully"
-
-    return 0
-}
-
-# Private
-# Detach a disk we attached to xen
-function xenguest_detach_disk()
-{
-    log verbose "Attempting to detach partition '${part}'"
-
-    check_private
-
-    log_command "xl block-detach 0 \$(xl block-list 0 | grep \"domain/0\" =
| awk '{print \$1}')"
-    if [ $? -ne 0 ]; then
-        log error "Detaching partition '${part}' failed."
-        return 1
-    fi
-
-    log verbose "Partition '${part}' detached successfully"
-}
-
-#Private
-function xenguest_volume_remove()
-{
-    # Inputs:
-    # $1 - volumename
-    # $2 - guestname
-
-    local volumename
-    local guestname
-
-    volumename=3D"${1}"
-    guestname=3D"${2}"
-
-    devname=3D"/dev/${volumename}/${guestname}"
-
-    # Remove volume if it exists
-    log verbose "Checking for volume ${devname}"
-    log_command verbose "lvs ${volumename}/${guestname}"
-    if [ $? -eq 0 ]; then
-        log info "Removing volume ${devname}"
-        log_command "lvremove -y ${devname}"
-        if [ $? -ne 0 ]; then
-            log error "Removing volume ${devname} failed."
-            return 1
-        else
-            log verbose "Volume ${devname} removed successfully"
-            return 0
-        fi
-    fi
-
-    log verbose "Volume ${devname} not found"
-}
-
-# Private
-function xenguest_disk_init()
-{
-    # Inputs:
-    # $1 - guestname
-    # $2 - guestfile
-    #
-    # Outputs:
-    # 0 - success
-    # 1 - failed at guest disk preparation
-    # 2 - failed at guest disk creation
-
-    guestname=3D"$1"
-    guestfile=3D"$2"
-
-    log info "Attempting to initialise disk for guest '${guestname}'"
-
-    check_private
-
-    source ${XENGUEST_CONF_BASE}/guests/${guestname}/disk.cfg
-    if [ -z "${DISK_DEVICE}" ]; then
-        log info "Using disk device and volume name from xenguest-manager.=
conf"
-        # By default guest is using disk defined inside xenguest-manager.c=
onf
-        diskdevice=3D"${XENGUEST_VOLUME_DEVICE}"
-        volumename=3D"${XENGUEST_VOLUME_NAME}"
-    else
-        log info "Using disk device set in disk.cfg"
-        # If guest configuration contains custom disk setting,
-        # overwrite default one
-        diskdevice=3D"${DISK_DEVICE}"
-        volumename=3D"vg-xen-$(basename ${diskdevice})"
-    fi
-
-    log verbose "Disk Device =3D ${diskdevice}"
-    log verbose "Volume Name =3D ${volumename}"
-
-    devname=3D"/dev/${volumename}/${guestname}"
-
-    DISK_SIZE=3D$(check_size "${DISK_SIZE}")
-    if [ -z "${DISK_SIZE}" ] || [ "${DISK_SIZE}" =3D "0M" ]; then
-        log info "No disk for ${guestname}"
-        return
-    fi
-
-    # Init our volume
-    xenguest_volume_init "${diskdevice}" "${volumename}"
-    if [ $? -ne 0 ]; then
-        return 1
-    fi
-
-    log info "Creating hard drive for guest '${guestname}'. This might tak=
e a while..."
-
-    # Remove volume if it already exist
-    xenguest_volume_remove ${volumename} ${guestname}
-    if [ $? -ne 0 ]; then
-        return 1
-    fi
-
-    # Create volume
-    log info "Creating volume '${volumename}/${guestname}'"
-    log_command "lvcreate -y -L ${DISK_SIZE} -n ${guestname} ${volumename}=
"
-    if [ $? -ne 0 ]; then
-        log error "Creating volume '${volumename}/${guestname}' failed."
-        return 1
-    fi
-
-    # Add partition table
-    log verbose "Creating partition table on ${devname}"
-    log_command "parted -s \"${devname}\" mklabel msdos"
-    if [ $? -ne 0 ]; then
-        log error "Creating partition table on ${devname} failed."
-        return 1
-    fi
-
-    # Setup disk name in xen configuration
-    log verbose "Setting disk name in xen configuration"
-    log_command "xenguest-mkimage update \"${XENGUEST_CONF_BASE}/guests/${=
guestname}\" --xen-disk=3D\"${devname}\""
-    if [ $? -ne 0 ]; then
-        log error "Setting disk name in xen configuration failed."
-        return 1
-    fi
-
-    # Create partitions
-    partstart=3D"0"
-
-    # For each partition X the disk.cfg file should set a variable DISK_PA=
RTX
-    # with a : separated list defining the partition:
-    # DISK_PART3=3D"4:ext4:disk.tgz" means that partition 3 should be 4G f=
ormated
-    # with ext4 and initialized with the content of disk.tgz
-    # Keep user defined partition order,
-    # even if previous partitions are not defined.
-    # Create 2MB partitions in this case
-    lastpart=3D"0"
-    for partidx in $(seq 1 4); do
-        local _part=3D"DISK_PART${partidx}"
-        if [ -n "${!_part:=3D}" ]; then
-            lastpart=3D"${partidx}"
-        fi
-    done
-
-    if [ "${lastpart}" -eq "0" ]; then
-        # Nothing to be added here
-        # No partition definition found
-        return
-    fi
-
-    for part in $(seq 1 "${lastpart}"); do
-        eval partdesc=3D"\${DISK_PART${part}:=3D}"
-        size=3D$(echo ${partdesc} | sed -e "s/\(.*\):.*:.*/\1/")
-        fstype=3D$(echo ${partdesc} | sed -e "s/.*:\(.*\):.*/\1/")
-        content=3D$(echo ${partdesc} | sed -e "s/.*:.*:\(.*\)/\1/")
-
-        local _part=3D"DISK_PART${part}"
-        [ -n "${!_part:=3D}" ] || size=3D"2M"
-
-        size=3D$(check_size "${size}")
-        if [ -n "${size}" ] && [ "${size}" !=3D "0M" ]; then
-            # size has appended M or G suffix, let's extract just the valu=
e
-            # ${var:offset:length}, where #var is var length
-            size=3D"${size::${#size}-1}"
-            partend=3D$(expr ${partstart} + ${size})
-
-            # Let first MB of disk free for partition table
-            if [ ${partstart} -eq 0 ]; then
-                partstart=3D"1"
-            fi
-
-            # Create partition
-            log verbose "Adding partition ${part}"
-            log_command "parted -s \"${devname}\" unit MB mkpart primary \=
"${partstart}\" \"${partend}\""
-            if [ $? -ne 0 ]; then
-                log error "Adding partition ${part} failed."
-                return 1
-            fi
-
-            # Set next partition start to current partition end
-            partstart=3D"${partend}"
-
-            # Sync to see the created partition
-            log verbose "Sync created partition"
-            log_command "sync"
-
-            # Prepare format command
-            if [ -n "${fstype}" ]; then
-                case ${fstype} in
-                    vfat|ext2|ext3|ext4)
-                        formatcmd=3D"mkfs.${fstype} -F"
-                        ;;
-                    swap)
-                        formatcmd=3D"mkswap"
-                        ;;
-                    *)
-                        log error "Partition ${part} of ${guestname} fstyp=
e is invalid '${fstype}'"
-                        return 1
-                        ;;
-                esac
-            else
-                formatcmd=3D""
-            fi
-
-            # Attach disk to xen
-            log verbose "Attaching partition ${part}"
-            log_command "xl block-attach 0 \"phy:${devname}\" xvda w"
-            if [ $? -ne 0 ]; then
-                log error "Attaching partition ${part} failed."
-                return 1
-            fi
-
-
-            # Loop for 20s to wait until /dev/xvdaX appears
-            i=3D0
-            while [ ! -b /dev/xvda${part} ]; do
-                ((i++))
-                if [[ "$i" =3D=3D '40' ]]; then
-                    break;
-                fi
-                sleep 0.5
-            done
-
-            if [ ! -b /dev/xvda${part} ]; then
-                log error "Partition ${part} creation failed."
-                return 2
-            fi
-
-            log verbose "/dev/xvda${part} created"
-
-            if [ -n "${formatcmd}" ]; then
-                log info "Creating filesystem for partition '${part}'"
-                log_command "${formatcmd} /dev/xvda${part}"
-                if [ $? -ne 0 ]; then
-                    log error "Creating filesystem for partition '${part}'=
 failed."
-                    return 2
-                fi
-            fi
-
-            case ${content} in
-                *.img*)
-                    decompress=3D""
-                    case ${content} in
-                        *.img.gz)
-                            decompress=3D'zcat'
-                            ;;
-                        *.img.bz2)
-                            decompress=3D'bzcat'
-                            ;;
-                        *.img)
-                            decompress=3D'cat'
-                            ;;
-                        *)
-                            # invalid/unknown compression type
-                            log error "Invalid file format in disk ${conte=
nt}"
-                            return 2
-                            ;;
-                    esac
-                    # dd into partition
-                    log verbose "Populating partition '${part}'"
-                    log_command "xenguest-mkimage extract-disk-file ${gues=
tfile} ${content} | ${decompress} | dd of=3D/dev/xvda${part} "
-                    if [ $? -ne 0 ]; then
-                        log error "Populating partition '${part}' failed."
-                        return 2
-                    fi
-                    ;;
-                *.tar*)
-                    tararg=3D""
-                    case ${content} in
-                        *.tar.gz)
-                            tararg=3D"z"
-                            ;;
-                        *.tar.bz2)
-                            tararg=3D"j"
-                            ;;
-                        *.tar.xz)
-                            tararg=3D"J"
-                            ;;
-                        *.tar)
-                            tararg=3D""
-                            ;;
-                        *)
-                            # invalid/unknown tar type
-                            log error "Invalid file format in disk ${conte=
nt}"
-                            return 2
-                            ;;
-                    esac
-
-                    # must mount the partition and extract
-                    mntdir=3D$(mktemp -d)
-                    log verbose "Mounting partition '${part}'"
-                    log_command "mount /dev/xvda${part} ${mntdir}"
-                    if [ $? -ne 0 ]; then
-                        log error "Mounting partition '${part}' failed."
-                        rm -rf ${mntdir}
-                        return 2
-                    fi
-
-                    # tar and unmount
-                    log_command "xenguest-mkimage extract-disk-file ${gues=
tfile} ${content} |" \
-                    "tar -C ${mntdir} -x${tararg}f - "
-                    if [ $? -ne 0 ]; then
-                        log error "Cannot populate partition ${part}"
-                        umount ${mntdir}
-                        rm -rf ${mntdir}
-                        return 2
-                    fi
-                    log_command "umount ${mntdir}"
-                    if [ $? -ne 0 ]; then
-                        log error "Unmounting ${part} failed."
-                        rm -rf ${mntdir}
-                        return 2
-                    fi
-                    rm -rf ${mntdir}
-                    ;;
-                *)
-                    #invalid content type
-                    ;;
-            esac
-
-            # Detach disk
-            xenguest_detach_disk
-            if [ $? -ne 0 ]; then
-                return 1
-            fi
-        fi
-    done
-
-    log info "Initialised disk for guest '${guestname}' successfully"
-
-}
-
-# Private
-function xenguest_guest_create()
-{
-    # extract xenguest tar
-    # put xen config in etc ?
-    # if disk config file:
-    #  disk init
-    #  add partititions
-
-    guestfile=3D"$1"
-    guestname=3D"$2"
-
-    log info "Attempting to create guest '${guestname}' using ${guestfile}=
"
-
-    check_private
-
-    log verbose "Cleaning up old directory"
-    log_command verbose "rm -rf ${XENGUEST_CONF_BASE}/guests/${guestname}"
-    log verbose "Creating directory for guest '${guestname}'"
-    log_command "mkdir -p ${XENGUEST_CONF_BASE}/guests/${guestname}"
-
-    log verbose "Extracting guest image"
-    log_command "xenguest-mkimage extract-config ${guestfile} ${XENGUEST_C=
ONF_BASE}/guests/${guestname}"
-    if [ $? -ne 0 ]; then
-        log fatal "Extracting guest image failed."
-    fi
-
-    # Set guest name inside config
-    log verbose "Setting guest name"
-    log_command "xenguest-mkimage update ${XENGUEST_CONF_BASE}/guests/${gu=
estname} --xen-name=3D${guestname}"
-    if [ $? -ne 0 ]; then
-        log error "Setting guest name failed."
-        xenguest_guest_remove ${guestname}
-        exit 1
-    fi
-
-    xenguest_disk_init ${guestname} ${guestfile}
-    disk_init_status=3D$?
-    if [ $disk_init_status -ne 0 ]; then
-        log error "Disk creation for guest '${guestname}' failed."
-        if [ $disk_init_status -eq 2 ]; then
-            xenguest_detach_disk
-        fi
-        xenguest_guest_remove ${guestname}
-        exit 1
-    fi
-
-    log info "Guest '${guestname}' created successfully"
-
-}
-
-# Private
-function xenguest_guest_remove()
-{
-    guestname=3D"$1"
-    log info "Attempting to remove guest '${guestname}'"
-
-    check_private
-
-    source ${XENGUEST_CONF_BASE}/guests/${guestname}/disk.cfg
-    if [ -z "${DISK_DEVICE}" ]; then
-        # By default guest is using disk defined inside xenguest-manager.c=
onf
-        diskdevice=3D"${XENGUEST_VOLUME_DEVICE}"
-        volumename=3D"${XENGUEST_VOLUME_NAME}"
-    else
-        # If guest configuration contains custom disk setting,
-        # overwrite default one
-        diskdevice=3D"${DISK_DEVICE}"
-        volumename=3D"vg-xen-$(basename ${diskdevice})"
-    fi
-    devname=3D"/dev/${volumename}/${guestname}"
-
-    # find and remove guest volume
-    xenguest_volume_remove ${volumename} ${guestname}
-    status=3D$?
-
-    # remove guest files
-    log info "Removing configuration files for guest '${guestname}'."
-    log_command "rm -rf ${XENGUEST_CONF_BASE}/guests/${guestname}"
-
-    if [ ${status} -ne 0 ]; then
-        # Shouldn't log success message if volume removal fails
-        exit 1
-    fi
-
-    log info "Removed guest '${guestname}' successfully"
-}
-
-# Private
-function xenguest_call_inits()
-{
-    # Inputs:
-    # $1 - script directory
-
-    local scriptdir
-    local guestdir
-    local guestcfgfile
-    local guestname
-
-    scriptdir=3D"${1}"
-    guestdir=3D"${2}"
-    guestcfgfile=3D"${3}"
-    guestname=3D"${4}"
-
-    log "Attempting to call all init scripts in ${scriptdir}"
-
-    check_private
-
-
-    init_scripts=3D"$(find ${XENGUEST_CONF_BASE}/${scriptdir} -type f 2> /=
dev/null | \
-            sort) $(find ${guestdir}/${scriptdir} -type f 2> /dev/null | s=
ort)"
-    for f in ${init_scripts}; do
-        if [ -x "$f" ]; then
-            log_source $f
-            if [ $? -ne 0 ]; then
-                rm -f ${guestcfgfile}
-                popd > /dev/null 2>&1
-                log fatal "Error during init script $(basename $f) of ${gu=
estname}"
-            fi
-        else
-            log fatal "$f is not executable. Exiting..."
-        fi
-    done
-
-    if [ "${init_scripts}" =3D " " ]; then
-        log "No scripts found"
-    else
-        log "All init scripts in ${scriptdir} completed successfully"
-    fi
-}
-
-# Private
-function xenguest_guest_start()
-{
-    guestname=3D"${1}"
-    guestdir=3D${XENGUEST_CONF_BASE}/guests/${guestname}
-
-    log info "Attempting to start guest '${guestname}'"
-
-    check_private
-
-    guestcfgfile=3D$(mktemp -u "${guestname}.XXXXXX" --tmpdir=3D"${guestdi=
r}" --suffix=3D".cfg")
-
-    # Get guest configuration
-    source ${guestdir}/params.cfg
-
-    pushd ${guestdir} > /dev/null 2>&1
-
-    # create config by merging all configurations together
-    cat guest.cfg $(find guest.d -type f 2> /dev/null) > ${guestcfgfile}
-
-    # Build init script lists (ignore non existing dirs errors,
-    # sort alphabetically and run global scripts first)
-    #
-    # These scripts are sourced throughout the start operation if they
-    # are executable
-    init_pre=3D"init.pre"
-    init_d=3D"init.d"
-    init_post=3D"init.post"
-
-    # call pre init scripts
-    xenguest_call_inits "${init_pre}" "${guestdir}" "${guestcfgfile}" "${g=
uestname}"
-
-    # Create non started guest
-    log verbose "Initiating ${guestname}"
-    log_command "xl create -p ${guestcfgfile}"
-    if [ $? -ne 0 ]; then
-        rm -f ${guestcfgfile}
-        popd > /dev/null 2>&1
-        log fatal "Initiating ${guestname} failed."
-    fi
-
-    # call init scripts
-    xenguest_call_inits "${init_d}" "${guestdir}" "${guestcfgfile}" "${gue=
stname}"
-
-    # Start guest
-    log info "Starting ${guestname}"
-    log_command "xl unpause ${guestname}"
-    if [ $? -ne 0 ]; then
-        rm -f ${guestcfgfile}
-        popd > /dev/null 2>&1
-        log fatal "Starting ${guestname} failed."
-    fi
-
-    # call post init scripts
-    xenguest_call_inits "${init_post}" "${guestdir}" "${guestcfgfile}" "${=
guestname}"
-
-    rm -f ${guestcfgfile}
-    popd > /dev/null 2>&1
-
-    log info "Guest '${guestname}' started successfully"
-}
-
-# Private
-function xenguest_guest_stop()
-{
-    local guestname
-    local extra_arg
-
-    guestname=3D"${1}"
-    extra_arg=3D"${2}"
-
-    shutdown_args=3D""
-
-    log info "Attempting to stop guest '${guestname}'"
-
-    if [[ ${extra_arg} !=3D "--nowait" ]]; then
-        shutdown_args+=3D" -w"
-    fi
-
-    check_private
-
-    log_command "xl shutdown ${shutdown_args} ${guestname}"
-    if [ $? -ne 0 ]; then
-        if [[ ${extra_arg} =3D=3D "--kill" ]]; then
-            log info "Stopping '${guestname}' failed, calling kill..."
-            xenguest_guest_kill "${guestname}"
-        else
-            log fatal "Stopping guest '${guestname}' failed."
-        fi
-    fi
-    if [[ "${extra_arg}" !=3D "--nowait" ]]; then
-        log info "Guest '${guestname}' stopped successfully"
-    else
-        log info "xl shutdown exited successfully for guest '${guestname}'=
."
-    fi
-}
-
-# Private
-function xenguest_guest_kill()
-{
-    local guestname
-
-    guestname=3D"${1}"
-    log "Attempting to kill guest '${guestname}'"
-
-    check_private
-
-    log_command "xl destroy ${guestname}"
-    if [ $? -ne 0 ]; then
-        log "fatal:Killing guest '${guestname}' failed."
-    fi
-    log "Guest '${guestname}' killed successfully"
-}
-
-# Private
-function check_guest_arg()
-{
-    check_private
-
-    cmd=3D"${1}"
-    guestname=3D"${2:-}"
-    if [ -z "${guestname:-}" ]; then
-        log fatal "Usage ${this} ${cmd} GUESTNAME"
-    fi
-}
-
-# Public
-function check_guest_exist()
-{
-    guestname=3D"${1}"
-    if [ ! -f ${XENGUEST_CONF_BASE}/guests/${guestname}/guest.cfg -o \
-        ! -f ${XENGUEST_CONF_BASE}/guests/${guestname}/params.cfg ]; then
-        log fatal "Invalid guest name '${guestname}'"
-    fi
-
-    log verbose "Guest '${guestname}' found: ${XENGUEST_CONF_BASE}/guests/=
${guestname}/"
-}
-
-# Public
-function xenguest_list_guests()
-{
-    guestlist=3D""
-    if [ -d ${XENGUEST_CONF_BASE}/guests ]; then
-        guestlist=3D$(find ${XENGUEST_CONF_BASE}/guests -mindepth 1 -maxde=
pth 1 -type d -exec sh -c 'if [ -f {}/guest.cfg ]; then basename {}; fi' \;=
)
-    else
-        log "Info: Guests directory ${XENGUEST_CONF_BASE}/guests not found=
"
-    fi
-}
-
-# Public
-function xl_list_contains()
-{
-    guestname=3D"${1}"
-    # Select first column of xl list, and find guestname exactly using reg=
ex
-    running=3D$(xl list | awk 'NR > 1 {print $1}' | grep "^${guestname}$" =
|| echo)
-    if [ "${running}" =3D "${guestname}" ]; then
-        log verbose "Guest '${guestname}' is running"
-        return 0
-    fi
-
-    log verbose "Guest '${guestname}' is not running"
-
-    return 1
-}
-
-# Public
-function check_guest_running()
-{
-    guestname=3D"${1}"
-    if ! xl_list_contains $guestname; then
-        log fatal "Cannot ${cmd} guest '${guestname}', already stopped"
-    fi
-}
-
-# Public
-function check_guest_not_running()
-{
-    guestname=3D"${1}"
-    if xl_list_contains $guestname; then
-        log fatal "Cannot ${cmd} guest '${guestname}', already started"
-    fi
-}
-
-## Entry Point ##
-
-# Check for verbose level arguments, and shift if found
-case ${1:-help} in
-    -v|-V)
-    LOG_LEVEL=3D"INFO"
-    shift
-    ;;
-    -vv|-VV)
-    LOG_LEVEL=3D"VERBOSE"
-    shift
-    ;;
-esac
-
-# Limit Verbose list to only those desired to be shown
-LOG_LEVEL_LIST=3D${LOG_LEVEL_LIST//${LOG_LEVEL}*/${LOG_LEVEL}}
-
-log ""
-log "Arguments: $*"
-
-cmd=3D"${1:-help}"
-arg1=3D"${2:-}"
-arg2=3D"${3:-}"
-
-case ${cmd} in
-    help|--help|-h|-?)
-        usage
-        exit 0
-        ;;
-esac
-
-# Check if we have a valid Dom0 booted with Xen
-log_command "xl info"
-if [ $? -ne 0 ]; then
-    log error "Xen environment is not valid!!!"
-    log error "Check if Xen has booted and the kernel configuration."
-    log fatal "More information in the logfile: ${LOGFILE}"
-fi
-
-case ${cmd} in
-    check-xen)
-        log verbose "Valid Xen environment found"
-        exit 0
-        ;;
-    create)
-        guestfile=3D"${arg1}"
-        guestname=3D"${arg2}"
-        # guestfile invalid if empty
-        if [ -z "${guestfile}" ]; then
-            log fatal "Usage ${this} create XENGUEST_FILE [NAME]"
-        fi
-        # Set Guest name before resolving any symlinks
-        if [ -z "${guestname}" ]; then
-            guestname=3D$(basename ${guestfile} .xenguest)
-            log info "guestname argument not provided, using '${guestname}=
'"
-        fi
-        # Check for and resolve symlink
-        if [ -L "${guestfile}" ]; then
-            errmsg=3D"'${guestfile}' is a broken symlink"
-            guestfile=3D$(readlink -e "${guestfile}")
-            if [ -z "${guestfile}" ]; then
-                log fatal "${errmsg}"
-            else
-                log info "Guestfile symlink resolved to path '${guestfile}=
'"
-            fi
-        fi
-        # Check that guestfile is a valid file
-        if [ ! -f "${guestfile}" ]; then
-            log fatal "File '${guestfile}' not found"
-        fi
-        # Check if guest already exists
-        if [ -f ${XENGUEST_CONF_BASE}/guests/${guestname}/guest.cfg ]; the=
n
-            log fatal "Guest '${guestname}' already exists"
-        fi
-
-        xenguest_guest_create ${guestfile} ${guestname}
-        ;;
-    remove)
-        guestname=3D"${arg1:-}"
-        check_guest_arg ${cmd} ${guestname}
-        check_guest_exist ${guestname}
-        # We need to stop the guest first if it is running
-        if xl_list_contains $guestname; then
-            xenguest_guest_kill ${guestname}
-        fi
-        xenguest_guest_remove ${guestname}
-        ;;
-    start)
-        guestname=3D"${arg1:-}"
-        check_guest_arg ${cmd} ${guestname}
-        check_guest_exist ${guestname}
-        check_guest_not_running ${guestname}
-        xenguest_guest_start ${guestname}
-        ;;
-    stop|shutdown)
-        guestname=3D"${arg1:-}"
-        extra_arg=3D"${arg2:-}"
-        check_guest_arg ${cmd} ${guestname}
-        check_guest_exist ${guestname}
-        check_guest_running ${guestname}
-        xenguest_guest_stop "${guestname}" "${extra_arg}"
-        ;;
-    kill|destroy)
-        guestname=3D"${arg1:-}"
-        check_guest_arg ${cmd} ${guestname}
-        check_guest_exist ${guestname}
-        check_guest_running ${guestname}
-        xenguest_guest_kill ${guestname}
-        ;;
-    list)
-        xenguest_list_guests
-        echo ${guestlist} | tr " " "\n"
-        ;;
-    status)
-
-        single_status() {
-            guestname=3D"${1}"
-            check_guest_exist ${guestname}
-            if xl_list_contains $guestname; then
-                echo "${guestname} Running"
-            else
-                echo "${guestname} Stopped"
-            fi
-        }
-
-        guestname=3D"${arg1}"
-        if [ -n "${guestname}" ]; then
-            single_status ${guestname}
-        else
-            xenguest_list_guests
-            if [ -n "${guestlist}" ]; then
-                for f in ${guestlist}; do
-                    single_status $f
-                done
-            fi
-        fi
-        ;;
-    *)
-        log fatal "Invalid argument: ${cmd}"
-        ;;
-esac
-
diff --git a/meta-arm-autonomy/recipes-extended/xenguest/files/xenguest-mki=
mage b/meta-arm-autonomy/recipes-extended/xenguest/files/xenguest-mkimage
deleted file mode 100755
index 29e0911..0000000
--- a/meta-arm-autonomy/recipes-extended/xenguest/files/xenguest-mkimage
+++ /dev/null
@@ -1,938 +0,0 @@
-#!/bin/bash
-# This script must be used to manipulate xenguest images
-#
-# xenguest image topology:
-#  params.cfg: guest global configuration file. Only edited using this scr=
ipt.
-#  guest.cfg: xen main configuration file. Only edited using this script.
-#  guest.d: directory contains files with custom xen configuration entries
-#    which are appended to guest.cfg before starting the guest
-#  files: directory where files used by xen configuration are stored
-#  disk.cfg: guest disk configuration file. Only edited using this script.
-#    (dtb, kernel image, etc)
-#  disk: directory where files for disk creation are stored
-#  init.[pre,d,post]: directories containing init pre, base and post scrip=
ts
-set -u
-set -e
-
-this=3D"$0"
-
-IMAGE_TMPDIR=3D""
-
-usage() {
-    cat <<EOF
-Usage $this ACTION XENGUEST [ARGS]
-
-Where XENGUEST is a xenguest image file or a xenguest directory.
-
-The following actions are supported:
-help               Display this help
-create             Create a xenguest image
-update             Update/modify a xenguest image
-partial            Create partial xenguest image in a directory
-pack               Pack a xenguest directory into an image
-check              Check a xenguest image
-dump-paramsconfig  Display the guest configuration of a xenguest image
-dump-xenconfig     Display the xen configuration of a xenguest image
-dump-diskconfig    Display the disk configuration of a xenguest image
-dump-init          Display init scripts of a xenguest image
-extract            Extract a xenguest image content
-extract-config     Extract the guest configuration from a xenguest image
-extract-disk-file  Extract a disk file from a xenguest image
-Use $this ACTION --help to have help on a specific action and its argument=
s.
-EOF
-}
-
-usage-check() {
-    cat <<EOF
-Usage $this check XENGUEST
-
-Check a xenguest image or a xenguest directory.
-EOF
-}
-
-usage-update-create() {
-    cat <<EOF
-All arguments are handled in order.
-
-Global configuration for the guest
---guest-config-reset    reset guest global configuration
---set-param=3DPARAM       disable parameter PARAM in guest global configur=
ation
---set-param=3DPARAM=3DVAL   set parameter PARAM to value VAL in guest glob=
al
-                        configuration.
-                        Example of parameters supported are:
-                        GUEST_AUTOBOOT: if set to 1 (default), guest will =
be
-                         automatically created and started during host ini=
t.
-
-Xen configuration for the guest
---xen-reset-config      reset xen guest configuration to default
---xen-name=3D             disable name parameter in xen configuration
---xen-name=3DNAME         set guest name in xen configuration
---xen-kernel=3D           disable guest kernel parameter in xen configurat=
ion
---xen-kernel=3DFILE       set guest kernel to FILE (file is added and xen
-                         configuration is set to use it)
---xen-memory            set guest memory size (in MB)
---xen-vcpus             set guest number of virtual cpus
---xen-clean-extra       set guest command line (extra) to an empty string
---xen-extra=3DARG         append ARG to the guest command line (with space=
)
-                         use this several time to set command line.
-                         To set the command line to "console=3DttyS0 rw" d=
o
-                         --xen-extra=3Dconsole=3DttyS0 --xen-extra=3Drw
---xen-root=3D             disable root parameter in xen configuration
---xen-root=3DROOT         set guest root in xen configuration
---xen-device-tree=3D      disable device tree parameter in xen configurati=
on
---xen-device-tree=3DFILE  set guest device tree in xen configuration and a=
dd
-                         file to xen files
---xen-ramdisk=3D          disable ramdisk parameter in xen configuration
---xen-ramdisk=3DFILE      set guest ramdisk in xen configuration and add
-                         file to xen files
---xen-disk=3D             disable disk parameter in xen configuration
---xen-disk=3DDEV          set guest disk to device DEV (phy:DEV,xvda,w is =
set)
---xen-append=3DFILE       append FILE content to xen configuration
-
-Xen files
---xen-add-file=3DSRC:DST  add file SRC as file DST in the xenguest image.
-                         If DST already exist in the image, it is overwrit=
ten.
-                         DST must be the same as arguments passed to other
-                         options (like --xen-kernel)
---xen-rm-file=3DDST       remove file DST from the xenguest image.
-
-Init configuration
-  This can be used to add init scripts for the guest. There are 3 possible=
 init
-  scripts which are called at different time. The pre scripts are called f=
irst,
-  then the xen guest is created in pause and standard init scripts are cal=
led.
-  Finally the xen guest is started then the post init scripts are called.
-  Each script is called with the name of the guest as first argument and
-  multiple scripts can be added (they must have different names).
-
---init-script=3DFILE      add FILE as init script
---init-pre=3DFILE         add FILE as pre init script
---init-post=3DFILE        add FILE as post init script
-
-Disk configuration
---disk-reset-config     reset disk guest configuration to default (no disk=
)
---disk-size=3DSZ          set guest disk size in MB or GB(default),
-                         e.g 1000M or 2[G].
---disk-device=3DDEV       set device to be used to create the guest disk
-                        if unset or set to an empty string, the volume wil=
l be
-                        create in the default manager volume group.
---disk-add-part=3DDEF     add a partition to the guest disk with definitio=
n DEF
-                         a partition definition must have the following fo=
rmat:
-                         ID:SIZE:FORMAT:CONTENT where:
-                         - ID is the partition numeric ID (1 to 4)
-                         - FORMAT is the filesystem format (supported form=
ats
-                           are none, vfat, swap, ext2, ext3 and ext4) or c=
an be
-                           left empty to not format
-                         - CONTENT can be used to point to a file added us=
ing
-                          --disk-add-file to be used as partition initial
-                          content (tar file or img file)
---disk-rm-part=3DID       remove partition ID from the guest disk
---disk-add-file=3DSRC:DST add file SRC as disk file DST in the xenguest im=
age.
-                         DST can then be used as a partition CONTENT.
---disk-rm-file=3DDST     remove disk file DST from the xenguest image.
-EOF
-}
-
-usage-create() {
-    cat <<EOF
-Usage $this create XENGUEST [ARGS]
-
-Create a xenguest image as XENGUEST file.
-
-EOF
-    usage-update-create
-}
-
-usage-update() {
-    cat <<EOF
-Usage $this update XENGUEST [ARGS]
-
-Update or modify a xenguest image or a xenguest directory.
-
-EOF
-    usage-update-create
-}
-
-usage-pack() {
-    cat <<EOF
-Usage $this pack XENGUEST DESTFILE
-
-Pack a xenguest directory in XENGUEST to create a xenguest image DESTFILE.
-
-EOF
-}
-
-usage-partial() {
-    cat <<EOF
-Usage $this partial XENGUEST [ARGS]
-
-Update or modify a partial xenguest image.
-
-EOF
-    usage-update-create
-}
-
-usage-dump-paramsconfig() {
-    cat <<EOF
-Usage $this dump-paramsconfig XENGUEST
-
-Dump the guest parameters of a xenguest image or directory
-EOF
-}
-
-usage-dump-xenconfig() {
-    cat <<EOF
-Usage $this dump-xenconfig XENGUEST
-
-Dump the xen configuration of a xenguest image or directory
-EOF
-}
-
-usage-dump-diskconfig() {
-    cat <<EOF
-Usage $this dump-diskconfig XENGUEST
-
-Dump the disk configuration of a xenguest image or directory
-EOF
-}
-
-usage-extract() {
-    cat <<EOF
-Usage $this extract XENGUEST DESTDIR
-
-Extract guest to DESTDIR
-EOF
-}
-
-usage-extract-config() {
-    cat <<EOF
-Usage $this extract-config XENGUEST DESTDIR
-
-Extract guest configuration to DESTDIR
-EOF
-}
-
-usage-extract-disk-file() {
-    cat <<EOF
-Usage $this extract-disk-file XENGUEST DISKFILE
-
-Extract disk file DISKFILE to stdout.
-EOF
-}
-
-check_image() {
-    local tstfile=3D${1}
-
-    if [ ! -e ${tstfile} -o ! -w ${tstfile} ]; then
-        echo "Error: File ${tstfile} does not exist or is not writeable"
-        exit 1
-    fi
-
-    if [ -f ${tstfile} ]; then
-        # This is a xenguest file
-        local res=3D$(tar -tvf ${tstfile} ./guest.cfg ./disk.cfg \
-            ./params.cfg > /dev/null 2>&1 || echo "error")
-        if [ -n "${res}" ]; then
-            echo "Error: File ${tstfile} is not a valid xenguest"
-            exit 1
-        fi
-    elif [ -d ${tstfile} ]; then
-        if [ ! -f ${tstfile}/guest.cfg -o ! -f  ${tstfile}/disk.cfg -o \
-            ! ${tstfile}/params.cfg ]; then
-            echo "Error: Directory ${tstfile} is not a valid xenguest"
-            exit 1
-        fi
-    fi
-}
-
-params_config_reset() {
-    cat <<EOF > ${IMAGE_TMPDIR}/params.cfg
-# Xenguest-image guest global configuration
-#
-# !! This file must not be modified manually !!
-#
-# You can use xenguest-image to modify parameters.
-#
-
-# Guest auto boot during Dom0 init
-GUEST_AUTOBOOT=3D"1"
-EOF
-}
-
-params_config_setparam() {
-    param=3D"${1}"
-    shift
-    value=3D"$@"
-
-    if [ -z "$value" ]; then
-        sed -i "/.*${param}=3D.*/d" ${IMAGE_TMPDIR}/params.cfg
-    elif grep -e "^${param}=3D" ${IMAGE_TMPDIR}/params.cfg > /dev/null; th=
en
-        sed -i "s/${param}=3D\".*\"/${param}=3D\"${value}\"/" \
-            ${IMAGE_TMPDIR}/params.cfg
-    else
-        echo "${param}=3D\"${value}\"" >> ${IMAGE_TMPDIR}/params.cfg
-    fi
-}
-
-xen_config_reset() {
-    cat <<EOF > ${IMAGE_TMPDIR}/guest.cfg
-# Xenguest-image main configuraiton
-#
-# !! This file must not be modified manually !!
-#
-# You can use xenguest-image to modify parameters.
-#
-# You can add custom entries to configuration in the guest.d directory.
-
-# Guest name (set by manager when guest is created)
-# name =3D ""
-
-# Guest memory size in MB
-memory =3D 1024
-
-# Number of VCPUS
-vcpus =3D 1
-
-# Guest command line
-extra =3D "earlyprintk=3Dxenboot console=3Dhvc0 rw"
-
-# Guest root filesystem device (from guest point of view)
-# root =3D "/dev/xvda2"
-
-# Disk that will be used by the guest (set by manager when guest is create=
d)
-# disk =3D ['phy:/dev/vg-xen/guestname,xvda,w']
-
-EOF
-}
-
-get_param_file() {
-    param=3D"${1}"
-
-    if grep ${param} ${IMAGE_TMPDIR}/guest.cfg > /dev/null 2>&1; then
-        echo "${IMAGE_TMPDIR}/guest.cfg"
-    else
-        if [ ! -f ${IMAGE_TMPDIR}/guest.d/${param}.cfg ]; then
-            mkdir -p ${IMAGE_TMPDIR}/guest.d
-            echo "# ${param} =3D \"\"" > ${IMAGE_TMPDIR}/guest.d/${param}.=
cfg
-        fi
-        echo "${IMAGE_TMPDIR}/guest.d/${param}.cfg"
-    fi
-}
-
-xen_config_disable_param() {
-    param=3D"${1}"
-    dst=3D$(get_param_file ${param})
-
-    sed -i "s@.*\(${param} =3D .*\)\$@# \1@" ${dst}
-}
-
-xen_config_set_number() {
-    param=3D"${1}"
-    shift
-    value=3D"$@"
-    dst=3D$(get_param_file ${param})
-
-    sed -i "s@.*${param} =3D .*@${param} =3D ${value}@" ${dst}
-}
-
-xen_config_set_string() {
-    param=3D"${1}"
-    shift
-    value=3D"$@"
-    dst=3D$(get_param_file ${param})
-
-    sed -i "s@.*${param} =3D .*@${param} =3D \"${value}\"@" ${dst}
-}
-
-xen_config_append_string() {
-    param=3D"${1}"
-    shift
-    value=3D"$@"
-    dst=3D$(get_param_file ${param})
-
-    sed -i "s@.*${param} =3D \"\([^\"]*\)\"@${param} =3D \"\1 ${value}\"@"=
 ${dst}
-}
-
-xen_config_set_list() {
-    param=3D"${1}"
-    shift
-    value=3D$(echo $@ | tr " " ",")
-    dst=3D$(get_param_file ${param})
-
-    sed -i "s@.*${param} =3D .*@${param} =3D ['${value}']@" ${dst}
-}
-
-disk_config_reset() {
-    echo "DISK_SIZE=3D\"0\"" > ${IMAGE_TMPDIR}/disk.cfg
-    echo "DISK_DEVICE=3D\"\"" >> ${IMAGE_TMPDIR}/disk.cfg
-}
-
-disk_config_rm_part() {
-    partid=3D$1
-    sed -i "/DISK_PART${partid}=3D.*/d" ${IMAGE_TMPDIR}/disk.cfg
-}
-
-is_integer() {
-    if ! [[ "${1}" =3D~ ^[0-9]+$ ]]; then
-        >&2 echo "error: invalid number '${1}'"; exit 1
-    fi
-}
-
-# check size and convert it to MB, e.g '1[G]' =3D> '1000M'
-check_size() {
-    local disksize=3D"${1}"
-
-    [ -n "${disksize}" ] || disksize=3D"invalid"
-
-    # disksize may have appended M or G suffix, let's extract it
-    # ${var:offset:length}, where #var is var length
-    local lastchar=3D"${disksize:${#disksize}-1}"
-    case "${lastchar}" in
-        [0-9])
-            # backwards compatibility
-            is_integer "${disksize}"
-            echo -e "$((${disksize} * 1000))M"
-            return
-            ;;
-        G|M)
-            if [ "${#disksize}" -gt "1" ]; then
-                local size=3D"${disksize::${#disksize}-1}"
-                is_integer "${size}"
-                # convert GB to MB
-                [ "${lastchar}" =3D "M" ] || size=3D$((${size} * 1000))
-                echo -e "${size}M"
-                return
-            fi
-            ;;
-        *)
-            ;;
-    esac
-
-    >&2 echo -e "Invalid size format '${1}'" \
-                "\n\tSupported size format is e.g 1000M or 2[G]"
-    exit 1
-}
-
-disk_config_get_size() {
-    disksize=3D$(echo -e "$( . ${IMAGE_TMPDIR}/disk.cfg && echo $DISK_SIZE=
)")
-    check_size "${disksize}"
-}
-
-disk_config_get_parts() {
-    echo -e "$( . ${IMAGE_TMPDIR}/disk.cfg && \
-                typeset -p | awk '$3 ~ /^DISK_PART/ { print $3 }')"
-}
-
-disk_config_get_free_space() {
-    disk_usage=3D"0"
-    for partinfo in $(disk_config_get_parts)
-    do
-        partsize=3D$(echo "${partinfo}" | cut -d '"' -f2 | sed -e "s/:.*//=
")
-        sizeMB=3D$(check_size "${partsize}")
-        [ -n "${sizeMB}" ] || exit 1
-        disk_usage=3D$((${sizeMB::${#sizeMB}-1} + $disk_usage))
-    done
-
-    disk_size=3D$(disk_config_get_size)
-    echo -e "$((${disk_size::${#disk_size}-1} - ${disk_usage}))M"
-}
-
-disk_check_partition_format() {
-    local partformat=3D"${1}"
-    # if partformat is not defined let's skip this check
-    [ -n "${partformat}" ] || return 0
-
-    case "${partformat}" in
-         vfat|ext2|ext3|ext4|swap)
-            ;;
-        *)
-            # invalid/unknown fstype
-            echo "Invalid file fstype ${partformat}"
-            exit 1
-            ;;
-    esac
-}
-
-disk_check_partition_content() {
-    local partcontent=3D"${1}"
-    # if partcontent is not defined let's skip this check
-    [ -n "${partcontent}" ] || return 0
-
-    case "${partcontent}" in
-        *.img*)
-            case "${partcontent}" in
-                *.img.gz|*.img.bz2|*.img)
-                    ;;
-                *)
-                    # invalid/unknown compression type
-                    echo "Invalid file format in disk ${partcontent}"
-                    exit 1
-                    ;;
-            esac
-            ;;
-        *.tar*)
-            case "${partcontent}" in
-                *.tar.gz|*.tar.bz2|*.tar.xz|*.tar)
-                    ;;
-                *)
-                    # invalid/unknown tar type
-                    echo "Invalid file format in disk ${partcontent}"
-                    exit 1
-                    ;;
-            esac
-            ;;
-        *)
-          #invalid content type
-          echo "Unsupported content type ${partcontent}!"
-          exit 1
-          ;;
-    esac
-    # do not allow to create multiple partitions the same content
-    if grep ":${partcontent}\"" <<< "$(disk_config_get_parts)"; then
-        echo "Error ${partcontent} is already inside guest image"
-        exit 1
-    fi
-}
-
-disk_config_add_part() {
-    partconf=3D"${1}"
-    partid=3D$(echo ${partconf} | sed -e "s/:.*//")
-    partinfo=3D$(echo ${partconf} | sed -e "s/[^:]*://")
-    partsize=3D$(echo ${partinfo} | cut -d ":" -f1)
-    partformat=3D$(echo ${partinfo} | cut -d ":" -f2)
-    partcontent=3D$(echo ${partinfo} | cut -d ":" -f3)
-
-    # check size "ID:*SIZE*:FORMAT:CONTENT"
-    partsizeMB=3D$(check_size "${partsize}")
-
-    # Make sure we don't add the same partition twice
-    disk_config_rm_part "${partid}"
-
-    # check available disk space
-    freespace=3D$(disk_config_get_free_space)
-    if ((${partsizeMB::${#partsizeMB}-1} > ${freespace::${#freespace}-1}))
-    then
-        echo -e "Not enough free disk space(${freespace}) for partition "\
-                "'${partconf}'!"\
-                "\tTo adjust disk size use '--disk-size' parameter"\
-                "\tor shrink the partition with '--disk-add-part' paramete=
r"
-        exit 1
-    fi
-
-    # check format "ID:SIZE:*FORMAT*:CONTENT"
-    disk_check_partition_format "${partformat}"
-
-    # check content "ID:SIZE:FORMAT:*CONTENT*"
-    disk_check_partition_content "${partcontent}"
-
-    echo "DISK_PART${partid}=3D\"${partinfo}\"" >> \
-        ${IMAGE_TMPDIR}/disk.cfg
-}
-
-# We need an action as first argument
-action=3D"${1:-}"
-
-if [ -z "${action}" ]; then
-    echo "Error: No ACTION provided"
-    usage
-    exit 1
-fi
-
-# Only help does not require a xenguest argument so treat this first
-# while there we also check that user is asking for a supported action
-case $action in
-    help|--help|-h|-?)
-        usage
-        exit 0
-        ;;
-    check|create|update|pack|partial)
-        ;;
-    dump-xenconfig|dump-diskconfig|dump-init|dump-paramsconfig)
-        ;;
-    extract|extract-config|extract-disk-file)
-        ;;
-    *)
-        echo "Error: Invalid action $action"
-        exit 1
-        ;;
-esac
-
-# Second argument should be the file name or directory
-guestfile=3D"${2:-}"
-
-# Handle user asking for help on a specific action
-case $guestfile in
-    help|--help|-h|-?)
-        usage-${action}
-        exit 0
-        ;;
-esac
-
-if [ -z "${guestfile}" ]; then
-    echo "Error: no GUESTFILE provided"
-    usage
-    exit 1
-fi
-
-shift 2
-
-case ${action} in
-    check)
-        check_image ${guestfile}
-        echo "Image is OK"
-        exit 0
-        ;;
-    dump-paramsconfig)
-        check_image ${guestfile}
-        echo "Guest configuration:"
-        if [ -f ${guestfile} ]; then
-            tar -xOf ${guestfile} ./params.cfg
-        else
-            cat ${guestfile}/params.cfg
-        fi
-        exit 0
-        ;;
-    dump-xenconfig)
-        check_image ${guestfile}
-        echo "Xen configuration:"
-        if [ -f ${guestfile} ]; then
-            tar -xOf ${guestfile} ./guest.cfg
-            tar -xOf ${guestfile} ./guest.d 2> /dev/null || true
-        else
-            cat ${guestfile}/guest.cfg
-            cat ${guestfile}/guest.d/* 2> /dev/null || true
-        fi
-        echo
-        exit 0
-        ;;
-    dump-diskconfig)
-        check_image ${guestfile}
-        echo "Disk configuration:"
-        if [ -f ${guestfile} ]; then
-            tar -xOf ${guestfile} ./disk.cfg
-        else
-            cat ${guestfile}/disk.cfg
-        fi
-        echo
-        exit 0
-        ;;
-    dump-init)
-        check_image ${guestfile}
-        for init in init.d init-pre init-post; do
-            echo "=3D=3D=3D ${init} =3D=3D=3D"
-            if [ -f ${guestfile} ]; then
-                tar -xOf ${guestfile} ./${init} 2> /dev/null || \
-                    echo "No ${init} scripts."
-            else
-                cat ${guestfile}/${init}/* 2> /dev/null || \
-                    echo "No ${init} scripts."
-            fi
-            echo "=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D"
-            echo
-        done
-        exit 0
-        ;;
-    pack)
-        check_image ${guestfile}
-        if [ ! -d ${guestfile} ]; then
-            echo "Error: Pack can only be done on a xenguest directory"
-            exit 1
-        fi
-
-        if [ -z "${1:-}" ] || [ -f ${1} ]; then
-            echo "Error: No destination file or already existing file"
-            exit 1
-        fi
-
-        tar -C ${guestfile} -cf ${1} .
-        exit 0
-        ;;
-    extract)
-        check_image ${guestfile}
-        if [ -d ${guestfile} ]; then
-            echo "Error: Cannot extract config from xenguest directory"
-            exit 1
-        fi
-
-        if [ -z "${1:-}" ] || [ ! -d ${1} ]; then
-            echo "Error: No destination directory for image extract"
-            exit 1
-        fi
-
-        tar -C ${1} -xf ${guestfile}
-        exit 0
-        ;;
-    extract-config)
-        check_image ${guestfile}
-        if [ -d ${guestfile} ]; then
-            echo "Error: Cannot extract config from xenguest directory"
-            exit 1
-        fi
-
-        if [ -z "${1:-}" ] || [ ! -d ${1} ]; then
-            echo "Error: No destination directory for config extract"
-            exit 1
-        fi
-
-        #extract all but disk files
-        tar -C ${1} --exclude=3D'./disk' -xf ${guestfile}
-        exit 0
-        ;;
-    extract-disk-file)
-        check_image ${guestfile}
-
-        if [ -d ${guestfile} ]; then
-            echo "Error: Cannot extract disk file from xenguest directory"=
 >&2
-            exit 1
-        fi
-
-        if [ -z "${1:-}" ]; then
-            echo "Error: No file to extract" >&2
-            exit 1
-        fi
-
-        tar -xOf ${guestfile} ./disk/${1}
-        exit 0
-        ;;
-    create)
-        if [ -f ${guestfile} ]; then
-            echo "Error: File ${guestfile} already exist"
-            exit 1
-        elif [ -d ${guestfile} ]; then
-            if [ -n "$(ls -A ${guestfile})" ]; then
-                echo "Error: Directory ${guestfile} is not empty"
-                exit 1
-            fi
-            IMAGE_TMPDIR=3D$(realpath -m ${guestfile})
-        else
-            IMAGE_TMPDIR=3D$(mktemp -d)
-        fi
-
-        # Create initial content
-        params_config_reset
-        xen_config_reset
-        disk_config_reset
-        ;;
-    update)
-        check_image ${guestfile}
-
-        if [ -f ${guestfile} ]; then
-            # Extract the image to update it
-            IMAGE_TMPDIR=3D$(mktemp -d)
-            tar -C ${IMAGE_TMPDIR} -xf ${guestfile}
-        else
-            IMAGE_TMPDIR=3D$(realpath -m ${guestfile})
-        fi
-        ;;
-    partial)
-        if [ -e ${guestfile} -a ! -d ${guestfile} ]; then
-            echo "Error: Invalid partial output directory"
-            exit 1
-        fi
-        mkdir -p ${guestfile}
-        IMAGE_TMPDIR=3D$(realpath -m ${guestfile})
-        ;;
-    *)
-        echo "Invalid action ${action}"
-        usage
-        exit 1
-        ;;
-esac
-
-# Process command line arguments
-for arg in "${@}"; do
-    case ${arg} in
-        --*=3D*)
-            optarg=3D$(echo ${arg} | sed -e "s/[^=3D]*=3D//")
-            ;;
-        *)
-            optarg=3D""
-            ;;
-    esac
-
-    case ${arg} in
-        --guest-reset-config)
-            params_config_reset
-            ;;
-        --set-param=3D*=3D*)
-            param_name=3D$(echo $optarg | sed -e "s/=3D.*//")
-            param_value=3D$(echo $optarg | sed -e "s/[^=3D]*=3D//")
-            params_config_setparam "$param_name" "$param_value"
-            ;;
-        --set-param=3D*)
-            params_config_setparam "$optarg"
-            ;;
-        --xen-reset-config)
-            xen_config_create
-            ;;
-        --xen-name=3D*)
-            if [ -z "${optarg}" ]; then
-                xen_config_disable_param "name"
-            else
-                xen_config_set_string "name" "${optarg}"
-            fi
-            ;;
-        --xen-kernel=3D*)
-            if [ -z "${optarg}" ]; then
-                xen_config_disable_param "kernel"
-                rm -f ${IMAGE_TMPDIR}/files/kernel
-            else
-                if [ ! -f ${optarg} ]; then
-                    echo "Error: invalid kernel file ${optarg}"
-                    exit 1
-                fi
-                xen_config_set_string "kernel" "files/kernel"
-                mkdir -p ${IMAGE_TMPDIR}/files
-                install -m 644 ${optarg} ${IMAGE_TMPDIR}/files/kernel
-            fi
-            ;;
-        --xen-memory=3D*)
-            xen_config_set_number "memory" ${optarg}
-            ;;
-        --xen-vcpus=3D*)
-            xen_config_set_number "vcpus" ${optarg}
-            ;;
-        --xen-clean-extra)
-            xen_config_set_string "extra" ""
-            ;;
-        --xen-extra=3D*)
-            xen_config_append_string "extra" ${optarg}
-            ;;
-        --xen-root=3D*)
-            if [ -z "${optarg}" ]; then
-                xen_config_disable_param "root"
-            else
-                xen_config_set_string "root" "${optarg}"
-            fi
-            ;;
-        --xen-device-tree=3D*)
-            if [ -z "${optarg}" ]; then
-                xen_config_disable_param "device_tree"
-                rm -f ${IMAGE_TMPDIR}/files/guest.dtb
-            else
-                if [ ! -f ${optarg} ]; then
-                    echo "Error: invalid dtb file ${optarg}"
-                    exit 1
-                fi
-                xen_config_set_string "device_tree" "files/guest.dtb"
-                mkdir -p ${IMAGE_TMPDIR}/files
-                install -m 644 ${optarg} ${IMAGE_TMPDIR}/files/guest.dtb
-            fi
-            ;;
-        --xen-ramdisk=3D*)
-            if [ -z "${optarg}" ]; then
-                xen_config_disable_param "ramdisk"
-                rm -f ${IMAGE_TMPDIR}/files/ramdisk.img
-            else
-                if [ ! -f ${optarg} ]; then
-                    echo "Error: invalid ramdisk file ${optarg}"
-                    exit 1
-                fi
-                xen_config_set_string "ramdisk" "files/ramdisk.img"
-                mkdir -p ${IMAGE_TMPDIR}/files
-                install -m 644 ${optarg} ${IMAGE_TMPDIR}/files/ramdisk.img
-            fi
-            ;;
-        --xen-disk=3D*)
-            if [ -z "${optarg}" ]; then
-                xen_config_disable_param "disk"
-            else
-                xen_config_set_list "disk" "phy:${optarg}" "xvda" "w"
-            fi
-            ;;
-        --xen-append=3D*)
-            if [ ! -f ${optarg} ]; then
-                echo "Error: invalid xen append file ${optarg}"
-                exit 1
-            fi
-            mkdir -p ${IMAGE_TMPDIR}/guest.d
-            install -m 755 ${optarg} ${IMAGE_TMPDIR}/guest.d/.
-            ;;
-        --xen-add-file=3D*)
-            src=3D$(echo "${optarg}" | sed -e "s/:.*//")
-            dst=3D$(echo "${optarg}" | sed -e "s/.*://")
-            if [ ! -f ${src} ]; then
-                echo "Error: Invalid file: ${src}"
-                rm -rf ${IMAGE_TMPDIR}
-                exit 1
-            fi
-            if [ -z "${dst}" ]; then
-                dst=3D$(basename ${src})
-            fi
-            mkdir -p ${IMAGE_TMPDIR}/files/$(dirname ${dst})
-            cp -f ${src} ${IMAGE_TMPDIR}/files/${dst}
-            ;;
-        --xen-rm-file=3D*)
-            rm -f ${IMAGE_TMPDIR}/files/${optarg}
-            ;;
-        --init-script=3D*|--init-pre=3D*|--init-post=3D*)
-            dst=3D""
-            case $arg in
-                --init-script=3D*)
-                    dst=3D"init.d"
-                    ;;
-                --init-pre=3D*)
-                    dst=3D"init.pre"
-                    ;;
-                --init-post=3D*)
-                    dst=3D"init.post"
-                    ;;
-            esac
-            if [ ! -f ${optarg} ]; then
-                echo "${optarg} does not point to a valid file"
-                exit 1
-            else
-                mkdir -p ${IMAGE_TMPDIR}/${dst}
-                install -m 755 ${optarg} ${IMAGE_TMPDIR}/${dst}/.
-            fi
-            ;;
-        --disk-reset-config)
-            disk_config_reset
-            ;;
-        --disk-size=3D*)
-            size=3D$(check_size "${optarg}")
-            [ -n "size" ] || exit 1
-            sed -i "s/DISK_SIZE=3D.*/DISK_SIZE=3D\"${size}\"/" \
-                ${IMAGE_TMPDIR}/disk.cfg
-            ;;
-        --disk-device=3D*)
-            sed -i "s@DISK_DEVICE=3D.*@DISK_DEVICE=3D\"${optarg}\"@" \
-                ${IMAGE_TMPDIR}/disk.cfg
-            ;;
-        --disk-add-part=3D*)
-            disk_config_add_part ${optarg}
-            ;;
-        --disk-rm-part=3D*)
-            disk_config_rm_part ${optarg}
-            ;;
-        --disk-add-file=3D*)
-            src=3D$(echo "${optarg}" | sed -e "s/:.*//")
-            dst=3D$(echo "${optarg}" | sed -e "s/.*://")
-            if [ ! -f ${src} ]; then
-                echo "Error: Invalid disk file: ${src}"
-                rm -rf ${IMAGE_TMPDIR}
-                exit 1
-            fi
-            if [ -z "${dst}" ]; then
-                dst=3D$(basename ${src})
-            fi
-            mkdir -p ${IMAGE_TMPDIR}/disk/$(dirname ${dst})
-            cp -f ${src} ${IMAGE_TMPDIR}/disk/${dst}
-            ;;
-        --disk-rm-file=3D*)
-            rm -f ${IMAGE_TMPDIR}/disk/${optarg}
-            ;;
-        *)
-            echo "Unsupported command: ${arg}"
-            exit 1
-            ;;
-    esac
-done
-
-if [ ! -d ${guestfile} ]; then
-    # If the original guest was in a file we need to repack the file
-    # with the changes we did on it in the IMAGE_TMPDIR
-    rm -f ${guestfile}
-    tar -C ${IMAGE_TMPDIR} -cf ${guestfile} .
-    rm -rf ${IMAGE_TMPDIR}
-fi
-
diff --git a/meta-arm-autonomy/recipes-extended/xenguest/files/xenguest-net=
work-bridge-dhcp.cfg.in b/meta-arm-autonomy/recipes-extended/xenguest/files=
/xenguest-network-bridge-dhcp.cfg.in
deleted file mode 100644
index 6e06379..0000000
--- a/meta-arm-autonomy/recipes-extended/xenguest/files/xenguest-network-br=
idge-dhcp.cfg.in
+++ /dev/null
@@ -1,3 +0,0 @@
-# Xenguest Network Bridge interface configuration
-auto ###BRIDGE_NAME###
-iface ###BRIDGE_NAME### inet dhcp
diff --git a/meta-arm-autonomy/recipes-extended/xenguest/files/xenguest-net=
work-bridge.in b/meta-arm-autonomy/recipes-extended/xenguest/files/xenguest=
-network-bridge.in
deleted file mode 100755
index 54b5a2f..0000000
--- a/meta-arm-autonomy/recipes-extended/xenguest/files/xenguest-network-br=
idge.in
+++ /dev/null
@@ -1,44 +0,0 @@
-#!/bin/sh
-#
-# Xenguest Network Bridge init
-# This script creates a network bridge and add host interfaces to it
-# It will then be used by xen guests to connect to the external nework
-#
-
-INTFS=3D"###BRIDGE_MEMBERS###"
-BR_INTF=3D"###BRIDGE_NAME###"
-
-case "$1" in
-  start)
-        echo "Starting $BR_INTF"
-        brctl addbr $BR_INTF
-        for intf in $INTFS; do
-            echo "Adding $intf to $BR_INTF"
-            brctl addif $BR_INTF $intf
-        done
-        ;;
-  status)
-        true
-        ;;
-  stop)
-        echo "Stopping $BR_INTF"
-        ifdown $BR_INTF
-        brctl delbr $BR_INTF
-        ;;
-  reload)
-        echo >&2 'Reload not available; use force-reload'; exit 1
-        ;;
-  force-reload|restart)
-        echo "Restarting host-bridge"
-        $0 stop
-        $0 start
-        ;;
-  *)
-        # do not advertise unreasonable commands that there is no reason
-        # to use with this device
-        echo "Usage: $0 {start|stop|status|restart|force-reload}"
-        exit 1
-esac
-
-exit $?
-
diff --git a/meta-arm-autonomy/recipes-extended/xenguest/files/xenguest-net=
work-init-post.sh b/meta-arm-autonomy/recipes-extended/xenguest/files/xengu=
est-network-init-post.sh
deleted file mode 100755
index b63c6a2..0000000
--- a/meta-arm-autonomy/recipes-extended/xenguest/files/xenguest-network-in=
it-post.sh
+++ /dev/null
@@ -1,45 +0,0 @@
-#!/bin/sh
-# This script is to reload kea dhcp4 server when guest interface will be r=
eady
-
-# include locking functions
-. /etc/xen/scripts/locking.sh
-set +u
-
-# $1 is vif name, e.g. "vif/15/0"
-# returns 0 on success,
-# 1 otherwize
-#
-
-check_if_vif_is_ready() {
-    ret=3D$(xl network-list "${guestname:?}" | grep  "${1}" \
-        | tr -s ' ' | cut -d' ' -f5)
-    # ${ret} is network interface status value
-    # 1 means vif is not ready
-    # 4 means vif is ready
-    [ "${ret}" =3D "4" ] && return 0
-    return 1
-}
-
-case "${XENGUEST_NETWORK_TYPE:-}" in
-    nat)
-        vif_name=3D"$(xl network-list "${guestname:?}" | grep -o "vif.*")"
-
-        for try in $(seq 20)
-        do
-            if check_if_vif_is_ready "${vif_name}"; then
-                claim_lock "vif-nat-kea"
-                keactrl reload
-                release_lock "vif-nat-kea"
-                exit 0
-            fi
-            log info "Waiting for ${vif_name} - network interface is not r=
eady..."
-            log info "try #${try}"
-            sleep 1
-        done
-        log error "Failed to get ${vif_name}. network interface ready!"
-        exit 1
-        ;;
-    *)
-        log verbose "No action needed"
-        ;;
-esac
diff --git a/meta-arm-autonomy/recipes-extended/xenguest/xenguest-base-imag=
e.bb b/meta-arm-autonomy/recipes-extended/xenguest/xenguest-base-image.bb
deleted file mode 100644
index d3efed1..0000000
--- a/meta-arm-autonomy/recipes-extended/xenguest/xenguest-base-image.bb
+++ /dev/null
@@ -1,157 +0,0 @@
-# Create a xenguest base image
-#
-# This recipe creates a base image that is then extended by other recipes
-# through xenguest_image class.
-# xenguest image type uses this recipe as a base to add a kernel and a dis=
k
-# image to create a guest
-#
-# The recipe also adds files in those directories to the xenguest image:
-# - ${WORKDIR}/extend/disk-files: all files in this directory will be adde=
d to
-#   the guest disk files (using --disk-add-file)
-# - ${WORKDIR}/extend/files: all files in this directory will be added to =
the
-#   guest xen files (using --xen-add-file)
-# - ${WORKDIR}/extend/guest.d: all files in this directory will be added t=
o
-#   the xen append configuration files (using --xen-append)
-# - ${WORKDIR}/extend/init.[pre|post|d]: all files in those directories wi=
ll
-#   be added to the corresponding init scripts (using --init-[pre|post|scr=
ipt])
-# You can bbappend this recipe and put files in ${WORKDIR}/extend to add
-# elements to the image.
-#
-
-DESCRIPTION =3D "Xenguest Base Image"
-LICENSE =3D "MIT"
-
-LIC_FILES_CHKSUM =3D "file://${COMMON_LICENSE_DIR}/MIT;md5=3D0835ade698e0b=
cf8506ecda2f7b4f302"
-
-# When XENGUEST_IMAGE_NETWORK_TYPE=3D"nat", the "00-xenguest-nat-port-forw=
ard.hook"
-# is called by "/etc/xen/scripts/vif-post.d/00-vif-xenguest.hook" to apply=
 NAT
-# port forwarding. Both dom0 and domU ports can be be set by changing the
-# XENGUEST_IMAGE_HOST_PORT and XENGUEST_IMAGE_GUEST_PORT variables in loca=
l.conf
-# or xenguest-base-image.bbappend. The XENGUEST_IMAGE_NAT_PORT_FORWARD_SCR=
IPT
-# can also be replaced in a xenguest-base-image.bbappend
-XENGUEST_IMAGE_HOST_PORT ?=3D "\$( expr 1000 + \${domid} )"
-XENGUEST_IMAGE_GUEST_PORT ?=3D "22"
-XENGUEST_IMAGE_NAT_PORT_FORWARD_SCRIPT ?=3D "00-xenguest-nat-port-forward.=
hook"
-
-#
-# The following variables can contain SRC_URI compatible entries to add
-# files to the xenguest image.
-# You can set those variable in local.conf to add one or several files
-# For example to add a boot.tar.gz file that has to be downloaded to the f=
ile
-# useable for disk partition initialisation:
-# XENGUEST_IMAGE_SRC_URI_DISK_FILES +=3D "https://www.test.com/files/boot.=
tar.gz"
-
-# Add disk files
-XENGUEST_IMAGE_SRC_URI_DISK_FILES ??=3D ""
-
-# Add xen files
-# Any extrafiles files to be added to XENGUEST_IMAGE_SRC_URI_XEN_FILES sho=
uld
-# be performed via XENGUEST_IMAGE_SRC_URI_XEN_FILES:append.
-# The kea-subnet4.json holds the kea dhcp4 subnet configuration for Dom0.
-# And it is used when XENGUEST_IMAGE_NETWORK_TYPE=3D"nat".
-# Any customizations to it should be performed by replacing it
-# via a xenguest-network.bbappend.
-# The XENGUEST_IMAGE_NAT_PORT_FORWARD_SCRIPT file is only added if the
-# variable is set.
-XENGUEST_IMAGE_SRC_URI_XEN_FILES =3D "file://kea-subnet4.json \
-    ${@ "file://" + d.getVar('XENGUEST_IMAGE_NAT_PORT_FORWARD_SCRIPT') \
-      if d.getVar('XENGUEST_IMAGE_NAT_PORT_FORWARD_SCRIPT') else "" } \
-    "
-
-# Add xen configuration elements
-XENGUEST_IMAGE_SRC_URI_XEN_CONFIG ??=3D ""
-
-# Add pre init script
-XENGUEST_IMAGE_SRC_URI_INIT_PRE ??=3D ""
-
-# Add init script
-XENGUEST_IMAGE_SRC_URI_INIT ??=3D ""
-
-# Add post init script
-XENGUEST_IMAGE_SRC_URI_INIT_POST ??=3D ""
-
-S =3D "${WORKDIR}"
-
-# Extra vars to add to xenguest.env
-XENGUEST_IMAGE_VARS_EXTRA +=3D "\
- XENGUEST_IMAGE_HOST_PORT XENGUEST_IMAGE_GUEST_PORT \
- XENGUEST_IMAGE_NAT_PORT_FORWARD_SCRIPT XENGUEST_IMAGE_SRC_URI_DISK_FILES =
\
- XENGUEST_IMAGE_SRC_URI_XEN_FILES XENGUEST_IMAGE_SRC_URI_XEN_CONFIG \
- XENGUEST_IMAGE_SRC_URI_INIT_PRE XENGUEST_IMAGE_SRC_URI_INIT \
- XENGUEST_IMAGE_SRC_URI_INIT_POST"
-
-inherit deploy xenguest_image
-
-# parse XENGUEST_IMAGE_SRC_URI_ variables and add them to SRC_URI
-python __anonymous() {
-    def parse_extend_variable(d, varname, destdir):
-        list =3D d.getVar(varname)
-        if list:
-            for entry in list.split():
-                #Check the URL
-                try:
-                    decode =3D bb.fetch.decodeurl(entry)
-                    d.appendVar('SRC_URI', ' ' + entry + ';unpack=3D0;subd=
ir=3Dextend/' + destdir)
-                except:
-                    bb.fatal("%s: %s contains an invalid URL:  %s" \
-                    % (d.getVar('PF'), varname, entry))
-
-    parse_extend_variable(d, 'XENGUEST_IMAGE_SRC_URI_DISK_FILES', 'disk-fi=
les')
-    parse_extend_variable(d, 'XENGUEST_IMAGE_SRC_URI_XEN_FILES', 'files')
-    parse_extend_variable(d, 'XENGUEST_IMAGE_SRC_URI_XEN_CONFIG', 'guest.d=
')
-    parse_extend_variable(d, 'XENGUEST_IMAGE_SRC_URI_INIT_PRE', 'init.pre'=
)
-    parse_extend_variable(d, 'XENGUEST_IMAGE_SRC_URI_INIT', 'init.d')
-    parse_extend_variable(d, 'XENGUEST_IMAGE_SRC_URI_INIT_POST', 'init.pos=
t')
-}
-
-# Make sure we are removing old files before redoing a fetch
-do_fetch[cleandirs] +=3D "${WORKDIR}/extend"
-do_fetch[vardeps] +=3D "XENGUEST_IMAGE_HOST_PORT XENGUEST_IMAGE_GUEST_PORT=
"
-
-do_compile[noexec] =3D "1"
-do_install[noexec] =3D "1"
-
-add_extend_files() {
-    local subdir=3D"$1"
-    local cmd=3D"$2"
-    local stripdest=3D"${3:-n}"
-
-    if [ -d ${WORKDIR}/extend/$subdir ]; then
-        filelist=3D$(find ${WORKDIR}/extend/$subdir -type f)
-
-        if [ -n "$filelist" ]; then
-            for f in $filelist; do
-                if [ "$stripdest" =3D "y" ]; then
-                    call_xenguest_mkimage update --$cmd=3D$f:$(basename $f=
)
-                else
-                    call_xenguest_mkimage update --$cmd=3D$f
-                fi
-            done
-        fi
-    fi
-}
-
-do_configure() {
-    if [ -f ${WORKDIR}/extend/files/${XENGUEST_IMAGE_NAT_PORT_FORWARD_SCRI=
PT} ]; then
-        sed -i "s,###HOST_PORT###,${XENGUEST_IMAGE_HOST_PORT}," \
-               ${WORKDIR}/extend/files/${XENGUEST_IMAGE_NAT_PORT_FORWARD_S=
CRIPT}
-        sed -i "s,###GUEST_PORT###,${XENGUEST_IMAGE_GUEST_PORT}," \
-               ${WORKDIR}/extend/files/${XENGUEST_IMAGE_NAT_PORT_FORWARD_S=
CRIPT}
-    fi
-}
-
-do_deploy() {
-    # Create a new image
-    xenguest_image_create
-
-    # Add our extra files if any
-    add_extend_files "disk-files" "disk-add-file" "y"
-    add_extend_files "files" "xen-add-file" "y"
-    add_extend_files "guest.d" "xen-append"
-    add_extend_files "init.pre" "init-pre"
-    add_extend_files "init.d" "init-script"
-    add_extend_files "init.post" "init-post"
-}
-
-addtask deploy after do_install before do_build
-
diff --git a/meta-arm-autonomy/recipes-extended/xenguest/xenguest-extern-gu=
ests.bb b/meta-arm-autonomy/recipes-extended/xenguest/xenguest-extern-guest=
s.bb
deleted file mode 100644
index ac58184..0000000
--- a/meta-arm-autonomy/recipes-extended/xenguest/xenguest-extern-guests.bb
+++ /dev/null
@@ -1,85 +0,0 @@
-# Xenguest Extern Guests
-#
-# This recipe installs the extern guest files specified in
-# ARM_AUTONOMY_HOST_IMAGE_EXTERN_GUESTS into the host image, They are inst=
alled
-# to the directory XENGUEST_MANAGER_GUEST_DIR
-#
-# src_uri_parse_var.bbclass is used to parse
-# ARM_AUTONOMY_HOST_IMAGE_EXTERN_GUESTS and add the guest paths to the SRC=
_URI
-# to be fetched and unpacked to ${WORKDIR}/${SRC_URI_FROM_VAR_UNPACK_DIR}
-#
-# Further documentation can be found in documentation/arm-autonomy-quickst=
art.md,
-# in the section named "Include guests directly in the host image"
-
-DESCRIPTION =3D "Xenguest Extern Guests"
-LICENSE =3D "MIT"
-
-LIC_FILES_CHKSUM =3D "file://${COMMON_LICENSE_DIR}/MIT;md5=3D0835ade698e0b=
cf8506ecda2f7b4f302"
-
-# Global value of XENGUEST_MANAGER_GUEST_DIR set here
-require conf/xenguest.conf
-
-ARM_AUTONOMY_HOST_IMAGE_EXTERN_GUESTS ??=3D ""
-
-# Parse the variable ARM_AUTONOMY_HOST_IMAGE_EXTERN_GUESTS for xenguest fi=
les,
-# unpack them to SRC_URI_FROM_VAR_UNPACK_DIR and create a manifest file
-# containing each of SRC_URI_FROM_VAR_MANIFEST_PARAMS for each entry
-inherit set_src_uri_from_var
-SRC_URI_FROM_VAR_NAME =3D "ARM_AUTONOMY_HOST_IMAGE_EXTERN_GUESTS"
-SRC_URI_FROM_VAR_MANIFEST_PARAMS=3D "guestname=3D[basename] guestcount=3D1=
"
-SRC_URI_FROM_VAR_UNPACK_DIR =3D "xenguests"
-
-# Unnecessary tasks
-do_compile[noexec] =3D "1"
-do_configure[noexec] =3D "1"
-do_patch[noexec] =3D "1"
-
-# Install guest files to XENGUEST_MANAGER_GUEST_DIR
-do_install() {
-
-    local guestfile guestname guestcount
-
-    if [ -f "${WORKDIR}/${SRC_URI_FROM_VAR_UNPACK_DIR}/manifest" ]; then
-
-        install -d "${D}${XENGUEST_MANAGER_GUEST_DIR}"
-
-        # Iterate over manifest file containing parameters
-        while read -r guestfile guestname guestcount _; do
-            [ -f "${WORKDIR}/${SRC_URI_FROM_VAR_UNPACK_DIR}/${guestfile}" =
] ||
-                bbfatal "${guestfile} does not exist"
-
-            install -m 644 \
-                "${WORKDIR}/${SRC_URI_FROM_VAR_UNPACK_DIR}/${guestfile}" \
-                "${D}${XENGUEST_MANAGER_GUEST_DIR}/${guestname}.xenguest"
-
-            # Create symlinks for duplicate guests, appending numbers to
-            # guestname
-            for i in `seq 2 $guestcount`
-            do
-                ln -s -r \
-                    "${D}${XENGUEST_MANAGER_GUEST_DIR}/${guestname}.xengue=
st" \
-                    "${D}${XENGUEST_MANAGER_GUEST_DIR}/${guestname}$i.xeng=
uest"
-            done
-
-        done < "${WORKDIR}/${SRC_URI_FROM_VAR_UNPACK_DIR}/manifest"
-    fi
-}
-
-do_install[vardeps] +=3D "ARM_AUTONOMY_HOST_IMAGE_EXTERN_GUESTS"
-
-FILES:${PN} +=3D "${XENGUEST_MANAGER_GUEST_DIR}"
-
-# In a multiconfig build this variable will hold a dependency string, whic=
h
-# differs based on whether the guest has initramfs or not.  It may have a =
space
-# seperated list of dependency strings if mulitple guest types are configu=
red
-MC_DOIMAGE_MCDEPENDS ?=3D ""
-# Example value: mc:host:guest:core-image-minimal:do_merge_xenguestenv
-
-# In a multiconfig build the host task 'do_image' has a dependency on
-# multiconfig guest.  This ensures that the guest image file already exist=
s
-# when it is needed by the host
-DO_IMAGE_MCDEPENDS :=3D "${@ '${MC_DOIMAGE_MCDEPENDS}' \
-if d.getVar('BBMULTICONFIG') else ''}"
-
-# Apply mc dependency. Empty string if multiconfig not enabled
-do_fetch[mcdepends] +=3D "${DO_IMAGE_MCDEPENDS}"
diff --git a/meta-arm-autonomy/recipes-extended/xenguest/xenguest-manager.b=
b b/meta-arm-autonomy/recipes-extended/xenguest/xenguest-manager.bb
deleted file mode 100644
index 83ff95d..0000000
--- a/meta-arm-autonomy/recipes-extended/xenguest/xenguest-manager.bb
+++ /dev/null
@@ -1,63 +0,0 @@
-# Xenguest manager recipe
-#
-# xenguest-manager is a tool to control xen guests (e.g. create, start, st=
op)
-#
-# Usage documentation for the xenguest-manager tool can be found in
-# meta-arm-autonomy/documentation/xenguest-manager.md including the
-# customizable bitbake variables.
-
-DESCRIPTION =3D "Xen Guest Manager"
-LICENSE =3D "MIT"
-
-SRC_URI =3D " \
-    file://xenguest-manager \
-    file://xenguest-init \
-    file://logrotate-xenguest \
-    "
-LIC_FILES_CHKSUM =3D "file://${COMMON_LICENSE_DIR}/MIT;md5=3D0835ade698e0b=
cf8506ecda2f7b4f302"
-
-S =3D "${WORKDIR}"
-
-XENGUEST_MANAGER_VOLUME_DEVICE ?=3D "/dev/sda2"
-XENGUEST_MANAGER_VOLUME_NAME ?=3D "vg-xen-$(basename ${XENGUEST_MANAGER_VO=
LUME_DEVICE})"
-XENGUEST_MANAGER_LOG_LEVEL ?=3D "ERROR"
-#XENGUEST_MANAGER_GUEST_DIR set in xenguest.conf
-
-require conf/xenguest.conf
-
-# We add an init script to create and start guests automatically
-# run start script after xen-tools and run stop script before xen-tools
-INITSCRIPT_NAME =3D "xenguest"
-INITSCRIPT_PARAMS =3D "start 90 2 3 4 5 . stop 79 0 1 6 ."
-
-inherit allarch update-rc.d
-
-do_compile() {
-    echo "XENGUEST_VOLUME_DEVICE=3D\"${XENGUEST_MANAGER_VOLUME_DEVICE}\"" =
> \
-        xenguest-manager.conf
-    echo "XENGUEST_VOLUME_NAME=3D\"${XENGUEST_MANAGER_VOLUME_NAME}\"" >> \
-        xenguest-manager.conf
-    echo "XENGUEST_GUEST_DIR=3D\"${XENGUEST_MANAGER_GUEST_DIR}\"" >> \
-        xenguest-manager.conf
-    echo "XENGUEST_LOG_LEVEL=3D\"${XENGUEST_MANAGER_LOG_LEVEL}\"" >> \
-        xenguest-manager.conf
-}
-
-do_install() {
-    install -d -m 755 ${D}${bindir}
-    install -m 755 xenguest-manager ${D}${bindir}/.
-    install -d -m 755 ${D}${sysconfdir}/xenguest
-    install -m 644 xenguest-manager.conf ${D}${sysconfdir}/xenguest/.
-    install -d -m 755 ${D}${sysconfdir}/init.d
-    install -m 755 xenguest-init ${D}${sysconfdir}/init.d/${INITSCRIPT_NAM=
E}
-    install -d -m 755 ${D}${XENGUEST_GUEST_DIR}
-    install -d -m 755 ${D}${sysconfdir}/logrotate.d
-    install -m 644 logrotate-xenguest ${D}${sysconfdir}/logrotate.d/xengue=
st
-}
-
-# Things that we need on the target
-RDEPENDS:${PN} +=3D "bash xenguest-mkimage lvm2 xen-tools parted e2fsprogs=
 \
-                   dosfstools logrotate"
-
-FILES:${PN} +=3D "${bindir}/xenguest-manager \
-               ${sysconfdir}/xenguest"
diff --git a/meta-arm-autonomy/recipes-extended/xenguest/xenguest-mkimage.b=
b b/meta-arm-autonomy/recipes-extended/xenguest/xenguest-mkimage.bb
deleted file mode 100644
index 91344aa..0000000
--- a/meta-arm-autonomy/recipes-extended/xenguest/xenguest-mkimage.bb
+++ /dev/null
@@ -1,36 +0,0 @@
-# Xenguest mkimage recipe
-#
-# xenguest-mkimage is a tool to create/modify images to be used as xen gue=
sts
-# Produced images contains a xen configuration and several optional compon=
ents
-# (kernel, device-tree, disk definition and files, and init scripts) which=
 all
-# together fully define a xen guest image
-#
-# Usage documentation for the xenguest-mkimage tool can be found in
-# meta-arm-autonomy/documentation/xenguest-mkimage.md
-
-DESCRIPTION =3D "Xenguest mkimage tool"
-LICENSE =3D "MIT"
-
-SRC_URI =3D "file://xenguest-mkimage"
-
-LIC_FILES_CHKSUM =3D "file://${COMMON_LICENSE_DIR}/MIT;md5=3D0835ade698e0b=
cf8506ecda2f7b4f302"
-
-S =3D "${WORKDIR}"
-
-# Can be built native also to produce xenguest images during Yocto build
-BBCLASSEXTEND =3D "native"
-
-inherit allarch
-
-do_configure[noexec] =3D "1"
-do_compile[noexec] =3D "1"
-
-do_install() {
-    install -d -m 755 ${D}${bindir}
-    install -m 755 xenguest-mkimage ${D}${bindir}/.
-}
-
-# We need bash
-RDEPENDS:${PN} =3D "bash"
-FILES:${PN} =3D "${bindir}/xenguest-mkimage"
-
diff --git a/meta-arm-autonomy/recipes-extended/xenguest/xenguest-network.b=
b b/meta-arm-autonomy/recipes-extended/xenguest/xenguest-network.bb
deleted file mode 100644
index 31a06ad..0000000
--- a/meta-arm-autonomy/recipes-extended/xenguest/xenguest-network.bb
+++ /dev/null
@@ -1,96 +0,0 @@
-# Recipe to handle xenguest network configuration
-DESCRIPTION =3D "Xenguest Network"
-
-LICENSE =3D "MIT"
-LIC_FILES_CHKSUM =3D "file://${COMMON_LICENSE_DIR}/MIT;md5=3D0835ade698e0b=
cf8506ecda2f7b4f302"
-
-S =3D "${WORKDIR}"
-
-# Please refer to documentation/xenguest-network-bridge.md for documentati=
on on
-# the parameters available for customization
-XENGUEST_NETWORK_BRIDGE_NAME ?=3D "xenbr0"
-
-# The XENGUEST_NETWORK_BRIDGE_MEMBERS should be set in a machine.conf
-# or bbappend file.
-#XENGUEST_NETWORK_BRIDGE_MEMBERS ?=3D "eth0"
-
-XENGUEST_NETWORK_BRIDGE_CONFIG ?=3D "xenguest-network-bridge-dhcp.cfg.in"
-
-SRC_URI =3D " \
-    file://xenguest-network-bridge.in \
-    file://xenguest-network-bridge-dhcp.cfg.in \
-    file://network-bridge.sh.in \
-    file://00-vif-xenguest.hook \
-    file://xenguest-network-init-post.sh \
-    file://kea-dhcp4.conf \
-    file://kea-restore-default-config \
-    "
-PACKAGES =3D+ "${PN}-kea-dhcp4"
-
-# Bridge configurator needs to run before S01networking init script
-# Prefix with a_ to make sure it is executed in runlevel 01 before others
-# run start script before ifupdown and run stop script after ifupdown
-INITSCRIPT_PACKAGES =3D "${PN} ${PN}-kea-dhcp4"
-INITSCRIPT_NAME:${PN} =3D "a_xenguest-network-bridge"
-INITSCRIPT_PARAMS:${PN} =3D "start 01 2 3 4 5 . stop 81 0 1 6 ."
-
-# Kea configuration needs to be restored before kea init scripts:
-# Kea dhcp4 server is 30, so lets use 20, to have higher priority
-INITSCRIPT_NAME:${PN}-kea-dhcp4 =3D "kea-restore-default-config"
-INITSCRIPT_PARAMS:${PN}-kea-dhcp4 =3D "defaults 20"
-
-inherit allarch update-rc.d
-
-do_install() {
-    cat ${WORKDIR}/xenguest-network-bridge.in \
-       | sed -e "s,###BRIDGE_MEMBERS###,${XENGUEST_NETWORK_BRIDGE_MEMBERS}=
," \
-       | sed -e "s,###BRIDGE_NAME###,${XENGUEST_NETWORK_BRIDGE_NAME}," \
-       > ${WORKDIR}/xenguest-network-bridge
-    cat ${WORKDIR}/${XENGUEST_NETWORK_BRIDGE_CONFIG} \
-       | sed -e "s,###BRIDGE_NAME###,${XENGUEST_NETWORK_BRIDGE_NAME}," \
-       > ${WORKDIR}/xenguest-network-bridge.cfg
-    cat ${WORKDIR}/network-bridge.sh.in \
-       | sed -e "s,###BRIDGE_NAME###,${XENGUEST_NETWORK_BRIDGE_NAME}," \
-       > ${WORKDIR}/network-bridge.sh
-    install -d -m 755 ${D}${sysconfdir}/init.d
-    install -m 755 ${WORKDIR}/xenguest-network-bridge \
-        ${D}${sysconfdir}/init.d/${INITSCRIPT_NAME:${PN}}
-    install -d -m 755 ${D}${sysconfdir}/network/interfaces.d
-    install -m 755 ${WORKDIR}/xenguest-network-bridge.cfg \
-        ${D}${sysconfdir}/network/interfaces.d/.
-    install -d -m 755 ${D}${sysconfdir}/xenguest/init.pre
-    install -m 755 ${WORKDIR}/network-bridge.sh \
-        ${D}${sysconfdir}/xenguest/init.pre/.
-
-    install -d ${D}${sysconfdir}/xen/scripts/vif-post.d
-    install -m 755 ${WORKDIR}/00-vif-xenguest.hook \
-        ${D}${sysconfdir}/xen/scripts/vif-post.d/.
-
-    install -d -m 755 ${D}${sysconfdir}/xenguest/init.post
-    install -m 755 ${WORKDIR}/xenguest-network-init-post.sh \
-        ${D}${sysconfdir}/xenguest/init.post/.
-
-    install -m 755 ${WORKDIR}/kea-restore-default-config \
-        ${D}${sysconfdir}/init.d/.
-    install -d -m 755 ${D}${sysconfdir}/kea/
-    install -m 755 ${WORKDIR}/kea-dhcp4.conf \
-        ${D}${sysconfdir}/kea/kea-dhcp4.conf.original
-}
-
-RDEPENDS:${PN} +=3D "bridge-utils \
-                   iptables \
-                   kea \
-                   ${PN}-kea-dhcp4 \
-                   kernel-module-xt-tcpudp \
-                   kernel-module-xt-physdev \
-                   kernel-module-xt-comment \
-                   kernel-module-xt-nat \
-                   kernel-module-xt-masquerade \
-                  "
-FILES:${PN} +=3D "${sysconfdir}/network/interfaces.d/xenguest-network-brid=
ge.cfg"
-FILES:${PN} +=3D "${sysconfdir}/xenguest/init.pre/network-bridge.sh"
-FILES:${PN} +=3D "${sysconfdir}/xen/scripts/vif-post.d/00-vif-xenguest.hoo=
k"
-
-FILES:${PN}-kea-dhcp4 =3D "${sysconfdir}/kea/kea-dhcp4.conf.original"
-FILES:${PN}-kea-dhcp4 +=3D "${sysconfdir}/init.d/${INITSCRIPT_NAME:${PN}-k=
ea-dhcp4}"
-FILES:${PN}-kea-dhcp4 +=3D "${sysconfdir}/xenguest/init.post/xenguest-netw=
ork-init-post.sh"
diff --git a/meta-arm-autonomy/recipes-extended/xenguest/xenguest-nodisk-im=
age.bb b/meta-arm-autonomy/recipes-extended/xenguest/xenguest-nodisk-image.=
bb
deleted file mode 100644
index 8ff24a1..0000000
--- a/meta-arm-autonomy/recipes-extended/xenguest/xenguest-nodisk-image.bb
+++ /dev/null
@@ -1,38 +0,0 @@
-# Create a xenguest image with kernel but no rootfs or an external rootfs
-DESCRIPTION =3D "Xenguest No Disk Image"
-LICENSE =3D "MIT"
-
-LIC_FILES_CHKSUM =3D "file://${COMMON_LICENSE_DIR}/MIT;md5=3D0835ade698e0b=
cf8506ecda2f7b4f302"
-
-S =3D "${WORKDIR}"
-
-inherit deploy xenguest_image
-
-# Name of the file we create in deploy
-XENGUEST_IMAGE_NODISK_DEPLOY =3D "xenguest-nodisk-image.xenguest"
-
-# use a local copy to pack all together
-XENGUEST_IMAGE_DEPLOY_DIR =3D "${WORKDIR}/tmp-xenguest"
-
-do_configure[noexec] =3D "1"
-do_compile[noexec] =3D "1"
-do_install[noexec] =3D "1"
-
-do_deploy() {
-    xenguest_image_clone
-
-    # Add kernel to the image
-    if [ -n "${XENGUEST_IMAGE_KERNEL}" ]; then
-        call_xenguest_mkimage partial \
-            --xen-kernel=3D${DEPLOY_DIR_IMAGE}/${XENGUEST_IMAGE_KERNEL}
-    fi
-
-    # Pack and deploy the final image
-    rm -f ${DEPLOYDIR}/${XENGUEST_IMAGE_NODISK_DEPLOY}
-    call_xenguest_mkimage pack ${DEPLOYDIR}/${XENGUEST_IMAGE_NODISK_DEPLOY=
}
-}
-do_deploy[depends] +=3D "virtual/kernel:do_deploy"
-do_deploy[depends] +=3D "xenguest-base-image:do_deploy"
-
-addtask deploy before do_build after do_install
-
diff --git a/meta-arm-autonomy/recipes-kernel/linux/arm-autonomy-kmeta/bsp/=
arm-autonomy/arm64-autonomy-guest-standard.scc b/meta-arm-autonomy/recipes-=
kernel/linux/arm-autonomy-kmeta/bsp/arm-autonomy/arm64-autonomy-guest-stand=
ard.scc
deleted file mode 100644
index 7c75d99..0000000
--- a/meta-arm-autonomy/recipes-kernel/linux/arm-autonomy-kmeta/bsp/arm-aut=
onomy/arm64-autonomy-guest-standard.scc
+++ /dev/null
@@ -1,5 +0,0 @@
-define KMACHINE arm64-autonomy-guest
-define KTYPE standard
-define KARCH arm64
-
-include arm64-autonomy-guest.scc
diff --git a/meta-arm-autonomy/recipes-kernel/linux/arm-autonomy-kmeta/bsp/=
arm-autonomy/arm64-autonomy-guest.cfg b/meta-arm-autonomy/recipes-kernel/li=
nux/arm-autonomy-kmeta/bsp/arm-autonomy/arm64-autonomy-guest.cfg
deleted file mode 100644
index fcdad98..0000000
--- a/meta-arm-autonomy/recipes-kernel/linux/arm-autonomy-kmeta/bsp/arm-aut=
onomy/arm64-autonomy-guest.cfg
+++ /dev/null
@@ -1,2 +0,0 @@
-CONFIG_ARM64=3Dy
-CONFIG_SMP=3Dy
diff --git a/meta-arm-autonomy/recipes-kernel/linux/arm-autonomy-kmeta/bsp/=
arm-autonomy/arm64-autonomy-guest.scc b/meta-arm-autonomy/recipes-kernel/li=
nux/arm-autonomy-kmeta/bsp/arm-autonomy/arm64-autonomy-guest.scc
deleted file mode 100644
index e887b4e..0000000
--- a/meta-arm-autonomy/recipes-kernel/linux/arm-autonomy-kmeta/bsp/arm-aut=
onomy/arm64-autonomy-guest.scc
+++ /dev/null
@@ -1,6 +0,0 @@
-include ktypes/standard/standard.scc
-include features/input/input.scc
-include features/net/net.scc
-include cfg/timer/no_hz.scc
-
-kconf hardware arm64-autonomy-guest.cfg
diff --git a/meta-arm-autonomy/recipes-kernel/linux/arm-autonomy-kmeta/feat=
ures/arm-autonomy/docker-minimal.cfg b/meta-arm-autonomy/recipes-kernel/lin=
ux/arm-autonomy-kmeta/features/arm-autonomy/docker-minimal.cfg
deleted file mode 100644
index 62b2d84..0000000
--- a/meta-arm-autonomy/recipes-kernel/linux/arm-autonomy-kmeta/features/ar=
m-autonomy/docker-minimal.cfg
+++ /dev/null
@@ -1,27 +0,0 @@
-CONFIG_OVERLAY_FS=3Dy
-CONFIG_NAMESPACES=3Dy
-CONFIG_NET_NS=3Dy
-CONFIG_PID_NS=3Dy
-CONFIG_IPC_NS=3Dy
-CONFIG_UTS_NS=3Dy
-CONFIG_CGROUPS=3Dy
-CONFIG_CGROUP_CPUACCT=3Dy
-CONFIG_CGROUP_DEVICE=3Dy
-CONFIG_CGROUP_FREEZER=3Dy
-CONFIG_CGROUP_SCHED=3Dy
-CONFIG_CPUSETS=3Dy
-CONFIG_MEMCG=3Dy
-CONFIG_KEYS=3Dy
-CONFIG_POSIX_MQUEUE=3Dy
-CONFIG_VETH=3Dy
-CONFIG_IPV6=3Dy
-CONFIG_BRIDGE=3Dy
-CONFIG_BRIDGE_NETFILTER=3Dy
-CONFIG_IP_NF_FILTER=3Dm
-CONFIG_IP_NF_NAT=3Dm
-CONFIG_NF_NAT=3Dm
-CONFIG_IP_NF_TARGET_MASQUERADE=3Dm
-CONFIG_NETFILTER_XT_MATCH_ADDRTYPE=3Dm
-CONFIG_NETFILTER_XT_MATCH_CONNTRACK=3Dm
-CONFIG_IP_VS=3Dy
-CONFIG_NETFILTER_XT_MATCH_IPVS=3Dm
diff --git a/meta-arm-autonomy/recipes-kernel/linux/arm-autonomy-kmeta/feat=
ures/arm-autonomy/docker-minimal.scc b/meta-arm-autonomy/recipes-kernel/lin=
ux/arm-autonomy-kmeta/features/arm-autonomy/docker-minimal.scc
deleted file mode 100644
index 780f661..0000000
--- a/meta-arm-autonomy/recipes-kernel/linux/arm-autonomy-kmeta/features/ar=
m-autonomy/docker-minimal.scc
+++ /dev/null
@@ -1,5 +0,0 @@
-define KFEATURE_DESCRIPTION "Minimal Kernel configs for Docker runtime"
-
-include features/netfilter/netfilter.scc
-
-kconf non-hardware docker-minimal.cfg
diff --git a/meta-arm-autonomy/recipes-kernel/linux/arm-autonomy-kmeta/feat=
ures/arm-autonomy/netfilter-extra.cfg b/meta-arm-autonomy/recipes-kernel/li=
nux/arm-autonomy-kmeta/features/arm-autonomy/netfilter-extra.cfg
deleted file mode 100644
index 1a57369..0000000
--- a/meta-arm-autonomy/recipes-kernel/linux/arm-autonomy-kmeta/features/ar=
m-autonomy/netfilter-extra.cfg
+++ /dev/null
@@ -1,2 +0,0 @@
-CONFIG_NETFILTER_XT_MATCH_PHYSDEV=3Dm
-CONFIG_NETFILTER_XT_MATCH_COMMENT=3Dm
diff --git a/meta-arm-autonomy/recipes-kernel/linux/arm-autonomy-kmeta/feat=
ures/arm-autonomy/xen-common.cfg b/meta-arm-autonomy/recipes-kernel/linux/a=
rm-autonomy-kmeta/features/arm-autonomy/xen-common.cfg
deleted file mode 100644
index 1e61403..0000000
--- a/meta-arm-autonomy/recipes-kernel/linux/arm-autonomy-kmeta/features/ar=
m-autonomy/xen-common.cfg
+++ /dev/null
@@ -1,31 +0,0 @@
-CONFIG_PARAVIRT=3Dy
-CONFIG_XEN=3Dy
-
-CONFIG_BLOCK=3Dy
-
-CONFIG_SCSI=3Dy
-
-CONFIG_NET=3Dy
-
-CONFIG_HVC_IRQ=3Dy
-
-CONFIG_HVC_XEN=3Dy
-
-CONFIG_WATCHDOG=3Dy
-CONFIG_XEN_WDT=3Dy
-
-CONFIG_XEN_BALLOON=3Dy
-
-CONFIG_XEN_DEV_EVTCHN=3Dy
-
-CONFIG_XENFS=3Dy
-CONFIG_XEN_COMPAT_XENFS=3Dy
-
-CONFIG_XEN_SYS_HYPERVISOR=3Dy
-
-CONFIG_XEN_GNTDEV=3Dy
-CONFIG_XEN_GRANT_DEV_ALLOC=3Dy
-CONFIG_SWIOTLB_XEN=3Dy
-
-CONFIG_XEN_EFI=3Dy
-CONFIG_XEN_AUTO_XLATE=3Dy
diff --git a/meta-arm-autonomy/recipes-kernel/linux/arm-autonomy-kmeta/feat=
ures/arm-autonomy/xen-common.scc b/meta-arm-autonomy/recipes-kernel/linux/a=
rm-autonomy-kmeta/features/arm-autonomy/xen-common.scc
deleted file mode 100644
index f359d8c..0000000
--- a/meta-arm-autonomy/recipes-kernel/linux/arm-autonomy-kmeta/features/ar=
m-autonomy/xen-common.scc
+++ /dev/null
@@ -1,3 +0,0 @@
-define KFEATURE_DESCRIPTION "Common XEN (Host and Guest) configs and patch=
es on autonomy systems"
-
-kconf non-hardware xen-common.cfg
diff --git a/meta-arm-autonomy/recipes-kernel/linux/arm-autonomy-kmeta/feat=
ures/arm-autonomy/xen-guest.cfg b/meta-arm-autonomy/recipes-kernel/linux/ar=
m-autonomy-kmeta/features/arm-autonomy/xen-guest.cfg
deleted file mode 100644
index bb2cbd5..0000000
--- a/meta-arm-autonomy/recipes-kernel/linux/arm-autonomy-kmeta/features/ar=
m-autonomy/xen-guest.cfg
+++ /dev/null
@@ -1,28 +0,0 @@
-CONFIG_XEN_BLKDEV_FRONTEND=3Dy
-
-CONFIG_XEN_SCSI_FRONTEND=3Dy
-
-CONFIG_XEN_NETDEV_FRONTEND=3Dy
-
-CONFIG_INPUT=3Dy
-CONFIG_INPUT_MISC=3Dy
-CONFIG_INPUT_XEN_KBDDEV_FRONTEND=3Dy
-
-CONFIG_HVC_XEN_FRONTEND=3Dy
-
-CONFIG_FB_SYS_FILLRECT=3Dy
-CONFIG_FB_SYS_COPYAREA=3Dy
-CONFIG_FB_SYS_IMAGEBLIT=3Dy
-CONFIG_FB_SYS_FOPS=3Dy
-CONFIG_FB_DEFERRED_IO=3Dy
-CONFIG_XEN_FBDEV_FRONTEND=3Dy
-
-CONFIG_XEN_XENBUS_FRONTEND=3Dy
-
-CONFIG_DRM=3Dy
-CONFIG_DRM_XEN=3Dy
-CONFIG_DRM_XEN_FRONTEND=3Dy
-
-CONFIG_SOUND=3Dy
-CONFIG_SND=3Dy
-CONFIG_SND_XEN_FRONTEND=3Dy
diff --git a/meta-arm-autonomy/recipes-kernel/linux/arm-autonomy-kmeta/feat=
ures/arm-autonomy/xen-guest.scc b/meta-arm-autonomy/recipes-kernel/linux/ar=
m-autonomy-kmeta/features/arm-autonomy/xen-guest.scc
deleted file mode 100644
index 17ded00..0000000
--- a/meta-arm-autonomy/recipes-kernel/linux/arm-autonomy-kmeta/features/ar=
m-autonomy/xen-guest.scc
+++ /dev/null
@@ -1,3 +0,0 @@
-define KFEATURE_DESCRIPTION "Enable XEN Guest Frontend Drivers"
-
-kconf non-hardware xen-guest.cfg
diff --git a/meta-arm-autonomy/recipes-kernel/linux/arm-autonomy-kmeta/feat=
ures/arm-autonomy/xen-host-iptables.scc b/meta-arm-autonomy/recipes-kernel/=
linux/arm-autonomy-kmeta/features/arm-autonomy/xen-host-iptables.scc
deleted file mode 100644
index 0820064..0000000
--- a/meta-arm-autonomy/recipes-kernel/linux/arm-autonomy-kmeta/features/ar=
m-autonomy/xen-host-iptables.scc
+++ /dev/null
@@ -1,10 +0,0 @@
-#
-# Not directly sourced via a kernel type but via an external bb
-#
-
-define KFEATURE_DESCRIPTION "Enable netfilter + conn tracking + extras"
-define KFEATURE_COMPATIBILITY all
-
-include cfg/net/bridge.scc
-include features/netfilter/netfilter.scc
-kconf non-hardware netfilter-extra.cfg
diff --git a/meta-arm-autonomy/recipes-kernel/linux/arm-autonomy-kmeta/feat=
ures/arm-autonomy/xen-host.cfg b/meta-arm-autonomy/recipes-kernel/linux/arm=
-autonomy-kmeta/features/arm-autonomy/xen-host.cfg
deleted file mode 100644
index 54bd605..0000000
--- a/meta-arm-autonomy/recipes-kernel/linux/arm-autonomy-kmeta/features/ar=
m-autonomy/xen-host.cfg
+++ /dev/null
@@ -1,10 +0,0 @@
-CONFIG_XEN_BLKDEV_BACKEND=3Dy
-
-CONFIG_TARGET_CORE=3Dy
-CONFIG_XEN_SCSI_BACKEND=3Dy
-
-CONFIG_XEN_NETDEV_BACKEND=3Dy
-
-# For LVM2 we need Multiple Devices and Device Mapper support
-CONFIG_MD=3Dy
-CONFIG_BLK_DEV_DM=3Dy
diff --git a/meta-arm-autonomy/recipes-kernel/linux/arm-autonomy-kmeta/feat=
ures/arm-autonomy/xen-host.scc b/meta-arm-autonomy/recipes-kernel/linux/arm=
-autonomy-kmeta/features/arm-autonomy/xen-host.scc
deleted file mode 100644
index 7185775..0000000
--- a/meta-arm-autonomy/recipes-kernel/linux/arm-autonomy-kmeta/features/ar=
m-autonomy/xen-host.scc
+++ /dev/null
@@ -1,3 +0,0 @@
-define KFEATURE_DESCRIPTION "Enable XEN Host Drivers on autonomy systems"
-
-kconf non-hardware xen-host.cfg
diff --git a/meta-arm-autonomy/recipes-kernel/linux/files/0001-arm-arm64-xe=
n-Fix-to-convert-percpu-address-to-gfn-c.patch b/meta-arm-autonomy/recipes-=
kernel/linux/files/0001-arm-arm64-xen-Fix-to-convert-percpu-address-to-gfn-=
c.patch
deleted file mode 100644
index 79e88d7..0000000
--- a/meta-arm-autonomy/recipes-kernel/linux/files/0001-arm-arm64-xen-Fix-t=
o-convert-percpu-address-to-gfn-c.patch
+++ /dev/null
@@ -1,147 +0,0 @@
-From 5a0677110b73dd3e1766f89159701bfe8ac06808 Mon Sep 17 00:00:00 2001
-From: Masami Hiramatsu <mhiramat@kernel.org>
-Date: Tue, 6 Oct 2020 15:49:31 +0900
-Subject: [PATCH] arm/arm64: xen: Fix to convert percpu address to gfn
- correctly
-
-Use per_cpu_ptr_to_phys() instead of virt_to_phys() for per-cpu
-address conversion.
-
-In xen_starting_cpu(), per-cpu xen_vcpu_info address is converted
-to gfn by virt_to_gfn() macro. However, since the virt_to_gfn(v)
-assumes the given virtual address is in linear mapped kernel memory
-area, it can not convert the per-cpu memory if it is allocated on
-vmalloc area.
-
-This depends on CONFIG_NEED_PER_CPU_EMBED_FIRST_CHUNK.
-If it is enabled, the first chunk of percpu memory is linear mapped.
-In the other case, that is allocated from vmalloc area. Moreover,
-if the first chunk of percpu has run out until allocating
-xen_vcpu_info, it will be allocated on the 2nd chunk, which is
-based on kernel memory or vmalloc memory (depends on
-CONFIG_NEED_PER_CPU_KM).
-
-Without this fix and kernel configured to use vmalloc area for
-the percpu memory, the Dom0 kernel will fail to boot with following
-errors.
-
-[    0.466172] Xen: initializing cpu0
-[    0.469601] ------------[ cut here ]------------
-[    0.474295] WARNING: CPU: 0 PID: 1 at arch/arm64/xen/../../arm/xen/enli=
ghten.c:153 xen_starting_cpu+0x160/0x180
-[    0.484435] Modules linked in:
-[    0.487565] CPU: 0 PID: 1 Comm: swapper/0 Not tainted 5.9.0-rc4+ #4
-[    0.493895] Hardware name: Socionext Developer Box (DT)
-[    0.499194] pstate: 00000005 (nzcv daif -PAN -UAO BTYPE=3D--)
-[    0.504836] pc : xen_starting_cpu+0x160/0x180
-[    0.509263] lr : xen_starting_cpu+0xb0/0x180
-[    0.513599] sp : ffff8000116cbb60
-[    0.516984] x29: ffff8000116cbb60 x28: ffff80000abec000
-[    0.522366] x27: 0000000000000000 x26: 0000000000000000
-[    0.527754] x25: ffff80001156c000 x24: fffffdffbfcdb600
-[    0.533129] x23: 0000000000000000 x22: 0000000000000000
-[    0.538511] x21: ffff8000113a99c8 x20: ffff800010fe4f68
-[    0.543892] x19: ffff8000113a9988 x18: 0000000000000010
-[    0.549274] x17: 0000000094fe0f81 x16: 00000000deadbeef
-[    0.554655] x15: ffffffffffffffff x14: 0720072007200720
-[    0.560037] x13: 0720072007200720 x12: 0720072007200720
-[    0.565418] x11: 0720072007200720 x10: 0720072007200720
-[    0.570801] x9 : ffff8000100fbdc0 x8 : ffff800010715208
-[    0.576182] x7 : 0000000000000054 x6 : ffff00001b790f00
-[    0.581564] x5 : ffff800010bbf880 x4 : 0000000000000000
-[    0.586945] x3 : 0000000000000000 x2 : ffff80000abec000
-[    0.592327] x1 : 000000000000002f x0 : 0000800000000000
-[    0.597716] Call trace:
-[    0.600232]  xen_starting_cpu+0x160/0x180
-[    0.604309]  cpuhp_invoke_callback+0xac/0x640
-[    0.608736]  cpuhp_issue_call+0xf4/0x150
-[    0.612728]  __cpuhp_setup_state_cpuslocked+0x128/0x2c8
-[    0.618030]  __cpuhp_setup_state+0x84/0xf8
-[    0.622192]  xen_guest_init+0x324/0x364
-[    0.626097]  do_one_initcall+0x54/0x250
-[    0.630003]  kernel_init_freeable+0x12c/0x2c8
-[    0.634428]  kernel_init+0x1c/0x128
-[    0.637988]  ret_from_fork+0x10/0x18
-[    0.641635] ---[ end trace d95b5309a33f8b27 ]---
-[    0.646337] ------------[ cut here ]------------
-[    0.651005] kernel BUG at arch/arm64/xen/../../arm/xen/enlighten.c:158!
-[    0.657697] Internal error: Oops - BUG: 0 [#1] SMP
-[    0.662548] Modules linked in:
-[    0.665676] CPU: 0 PID: 1 Comm: swapper/0 Tainted: G        W         5=
.9.0-rc4+ #4
-[    0.673398] Hardware name: Socionext Developer Box (DT)
-[    0.678695] pstate: 00000005 (nzcv daif -PAN -UAO BTYPE=3D--)
-[    0.684338] pc : xen_starting_cpu+0x178/0x180
-[    0.688765] lr : xen_starting_cpu+0x144/0x180
-[    0.693188] sp : ffff8000116cbb60
-[    0.696573] x29: ffff8000116cbb60 x28: ffff80000abec000
-[    0.701955] x27: 0000000000000000 x26: 0000000000000000
-[    0.707344] x25: ffff80001156c000 x24: fffffdffbfcdb600
-[    0.712718] x23: 0000000000000000 x22: 0000000000000000
-[    0.718107] x21: ffff8000113a99c8 x20: ffff800010fe4f68
-[    0.723481] x19: ffff8000113a9988 x18: 0000000000000010
-[    0.728863] x17: 0000000094fe0f81 x16: 00000000deadbeef
-[    0.734245] x15: ffffffffffffffff x14: 0720072007200720
-[    0.739626] x13: 0720072007200720 x12: 0720072007200720
-[    0.745008] x11: 0720072007200720 x10: 0720072007200720
-[    0.750390] x9 : ffff8000100fbdc0 x8 : ffff800010715208
-[    0.755771] x7 : 0000000000000054 x6 : ffff00001b790f00
-[    0.761153] x5 : ffff800010bbf880 x4 : 0000000000000000
-[    0.766534] x3 : 0000000000000000 x2 : 00000000deadbeef
-[    0.771916] x1 : 00000000deadbeef x0 : ffffffffffffffea
-[    0.777304] Call trace:
-[    0.779819]  xen_starting_cpu+0x178/0x180
-[    0.783898]  cpuhp_invoke_callback+0xac/0x640
-[    0.788325]  cpuhp_issue_call+0xf4/0x150
-[    0.792317]  __cpuhp_setup_state_cpuslocked+0x128/0x2c8
-[    0.797619]  __cpuhp_setup_state+0x84/0xf8
-[    0.801779]  xen_guest_init+0x324/0x364
-[    0.805683]  do_one_initcall+0x54/0x250
-[    0.809590]  kernel_init_freeable+0x12c/0x2c8
-[    0.814016]  kernel_init+0x1c/0x128
-[    0.817583]  ret_from_fork+0x10/0x18
-[    0.821226] Code: d0006980 f9427c00 cb000300 17ffffea (d4210000)
-[    0.827415] ---[ end trace d95b5309a33f8b28 ]---
-[    0.832076] Kernel panic - not syncing: Attempted to kill init! exitcod=
e=3D0x0000000b
-[    0.839815] ---[ end Kernel panic - not syncing: Attempted to kill init=
! exitcode=3D0x0000000b ]---
-
-Signed-off-by: Masami Hiramatsu <mhiramat@kernel.org>
-Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
-Link: https://lore.kernel.org/r/160196697165.60224.17470743378683334995.st=
git@devnote2
-Signed-off-by: Juergen Gross <jgross@suse.com>
-
-Upstream-Status: Backport
-Signed-off-by: Richard Neill <richard.neill@arm.com>
----
- arch/arm/xen/enlighten.c | 2 +-
- include/xen/arm/page.h   | 3 +++
- 2 files changed, 4 insertions(+), 1 deletion(-)
-
-diff --git a/arch/arm/xen/enlighten.c b/arch/arm/xen/enlighten.c
-index e93145d72c26..a6ab3689b2f4 100644
---- a/arch/arm/xen/enlighten.c
-+++ b/arch/arm/xen/enlighten.c
-@@ -150,7 +150,7 @@ static int xen_starting_cpu(unsigned int cpu)
- 	pr_info("Xen: initializing cpu%d\n", cpu);
- 	vcpup =3D per_cpu_ptr(xen_vcpu_info, cpu);
-=20
--	info.mfn =3D virt_to_gfn(vcpup);
-+	info.mfn =3D percpu_to_gfn(vcpup);
- 	info.offset =3D xen_offset_in_page(vcpup);
-=20
- 	err =3D HYPERVISOR_vcpu_op(VCPUOP_register_vcpu_info, xen_vcpu_nr(cpu),
-diff --git a/include/xen/arm/page.h b/include/xen/arm/page.h
-index 39df751d0dc4..ac1b65470563 100644
---- a/include/xen/arm/page.h
-+++ b/include/xen/arm/page.h
-@@ -83,6 +83,9 @@ static inline unsigned long bfn_to_pfn(unsigned long bfn=
)
- 	})
- #define gfn_to_virt(m)		(__va(gfn_to_pfn(m) << XEN_PAGE_SHIFT))
-=20
-+#define percpu_to_gfn(v)	\
-+	(pfn_to_gfn(per_cpu_ptr_to_phys(v) >> XEN_PAGE_SHIFT))
-+
- /* Only used in PV code. But ARM guests are always HVM. */
- static inline xmaddr_t arbitrary_virt_to_machine(void *vaddr)
- {
---=20
-2.25.1
-
diff --git a/meta-arm-autonomy/recipes-kernel/linux/files/0001-xen-arm-do-n=
ot-setup-the-runstate-info-page-if-kpti-.patch b/meta-arm-autonomy/recipes-=
kernel/linux/files/0001-xen-arm-do-not-setup-the-runstate-info-page-if-kpti=
-.patch
deleted file mode 100644
index eeade92..0000000
--- a/meta-arm-autonomy/recipes-kernel/linux/files/0001-xen-arm-do-not-setu=
p-the-runstate-info-page-if-kpti-.patch
+++ /dev/null
@@ -1,83 +0,0 @@
-From f88af7229f6f22ce7313c11a0bbb9c88317b7c5e Mon Sep 17 00:00:00 2001
-Message-Id: <f88af7229f6f22ce7313c11a0bbb9c88317b7c5e.1602759709.git.diego=
.sueiro@arm.com>
-From: Stefano Stabellini <stefano.stabellini@xilinx.com>
-Date: Thu, 24 Sep 2020 16:49:55 -0700
-Subject: [PATCH] xen/arm: do not setup the runstate info page if kpti is
- enabled
-
-The VCPUOP_register_runstate_memory_area hypercall takes a virtual
-address of a buffer as a parameter. The semantics of the hypercall are
-such that the virtual address should always be valid.
-
-When KPTI is enabled and we are running userspace code, the virtual
-address is not valid, thus, Linux is violating the semantics of
-VCPUOP_register_runstate_memory_area.
-
-Do not call VCPUOP_register_runstate_memory_area when KPTI is enabled.
-
-Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
-CC: Bertrand Marquis <Bertrand.Marquis@arm.com>
-CC: boris.ostrovsky@oracle.com
-CC: jgross@suse.com
-Link: https://lore.kernel.org/r/20200924234955.15455-1-sstabellini@kernel.=
org
-Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>
-Signed-off-by: Boris Ostrovsky <boris.ostrovsky@oracle.com>
-
-Upstream-Status: Backport
-Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>
----
- arch/arm/include/asm/xen/page.h   | 5 +++++
- arch/arm/xen/enlighten.c          | 6 ++++--
- arch/arm64/include/asm/xen/page.h | 6 ++++++
- 3 files changed, 15 insertions(+), 2 deletions(-)
-
-diff --git a/arch/arm/include/asm/xen/page.h b/arch/arm/include/asm/xen/pa=
ge.h
-index 31bbc80..dc7f6e9 100644
---- a/arch/arm/include/asm/xen/page.h
-+++ b/arch/arm/include/asm/xen/page.h
-@@ -1 +1,6 @@
- #include <xen/arm/page.h>
-+
-+static inline bool xen_kernel_unmapped_at_usr(void)
-+{
-+	return false;
-+}
-diff --git a/arch/arm/xen/enlighten.c b/arch/arm/xen/enlighten.c
-index e93145d..ea76562 100644
---- a/arch/arm/xen/enlighten.c
-+++ b/arch/arm/xen/enlighten.c
-@@ -158,7 +158,8 @@ static int xen_starting_cpu(unsigned int cpu)
- 	BUG_ON(err);
- 	per_cpu(xen_vcpu, cpu) =3D vcpup;
-=20
--	xen_setup_runstate_info(cpu);
-+	if (!xen_kernel_unmapped_at_usr())
-+		xen_setup_runstate_info(cpu);
-=20
- after_register_vcpu_info:
- 	enable_percpu_irq(xen_events_irq, 0);
-@@ -387,7 +388,8 @@ static int __init xen_guest_init(void)
- 		return -EINVAL;
- 	}
-=20
--	xen_time_setup_guest();
-+	if (!xen_kernel_unmapped_at_usr())
-+		xen_time_setup_guest();
-=20
- 	if (xen_initial_domain())
- 		pvclock_gtod_register_notifier(&xen_pvclock_gtod_notifier);
-diff --git a/arch/arm64/include/asm/xen/page.h b/arch/arm64/include/asm/xe=
n/page.h
-index 31bbc80..dffdc77 100644
---- a/arch/arm64/include/asm/xen/page.h
-+++ b/arch/arm64/include/asm/xen/page.h
-@@ -1 +1,7 @@
- #include <xen/arm/page.h>
-+#include <asm/mmu.h>
-+
-+static inline bool xen_kernel_unmapped_at_usr(void)
-+{
-+	return arm64_kernel_unmapped_at_el0();
-+}
---=20
-2.7.4
-
diff --git a/meta-arm-autonomy/recipes-kernel/linux/linux-%.bbappend b/meta=
-arm-autonomy/recipes-kernel/linux/linux-%.bbappend
deleted file mode 100644
index 84a325c..0000000
--- a/meta-arm-autonomy/recipes-kernel/linux/linux-%.bbappend
+++ /dev/null
@@ -1,5 +0,0 @@
-# Add arm-autonomy kernel support
-require ${@bb.utils.contains_any('DISTRO_FEATURES', \
-                                 'arm-autonomy-host arm-autonomy-guest', \
-                                 'linux-arm-autonomy.inc', \
-                                 '', d)}
diff --git a/meta-arm-autonomy/recipes-kernel/linux/linux-arm-autonomy.inc =
b/meta-arm-autonomy/recipes-kernel/linux/linux-arm-autonomy.inc
deleted file mode 100644
index 588856c..0000000
--- a/meta-arm-autonomy/recipes-kernel/linux/linux-arm-autonomy.inc
+++ /dev/null
@@ -1,51 +0,0 @@
-# Add arm-autonomy specific features to the kernel
-
-FILESEXTRAPATHS:prepend :=3D "${THISDIR}:"
-
-#
-# arm-autonomy kmeta
-#
-SRC_URI:append =3D " file://arm-autonomy-kmeta;type=3Dkmeta;name=3Darm-aut=
onomy-kmeta;destsuffix=3Darm-autonomy-kmeta"
-
-# Add common Xen (host and guest) configs and patches
-KERNEL_FEATURES +=3D "${@bb.utils.contains_any('DISTRO_FEATURES', \
-        'arm-autonomy-host arm-autonomy-guest', \
-        'features/arm-autonomy/xen-common.scc', '', d)}"
-
-
-# Add xen host drivers to kernel if arm-autonomy-host is activated
-KERNEL_FEATURES +=3D "${@bb.utils.contains('DISTRO_FEATURES', \
-        'arm-autonomy-host', \
-        'features/arm-autonomy/xen-host.scc \
-         features/arm-autonomy/xen-host-iptables.scc', \
-        '', d)}"
-
-
-# Add xen guest drivers to kernel if arm-autonomy-guest is activated
-KERNEL_FEATURES +=3D "${@bb.utils.contains('DISTRO_FEATURES', \
-        'arm-autonomy-guest', 'features/arm-autonomy/xen-guest.scc', '', d=
)}"
-
-
-# Add support for arm64-autonomy-guest machine
-COMPATIBLE_MACHINE:arm64-autonomy-guest =3D "arm64-autonomy-guest"
-KMACHINE:arm64-autonomy-guest =3D "arm64-autonomy-guest"
-
-# Add Minimal Kernel Configs for Docker runtime
-KERNEL_FEATURES +=3D "${@bb.utils.contains('DISTRO_FEATURES', \
-        'docker', 'features/arm-autonomy/docker-minimal.scc', '', d)}"
-
-python() {
-    from distutils.version import LooseVersion
-
-    kernelVersion =3D d.getVar('LINUX_VERSION')
-    pn =3D d.getVar('PN')
-
-    if kernelVersion and pn !=3D 'linux-libc-headers' \
-       and oe.utils.any_distro_features(d, "arm-autonomy-host arm-autonomy=
-guest"):
-        if LooseVersion(kernelVersion) < '5.9':
-           d.appendVar('SRC_URI', ' file://files/0001-arm-arm64-xen-Fix-to=
-convert-percpu-address-to-gfn-c.patch' )
-
-    if kernelVersion and LooseVersion(kernelVersion) < '5.10':
-        if oe.utils.any_distro_features(d, "arm-autonomy-host arm-autonomy=
-guest"):
-            d.appendVar('SRC_URI', ' file://files/0001-xen-arm-do-not-setu=
p-the-runstate-info-page-if-kpti-.patch' )
-}
--=20
2.17.1



Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.69])
 by mx.groups.io with SMTP id smtpd.web11.9100.1606996874586463019
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 03 Dec 2020 04:01:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=b2Uba/se;
 spf=pass (domain: arm.com, ip: 40.107.21.69, mailfrom: diego.sueiro@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FECveUdYWemcjNz04b1GGcDRntsZ+/zo3aY4DU7bmBk=;
 b=b2Uba/semdqKVO86c1dkOnaenJzbi766J1NNkoOuxQPXCxmZpM6mmFNp6+984s7pyrE1ebdMvtSvGWHRa/4Du0f3NdAdG+yxtGkifR8ZQEAiGXUeszsTOOhqcoSJN2CsZSwGD/aFG6Ky2O0G0gljeKiTqwu22BHAbMUCu9zDWfs=
Received: from AM6PR10CA0037.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:209:80::14)
 by VI1PR0802MB2269.eurprd08.prod.outlook.com (2603:10a6:800:9e::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.17; Thu, 3 Dec
 2020 12:01:12 +0000
Received: from AM5EUR03FT058.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:80:cafe::79) by AM6PR10CA0037.outlook.office365.com
 (2603:10a6:209:80::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.17 via Frontend
 Transport; Thu, 3 Dec 2020 12:01:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT058.mail.protection.outlook.com (10.152.17.48) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3632.17 via Frontend Transport; Thu, 3 Dec 2020 12:01:11 +0000
Received: ("Tessian outbound 39646a0fd094:v71"); Thu, 03 Dec 2020 12:01:11 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 80f45c2c495cdadc
X-CR-MTA-TID: 64aa7808
Received: from 284845f58913.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id F71549AD-C103-448C-8661-3F34BFAEBD00.1;
	Thu, 03 Dec 2020 12:00:34 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 284845f58913.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 03 Dec 2020 12:00:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R2iPf8ev4xE0F1/EuNKde7DD0pWMBqOGIsJrufBypV6TNYIjoQZ6F9i86G/dagVcNHLvBd+JCyGtUikM/ThhiLlv9zrqcepw5gjbDAqczAZ2I+kZ/+b8CGN+UHHmurgKYrdsL1Z2RlHdMlIB7g3CVcTHy89ppIKNGvYTehP9TuZ+04DDwmZe+d6NODyfirZlN9HBzikHczXI1vQ/WpXOq0IGdz+zesDgRXnt6TL7OlRFjswBl/ZFc+f0rnzTVZxx/+/+SohWbMQJ4byJdCjausgPtRkAwPm8k6atZjnxw8ml1PtJrDvJWMKtLuaAyVuezzLhr+/MtHOk5KV7GiyP2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FECveUdYWemcjNz04b1GGcDRntsZ+/zo3aY4DU7bmBk=;
 b=Oxe8Dq0WOblc8E1K4sT2pLI524AHWcYlVm79TAJuhoUenUregpeOmDCb4hsw0pguH5+RbqOPJAhtyYDappXmvZZJs/f8EsY8M5BxBB6VGCNMjH5kastHizsI+ex4stPYZlyyUbkG0PjfJVJFz81qEqCnRq7HY7bnTcwvJjQ4mCNFfU0LXM5rEMJ44HM1GkKYg4c/klw8/Y9Q4Z1z6ety3F2YazEVsNEphJWpAn0BpRsk23SnUJVmIvWJHjGFCv8yIgN2qDN6XF3+v5a9KLoHLpQKBwquTubJV0lzGc6n+p3MEz+TF9VOV9hsPb+YKN693ptbisT7jdA7PlBcJDrfqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FECveUdYWemcjNz04b1GGcDRntsZ+/zo3aY4DU7bmBk=;
 b=b2Uba/semdqKVO86c1dkOnaenJzbi766J1NNkoOuxQPXCxmZpM6mmFNp6+984s7pyrE1ebdMvtSvGWHRa/4Du0f3NdAdG+yxtGkifR8ZQEAiGXUeszsTOOhqcoSJN2CsZSwGD/aFG6Ky2O0G0gljeKiTqwu22BHAbMUCu9zDWfs=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from AM6PR08MB3461.eurprd08.prod.outlook.com (2603:10a6:20b:47::28)
 by AM7PR08MB5400.eurprd08.prod.outlook.com (2603:10a6:20b:109::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.20; Thu, 3 Dec
 2020 12:00:32 +0000
Received: from AM6PR08MB3461.eurprd08.prod.outlook.com
 ([fe80::f500:d160:ee9e:f578]) by AM6PR08MB3461.eurprd08.prod.outlook.com
 ([fe80::f500:d160:ee9e:f578%4]) with mapi id 15.20.3611.031; Thu, 3 Dec 2020
 12:00:32 +0000
From: "Diego Sueiro" <diego.sueiro@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com,
	Kamil Dziezyk <kamil.dziezyk@arm.com>
Subject: [PATCH 2/4] arm-autonomy/juno-image-customization: add host wks file
Date: Thu,  3 Dec 2020 11:59:22 +0000
Message-Id: <90485e9b687301d35fb7467668b1c429b98fb999.1606996678.git.diego.sueiro@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <18d45b3d900892dde8c466d582a5027a25c21c84.1606996678.git.diego.sueiro@arm.com>
References: <18d45b3d900892dde8c466d582a5027a25c21c84.1606996678.git.diego.sueiro@arm.com>
X-Originating-IP: [217.140.99.251]
X-ClientProxiedBy: LO2P123CA0049.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1::13) To AM6PR08MB3461.eurprd08.prod.outlook.com
 (2603:10a6:20b:47::28)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from e125394.arm.com (217.140.99.251) by LO2P123CA0049.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:1::13) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.17 via Frontend Transport; Thu, 3 Dec 2020 12:00:32 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 51fdca6b-f1c5-4278-1404-08d8978320c6
X-MS-TrafficTypeDiagnostic: AM7PR08MB5400:|VI1PR0802MB2269:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<VI1PR0802MB2269AC4C4282B7BEE4E7A75292F20@VI1PR0802MB2269.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 OeDyi87OXTUi3D2R/CWUhHhM3Rymqie1NXN28h9cDWIWdv79wzHaQrNNDV/0c8d07OFgh5LzeIUqQ7ypaLw7iyXiOYTLJOaG7F4W8r0mDQ08NAVkMP5XxRp5HMrDe4JNyx7AzgUp+XDu3TWvaTdC9J16/7RjORuA0ofwdf0V/vTlgK0DKQ7b4g8TLoee9KAk8WWy2UUa8qohozc6aMm/+FX3merm3Qw4o48Dp+3k163ioTjau33g08ZiKdLPoKpoIBhh6t7+5eTk88/Y2uiW+mrNHb6OdfM6JJ8IozVyOHyWo3XV8KMhSYSZbRUgh4E0
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3461.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(376002)(39860400002)(366004)(136003)(396003)(2616005)(6916009)(4326008)(2906002)(8936002)(36756003)(5660300002)(7696005)(6486002)(52116002)(478600001)(66946007)(66556008)(66476007)(83380400001)(86362001)(8676002)(6666004)(316002)(956004)(44832011)(26005)(186003)(16526019);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 =?us-ascii?Q?Qn5ve9r6vHiI051CeEE3F3hYapY5VVDqB5rsMOJn9RzJEqVwF7IQFK055NMr?=
 =?us-ascii?Q?D5KqI208ezBYkElZd9DYDuzMFWqLipTPlTw+2JIYsQoPy4tp47pQo8jbDFZ1?=
 =?us-ascii?Q?9BmnevuVyRbdNxc86Bbs8vbjim7+bxD/8wZMtKaf5qdBs//WXDV4iKOhZJAd?=
 =?us-ascii?Q?7mbhg3S5mCHTuaMTpWI1BFwIzIxNI3++Bw5rbRXmX1Pas3kRo+Vtx0PRCNFc?=
 =?us-ascii?Q?rwA3xWur9ksJYg0VbOzDTtFk01xiitDFsaJBpVHt7xPBNk7MDieDIHS+SkCi?=
 =?us-ascii?Q?EnLhZnVFgTHOM9cbijKeWIz6aVtz5E4iR/qNWYYY9pPfb5TMyOx7i+pxBmbG?=
 =?us-ascii?Q?x7ddvwT9yhevVVcfuK3sLsyO2JXcY4g/oFMZauZ+gZsgkNJFlFE3uVHnLkPj?=
 =?us-ascii?Q?wJU6OUhPGTxr/OQ5P2OyH9CwiDtxRKgljX7V8bTZVgii449ZctkjDrEINJKV?=
 =?us-ascii?Q?1YEPW1c1reh/HPTzX8+UfJoIcea/6Q5WHxcL+pISoS/JvfcQnBAXgyYQmWdf?=
 =?us-ascii?Q?v4wOWIzeGxUUSedHdB4mCg/94LzAUrK4M2hhRONIJP9z7rmnNCQjVhm36U6L?=
 =?us-ascii?Q?XvTCKxl7ZGiTDpPBTIhkcDoxeTFodP8v1AtAzgWEJ378IQlG7RnZaGoREdyr?=
 =?us-ascii?Q?lYEKEBLd8tBnNng6wkXIumAOwsptALfMVJYxOyZUmXWeKA6/H0dpbsvPZKUd?=
 =?us-ascii?Q?akF7iSIRiicPtj2fGfjcUx55iqyPE70YhpSZJ/FQzFTgLQm10pQ6EoxjAU4W?=
 =?us-ascii?Q?6WxHwmkZ+WfbNdamfT4+oh5RoAXexcM+GDxOom63qRSl9UrdEfXxCUiU4YAw?=
 =?us-ascii?Q?t/CpB13IFj5TArignhBq277dED08rikGtE+pVvG6/SNRzOgPEke5m8LePtQQ?=
 =?us-ascii?Q?qX79mI878u6qZBmUNsmGdJXUWmp2k4GAdviBmpOqcQKZZG5iPOnv5aNsviMa?=
 =?us-ascii?Q?io4WmWga7vFbXOV0yge6QlZQI7c+plCnjDv9Sx/vzr99YV6OzHWAEICYdyIk?=
 =?us-ascii?Q?Lgzs?=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5400
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Diego.Sueiro@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM5EUR03FT058.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	0150fec9-4830-4725-1caa-08d897830957
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	VUrLfWTt1OINOTP9GffkLdgIWSBdDbdo9WW9IM/5tWqe9T+gSonMIPwodEKoqBwLeQYeLklZrTDPBCAZhqkSG+cZ7E1MyOyu7e/uvLuVVB6mGOqeo/c7BNGCzTYkG8iKzGFgwElQGth9KGq/wSyWF6qeKO2h11rBBZZABfTspLbIN3nX3QkNkeirMo8rHhb/mI6FJ+pu9C0cW9m6r1ZB2cZLEsM1ijdqENiEpEhkr6iz7/jTQi4QdBsR/MEZ0sXhr6WEnF1VKpf1472tWs/og9QGlGpePmYwNznb003G9/dDZMYBEQLNV6sWgxxqilMIL/hPOuv6jDokmnk2E1/8Y++74Gw3m5dXTK3A9HxecANvJIZQj7OD/LwJVTIjAzv6i/jUG5GIfRgSKNq1x+0ETw==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(136003)(376002)(346002)(396003)(39860400002)(46966005)(478600001)(186003)(16526019)(8936002)(26005)(83380400001)(86362001)(316002)(7696005)(36756003)(36906005)(6486002)(70586007)(6666004)(956004)(336012)(5660300002)(47076004)(8676002)(82310400003)(356005)(6916009)(4326008)(82740400003)(70206006)(81166007)(44832011)(2616005)(2906002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2020 12:01:11.8707
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 51fdca6b-f1c5-4278-1404-08d8978320c6
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM5EUR03FT058.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0802MB2269
Content-Type: text/plain

From: Kamil Dziezyk <kamil.dziezyk@arm.com>

This patch also appends 'wic wic.gz wic.bmap' images,
to IMAGE_FSTYPES.

WKS file contains two partition entries:
 * first is rootfs partition
 * second is empty partition (4 GiB by default)

Issue-Id: SCM-1520
Signed-off-by: Kamil Dziezyk <kamil.dziezyk@arm.com>
Change-Id: Ic0c79ee5eb4b08ad8f9c133b267feda1c85519a3
---
 .../conf/machine/juno-extra-settings.inc      | 20 +++++++++++++++++++
 .../wic/arm-autonomy-juno-disk.wks.in         | 11 ++++++++++
 2 files changed, 31 insertions(+)
 create mode 100644 meta-arm-autonomy/dynamic-layers/meta-arm-bsp/wic/arm-autonomy-juno-disk.wks.in

diff --git a/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/conf/machine/juno-extra-settings.inc b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/conf/machine/juno-extra-settings.inc
index 110865d..ec7ed35 100644
--- a/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/conf/machine/juno-extra-settings.inc
+++ b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/conf/machine/juno-extra-settings.inc
@@ -3,3 +3,23 @@
 # Juno board has 2 network interfaces, add both of them to the bridge
 XENGUEST_NETWORK_BRIDGE_MEMBERS ?= "eth0 eth1"
 XEN_DEVICETREE_DOM0_SIZE ?= "0x02400000"
+
+# We need to extend the wks search path to be able to find the wks file set in
+# ARM_AUTONOMY_WKS_FILE.
+WKS_SEARCH_PATH_prepend := "${ARM_AUTONOMY_ARM_BSP_DYNAMIC_DIR}/wic:"
+
+ARM_AUTONOMY_WKS_FILE ?= "arm-autonomy-juno-disk.wks.in"
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
+# set wic image type only if INITRAMFS_IMAGE_BUNDLE is not set
+IMAGE_FSTYPES += "${@bb.utils.contains('INITRAMFS_IMAGE_BUNDLE', '1', '',\
+                                       'wic wic.gz wic.bmap', d)}"
diff --git a/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/wic/arm-autonomy-juno-disk.wks.in b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/wic/arm-autonomy-juno-disk.wks.in
new file mode 100644
index 0000000..5c5b24a
--- /dev/null
+++ b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/wic/arm-autonomy-juno-disk.wks.in
@@ -0,0 +1,11 @@
+# short-description: Create a disk image
+# long-description: Creates a partitioned disk image that the user
+# can directly dd to boot media.
+
+# For Juno first partition is rootfs normally populated as /dev/sda1
+part / --source rootfs --ondisk sda --fstype=ext4 --label root --align 1024
+
+# Second partition to accomodate guests images normally populated as /dev/sda2 (used by XENGUEST_MANAGER_VOLUME_DEVICE)
+part --label guests --source empty --ondisk sda --size="${GUEST_PART_SIZE}${GUEST_PART_SIZE_UNIT}" --system-id 8e --align 1024
+
+bootloader --ptable msdos
-- 
2.17.1


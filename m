Return-Path: <anders.dellien@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA48FC433F5
	for <webhook@archiver.kernel.org>; Mon, 17 Jan 2022 15:00:41 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (EUR04-VI1-obe.outbound.protection.outlook.com [40.107.8.40])
 by mx.groups.io with SMTP id smtpd.web08.12132.1642431639464642185
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 17 Jan 2022 07:00:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com
 header.s=selector2-armh-onmicrosoft-com header.b=EvOvqN7h;
 spf=pass (domain: arm.com, ip: 40.107.8.40, mailfrom: anders.dellien@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tNp/uwyuxfP8zWRgxN5yc7G9/wNa5C0HPFsmzmkNSS8=;
 b=EvOvqN7hsEqW7KYEljNzRLFVoWVm+jBTxs+Ct3fXPzuWNKDLWECUqo3dAJa5XoHk7YSnJ08/iwzMkNioPs0cYvOopRzi82srtu1kDEdKlt5lNvfuqgZq5RPC6dRTwCopiLOwqhG8uQ9GrUalTJmEEtWz/FrS5pKNEJhSs5fSWIU=
Received: from DU2PR04CA0313.eurprd04.prod.outlook.com (2603:10a6:10:2b5::18)
 by PAXPR08MB6703.eurprd08.prod.outlook.com (2603:10a6:102:138::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.11; Mon, 17 Jan
 2022 15:00:34 +0000
Received: from DB5EUR03FT006.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:2b5:cafe::f2) by DU2PR04CA0313.outlook.office365.com
 (2603:10a6:10:2b5::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.9 via Frontend
 Transport; Mon, 17 Jan 2022 15:00:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT006.mail.protection.outlook.com (10.152.20.106) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4888.9 via Frontend Transport; Mon, 17 Jan 2022 15:00:33 +0000
Received: ("Tessian outbound de6049708a0a:v110");
 Mon, 17 Jan 2022 15:00:33 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 29788e1c2804ef3f
X-CR-MTA-TID: 64aa7808
Received: from 1b9d126fa641.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 8CBEE2BC-69BF-45C4-8A77-3F232CC7D828.1;
	Mon, 17 Jan 2022 15:00:24 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 1b9d126fa641.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Mon, 17 Jan 2022 15:00:24 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Od03cfJiuZdT/w+xuBBCphMwHQe2j8xstZX/CopRbsK1eri8k1dgSXCFOtaJ4/mRrzEX6xhmRbZw8FZnAs7S8LPjAEBHQQ3ZIQcc2TeOzKIoWG2Z1JhD7zzmtGKKKXNn2SG0IWFhMG0YJrqhHVgXy1lF+Xmo0pKvij8ME7kRttviwFq6on+ApPiqr/AELiNxkzyc4E34t1Ab/W3Wfl7B61FlOkTmfjUdMSNYzT2Ij+sB+xRqt2Sm2FbzWa/r0AGwzGA6QlMLOxZthfl61KF5foX6VcC7m8BLlheFnX3BwYeWhGw28mn1zxTcya5xtcTjod+xMx6Tkktmq0+B27RAWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tNp/uwyuxfP8zWRgxN5yc7G9/wNa5C0HPFsmzmkNSS8=;
 b=DlPVVapgDLLSbQeu1ZJlDwiY1agL8Sazkwcyrpo8X+vSXNd6FiIjZhLz5pMCppQg2fkryyDSGppAutaxcL3LF3P/gwp7PZNw+uFZExYje6uCC9KmFU9EDX1I1DXv7CP6SeH/mC/mfVnLi46MM7SIaxsHWxMScPk2jFEzQEbrE1fSXnZarhBX55dXfLD3N2JQe3QkBRKa8FwK4P+e2reRAhL93+IEQzgjhdFhTKHaF0vygpU3gMQ+3Xo9yrV1TwTDS3ohjGQiFBDMSK18iw1M/ROM04P1ciJXgP0XfyqOUNSQ5g1e9Os5q4vQ0LQLd6VMaU+0iErrlkURC4HJRolKMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tNp/uwyuxfP8zWRgxN5yc7G9/wNa5C0HPFsmzmkNSS8=;
 b=EvOvqN7hsEqW7KYEljNzRLFVoWVm+jBTxs+Ct3fXPzuWNKDLWECUqo3dAJa5XoHk7YSnJ08/iwzMkNioPs0cYvOopRzi82srtu1kDEdKlt5lNvfuqgZq5RPC6dRTwCopiLOwqhG8uQ9GrUalTJmEEtWz/FrS5pKNEJhSs5fSWIU=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from AM0PR08MB5506.eurprd08.prod.outlook.com (2603:10a6:208:17e::12)
 by DB6PR0801MB1703.eurprd08.prod.outlook.com (2603:10a6:4:2e::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.12; Mon, 17 Jan
 2022 15:00:19 +0000
Received: from AM0PR08MB5506.eurprd08.prod.outlook.com
 ([fe80::d1d1:2adb:bad1:bb96]) by AM0PR08MB5506.eurprd08.prod.outlook.com
 ([fe80::d1d1:2adb:bad1:bb96%6]) with mapi id 15.20.4888.014; Mon, 17 Jan 2022
 15:00:19 +0000
From: Anders Dellien <anders.dellien@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Anders Dellien <anders.dellien@arm.com>
Subject: [PATCH 3/3] arm: update Android common kernel and config
Date: Mon, 17 Jan 2022 15:00:02 +0000
Message-Id: <20220117150002.16976-3-anders.dellien@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220117150002.16976-1-anders.dellien@arm.com>
References: <20220117150002.16976-1-anders.dellien@arm.com>
Content-Type: text/plain
X-ClientProxiedBy: LO2P265CA0326.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a4::26) To AM0PR08MB5506.eurprd08.prod.outlook.com
 (2603:10a6:208:17e::12)
MIME-Version: 1.0
X-MS-Office365-Filtering-Correlation-Id: 8067e022-9eed-4368-db0c-08d9d9ca1cca
X-MS-TrafficTypeDiagnostic: 
	DB6PR0801MB1703:EE_|DB5EUR03FT006:EE_|PAXPR08MB6703:EE_
X-Microsoft-Antispam-PRVS: 
	<PAXPR08MB6703C9D43CF7A59F1461B92189579@PAXPR08MB6703.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:494;OLM:494;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 EFQcRGmqNfNiQCburNGDY2GcF7ublBGCF52N3LDJfqfWvnzcPrVtJlH8dMQ6OpaU/Z1MRVgzQxEYMZ8JeRpB85zYPyZvji6O68cdO61poolVpuGOU3kkva3YJiSku1iGN0ELgLHRYi5oT11ViDqHplo1cDfGa9U5SZ+RzIKJKI68p1e8rQSdqfKm/2zExFMjLyURnTQp3bB6yXf+RLkgMBaBYivbRXWE/TSmemMQrGBU3Fs4LNNdzSZo/vriuhcuGDhZQ8yg5C+tNHtSJ4tvZA+iYMDxtmStDGvUj2COGuSYSo2OOSmQ6hvmwGmLRy8r2gqKdGQmJQXyoV5hyXb2sRCmgR772A8d/EQxRsDfKu/iaVNJyVY8TRP4rvKgGU9fW6QASaPMI7N4LmCmcqzZboKJiOKsPFQcSMZi85ltYOuMetq5/3JwN0fYUbPx62QL8CoV0dEysV1O2F+g1/YBO5eCIkqJslBXQNRX/sLKj63n1oZDC5Ce5x/VyKrPlyO4BGfJDmlSUS3JF4Mr+byF+kb3dU70SvjBio2GfG4JerxoujlbeC32L34h0QYedVsHIOV5O6rFTEct72e1g9KzHotEphd0weZ6YQYN935/K/iZukUtpREy1XVEsotOXVGNaqmt9GeL+oX9KaGV2DStKZHbUcQ5TUIykmRtwOS362fNFMrWAgcs29+fUlXBsd3ilb+OdbFai4ZluFD0MA+f9qxNr9zyn1qHaIqOYeV0nsqxbnQOirzS60irBHNz7AkWloyZe295p/1zG376FZPYGcgU7QaectRnBaZnXKAEk5NufjZoIbfOaFu9L2ELXdGp2HvNetCNw96ygq9asoHmkbor2XbOcHaJk/eqJtqilLmGY1B/PQ20QEWUngHtX5aK6MmJfuTYO4i+XKAAh1YZYA==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB5506.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(1076003)(38350700002)(66574015)(8676002)(38100700002)(6506007)(15650500001)(8936002)(83380400001)(6666004)(26005)(66476007)(66556008)(44832011)(45080400002)(6916009)(52116002)(2906002)(30864003)(86362001)(316002)(66946007)(5660300002)(4326008)(508600001)(36756003)(2616005)(186003)(6486002)(6512007)(46800400005)(559001)(579004)(473944003);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0801MB1703
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5EUR03FT006.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	6276ec53-1c14-45cd-265f-08d9d9ca13cd
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	aDfQ2wJ9l23RlOTiuw2qOE7k3wp+lNc+OiJwBUmaQT9XQ99moVBERmwug9HcFhhW+aE2riPlzeJwZ+5aF2BmztitgzXzAlC3qM2zTnrtfTPyfZq2iFaf17TCfZFKSZrmWOOcoVEYB0v9kGAGSjSW6x+GazoZP1GQd+1ikZ/48G8MkMWT2+gcbFDQGNWeHSPMJ2uRxa66ZQCS9MmOpNTJyOJT5aqt4ww0tqP9OPGyohjY7QOmXQ9m1lBBai05/085lF4E/hegyrbxhuLc+QrPZxBmQul7TSddv8JNed7lLJ0KqaUPGyP0ksua8Zspa/x0iOUj8vg1F1ClmXkBahZ5PnnSZv+i+QaWmtT0Yqw5xZXRywVlGarGzg8TWPiyF6cUYY93qAkYeOMlkL+Eh8fSluVivE5m9OIgA9c3k+BGKOlw6eylEaxofOKW1/FbZp9CCbzv9AsRyY4Z9Ry1gflTumlvU06iLdtJp0BndgxRifj8lukeso2KqVe8YQ+U0V7EoYQqefNGdegOaL6wrD0JxAN4Nb6HGbaFG2RL8ocqbmkULWzQSffd0smC63qwxU56uFHunmcKYOmaDbATlb7l8Xczvuojokyw2EZlBhcH1fJAo1euOkW0k1+soSxy/2g3k1+J0JcvUdxWvIQ0nRA8me0v1hjKDH+MvNbPALe85d9c5LTrk30fkWHgNIt8XI3yPg/3aR6iv6zmlzOBrKjN/f+BhU0Kqid4RrFyQMDZAnw/mphkPYxGHWPeBfTtSOUbwmWswfpufI2VWP67lswkiuXOvgCl2UQ9kxgXFuEt7SCALmekCJl1sUiIUWwuqwuZA4haFvdeCNX0UgShSqAI7tK7f3Lk4x8edYoNyiXSJ10ss14DpcUFS8Ot3EC41XEdpLKsOufHi7LwQgU6JOXJ6V9NOIjEyiI4E7Hng0T2pjGAhybSGSSVvvpS/IpqcbhE
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(40470700002)(36840700001)(46966006)(82310400004)(15650500001)(8936002)(45080400002)(2906002)(6506007)(5660300002)(30864003)(8676002)(47076005)(336012)(81166007)(26005)(36860700001)(40460700001)(36756003)(6486002)(6916009)(1076003)(70586007)(6512007)(356005)(44832011)(4326008)(86362001)(66574015)(508600001)(6666004)(2616005)(70206006)(316002)(83380400001)(186003)(46800400005)(559001)(579004)(473944003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jan 2022 15:00:33.9313
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 8067e022-9eed-4368-db0c-08d9d9ca1cca
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5EUR03FT006.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6703
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 17 Jan 2022 15:00:41 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2838

Move to newer tag of ACK as well as update to the latest gki_defconfig
using fragments to support TC.

Signed-off-by: Anders Dellien <anders.dellien@arm.com>
Change-Id: I71fe31730ce063e9604b8adc879e0a626b3320e7
---
 .../bsp/arm-platforms/tc.scc                  |   7 +
 .../bsp/arm-platforms/tc/base.cfg             |  12 +
 .../bsp/arm-platforms/tc/devtmpfs.cfg         |   3 +
 .../bsp/arm-platforms/tc/dhcp.cfg             |   2 +
 .../bsp/arm-platforms/tc/gralloc.cfg          |   2 +
 .../bsp/arm-platforms/tc/mali.cfg             |   1 +
 .../bsp/arm-platforms/tc/tee.cfg              |   3 +
 .../bsp/arm-platforms/tc/virtio.cfg           |   2 +
 .../linux/linux-arm-platforms.inc             |  60 +-
 ...m-Add-component-aware-simple-encoder.patch |   4 +-
 ...dd-RENDER-capability-to-the-device-n.patch |   4 +-
 ...Adapt-ION-interface-to-match-Android.patch |  33 -
 ...ings-mailbox-arm-mhuv2-Add-bindings.patch} |   4 +-
 ...> 0004-mailbox-arm_mhuv2-Add-driver.patch} |   8 +-
 ...ilbox-arm_mhuv2-Fix-sparse-warnings.patch} |   4 +-
 ...v2-make-remove-callback-return-void.patch} |   4 +-
 ...-Skip-calling-kfree-with-invalid-po.patch} |   4 +-
 ...upport-for-SMCCCv1.2-extended-input.patch} |  10 +-
 ...Add-initial-FFA-bus-support-for-dev.patch} |   6 +-
 ...-Add-initial-Arm-FFA-driver-support.patch} |   6 +-
 ...Add-support-for-SMCCC-as-transport-.patch} |   6 +-
 ...Setup-in-kernel-users-of-FFA-partit.patch} |   6 +-
 ...ffa-Add-support-for-MEM_-interfaces.patch} |   6 +-
 ...-add-sec_world_id-to-struct-tee_shm.patch} |   6 +-
 ...> 0015-optee-simplify-optee_release.patch} |  12 +-
 ...h => 0016-optee-sync-OP-TEE-headers.patch} |  16 +-
 ...ctor-driver-with-internal-callbacks.patch} |  41 +-
 ...> 0018-optee-add-a-FF-A-memory-pool.patch} |   6 +-
 ...atch => 0019-optee-add-FF-A-support.patch} |  21 +-
 ...optee-hack-for-UUID-endianess-issue.patch} |   6 +-
 ...21-arm_ffa-add-support-for-FFA-v1.1.patch} |   4 +-
 .../linux/linux-arm64-ack-5.10/tc/defconfig   | 979 ------------------
 .../linux-arm64-ack-5.10/tc/gki_defconfig     | 689 ++++++++++++
 .../linux/linux-arm64-ack_5.10.bb             |   4 +-
 34 files changed, 842 insertions(+), 1139 deletions(-)
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-platforms/tc.scc
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-platforms/tc/base.cfg
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-platforms/tc/devtmpfs.cfg
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-platforms/tc/dhcp.cfg
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-platforms/tc/gralloc.cfg
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-platforms/tc/mali.cfg
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-platforms/tc/tee.cfg
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-platforms/tc/virtio.cfg
 delete mode 100644 meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/0003-Adapt-ION-interface-to-match-Android.patch
 rename meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/{0004-dt-bindings-mailbox-arm-mhuv2-Add-bindings.patch => 0003-dt-bindings-mailbox-arm-mhuv2-Add-bindings.patch} (98%)
 rename meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/{0005-mailbox-arm_mhuv2-Add-driver.patch => 0004-mailbox-arm_mhuv2-Add-driver.patch} (99%)
 rename meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/{0006-mailbox-arm_mhuv2-Fix-sparse-warnings.patch => 0005-mailbox-arm_mhuv2-Fix-sparse-warnings.patch} (97%)
 rename meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/{0007-mailbox-arm_mhuv2-make-remove-callback-return-void.patch => 0006-mailbox-arm_mhuv2-make-remove-callback-return-void.patch} (92%)
 rename meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/{0008-mailbox-arm_mhuv2-Skip-calling-kfree-with-invalid-po.patch => 0007-mailbox-arm_mhuv2-Skip-calling-kfree-with-invalid-po.patch} (90%)
 rename meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/{0009-arm64-smccc-Add-support-for-SMCCCv1.2-extended-input.patch => 0008-arm64-smccc-Add-support-for-SMCCCv1.2-extended-input.patch} (97%)
 rename meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/{0010-firmware-arm_ffa-Add-initial-FFA-bus-support-for-dev.patch => 0009-firmware-arm_ffa-Add-initial-FFA-bus-support-for-dev.patch} (98%)
 rename meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/{0011-firmware-arm_ffa-Add-initial-Arm-FFA-driver-support.patch => 0010-firmware-arm_ffa-Add-initial-Arm-FFA-driver-support.patch} (98%)
 rename meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/{0012-firmware-arm_ffa-Add-support-for-SMCCC-as-transport-.patch => 0011-firmware-arm_ffa-Add-support-for-SMCCC-as-transport-.patch} (96%)
 rename meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/{0013-firmware-arm_ffa-Setup-in-kernel-users-of-FFA-partit.patch => 0012-firmware-arm_ffa-Setup-in-kernel-users-of-FFA-partit.patch} (98%)
 rename meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/{0014-firmware-arm_ffa-Add-support-for-MEM_-interfaces.patch => 0013-firmware-arm_ffa-Add-support-for-MEM_-interfaces.patch} (98%)
 rename meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/{0015-tee-add-sec_world_id-to-struct-tee_shm.patch => 0014-tee-add-sec_world_id-to-struct-tee_shm.patch} (91%)
 rename meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/{0016-optee-simplify-optee_release.patch => 0015-optee-simplify-optee_release.patch} (94%)
 rename meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/{0017-optee-sync-OP-TEE-headers.patch => 0016-optee-sync-OP-TEE-headers.patch} (98%)
 rename meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/{0018-optee-refactor-driver-with-internal-callbacks.patch => 0017-optee-refactor-driver-with-internal-callbacks.patch} (94%)
 rename meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/{0019-optee-add-a-FF-A-memory-pool.patch => 0018-optee-add-a-FF-A-memory-pool.patch} (96%)
 rename meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/{0020-optee-add-FF-A-support.patch => 0019-optee-add-FF-A-support.patch} (98%)
 rename meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/{0021-drivers-optee-hack-for-UUID-endianess-issue.patch => 0020-drivers-optee-hack-for-UUID-endianess-issue.patch} (92%)
 rename meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/{0022-arm_ffa-add-support-for-FFA-v1.1.patch => 0021-arm_ffa-add-support-for-FFA-v1.1.patch} (90%)
 delete mode 100644 meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/defconfig
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/gki_defconfig

diff --git a/meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-platforms/tc.scc b/meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-platforms/tc.scc
new file mode 100644
index 00000000..86e450c6
--- /dev/null
+++ b/meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-platforms/tc.scc
@@ -0,0 +1,7 @@
+kconf hardware tc/base.cfg
+kconf non-hardware tc/dhcp.cfg
+kconf non-hardware tc/devtmpfs.cfg
+kconf non-hardware tc/gralloc.cfg
+kconf non-hardware tc/mali.cfg
+kconf non-hardware tc/tee.cfg
+kconf non-hardware tc/virtio.cfg
diff --git a/meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-platforms/tc/base.cfg b/meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-platforms/tc/base.cfg
new file mode 100644
index 00000000..90b08f12
--- /dev/null
+++ b/meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-platforms/tc/base.cfg
@@ -0,0 +1,12 @@
+CONFIG_ARCH_VEXPRESS=y
+CONFIG_ARM_MHU=y
+CONFIG_ARM_MHU_V2=y
+CONFIG_ARM_SMMU_V3=y
+CONFIG_ARM64_VA_BITS_48=y
+CONFIG_COMMON_CLK_SCMI=y
+CONFIG_DRM_HDLCD=y
+CONFIG_DRM_KOMEDA=y
+CONFIG_DRM_VIRT_ENCODER=y
+CONFIG_MMC_ARMMMCI=y
+CONFIG_SERIO_AMBAKMI=y
+CONFIG_SMC91X=y
diff --git a/meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-platforms/tc/devtmpfs.cfg b/meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-platforms/tc/devtmpfs.cfg
new file mode 100644
index 00000000..abde4123
--- /dev/null
+++ b/meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-platforms/tc/devtmpfs.cfg
@@ -0,0 +1,3 @@
+CONFIG_DEVTMPFS=y
+CONFIG_DEVTMPFS_MOUNT=y
+CONFIG_VT=y
diff --git a/meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-platforms/tc/dhcp.cfg b/meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-platforms/tc/dhcp.cfg
new file mode 100644
index 00000000..78c5a040
--- /dev/null
+++ b/meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-platforms/tc/dhcp.cfg
@@ -0,0 +1,2 @@
+CONFIG_IP_PNP=y
+CONFIG_IP_PNP_DHCP=y
diff --git a/meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-platforms/tc/gralloc.cfg b/meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-platforms/tc/gralloc.cfg
new file mode 100644
index 00000000..22abcb54
--- /dev/null
+++ b/meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-platforms/tc/gralloc.cfg
@@ -0,0 +1,2 @@
+CONFIG_DMABUF_HEAPS_SYSTEM=y
+CONFIG_DMABUF_HEAPS_CMA=y
diff --git a/meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-platforms/tc/mali.cfg b/meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-platforms/tc/mali.cfg
new file mode 100644
index 00000000..166818f9
--- /dev/null
+++ b/meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-platforms/tc/mali.cfg
@@ -0,0 +1 @@
+CONFIG_FW_LOADER_USER_HELPER_FALLBACK=y
diff --git a/meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-platforms/tc/tee.cfg b/meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-platforms/tc/tee.cfg
new file mode 100644
index 00000000..4b9cbd8c
--- /dev/null
+++ b/meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-platforms/tc/tee.cfg
@@ -0,0 +1,3 @@
+CONFIG_TEE=y
+CONFIG_OPTEE=y
+CONFIG_ARM_FFA_TRANSPORT=y
diff --git a/meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-platforms/tc/virtio.cfg b/meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-platforms/tc/virtio.cfg
new file mode 100644
index 00000000..9e6d21c4
--- /dev/null
+++ b/meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-platforms/tc/virtio.cfg
@@ -0,0 +1,2 @@
+CONFIG_VIRTIO_BLK=y
+CONFIG_VIRTIO_MMIO=y
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc b/meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc
index 49f92ced..5dadc440 100644
--- a/meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc
@@ -19,6 +19,7 @@ SRC_URI:append:fvp-base-arm32 = " ${SRC_URI_KMETA}"
 SRC_URI:append:fvp-baser-aemv8r64 = " ${SRC_URI_KMETA}"
 SRC_URI:append:juno = " ${SRC_URI_KMETA}"
 SRC_URI:append:n1sdp = " ${SRC_URI_KMETA}"
+SRC_URI:append:tc = " ${SRC_URI_KMETA}"
 SRCREV:arm-platforms-kmeta = "6147e82375aa9df8f2a162d42ea6406c79c854c5"
 
 #
@@ -245,42 +246,33 @@ KBUILD_DEFCONFIG:sgi575 = "defconfig"
 KCONFIG_MODE:sgi575 = "--alldefconfig"
 
 #
-# Total Compute TC0 KMACHINE
+# Total Compute (TC0/TC1) KMACHINE
 #
-COMPATIBLE_MACHINE:tc0 = "tc0"
-KMACHINE:tc0 = "tc0"
-KCONFIG_MODE:tc0 = "--alldefconfig"
-FILESEXTRAPATHS:prepend:tc0 := "${THISDIR}/linux-arm64-ack-5.10/tc:"
+COMPATIBLE_MACHINE:tc = "(tc0|tc1)"
+KCONFIG_MODE:tc = "--alldefconfig"
+FILESEXTRAPATHS:prepend:tc := "${ARMBSPFILESPATHS}:${THISDIR}/linux-arm64-ack-5.10/tc:"
 SRC_URI:append:tc = " \
-    file://defconfig \
+    file://gki_defconfig \
     file://0001-drm-Add-component-aware-simple-encoder.patch \
     file://0002-drm-arm-komeda-add-RENDER-capability-to-the-device-n.patch \
-    file://0003-Adapt-ION-interface-to-match-Android.patch \
-    file://0004-dt-bindings-mailbox-arm-mhuv2-Add-bindings.patch \
-    file://0005-mailbox-arm_mhuv2-Add-driver.patch \
-    file://0006-mailbox-arm_mhuv2-Fix-sparse-warnings.patch \
-    file://0007-mailbox-arm_mhuv2-make-remove-callback-return-void.patch \
-    file://0008-mailbox-arm_mhuv2-Skip-calling-kfree-with-invalid-po.patch \
-    file://0009-arm64-smccc-Add-support-for-SMCCCv1.2-extended-input.patch \
-    file://0010-firmware-arm_ffa-Add-initial-FFA-bus-support-for-dev.patch \
-    file://0011-firmware-arm_ffa-Add-initial-Arm-FFA-driver-support.patch \
-    file://0012-firmware-arm_ffa-Add-support-for-SMCCC-as-transport-.patch \
-    file://0013-firmware-arm_ffa-Setup-in-kernel-users-of-FFA-partit.patch \
-    file://0014-firmware-arm_ffa-Add-support-for-MEM_-interfaces.patch \
-    file://0015-tee-add-sec_world_id-to-struct-tee_shm.patch \
-    file://0016-optee-simplify-optee_release.patch \
-    file://0017-optee-sync-OP-TEE-headers.patch \
-    file://0018-optee-refactor-driver-with-internal-callbacks.patch \
-    file://0019-optee-add-a-FF-A-memory-pool.patch \
-    file://0020-optee-add-FF-A-support.patch \
-    file://0021-drivers-optee-hack-for-UUID-endianess-issue.patch \
-    file://0022-arm_ffa-add-support-for-FFA-v1.1.patch \
+    file://0003-dt-bindings-mailbox-arm-mhuv2-Add-bindings.patch \
+    file://0004-mailbox-arm_mhuv2-Add-driver.patch \
+    file://0005-mailbox-arm_mhuv2-Fix-sparse-warnings.patch \
+    file://0006-mailbox-arm_mhuv2-make-remove-callback-return-void.patch \
+    file://0007-mailbox-arm_mhuv2-Skip-calling-kfree-with-invalid-po.patch \
+    file://0008-arm64-smccc-Add-support-for-SMCCCv1.2-extended-input.patch \
+    file://0009-firmware-arm_ffa-Add-initial-FFA-bus-support-for-dev.patch \
+    file://0010-firmware-arm_ffa-Add-initial-Arm-FFA-driver-support.patch \
+    file://0011-firmware-arm_ffa-Add-support-for-SMCCC-as-transport-.patch \
+    file://0012-firmware-arm_ffa-Setup-in-kernel-users-of-FFA-partit.patch \
+    file://0013-firmware-arm_ffa-Add-support-for-MEM_-interfaces.patch \
+    file://0014-tee-add-sec_world_id-to-struct-tee_shm.patch \
+    file://0015-optee-simplify-optee_release.patch \
+    file://0016-optee-sync-OP-TEE-headers.patch \
+    file://0017-optee-refactor-driver-with-internal-callbacks.patch \
+    file://0018-optee-add-a-FF-A-memory-pool.patch \
+    file://0019-optee-add-FF-A-support.patch \
+    file://0020-drivers-optee-hack-for-UUID-endianess-issue.patch \
+    file://0021-arm_ffa-add-support-for-FFA-v1.1.patch \
     "
-
-#
-# Total Compute TC1 KMACHINE
-#
-COMPATIBLE_MACHINE:tc1 = "tc1"
-KMACHINE:tc1 = "tc1"
-KCONFIG_MODE:tc1 = "--alldefconfig"
-FILESEXTRAPATHS:prepend:tc1 := "${THISDIR}/linux-arm64-ack-5.10/tc:"
+KERNEL_FEATURES:append:tc = " bsp/arm-platforms/tc.scc"
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/0001-drm-Add-component-aware-simple-encoder.patch b/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/0001-drm-Add-component-aware-simple-encoder.patch
index b698ec70..15860349 100644
--- a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/0001-drm-Add-component-aware-simple-encoder.patch
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/0001-drm-Add-component-aware-simple-encoder.patch
@@ -1,7 +1,7 @@
-From 9080fb7fc011445d4d6ee164d02d86ff6df0822a Mon Sep 17 00:00:00 2001
+From 39e6b51150c36dd659b85de0c4339594da389da9 Mon Sep 17 00:00:00 2001
 From: Tushar Khandelwal <tushar.khandelwal@arm.com>
 Date: Tue, 16 Jun 2020 12:39:06 +0000
-Subject: [PATCH 01/10] drm: Add component-aware simple encoder
+Subject: [PATCH 01/22] drm: Add component-aware simple encoder
 
 This is a simple DRM encoder that gets its connector timings information
 from a OF subnode in the device tree and exposes that as a "discovered"
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/0002-drm-arm-komeda-add-RENDER-capability-to-the-device-n.patch b/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/0002-drm-arm-komeda-add-RENDER-capability-to-the-device-n.patch
index c3febffc..77519f14 100644
--- a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/0002-drm-arm-komeda-add-RENDER-capability-to-the-device-n.patch
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/0002-drm-arm-komeda-add-RENDER-capability-to-the-device-n.patch
@@ -1,7 +1,7 @@
-From 7a0e6189c7b104a679bc7b91465425e2de909456 Mon Sep 17 00:00:00 2001
+From 1b2c200673b4a08324f3a6575b30bd16030ed586 Mon Sep 17 00:00:00 2001
 From: Tushar Khandelwal <tushar.khandelwal@arm.com>
 Date: Wed, 17 Jun 2020 10:49:26 +0000
-Subject: [PATCH 02/10] drm: arm: komeda: add RENDER capability to the device
+Subject: [PATCH 02/22] drm: arm: komeda: add RENDER capability to the device
  node
 
 this is required to make this driver work with android framework
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/0003-Adapt-ION-interface-to-match-Android.patch b/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/0003-Adapt-ION-interface-to-match-Android.patch
deleted file mode 100644
index 1d6a4033..00000000
--- a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/0003-Adapt-ION-interface-to-match-Android.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From b98c6070320ad31318a028482f026d6a5eddce5b Mon Sep 17 00:00:00 2001
-From: Anders Dellien <anders.dellien@arm.com>
-Date: Fri, 29 Jan 2021 09:44:38 +0000
-Subject: [PATCH 03/10] Adapt ION interface to match Android
-
-Change-Id: I62b69cc357868f725170899c862530b8f3069666
-Signed-off-by: Anders Dellien <anders.dellien@arm.com>
-
-Upstream-Status: Inappropriate [Product specific configuration]
-Signed-off-by: Arunachalam Ganapathy <arunachalam.ganapathy@arm.com>
----
- include/uapi/linux/ion.h | 5 ++++-
- 1 file changed, 4 insertions(+), 1 deletion(-)
-
-diff --git a/include/uapi/linux/ion.h b/include/uapi/linux/ion.h
-index 371e44662755..7022ea223736 100644
---- a/include/uapi/linux/ion.h
-+++ b/include/uapi/linux/ion.h
-@@ -24,7 +24,10 @@
-  */
- enum ion_heap_type {
- 	ION_HEAP_TYPE_SYSTEM = 0,
--	ION_HEAP_TYPE_DMA = 2,
-+       ION_HEAP_TYPE_SYSTEM_CONTIG = 1,
-+       ION_HEAP_TYPE_CARVEOUT = 2,
-+       ION_HEAP_TYPE_CHUNK = 3,
-+       ION_HEAP_TYPE_DMA = 4,
- 	/* reserved range for future standard heap types */
- 	ION_HEAP_TYPE_CUSTOM = 16,
- 	ION_HEAP_TYPE_MAX = 31,
--- 
-2.17.1
-
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/0004-dt-bindings-mailbox-arm-mhuv2-Add-bindings.patch b/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/0003-dt-bindings-mailbox-arm-mhuv2-Add-bindings.patch
similarity index 98%
rename from meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/0004-dt-bindings-mailbox-arm-mhuv2-Add-bindings.patch
rename to meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/0003-dt-bindings-mailbox-arm-mhuv2-Add-bindings.patch
index be5801ab..1da75ea8 100644
--- a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/0004-dt-bindings-mailbox-arm-mhuv2-Add-bindings.patch
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/0003-dt-bindings-mailbox-arm-mhuv2-Add-bindings.patch
@@ -1,7 +1,7 @@
-From 4cafac5cd54c7f5069a4d6e17bdbd8f94cd5fa0b Mon Sep 17 00:00:00 2001
+From cdda49168d42c897574388356555f8130c021bb5 Mon Sep 17 00:00:00 2001
 From: Viresh Kumar <viresh.kumar@linaro.org>
 Date: Tue, 17 Nov 2020 15:32:05 +0530
-Subject: [PATCH 04/10] dt-bindings: mailbox : arm,mhuv2: Add bindings
+Subject: [PATCH 03/22] dt-bindings: mailbox : arm,mhuv2: Add bindings
 
 This patch adds device tree binding for ARM Message Handling Unit (MHU)
 controller version 2.
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/0005-mailbox-arm_mhuv2-Add-driver.patch b/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/0004-mailbox-arm_mhuv2-Add-driver.patch
similarity index 99%
rename from meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/0005-mailbox-arm_mhuv2-Add-driver.patch
rename to meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/0004-mailbox-arm_mhuv2-Add-driver.patch
index f3f90ed1..a4dd9612 100644
--- a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/0005-mailbox-arm_mhuv2-Add-driver.patch
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/0004-mailbox-arm_mhuv2-Add-driver.patch
@@ -1,7 +1,7 @@
-From 51f0bb9cf8e8fca22b040d89e7be802c5ea0cf16 Mon Sep 17 00:00:00 2001
+From eadd9235d084da8022df2d232c90590f2160e433 Mon Sep 17 00:00:00 2001
 From: Viresh Kumar <viresh.kumar@linaro.org>
 Date: Tue, 17 Nov 2020 15:32:06 +0530
-Subject: [PATCH 05/10] mailbox: arm_mhuv2: Add driver
+Subject: [PATCH 04/22] mailbox: arm_mhuv2: Add driver
 
 This adds driver for the ARM MHUv2 (Message Handling Unit) mailbox
 controller.
@@ -33,10 +33,10 @@ Signed-off-by: Arunachalam Ganapathy <arunachalam.ganapathy@arm.com>
  create mode 100644 include/linux/mailbox/arm_mhuv2_message.h
 
 diff --git a/MAINTAINERS b/MAINTAINERS
-index db2a3dfb063d..389f356aed5d 100644
+index 354831907474..5234423c477a 100644
 --- a/MAINTAINERS
 +++ b/MAINTAINERS
-@@ -10458,6 +10458,15 @@ F:	drivers/mailbox/
+@@ -10459,6 +10459,15 @@ F:	drivers/mailbox/
  F:	include/linux/mailbox_client.h
  F:	include/linux/mailbox_controller.h
  
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/0006-mailbox-arm_mhuv2-Fix-sparse-warnings.patch b/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/0005-mailbox-arm_mhuv2-Fix-sparse-warnings.patch
similarity index 97%
rename from meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/0006-mailbox-arm_mhuv2-Fix-sparse-warnings.patch
rename to meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/0005-mailbox-arm_mhuv2-Fix-sparse-warnings.patch
index 46fe1aa5..8905f745 100644
--- a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/0006-mailbox-arm_mhuv2-Fix-sparse-warnings.patch
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/0005-mailbox-arm_mhuv2-Fix-sparse-warnings.patch
@@ -1,7 +1,7 @@
-From f082677cb35ea843e749e1c9e5a9b9fba44c5d48 Mon Sep 17 00:00:00 2001
+From 1c75e7d566e29258e9daf7b1548f2d681efb4aea Mon Sep 17 00:00:00 2001
 From: Viresh Kumar <viresh.kumar@linaro.org>
 Date: Wed, 30 Dec 2020 10:12:04 +0530
-Subject: [PATCH 06/10] mailbox: arm_mhuv2: Fix sparse warnings
+Subject: [PATCH 05/22] mailbox: arm_mhuv2: Fix sparse warnings
 
 This patch fixes a bunch of sparse warnings in the newly added arm_mhuv2
 driver.
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/0007-mailbox-arm_mhuv2-make-remove-callback-return-void.patch b/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/0006-mailbox-arm_mhuv2-make-remove-callback-return-void.patch
similarity index 92%
rename from meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/0007-mailbox-arm_mhuv2-make-remove-callback-return-void.patch
rename to meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/0006-mailbox-arm_mhuv2-make-remove-callback-return-void.patch
index cd1bb0b1..a353f31b 100644
--- a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/0007-mailbox-arm_mhuv2-make-remove-callback-return-void.patch
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/0006-mailbox-arm_mhuv2-make-remove-callback-return-void.patch
@@ -1,7 +1,7 @@
-From a0e07a4d72dfe8892ebcfb29c0a1007c35eebd66 Mon Sep 17 00:00:00 2001
+From 107f39e7741bb77688df47ce3f56b25cceb301c3 Mon Sep 17 00:00:00 2001
 From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
 Date: Tue, 2 Feb 2021 20:43:08 +0100
-Subject: [PATCH 07/10] mailbox: arm_mhuv2: make remove callback return void
+Subject: [PATCH 06/22] mailbox: arm_mhuv2: make remove callback return void
 MIME-Version: 1.0
 Content-Type: text/plain; charset=UTF-8
 Content-Transfer-Encoding: 8bit
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/0008-mailbox-arm_mhuv2-Skip-calling-kfree-with-invalid-po.patch b/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/0007-mailbox-arm_mhuv2-Skip-calling-kfree-with-invalid-po.patch
similarity index 90%
rename from meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/0008-mailbox-arm_mhuv2-Skip-calling-kfree-with-invalid-po.patch
rename to meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/0007-mailbox-arm_mhuv2-Skip-calling-kfree-with-invalid-po.patch
index 6553594f..cf5b0b06 100644
--- a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/0008-mailbox-arm_mhuv2-Skip-calling-kfree-with-invalid-po.patch
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/0007-mailbox-arm_mhuv2-Skip-calling-kfree-with-invalid-po.patch
@@ -1,7 +1,7 @@
-From c55091b7738802c503b1ce4276ee85d601604506 Mon Sep 17 00:00:00 2001
+From 81d76e92b03a6f33acefd8aef168948c5f595205 Mon Sep 17 00:00:00 2001
 From: Viresh Kumar <viresh.kumar@linaro.org>
 Date: Mon, 22 Feb 2021 12:48:06 +0530
-Subject: [PATCH 08/10] mailbox: arm_mhuv2: Skip calling kfree() with invalid
+Subject: [PATCH 07/22] mailbox: arm_mhuv2: Skip calling kfree() with invalid
  pointer
 
 It is possible that 'data' passed to kfree() is set to a error value
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/0009-arm64-smccc-Add-support-for-SMCCCv1.2-extended-input.patch b/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/0008-arm64-smccc-Add-support-for-SMCCCv1.2-extended-input.patch
similarity index 97%
rename from meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/0009-arm64-smccc-Add-support-for-SMCCCv1.2-extended-input.patch
rename to meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/0008-arm64-smccc-Add-support-for-SMCCCv1.2-extended-input.patch
index ddcc4886..fdd74689 100644
--- a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/0009-arm64-smccc-Add-support-for-SMCCCv1.2-extended-input.patch
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/0008-arm64-smccc-Add-support-for-SMCCCv1.2-extended-input.patch
@@ -1,7 +1,7 @@
-From 6cc4b54570d508413982d86bf68f60ccdb8687f8 Mon Sep 17 00:00:00 2001
+From 8f51e94b1c2c605fee7376fdb7ebac6a8fe16789 Mon Sep 17 00:00:00 2001
 From: Sudeep Holla <sudeep.holla@arm.com>
 Date: Fri, 30 Apr 2021 11:24:24 +0100
-Subject: [PATCH 01/14] arm64: smccc: Add support for SMCCCv1.2 extended
+Subject: [PATCH 08/22] arm64: smccc: Add support for SMCCCv1.2 extended
  input/output registers
 MIME-Version: 1.0
 Content-Type: text/plain; charset=UTF-8
@@ -33,10 +33,10 @@ Upstream-Status: Backport [https://git.kernel.org/pub/scm/linux/kernel/git/sudee
  3 files changed, 121 insertions(+)
 
 diff --git a/arch/arm64/kernel/asm-offsets.c b/arch/arm64/kernel/asm-offsets.c
-index f396d951ee54..6545c497064e 100644
+index 93da876a58e6..bad4a367da28 100644
 --- a/arch/arm64/kernel/asm-offsets.c
 +++ b/arch/arm64/kernel/asm-offsets.c
-@@ -138,6 +138,15 @@ int main(void)
+@@ -139,6 +139,15 @@ int main(void)
    DEFINE(ARM_SMCCC_RES_X2_OFFS,		offsetof(struct arm_smccc_res, a2));
    DEFINE(ARM_SMCCC_QUIRK_ID_OFFS,	offsetof(struct arm_smccc_quirk, id));
    DEFINE(ARM_SMCCC_QUIRK_STATE_OFFS,	offsetof(struct arm_smccc_quirk, state));
@@ -184,5 +184,5 @@ index 62c54234576c..c8eb24af3c62 100644
   * struct arm_smccc_quirk - Contains quirk information
   * @id: quirk identification
 -- 
-2.29.2
+2.17.1
 
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/0010-firmware-arm_ffa-Add-initial-FFA-bus-support-for-dev.patch b/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/0009-firmware-arm_ffa-Add-initial-FFA-bus-support-for-dev.patch
similarity index 98%
rename from meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/0010-firmware-arm_ffa-Add-initial-FFA-bus-support-for-dev.patch
rename to meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/0009-firmware-arm_ffa-Add-initial-FFA-bus-support-for-dev.patch
index 1083ffe5..fc53fccc 100644
--- a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/0010-firmware-arm_ffa-Add-initial-FFA-bus-support-for-dev.patch
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/0009-firmware-arm_ffa-Add-initial-FFA-bus-support-for-dev.patch
@@ -1,7 +1,7 @@
-From 12e789c445956198f2c09798ecfc44fb2ff98b8e Mon Sep 17 00:00:00 2001
+From 95591bf20e67a2f9635b7823baf7975946a630c2 Mon Sep 17 00:00:00 2001
 From: Sudeep Holla <sudeep.holla@arm.com>
 Date: Fri, 30 Apr 2021 11:24:33 +0100
-Subject: [PATCH 02/14] firmware: arm_ffa: Add initial FFA bus support for
+Subject: [PATCH 09/22] firmware: arm_ffa: Add initial FFA bus support for
  device enumeration
 
 The Arm FF for Armv8-A specification has concept of endpoints or
@@ -416,5 +416,5 @@ index 000000000000..aaff89364541
 +
 +#endif /* _LINUX_ARM_FFA_H */
 -- 
-2.29.2
+2.17.1
 
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/0011-firmware-arm_ffa-Add-initial-Arm-FFA-driver-support.patch b/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/0010-firmware-arm_ffa-Add-initial-Arm-FFA-driver-support.patch
similarity index 98%
rename from meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/0011-firmware-arm_ffa-Add-initial-Arm-FFA-driver-support.patch
rename to meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/0010-firmware-arm_ffa-Add-initial-Arm-FFA-driver-support.patch
index 5236c231..7bba11c3 100644
--- a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/0011-firmware-arm_ffa-Add-initial-Arm-FFA-driver-support.patch
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/0010-firmware-arm_ffa-Add-initial-Arm-FFA-driver-support.patch
@@ -1,7 +1,7 @@
-From 09e109d71c11f6c990d272cf5cc2c5515f184705 Mon Sep 17 00:00:00 2001
+From b81111a9cdfc182fb0ee5f219ab16710cd9146cd Mon Sep 17 00:00:00 2001
 From: Sudeep Holla <sudeep.holla@arm.com>
 Date: Fri, 30 Apr 2021 11:24:39 +0100
-Subject: [PATCH 03/14] firmware: arm_ffa: Add initial Arm FFA driver support
+Subject: [PATCH 10/22] firmware: arm_ffa: Add initial Arm FFA driver support
 
 This just add a basic driver that sets up the transport(e.g. SMCCC),
 checks the FFA version implemented, get the partition ID for self and
@@ -411,5 +411,5 @@ index 000000000000..d74f03b773d2
 +MODULE_DESCRIPTION("Arm FF-A interface driver");
 +MODULE_LICENSE("GPL v2");
 -- 
-2.29.2
+2.17.1
 
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/0012-firmware-arm_ffa-Add-support-for-SMCCC-as-transport-.patch b/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/0011-firmware-arm_ffa-Add-support-for-SMCCC-as-transport-.patch
similarity index 96%
rename from meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/0012-firmware-arm_ffa-Add-support-for-SMCCC-as-transport-.patch
rename to meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/0011-firmware-arm_ffa-Add-support-for-SMCCC-as-transport-.patch
index 27964e19..d62c4b62 100644
--- a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/0012-firmware-arm_ffa-Add-support-for-SMCCC-as-transport-.patch
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/0011-firmware-arm_ffa-Add-support-for-SMCCC-as-transport-.patch
@@ -1,7 +1,7 @@
-From a4e518ab87ffdff5bbfa629334dff4a37524e579 Mon Sep 17 00:00:00 2001
+From 22b6c0e78b031f97af093f4d2b26984c42cf4c22 Mon Sep 17 00:00:00 2001
 From: Sudeep Holla <sudeep.holla@arm.com>
 Date: Fri, 30 Apr 2021 11:24:43 +0100
-Subject: [PATCH 04/14] firmware: arm_ffa: Add support for SMCCC as transport
+Subject: [PATCH 11/22] firmware: arm_ffa: Add support for SMCCC as transport
  to FFA driver
 
 There are requests to keep the transport separate in order to allow
@@ -111,5 +111,5 @@ index 000000000000..22c34b788769
 +	return 0;
 +}
 -- 
-2.29.2
+2.17.1
 
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/0013-firmware-arm_ffa-Setup-in-kernel-users-of-FFA-partit.patch b/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/0012-firmware-arm_ffa-Setup-in-kernel-users-of-FFA-partit.patch
similarity index 98%
rename from meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/0013-firmware-arm_ffa-Setup-in-kernel-users-of-FFA-partit.patch
rename to meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/0012-firmware-arm_ffa-Setup-in-kernel-users-of-FFA-partit.patch
index af28a680..c747642e 100644
--- a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/0013-firmware-arm_ffa-Setup-in-kernel-users-of-FFA-partit.patch
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/0012-firmware-arm_ffa-Setup-in-kernel-users-of-FFA-partit.patch
@@ -1,7 +1,7 @@
-From 4eff52bdae3113edf0256bfd1e986866f7282365 Mon Sep 17 00:00:00 2001
+From c3da0efebc33b357c9fcf4c748c14167594e5c01 Mon Sep 17 00:00:00 2001
 From: Sudeep Holla <sudeep.holla@arm.com>
 Date: Fri, 30 Apr 2021 11:24:48 +0100
-Subject: [PATCH 05/14] firmware: arm_ffa: Setup in-kernel users of FFA
+Subject: [PATCH 12/22] firmware: arm_ffa: Setup in-kernel users of FFA
  partitions
 
 Parse the FFA nodes from the device-tree and register all the partitions
@@ -394,5 +394,5 @@ index aaff89364541..b242fbbce4f0 100644
 +
  #endif /* _LINUX_ARM_FFA_H */
 -- 
-2.29.2
+2.17.1
 
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/0014-firmware-arm_ffa-Add-support-for-MEM_-interfaces.patch b/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/0013-firmware-arm_ffa-Add-support-for-MEM_-interfaces.patch
similarity index 98%
rename from meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/0014-firmware-arm_ffa-Add-support-for-MEM_-interfaces.patch
rename to meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/0013-firmware-arm_ffa-Add-support-for-MEM_-interfaces.patch
index a9ff1fc2..897ba0a2 100644
--- a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/0014-firmware-arm_ffa-Add-support-for-MEM_-interfaces.patch
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/0013-firmware-arm_ffa-Add-support-for-MEM_-interfaces.patch
@@ -1,7 +1,7 @@
-From 6795f86f52751608a03cc6de0dda8e28a5c68cd1 Mon Sep 17 00:00:00 2001
+From f4b26dbe513b342f8774810f91d526f545a7202d Mon Sep 17 00:00:00 2001
 From: Sudeep Holla <sudeep.holla@arm.com>
 Date: Fri, 30 Apr 2021 11:24:51 +0100
-Subject: [PATCH 06/14] firmware: arm_ffa: Add support for MEM_* interfaces
+Subject: [PATCH 13/22] firmware: arm_ffa: Add support for MEM_* interfaces
 
 Most of the MEM_* APIs share the same parameters, so they can be
 generalised. Currently only MEM_SHARE is implemented and the user space
@@ -402,5 +402,5 @@ index b242fbbce4f0..6dc0f4e425b9 100644
  
  #endif /* _LINUX_ARM_FFA_H */
 -- 
-2.29.2
+2.17.1
 
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/0015-tee-add-sec_world_id-to-struct-tee_shm.patch b/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/0014-tee-add-sec_world_id-to-struct-tee_shm.patch
similarity index 91%
rename from meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/0015-tee-add-sec_world_id-to-struct-tee_shm.patch
rename to meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/0014-tee-add-sec_world_id-to-struct-tee_shm.patch
index 286d6f87..eab65271 100644
--- a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/0015-tee-add-sec_world_id-to-struct-tee_shm.patch
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/0014-tee-add-sec_world_id-to-struct-tee_shm.patch
@@ -1,7 +1,7 @@
-From 0f6e0009dc123faa5630bc02977674e182c5938c Mon Sep 17 00:00:00 2001
+From 812d2a649a9cc2a0004cbde2b3e411b46ec84af4 Mon Sep 17 00:00:00 2001
 From: Jens Wiklander <jens.wiklander@linaro.org>
 Date: Thu, 25 Mar 2021 15:08:44 +0100
-Subject: [PATCH 07/14] tee: add sec_world_id to struct tee_shm
+Subject: [PATCH 14/22] tee: add sec_world_id to struct tee_shm
 
 Adds sec_world_id to struct tee_shm which describes a shared memory
 object. sec_world_id can be used by a driver to store an id assigned by
@@ -40,5 +40,5 @@ index cdd049a724b1..93d836fded8b 100644
  
  /**
 -- 
-2.29.2
+2.17.1
 
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/0016-optee-simplify-optee_release.patch b/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/0015-optee-simplify-optee_release.patch
similarity index 94%
rename from meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/0016-optee-simplify-optee_release.patch
rename to meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/0015-optee-simplify-optee_release.patch
index 6fe573d8..94973c77 100644
--- a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/0016-optee-simplify-optee_release.patch
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/0015-optee-simplify-optee_release.patch
@@ -1,7 +1,7 @@
-From 0c25ca5835725220605f3dbf6225dcf22923cc0f Mon Sep 17 00:00:00 2001
+From cb4f6a55b9c61a82a65edcd4b18c505d92480710 Mon Sep 17 00:00:00 2001
 From: Jens Wiklander <jens.wiklander@linaro.org>
 Date: Thu, 25 Mar 2021 15:08:46 +0100
-Subject: [PATCH 08/14] optee: simplify optee_release()
+Subject: [PATCH 15/22] optee: simplify optee_release()
 
 Simplifies optee_release() with a new helper function,
 optee_close_session_helper() which has been factored out from
@@ -19,10 +19,10 @@ Upstream-Status: Pending [Not submitted to upstream yet]
  3 files changed, 39 insertions(+), 48 deletions(-)
 
 diff --git a/drivers/tee/optee/call.c b/drivers/tee/optee/call.c
-index 780d7c4fd756..c0eca4d7d7f2 100644
+index 0790de29f0ca..1b339b743ff5 100644
 --- a/drivers/tee/optee/call.c
 +++ b/drivers/tee/optee/call.c
-@@ -283,12 +283,28 @@ int optee_open_session(struct tee_context *ctx,
+@@ -285,12 +285,28 @@ int optee_open_session(struct tee_context *ctx,
  	return rc;
  }
  
@@ -53,7 +53,7 @@ index 780d7c4fd756..c0eca4d7d7f2 100644
  	struct optee_session *sess;
  
  	/* Check that the session is valid and remove it from the list */
-@@ -301,16 +317,7 @@ int optee_close_session(struct tee_context *ctx, u32 session)
+@@ -303,16 +319,7 @@ int optee_close_session(struct tee_context *ctx, u32 session)
  		return -EINVAL;
  	kfree(sess);
  
@@ -175,5 +175,5 @@ index e25b216a14ef..2b63b796645e 100644
  int optee_invoke_func(struct tee_context *ctx, struct tee_ioctl_invoke_arg *arg,
  		      struct tee_param *param);
 -- 
-2.29.2
+2.17.1
 
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/0017-optee-sync-OP-TEE-headers.patch b/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/0016-optee-sync-OP-TEE-headers.patch
similarity index 98%
rename from meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/0017-optee-sync-OP-TEE-headers.patch
rename to meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/0016-optee-sync-OP-TEE-headers.patch
index a8797a3b..5e3e8688 100644
--- a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/0017-optee-sync-OP-TEE-headers.patch
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/0016-optee-sync-OP-TEE-headers.patch
@@ -1,7 +1,7 @@
-From c325e66e1cbacc074051034ce7e40b3e0e987c99 Mon Sep 17 00:00:00 2001
+From 1e43bd55c951da0610230c4f28a8ebdd13b30733 Mon Sep 17 00:00:00 2001
 From: Jens Wiklander <jens.wiklander@linaro.org>
 Date: Wed, 20 Jan 2021 11:14:12 +0100
-Subject: [PATCH 09/14] optee: sync OP-TEE headers
+Subject: [PATCH 16/22] optee: sync OP-TEE headers
 
 Pulls in updates in the internal headers from OP-TEE OS [1]. A few
 defines has been shortened, hence the changes in rpc.c. Defines not used
@@ -24,7 +24,7 @@ Upstream-Status: Backport [https://git.kernel.org/pub/scm/linux/kernel/git/torva
  create mode 100644 drivers/tee/optee/optee_rpc_cmd.h
 
 diff --git a/drivers/tee/optee/optee_msg.h b/drivers/tee/optee/optee_msg.h
-index 7b2d919da2ac..1e1341a5eaf2 100644
+index c7ac7d02d6cc..5bef6a0165db 100644
 --- a/drivers/tee/optee/optee_msg.h
 +++ b/drivers/tee/optee/optee_msg.h
 @@ -1,6 +1,6 @@
@@ -36,7 +36,7 @@ index 7b2d919da2ac..1e1341a5eaf2 100644
  #ifndef _OPTEE_MSG_H
  #define _OPTEE_MSG_H
 @@ -12,11 +12,9 @@
-  * This file defines the OP-TEE message protocol used to communicate
+  * This file defines the OP-TEE message protocol (ABI) used to communicate
   * with an instance of OP-TEE running in secure world.
   *
 - * This file is divided into three sections.
@@ -59,7 +59,7 @@ index 7b2d919da2ac..1e1341a5eaf2 100644
   *
   * So, entries should be placed like members of this structure:
   *
-@@ -176,17 +174,9 @@ struct optee_msg_param {
+@@ -178,17 +176,9 @@ struct optee_msg_param {
   * @params: the parameters supplied to the OS Command
   *
   * All normal calls to Trusted OS uses this struct. If cmd requires further
@@ -79,7 +79,7 @@ index 7b2d919da2ac..1e1341a5eaf2 100644
   */
  struct optee_msg_arg {
  	u32 cmd;
-@@ -290,15 +280,12 @@ struct optee_msg_arg {
+@@ -292,15 +282,12 @@ struct optee_msg_arg {
   * OPTEE_MSG_CMD_REGISTER_SHM registers a shared memory reference. The
   * information is passed as:
   * [in] param[0].attr			OPTEE_MSG_ATTR_TYPE_TMEM_INPUT
@@ -97,7 +97,7 @@ index 7b2d919da2ac..1e1341a5eaf2 100644
   * memory reference. The information is passed as:
   * [in] param[0].attr			OPTEE_MSG_ATTR_TYPE_RMEM_INPUT
   * [in] param[0].u.rmem.shm_ref		holds shared memory reference
-@@ -313,131 +300,4 @@ struct optee_msg_arg {
+@@ -315,131 +302,4 @@ struct optee_msg_arg {
  #define OPTEE_MSG_CMD_UNREGISTER_SHM	5
  #define OPTEE_MSG_FUNCID_CALL_WITH_ARG	0x0004
  
@@ -640,5 +640,5 @@ index 6cbb3643c6c4..1849180b0278 100644
  		break;
  	default:
 -- 
-2.29.2
+2.17.1
 
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/0018-optee-refactor-driver-with-internal-callbacks.patch b/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/0017-optee-refactor-driver-with-internal-callbacks.patch
similarity index 94%
rename from meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/0018-optee-refactor-driver-with-internal-callbacks.patch
rename to meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/0017-optee-refactor-driver-with-internal-callbacks.patch
index 3c7d7fd0..083843d1 100644
--- a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/0018-optee-refactor-driver-with-internal-callbacks.patch
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/0017-optee-refactor-driver-with-internal-callbacks.patch
@@ -1,7 +1,7 @@
-From ca74085bd229be214f9bb9eec33f84a8f0a9090c Mon Sep 17 00:00:00 2001
+From abda5d14075802b84fe9e38f77bfdc371606172c Mon Sep 17 00:00:00 2001
 From: Jens Wiklander <jens.wiklander@linaro.org>
 Date: Thu, 25 Mar 2021 15:08:50 +0100
-Subject: [PATCH 10/14] optee: refactor driver with internal callbacks
+Subject: [PATCH 17/22] optee: refactor driver with internal callbacks
 
 The OP-TEE driver is refactored with three internal callbacks replacing
 direct calls to optee_from_msg_param(), optee_to_msg_param() and
@@ -25,7 +25,7 @@ Upstream-Status: Pending [Not submitted to upstream yet]
  4 files changed, 182 insertions(+), 106 deletions(-)
 
 diff --git a/drivers/tee/optee/call.c b/drivers/tee/optee/call.c
-index c0eca4d7d7f2..1439ab896cd0 100644
+index 1b339b743ff5..e7b93153252c 100644
 --- a/drivers/tee/optee/call.c
 +++ b/drivers/tee/optee/call.c
 @@ -1,6 +1,6 @@
@@ -116,7 +116,7 @@ index c0eca4d7d7f2..1439ab896cd0 100644
  
  	return shm;
  }
-@@ -211,15 +205,15 @@ int optee_open_session(struct tee_context *ctx,
+@@ -211,16 +205,16 @@ int optee_open_session(struct tee_context *ctx,
  		       struct tee_ioctl_open_session_arg *arg,
  		       struct tee_param *param)
  {
@@ -127,6 +127,7 @@ index c0eca4d7d7f2..1439ab896cd0 100644
  	struct optee_msg_arg *msg_arg;
 -	phys_addr_t msg_parg;
  	struct optee_session *sess = NULL;
+ 	uuid_t client_uuid;
  
  	/* +2 for the meta parameters added below */
 -	shm = get_msg_arg(ctx, arg->num_params + 2, &msg_arg, &msg_parg);
@@ -134,9 +135,9 @@ index c0eca4d7d7f2..1439ab896cd0 100644
  	if (IS_ERR(shm))
  		return PTR_ERR(shm);
  
-@@ -242,7 +236,8 @@ int optee_open_session(struct tee_context *ctx,
- 	if (rc)
+@@ -244,7 +238,8 @@ int optee_open_session(struct tee_context *ctx,
  		goto out;
+ 	export_uuid(msg_arg->params[1].u.octets, &client_uuid);
  
 -	rc = optee_to_msg_param(msg_arg->params + 2, arg->num_params, param);
 +	rc = optee->ops->to_msg_param(optee, msg_arg->params + 2,
@@ -144,7 +145,7 @@ index c0eca4d7d7f2..1439ab896cd0 100644
  	if (rc)
  		goto out;
  
-@@ -252,7 +247,7 @@ int optee_open_session(struct tee_context *ctx,
+@@ -254,7 +249,7 @@ int optee_open_session(struct tee_context *ctx,
  		goto out;
  	}
  
@@ -153,7 +154,7 @@ index c0eca4d7d7f2..1439ab896cd0 100644
  		msg_arg->ret = TEEC_ERROR_COMMUNICATION;
  		msg_arg->ret_origin = TEEC_ORIGIN_COMMS;
  	}
-@@ -267,7 +262,8 @@ int optee_open_session(struct tee_context *ctx,
+@@ -269,7 +264,8 @@ int optee_open_session(struct tee_context *ctx,
  		kfree(sess);
  	}
  
@@ -163,7 +164,7 @@ index c0eca4d7d7f2..1439ab896cd0 100644
  		arg->ret = TEEC_ERROR_COMMUNICATION;
  		arg->ret_origin = TEEC_ORIGIN_COMMS;
  		/* Close session again to avoid leakage */
-@@ -286,16 +282,16 @@ int optee_open_session(struct tee_context *ctx,
+@@ -288,16 +284,16 @@ int optee_open_session(struct tee_context *ctx,
  int optee_close_session_helper(struct tee_context *ctx, u32 session)
  {
  	struct tee_shm *shm;
@@ -183,7 +184,7 @@ index c0eca4d7d7f2..1439ab896cd0 100644
  
  	tee_shm_free(shm);
  
-@@ -323,10 +319,10 @@ int optee_close_session(struct tee_context *ctx, u32 session)
+@@ -325,10 +321,10 @@ int optee_close_session(struct tee_context *ctx, u32 session)
  int optee_invoke_func(struct tee_context *ctx, struct tee_ioctl_invoke_arg *arg,
  		      struct tee_param *param)
  {
@@ -195,7 +196,7 @@ index c0eca4d7d7f2..1439ab896cd0 100644
  	struct optee_session *sess;
  	int rc;
  
-@@ -337,7 +333,7 @@ int optee_invoke_func(struct tee_context *ctx, struct tee_ioctl_invoke_arg *arg,
+@@ -339,7 +335,7 @@ int optee_invoke_func(struct tee_context *ctx, struct tee_ioctl_invoke_arg *arg,
  	if (!sess)
  		return -EINVAL;
  
@@ -204,7 +205,7 @@ index c0eca4d7d7f2..1439ab896cd0 100644
  	if (IS_ERR(shm))
  		return PTR_ERR(shm);
  	msg_arg->cmd = OPTEE_MSG_CMD_INVOKE_COMMAND;
-@@ -345,16 +341,18 @@ int optee_invoke_func(struct tee_context *ctx, struct tee_ioctl_invoke_arg *arg,
+@@ -347,16 +343,18 @@ int optee_invoke_func(struct tee_context *ctx, struct tee_ioctl_invoke_arg *arg,
  	msg_arg->session = arg->session;
  	msg_arg->cancel_id = arg->cancel_id;
  
@@ -226,7 +227,7 @@ index c0eca4d7d7f2..1439ab896cd0 100644
  		msg_arg->ret = TEEC_ERROR_COMMUNICATION;
  		msg_arg->ret_origin = TEEC_ORIGIN_COMMS;
  	}
-@@ -368,10 +366,10 @@ int optee_invoke_func(struct tee_context *ctx, struct tee_ioctl_invoke_arg *arg,
+@@ -370,10 +368,10 @@ int optee_invoke_func(struct tee_context *ctx, struct tee_ioctl_invoke_arg *arg,
  
  int optee_cancel_req(struct tee_context *ctx, u32 cancel_id, u32 session)
  {
@@ -238,7 +239,7 @@ index c0eca4d7d7f2..1439ab896cd0 100644
  	struct optee_session *sess;
  
  	/* Check that the session is valid */
-@@ -381,14 +379,14 @@ int optee_cancel_req(struct tee_context *ctx, u32 cancel_id, u32 session)
+@@ -383,14 +381,14 @@ int optee_cancel_req(struct tee_context *ctx, u32 cancel_id, u32 session)
  	if (!sess)
  		return -EINVAL;
  
@@ -255,7 +256,7 @@ index c0eca4d7d7f2..1439ab896cd0 100644
  
  	tee_shm_free(shm);
  	return 0;
-@@ -587,10 +585,10 @@ int optee_shm_register(struct tee_context *ctx, struct tee_shm *shm,
+@@ -589,10 +587,10 @@ int optee_shm_register(struct tee_context *ctx, struct tee_shm *shm,
  		       struct page **pages, size_t num_pages,
  		       unsigned long start)
  {
@@ -268,7 +269,7 @@ index c0eca4d7d7f2..1439ab896cd0 100644
  	int rc;
  
  	if (!num_pages)
-@@ -604,7 +602,7 @@ int optee_shm_register(struct tee_context *ctx, struct tee_shm *shm,
+@@ -606,7 +604,7 @@ int optee_shm_register(struct tee_context *ctx, struct tee_shm *shm,
  	if (!pages_list)
  		return -ENOMEM;
  
@@ -277,7 +278,7 @@ index c0eca4d7d7f2..1439ab896cd0 100644
  	if (IS_ERR(shm_arg)) {
  		rc = PTR_ERR(shm_arg);
  		goto out;
-@@ -625,7 +623,7 @@ int optee_shm_register(struct tee_context *ctx, struct tee_shm *shm,
+@@ -627,7 +625,7 @@ int optee_shm_register(struct tee_context *ctx, struct tee_shm *shm,
  	msg_arg->params->u.tmem.buf_ptr = virt_to_phys(pages_list) |
  	  (tee_shm_get_page_offset(shm) & (OPTEE_MSG_NONCONTIG_PAGE_SIZE - 1));
  
@@ -286,7 +287,7 @@ index c0eca4d7d7f2..1439ab896cd0 100644
  	    msg_arg->ret != TEEC_SUCCESS)
  		rc = -EINVAL;
  
-@@ -637,12 +635,12 @@ int optee_shm_register(struct tee_context *ctx, struct tee_shm *shm,
+@@ -639,12 +637,12 @@ int optee_shm_register(struct tee_context *ctx, struct tee_shm *shm,
  
  int optee_shm_unregister(struct tee_context *ctx, struct tee_shm *shm)
  {
@@ -302,7 +303,7 @@ index c0eca4d7d7f2..1439ab896cd0 100644
  	if (IS_ERR(shm_arg))
  		return PTR_ERR(shm_arg);
  
-@@ -651,7 +649,7 @@ int optee_shm_unregister(struct tee_context *ctx, struct tee_shm *shm)
+@@ -653,7 +651,7 @@ int optee_shm_unregister(struct tee_context *ctx, struct tee_shm *shm)
  	msg_arg->params[0].attr = OPTEE_MSG_ATTR_TYPE_RMEM_INPUT;
  	msg_arg->params[0].u.rmem.shm_ref = (unsigned long)shm;
  
@@ -716,5 +717,5 @@ index 1849180b0278..39562fb6841e 100644
  }
  
 -- 
-2.29.2
+2.17.1
 
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/0019-optee-add-a-FF-A-memory-pool.patch b/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/0018-optee-add-a-FF-A-memory-pool.patch
similarity index 96%
rename from meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/0019-optee-add-a-FF-A-memory-pool.patch
rename to meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/0018-optee-add-a-FF-A-memory-pool.patch
index fc6ba049..6be15814 100644
--- a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/0019-optee-add-a-FF-A-memory-pool.patch
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/0018-optee-add-a-FF-A-memory-pool.patch
@@ -1,7 +1,7 @@
-From 69f802594252a0745ba4e798012a0fb6524b6267 Mon Sep 17 00:00:00 2001
+From eafffa586795e3cb485310fbd287322c9c7dc3bb Mon Sep 17 00:00:00 2001
 From: Jens Wiklander <jens.wiklander@linaro.org>
 Date: Thu, 25 Mar 2021 15:08:52 +0100
-Subject: [PATCH 11/14] optee: add a FF-A memory pool
+Subject: [PATCH 18/22] optee: add a FF-A memory pool
 
 Adds a memory pool to be used when the driver uses FF-A [1] as transport
 layer.
@@ -127,5 +127,5 @@ index 28109d991c4b..34c5fd74a3ff 100644
  
  #endif
 -- 
-2.29.2
+2.17.1
 
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/0020-optee-add-FF-A-support.patch b/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/0019-optee-add-FF-A-support.patch
similarity index 98%
rename from meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/0020-optee-add-FF-A-support.patch
rename to meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/0019-optee-add-FF-A-support.patch
index 6c4e4e62..faf6cd02 100644
--- a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/0020-optee-add-FF-A-support.patch
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/0019-optee-add-FF-A-support.patch
@@ -1,7 +1,7 @@
-From c7fedcabea2762c23a9e22cd5f5e4bb0de1f5081 Mon Sep 17 00:00:00 2001
+From 5665ffd3fb8e94003abc1c0c05c9fa30d4028b67 Mon Sep 17 00:00:00 2001
 From: Jens Wiklander <jens.wiklander@linaro.org>
 Date: Thu, 25 Mar 2021 15:08:53 +0100
-Subject: [PATCH 12/14] optee: add FF-A support
+Subject: [PATCH 19/22] optee: add FF-A support
 
 Adds support for using FF-A [1] as transport to the OP-TEE driver.
 
@@ -28,7 +28,7 @@ Upstream-Status: Pending [Not submitted to upstream yet]
  create mode 100644 drivers/tee/optee/optee_ffa.h
 
 diff --git a/drivers/tee/optee/call.c b/drivers/tee/optee/call.c
-index 1439ab896cd0..3d03a79dd246 100644
+index e7b93153252c..cf91a81a242a 100644
 --- a/drivers/tee/optee/call.c
 +++ b/drivers/tee/optee/call.c
 @@ -3,15 +3,18 @@
@@ -74,7 +74,7 @@ index 1439ab896cd0..3d03a79dd246 100644
  	if (IS_ERR(shm))
  		return shm;
  
-@@ -671,3 +684,198 @@ int optee_shm_unregister_supp(struct tee_context *ctx, struct tee_shm *shm)
+@@ -673,3 +686,198 @@ int optee_shm_unregister_supp(struct tee_context *ctx, struct tee_shm *shm)
  {
  	return 0;
  }
@@ -965,7 +965,7 @@ index 000000000000..ee3a03fc392c
 +
 +#endif /*__OPTEE_FFA_H*/
 diff --git a/drivers/tee/optee/optee_msg.h b/drivers/tee/optee/optee_msg.h
-index 1e1341a5eaf2..62348cee3e33 100644
+index 5bef6a0165db..1ee943980c68 100644
 --- a/drivers/tee/optee/optee_msg.h
 +++ b/drivers/tee/optee/optee_msg.h
 @@ -28,6 +28,9 @@
@@ -1011,15 +1011,16 @@ index 1e1341a5eaf2..62348cee3e33 100644
  /**
   * struct optee_msg_param_value - opaque value parameter
   *
-@@ -143,12 +165,14 @@ struct optee_msg_param_value {
+@@ -143,13 +165,15 @@ struct optee_msg_param_value {
   * @attr:	attributes
   * @tmem:	parameter by temporary memory reference
   * @rmem:	parameter by registered memory reference
 + * @fmem:	parameter by ffa registered memory reference
   * @value:	parameter by opaque value
+  * @octets:	parameter by octet string
   *
   * @attr & OPTEE_MSG_ATTR_TYPE_MASK indicates if tmem, rmem or value is used in
-  * the union. OPTEE_MSG_ATTR_TYPE_VALUE_* indicates value,
+  * the union. OPTEE_MSG_ATTR_TYPE_VALUE_* indicates value or octets,
   * OPTEE_MSG_ATTR_TYPE_TMEM_* indicates @tmem and
 - * OPTEE_MSG_ATTR_TYPE_RMEM_* indicates @rmem,
 + * OPTEE_MSG_ATTR_TYPE_RMEM_* or the alias PTEE_MSG_ATTR_TYPE_FMEM_* indicates
@@ -1027,14 +1028,14 @@ index 1e1341a5eaf2..62348cee3e33 100644
   * OPTEE_MSG_ATTR_TYPE_NONE indicates that none of the members are used.
   */
  struct optee_msg_param {
-@@ -156,6 +180,7 @@ struct optee_msg_param {
+@@ -157,6 +181,7 @@ struct optee_msg_param {
  	union {
  		struct optee_msg_param_tmem tmem;
  		struct optee_msg_param_rmem rmem;
 +		struct optee_msg_param_fmem fmem;
  		struct optee_msg_param_value value;
+ 		u8 octets[24];
  	} u;
- };
 diff --git a/drivers/tee/optee/optee_private.h b/drivers/tee/optee/optee_private.h
 index c5741e96e967..1ffe74e66d15 100644
 --- a/drivers/tee/optee/optee_private.h
@@ -1265,5 +1266,5 @@ index 39562fb6841e..865a9ab3cf65 100644
 +}
 +#endif /*CONFIG_ARM_FFA_TRANSPORT*/
 -- 
-2.29.2
+2.17.1
 
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/0021-drivers-optee-hack-for-UUID-endianess-issue.patch b/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/0020-drivers-optee-hack-for-UUID-endianess-issue.patch
similarity index 92%
rename from meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/0021-drivers-optee-hack-for-UUID-endianess-issue.patch
rename to meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/0020-drivers-optee-hack-for-UUID-endianess-issue.patch
index 8f3d3971..45319fc2 100644
--- a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/0021-drivers-optee-hack-for-UUID-endianess-issue.patch
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/0020-drivers-optee-hack-for-UUID-endianess-issue.patch
@@ -1,7 +1,7 @@
-From 831d01e34ff2065c585da91c8923ea44146097cd Mon Sep 17 00:00:00 2001
+From 62e38805a966c1bc66a72bcdc83af7031c6a95df Mon Sep 17 00:00:00 2001
 From: Arunachalam Ganapathy <arunachalam.ganapathy@arm.com>
 Date: Thu, 27 May 2021 13:40:33 +0100
-Subject: [PATCH 13/14] drivers: optee: hack for UUID endianess issue
+Subject: [PATCH 20/22] drivers: optee: hack for UUID endianess issue
 
 Signed-off-by: Arunachalam Ganapathy <arunachalam.ganapathy@arm.com>
 Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
@@ -54,5 +54,5 @@ index 056a3fca14d1..82c84fe10be2 100644
  		kfree(pbuf);
  
 -- 
-2.29.2
+2.17.1
 
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/0022-arm_ffa-add-support-for-FFA-v1.1.patch b/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/0021-arm_ffa-add-support-for-FFA-v1.1.patch
similarity index 90%
rename from meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/0022-arm_ffa-add-support-for-FFA-v1.1.patch
rename to meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/0021-arm_ffa-add-support-for-FFA-v1.1.patch
index 62a3eb36..bebac41c 100644
--- a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/0022-arm_ffa-add-support-for-FFA-v1.1.patch
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/0021-arm_ffa-add-support-for-FFA-v1.1.patch
@@ -1,7 +1,7 @@
-From 90c09f49c4df35fa0e25dda5e9f15a2d30debce8 Mon Sep 17 00:00:00 2001
+From abb29275dc4965e015f7719951645acfa58bcab4 Mon Sep 17 00:00:00 2001
 From: Usama Arif <usama.arif@arm.com>
 Date: Wed, 11 Aug 2021 09:45:35 +0100
-Subject: [PATCH] arm_ffa: add support for FFA v1.1
+Subject: [PATCH 21/22] arm_ffa: add support for FFA v1.1
 
 Change-Id: I3d5a72981c6a66a0a034fd76d5e38eeb33318d20
 Signed-off-by: Usama Arif <usama.arif@arm.com>
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/defconfig b/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/defconfig
deleted file mode 100644
index f8ef55b1..00000000
--- a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/defconfig
+++ /dev/null
@@ -1,979 +0,0 @@
-CONFIG_POSIX_MQUEUE=y
-CONFIG_AUDIT=y
-CONFIG_NO_HZ=y
-CONFIG_HIGH_RES_TIMERS=y
-CONFIG_PREEMPT=y
-CONFIG_IRQ_TIME_ACCOUNTING=y
-CONFIG_BSD_PROCESS_ACCT=y
-CONFIG_BSD_PROCESS_ACCT_V3=y
-CONFIG_IKCONFIG=y
-CONFIG_IKCONFIG_PROC=y
-CONFIG_UCLAMP_TASK=y
-CONFIG_NUMA_BALANCING=y
-CONFIG_MEMCG=y
-CONFIG_BLK_CGROUP=y
-CONFIG_RT_GROUP_SCHED=y
-CONFIG_UCLAMP_TASK_GROUP=y
-CONFIG_CGROUP_PIDS=y
-CONFIG_CGROUP_FREEZER=y
-CONFIG_CGROUP_HUGETLB=y
-CONFIG_CPUSETS=y
-CONFIG_CGROUP_DEVICE=y
-CONFIG_CGROUP_CPUACCT=y
-CONFIG_CGROUP_PERF=y
-CONFIG_CGROUP_BPF=y
-CONFIG_NAMESPACES=y
-CONFIG_USER_NS=y
-CONFIG_SCHED_AUTOGROUP=y
-CONFIG_BLK_DEV_INITRD=y
-CONFIG_KALLSYMS_ALL=y
-CONFIG_BPF_SYSCALL=y
-CONFIG_EMBEDDED=y
-# CONFIG_COMPAT_BRK is not set
-CONFIG_PROFILING=y
-CONFIG_ARCH_ACTIONS=y
-CONFIG_ARCH_AGILEX=y
-CONFIG_ARCH_SUNXI=y
-CONFIG_ARCH_ALPINE=y
-CONFIG_ARCH_BCM2835=y
-CONFIG_ARCH_BCM_IPROC=y
-CONFIG_ARCH_BERLIN=y
-CONFIG_ARCH_BRCMSTB=y
-CONFIG_ARCH_EXYNOS=y
-CONFIG_ARCH_K3=y
-CONFIG_ARCH_LAYERSCAPE=y
-CONFIG_ARCH_LG1K=y
-CONFIG_ARCH_HISI=y
-CONFIG_ARCH_MEDIATEK=y
-CONFIG_ARCH_MESON=y
-CONFIG_ARCH_MVEBU=y
-CONFIG_ARCH_MXC=y
-CONFIG_ARCH_QCOM=y
-CONFIG_ARCH_RENESAS=y
-CONFIG_ARCH_ROCKCHIP=y
-CONFIG_ARCH_SEATTLE=y
-CONFIG_ARCH_STRATIX10=y
-CONFIG_ARCH_SYNQUACER=y
-CONFIG_ARCH_TEGRA=y
-CONFIG_ARCH_SPRD=y
-CONFIG_ARCH_THUNDER=y
-CONFIG_ARCH_THUNDER2=y
-CONFIG_ARCH_UNIPHIER=y
-CONFIG_ARCH_VEXPRESS=y
-CONFIG_ARCH_XGENE=y
-CONFIG_ARCH_ZX=y
-CONFIG_ARCH_ZYNQMP=y
-CONFIG_ARM64_VA_BITS_48=y
-CONFIG_SCHED_MC=y
-CONFIG_NUMA=y
-CONFIG_KEXEC=y
-CONFIG_CRASH_DUMP=y
-CONFIG_XEN=y
-CONFIG_ARM64_SW_TTBR0_PAN=y
-CONFIG_COMPAT=y
-CONFIG_ARMV8_DEPRECATED=y
-CONFIG_SWP_EMULATION=y
-CONFIG_CP15_BARRIER_EMULATION=y
-CONFIG_SETEND_EMULATION=y
-CONFIG_RANDOMIZE_BASE=y
-CONFIG_PM_AUTOSLEEP=y
-CONFIG_PM_WAKELOCKS=y
-CONFIG_WQ_POWER_EFFICIENT_DEFAULT=y
-CONFIG_ENERGY_MODEL=y
-CONFIG_ARM_CPUIDLE=y
-CONFIG_ARM_PSCI_CPUIDLE=y
-CONFIG_CPU_FREQ=y
-CONFIG_CPU_FREQ_STAT=y
-CONFIG_CPU_FREQ_GOV_POWERSAVE=m
-CONFIG_CPU_FREQ_GOV_USERSPACE=y
-CONFIG_CPU_FREQ_GOV_ONDEMAND=y
-CONFIG_CPU_FREQ_GOV_CONSERVATIVE=m
-CONFIG_CPUFREQ_DT=y
-CONFIG_ACPI_CPPC_CPUFREQ=m
-CONFIG_ARM_ARMADA_37XX_CPUFREQ=y
-CONFIG_ARM_SCPI_CPUFREQ=y
-CONFIG_ARM_IMX_CPUFREQ_DT=m
-CONFIG_ARM_QCOM_CPUFREQ_NVMEM=y
-CONFIG_ARM_QCOM_CPUFREQ_HW=y
-CONFIG_ARM_RASPBERRYPI_CPUFREQ=m
-CONFIG_ARM_SCMI_CPUFREQ=y
-CONFIG_ARM_TEGRA186_CPUFREQ=y
-CONFIG_ARM_SCMI_PROTOCOL=y
-CONFIG_ARM_SCPI_PROTOCOL=y
-CONFIG_RASPBERRYPI_FIRMWARE=y
-CONFIG_INTEL_STRATIX10_SERVICE=y
-CONFIG_INTEL_STRATIX10_RSU=m
-CONFIG_ARM_FFA_TRANSPORT=y
-CONFIG_EFI_CAPSULE_LOADER=y
-CONFIG_IMX_SCU=y
-CONFIG_IMX_SCU_PD=y
-CONFIG_ACPI=y
-CONFIG_ACPI_APEI=y
-CONFIG_ACPI_APEI_GHES=y
-CONFIG_ACPI_APEI_MEMORY_FAILURE=y
-CONFIG_ACPI_APEI_EINJ=y
-CONFIG_VIRTUALIZATION=y
-CONFIG_KVM=y
-CONFIG_ARM64_CRYPTO=y
-CONFIG_CRYPTO_SHA1_ARM64_CE=y
-CONFIG_CRYPTO_SHA2_ARM64_CE=y
-CONFIG_CRYPTO_SHA512_ARM64_CE=m
-CONFIG_CRYPTO_SHA3_ARM64=m
-CONFIG_CRYPTO_SM3_ARM64_CE=m
-CONFIG_CRYPTO_GHASH_ARM64_CE=y
-CONFIG_CRYPTO_CRCT10DIF_ARM64_CE=m
-CONFIG_CRYPTO_AES_ARM64_CE_CCM=y
-CONFIG_CRYPTO_AES_ARM64_CE_BLK=y
-CONFIG_CRYPTO_CHACHA20_NEON=m
-CONFIG_CRYPTO_AES_ARM64_BS=m
-CONFIG_JUMP_LABEL=y
-CONFIG_MODULES=y
-CONFIG_MODULE_UNLOAD=y
-CONFIG_MODVERSIONS=y
-# CONFIG_CORE_DUMP_DEFAULT_ELF_HEADERS is not set
-CONFIG_KSM=y
-CONFIG_MEMORY_FAILURE=y
-CONFIG_TRANSPARENT_HUGEPAGE=y
-CONFIG_NET=y
-CONFIG_PACKET=y
-CONFIG_UNIX=y
-CONFIG_XFRM_USER=y
-CONFIG_NET_KEY=y
-CONFIG_INET=y
-CONFIG_IP_MULTICAST=y
-CONFIG_IP_ADVANCED_ROUTER=y
-CONFIG_IP_MULTIPLE_TABLES=y
-CONFIG_IP_PNP=y
-CONFIG_IP_PNP_DHCP=y
-CONFIG_IP_PNP_BOOTP=y
-CONFIG_INET_ESP=y
-CONFIG_INET_DIAG_DESTROY=y
-CONFIG_IPV6_ROUTER_PREF=y
-CONFIG_IPV6_ROUTE_INFO=y
-CONFIG_IPV6_OPTIMISTIC_DAD=y
-CONFIG_INET6_AH=y
-CONFIG_INET6_ESP=y
-CONFIG_INET6_IPCOMP=y
-CONFIG_IPV6_MIP6=y
-CONFIG_IPV6_SIT=m
-CONFIG_IPV6_MULTIPLE_TABLES=y
-CONFIG_NETFILTER=y
-CONFIG_NF_CONNTRACK=y
-CONFIG_NF_CONNTRACK_EVENTS=y
-CONFIG_NF_CONNTRACK_AMANDA=y
-CONFIG_NF_CONNTRACK_FTP=y
-CONFIG_NF_CONNTRACK_H323=y
-CONFIG_NF_CONNTRACK_IRC=y
-CONFIG_NF_CONNTRACK_NETBIOS_NS=y
-CONFIG_NF_CONNTRACK_PPTP=y
-CONFIG_NF_CONNTRACK_SANE=y
-CONFIG_NF_CONNTRACK_TFTP=y
-CONFIG_NF_CT_NETLINK=y
-CONFIG_NETFILTER_XT_TARGET_CLASSIFY=y
-CONFIG_NETFILTER_XT_TARGET_CONNMARK=y
-CONFIG_NETFILTER_XT_TARGET_IDLETIMER=y
-CONFIG_NETFILTER_XT_TARGET_MARK=y
-CONFIG_NETFILTER_XT_TARGET_NFLOG=y
-CONFIG_NETFILTER_XT_TARGET_NFQUEUE=y
-CONFIG_NETFILTER_XT_TARGET_TPROXY=y
-CONFIG_NETFILTER_XT_TARGET_TRACE=y
-CONFIG_NETFILTER_XT_MATCH_COMMENT=y
-CONFIG_NETFILTER_XT_MATCH_CONNLIMIT=y
-CONFIG_NETFILTER_XT_MATCH_CONNMARK=y
-CONFIG_NETFILTER_XT_MATCH_CONNTRACK=y
-CONFIG_NETFILTER_XT_MATCH_HASHLIMIT=y
-CONFIG_NETFILTER_XT_MATCH_HELPER=y
-CONFIG_NETFILTER_XT_MATCH_IPRANGE=y
-CONFIG_NETFILTER_XT_MATCH_LENGTH=y
-CONFIG_NETFILTER_XT_MATCH_LIMIT=y
-CONFIG_NETFILTER_XT_MATCH_MAC=y
-CONFIG_NETFILTER_XT_MATCH_MARK=y
-CONFIG_NETFILTER_XT_MATCH_POLICY=y
-CONFIG_NETFILTER_XT_MATCH_QUOTA=y
-CONFIG_NETFILTER_XT_MATCH_SOCKET=y
-CONFIG_NETFILTER_XT_MATCH_STATE=y
-CONFIG_NETFILTER_XT_MATCH_STATISTIC=y
-CONFIG_NETFILTER_XT_MATCH_STRING=y
-CONFIG_NETFILTER_XT_MATCH_TIME=y
-CONFIG_NETFILTER_XT_MATCH_U32=y
-CONFIG_NF_LOG_IPV4=m
-CONFIG_IP_NF_IPTABLES=y
-CONFIG_IP_NF_MATCH_AH=y
-CONFIG_IP_NF_MATCH_ECN=y
-CONFIG_IP_NF_MATCH_TTL=y
-CONFIG_IP_NF_FILTER=y
-CONFIG_IP_NF_TARGET_REJECT=y
-CONFIG_IP_NF_NAT=y
-CONFIG_IP_NF_TARGET_MASQUERADE=y
-CONFIG_IP_NF_TARGET_NETMAP=y
-CONFIG_IP_NF_TARGET_REDIRECT=y
-CONFIG_IP_NF_MANGLE=y
-CONFIG_IP_NF_RAW=y
-CONFIG_IP_NF_SECURITY=y
-CONFIG_IP_NF_ARPTABLES=y
-CONFIG_IP_NF_ARPFILTER=y
-CONFIG_IP_NF_ARP_MANGLE=y
-CONFIG_NF_LOG_IPV6=m
-CONFIG_IP6_NF_IPTABLES=y
-CONFIG_IP6_NF_MATCH_RPFILTER=y
-CONFIG_IP6_NF_FILTER=y
-CONFIG_IP6_NF_TARGET_REJECT=y
-CONFIG_IP6_NF_MANGLE=y
-CONFIG_IP6_NF_RAW=y
-CONFIG_IP6_NF_NAT=m
-CONFIG_IP6_NF_TARGET_MASQUERADE=m
-CONFIG_BRIDGE=m
-CONFIG_BRIDGE_VLAN_FILTERING=y
-CONFIG_VLAN_8021Q=m
-CONFIG_VLAN_8021Q_GVRP=y
-CONFIG_VLAN_8021Q_MVRP=y
-CONFIG_NET_SCHED=y
-CONFIG_NET_SCH_HTB=y
-CONFIG_NET_CLS_U32=y
-CONFIG_NET_EMATCH=y
-CONFIG_NET_EMATCH_U32=y
-CONFIG_NET_CLS_ACT=y
-CONFIG_QRTR=m
-CONFIG_QRTR_SMD=m
-CONFIG_QRTR_TUN=m
-CONFIG_BPF_JIT=y
-CONFIG_BT=m
-CONFIG_BT_HIDP=m
-# CONFIG_BT_LE is not set
-CONFIG_BT_LEDS=y
-# CONFIG_BT_DEBUGFS is not set
-CONFIG_BT_HCIBTUSB=m
-CONFIG_BT_HCIUART=m
-CONFIG_BT_HCIUART_LL=y
-CONFIG_BT_HCIUART_BCM=y
-CONFIG_BT_HCIUART_QCA=y
-CONFIG_CFG80211=y
-CONFIG_MAC80211=m
-CONFIG_MAC80211_LEDS=y
-CONFIG_RFKILL=y
-CONFIG_NET_9P=y
-CONFIG_NET_9P_VIRTIO=y
-CONFIG_PCI=y
-CONFIG_PCIEPORTBUS=y
-CONFIG_PCI_IOV=y
-CONFIG_HOTPLUG_PCI=y
-CONFIG_HOTPLUG_PCI_ACPI=y
-CONFIG_PCI_AARDVARK=y
-CONFIG_PCI_TEGRA=y
-CONFIG_PCIE_RCAR=y
-CONFIG_PCI_HOST_GENERIC=y
-CONFIG_PCI_XGENE=y
-CONFIG_PCIE_ALTERA=y
-CONFIG_PCIE_ALTERA_MSI=y
-CONFIG_PCI_HOST_THUNDER_PEM=y
-CONFIG_PCI_HOST_THUNDER_ECAM=y
-CONFIG_PCIE_ROCKCHIP_HOST=m
-CONFIG_PCI_LAYERSCAPE=y
-CONFIG_PCI_HISI=y
-CONFIG_PCIE_QCOM=y
-CONFIG_PCIE_ARMADA_8K=y
-CONFIG_PCIE_KIRIN=y
-CONFIG_PCIE_HISI_STB=y
-CONFIG_DEVTMPFS=y
-CONFIG_DEVTMPFS_MOUNT=y
-CONFIG_FW_LOADER_USER_HELPER=y
-CONFIG_FW_LOADER_USER_HELPER_FALLBACK=y
-CONFIG_HISILICON_LPC=y
-CONFIG_SIMPLE_PM_BUS=y
-CONFIG_MTD=y
-CONFIG_MTD_BLOCK=y
-CONFIG_MTD_PHRAM=y
-CONFIG_MTD_RAW_NAND=y
-CONFIG_MTD_NAND_DENALI_DT=y
-CONFIG_MTD_NAND_MARVELL=y
-CONFIG_MTD_NAND_QCOM=y
-CONFIG_MTD_SPI_NOR=y
-CONFIG_BLK_DEV_LOOP=y
-CONFIG_BLK_DEV_NBD=m
-CONFIG_BLK_DEV_RAM=y
-CONFIG_BLK_DEV_RAM_SIZE=8192
-CONFIG_VIRTIO_BLK=y
-CONFIG_BLK_DEV_NVME=m
-CONFIG_SRAM=y
-CONFIG_EEPROM_AT25=m
-# CONFIG_SCSI_PROC_FS is not set
-CONFIG_BLK_DEV_SD=y
-CONFIG_SCSI_SAS_ATA=y
-CONFIG_SCSI_HISI_SAS=y
-CONFIG_SCSI_HISI_SAS_PCI=y
-CONFIG_SCSI_MPT3SAS=m
-CONFIG_SCSI_UFSHCD=y
-CONFIG_SCSI_UFSHCD_PLATFORM=y
-CONFIG_SCSI_UFS_QCOM=m
-CONFIG_SCSI_UFS_HISI=y
-CONFIG_ATA=y
-CONFIG_SATA_AHCI=y
-CONFIG_SATA_AHCI_PLATFORM=y
-CONFIG_AHCI_CEVA=y
-CONFIG_AHCI_MVEBU=y
-CONFIG_AHCI_XGENE=y
-CONFIG_AHCI_QORIQ=y
-CONFIG_SATA_SIL24=y
-CONFIG_SATA_RCAR=y
-CONFIG_PATA_PLATFORM=y
-CONFIG_PATA_OF_PLATFORM=y
-CONFIG_MD=y
-CONFIG_BLK_DEV_MD=m
-CONFIG_BLK_DEV_DM=y
-CONFIG_DM_MIRROR=m
-CONFIG_DM_ZERO=m
-CONFIG_DM_VERITY=y
-CONFIG_DM_VERITY_VERIFY_ROOTHASH_SIG=y
-CONFIG_DM_VERITY_FEC=y
-CONFIG_NETDEVICES=y
-CONFIG_MACVLAN=m
-CONFIG_MACVTAP=m
-CONFIG_TUN=y
-CONFIG_VETH=m
-CONFIG_VIRTIO_NET=y
-CONFIG_AMD_XGBE=y
-CONFIG_NET_XGENE=y
-CONFIG_ATL1C=m
-CONFIG_BCMGENET=m
-CONFIG_BNX2X=m
-CONFIG_MACB=y
-CONFIG_THUNDER_NIC_PF=y
-CONFIG_FEC=y
-CONFIG_HIX5HD2_GMAC=y
-CONFIG_HNS_DSAF=y
-CONFIG_HNS_ENET=y
-CONFIG_HNS3=y
-CONFIG_HNS3_HCLGE=y
-CONFIG_HNS3_ENET=y
-CONFIG_E1000E=y
-CONFIG_IGB=y
-CONFIG_IGBVF=y
-CONFIG_MVNETA=y
-CONFIG_MVPP2=y
-CONFIG_SKY2=y
-CONFIG_MLX4_EN=m
-CONFIG_MLX5_CORE=m
-CONFIG_MLX5_CORE_EN=y
-CONFIG_QCOM_EMAC=m
-CONFIG_RAVB=y
-CONFIG_SMC91X=y
-CONFIG_SMSC911X=y
-CONFIG_SNI_AVE=y
-CONFIG_SNI_NETSEC=y
-CONFIG_STMMAC_ETH=m
-CONFIG_MESON_GXL_PHY=m
-CONFIG_MARVELL_PHY=m
-CONFIG_MARVELL_10G_PHY=m
-CONFIG_MICREL_PHY=y
-CONFIG_AT803X_PHY=y
-CONFIG_REALTEK_PHY=m
-CONFIG_ROCKCHIP_PHY=y
-CONFIG_MDIO_BUS_MUX_MMIOREG=y
-CONFIG_PPP=y
-CONFIG_PPP_BSDCOMP=y
-CONFIG_PPP_DEFLATE=y
-CONFIG_PPP_MPPE=y
-CONFIG_USB_PEGASUS=m
-CONFIG_USB_RTL8150=m
-CONFIG_USB_RTL8152=m
-CONFIG_USB_LAN78XX=m
-CONFIG_USB_USBNET=m
-CONFIG_USB_NET_DM9601=m
-CONFIG_USB_NET_SR9800=m
-CONFIG_USB_NET_SMSC75XX=m
-CONFIG_USB_NET_SMSC95XX=m
-CONFIG_USB_NET_PLUSB=m
-CONFIG_USB_NET_MCS7830=m
-CONFIG_ATH10K=m
-CONFIG_ATH10K_PCI=m
-CONFIG_ATH10K_SNOC=m
-CONFIG_BRCMFMAC=m
-CONFIG_MWIFIEX=m
-CONFIG_MWIFIEX_PCIE=m
-CONFIG_WL18XX=m
-CONFIG_WLCORE_SDIO=m
-CONFIG_INPUT_JOYDEV=y
-CONFIG_INPUT_EVDEV=y
-CONFIG_KEYBOARD_ADC=m
-CONFIG_KEYBOARD_GPIO=y
-CONFIG_KEYBOARD_SNVS_PWRKEY=m
-CONFIG_INPUT_TOUCHSCREEN=y
-CONFIG_TOUCHSCREEN_ATMEL_MXT=m
-CONFIG_INPUT_MISC=y
-CONFIG_INPUT_PM8941_PWRKEY=y
-CONFIG_INPUT_HISI_POWERKEY=y
-# CONFIG_SERIO_SERPORT is not set
-CONFIG_SERIO_AMBAKMI=y
-CONFIG_LEGACY_PTY_COUNT=16
-CONFIG_SERIAL_8250=y
-CONFIG_SERIAL_8250_CONSOLE=y
-CONFIG_SERIAL_8250_EXTENDED=y
-CONFIG_SERIAL_8250_SHARE_IRQ=y
-CONFIG_SERIAL_8250_BCM2835AUX=y
-CONFIG_SERIAL_8250_DW=y
-CONFIG_SERIAL_8250_OMAP=y
-CONFIG_SERIAL_8250_MT6577=y
-CONFIG_SERIAL_8250_UNIPHIER=y
-CONFIG_SERIAL_OF_PLATFORM=y
-CONFIG_SERIAL_AMBA_PL011=y
-CONFIG_SERIAL_AMBA_PL011_CONSOLE=y
-CONFIG_SERIAL_MESON=y
-CONFIG_SERIAL_MESON_CONSOLE=y
-CONFIG_SERIAL_SAMSUNG=y
-CONFIG_SERIAL_SAMSUNG_CONSOLE=y
-CONFIG_SERIAL_TEGRA=y
-CONFIG_SERIAL_TEGRA_TCU=y
-CONFIG_SERIAL_IMX=y
-CONFIG_SERIAL_IMX_CONSOLE=y
-CONFIG_SERIAL_SH_SCI=y
-CONFIG_SERIAL_MSM=y
-CONFIG_SERIAL_MSM_CONSOLE=y
-CONFIG_SERIAL_QCOM_GENI=y
-CONFIG_SERIAL_QCOM_GENI_CONSOLE=y
-CONFIG_SERIAL_XILINX_PS_UART=y
-CONFIG_SERIAL_XILINX_PS_UART_CONSOLE=y
-CONFIG_SERIAL_FSL_LPUART=y
-CONFIG_SERIAL_FSL_LPUART_CONSOLE=y
-CONFIG_SERIAL_FSL_LINFLEXUART=y
-CONFIG_SERIAL_FSL_LINFLEXUART_CONSOLE=y
-CONFIG_SERIAL_MVEBU_UART=y
-CONFIG_SERIAL_OWL=y
-CONFIG_SERIAL_DEV_BUS=y
-CONFIG_VIRTIO_CONSOLE=y
-CONFIG_IPMI_HANDLER=m
-CONFIG_IPMI_DEVICE_INTERFACE=m
-CONFIG_IPMI_SI=m
-CONFIG_TCG_TPM=y
-CONFIG_TCG_TIS_I2C_INFINEON=y
-CONFIG_I2C_CHARDEV=y
-CONFIG_I2C_MUX_PCA954x=y
-CONFIG_I2C_BCM2835=m
-CONFIG_I2C_DESIGNWARE_PLATFORM=y
-CONFIG_I2C_GPIO=m
-CONFIG_I2C_IMX=y
-CONFIG_I2C_IMX_LPI2C=y
-CONFIG_I2C_MESON=y
-CONFIG_I2C_MV64XXX=y
-CONFIG_I2C_OWL=y
-CONFIG_I2C_PXA=y
-CONFIG_I2C_QCOM_GENI=m
-CONFIG_I2C_QUP=y
-CONFIG_I2C_RK3X=y
-CONFIG_I2C_SH_MOBILE=y
-CONFIG_I2C_TEGRA=y
-CONFIG_I2C_UNIPHIER_F=y
-CONFIG_I2C_RCAR=y
-CONFIG_SPI=y
-CONFIG_SPI_ARMADA_3700=y
-CONFIG_SPI_BCM2835=m
-CONFIG_SPI_BCM2835AUX=m
-CONFIG_SPI_CADENCE_QUADSPI=y
-CONFIG_SPI_NXP_FLEXSPI=y
-CONFIG_SPI_IMX=m
-CONFIG_SPI_MESON_SPICC=m
-CONFIG_SPI_MESON_SPIFC=m
-CONFIG_SPI_ORION=y
-CONFIG_SPI_PL022=y
-CONFIG_SPI_ROCKCHIP=y
-CONFIG_SPI_QCOM_QSPI=m
-CONFIG_SPI_QUP=y
-CONFIG_SPI_QCOM_GENI=m
-CONFIG_SPI_S3C64XX=y
-CONFIG_SPI_SUN6I=y
-CONFIG_SPI_SPIDEV=m
-CONFIG_SPMI=y
-CONFIG_PINCTRL_SINGLE=y
-CONFIG_PINCTRL_MAX77620=y
-CONFIG_PINCTRL_OWL=y
-CONFIG_PINCTRL_S700=y
-CONFIG_PINCTRL_S900=y
-CONFIG_PINCTRL_IMX8MM=y
-CONFIG_PINCTRL_IMX8MN=y
-CONFIG_PINCTRL_IMX8MQ=y
-CONFIG_PINCTRL_IMX8QXP=y
-CONFIG_PINCTRL_IPQ8074=m
-CONFIG_PINCTRL_MSM8916=m
-CONFIG_PINCTRL_MSM8994=m
-CONFIG_PINCTRL_MSM8996=m
-CONFIG_PINCTRL_MSM8998=m
-CONFIG_PINCTRL_QCS404=m
-CONFIG_PINCTRL_QDF2XXX=m
-CONFIG_PINCTRL_QCOM_SPMI_PMIC=y
-CONFIG_PINCTRL_SDM845=m
-CONFIG_PINCTRL_SM8150=m
-CONFIG_GPIO_ALTERA=m
-CONFIG_GPIO_DWAPB=y
-CONFIG_GPIO_MB86S7X=y
-CONFIG_GPIO_PL061=y
-CONFIG_GPIO_RCAR=y
-CONFIG_GPIO_UNIPHIER=y
-CONFIG_GPIO_XGENE=y
-CONFIG_GPIO_XGENE_SB=y
-CONFIG_GPIO_MAX732X=y
-CONFIG_GPIO_PCA953X=y
-CONFIG_GPIO_PCA953X_IRQ=y
-CONFIG_GPIO_MAX77620=y
-CONFIG_POWER_RESET_MSM=y
-CONFIG_POWER_RESET_XGENE=y
-CONFIG_POWER_RESET_SYSCON=y
-CONFIG_SYSCON_REBOOT_MODE=y
-CONFIG_BATTERY_SBS=m
-CONFIG_BATTERY_BQ27XXX=y
-CONFIG_SENSORS_ARM_SCMI=y
-CONFIG_SENSORS_ARM_SCPI=y
-CONFIG_SENSORS_LM90=m
-CONFIG_SENSORS_PWM_FAN=m
-CONFIG_SENSORS_RASPBERRYPI_HWMON=m
-CONFIG_SENSORS_INA2XX=m
-CONFIG_SENSORS_INA3221=m
-CONFIG_THERMAL_GOV_POWER_ALLOCATOR=y
-CONFIG_CPU_THERMAL=y
-CONFIG_DEVFREQ_THERMAL=y
-CONFIG_THERMAL_EMULATION=y
-CONFIG_QORIQ_THERMAL=m
-CONFIG_ROCKCHIP_THERMAL=m
-CONFIG_RCAR_THERMAL=y
-CONFIG_RCAR_GEN3_THERMAL=y
-CONFIG_ARMADA_THERMAL=y
-CONFIG_BCM2835_THERMAL=m
-CONFIG_BRCMSTB_THERMAL=m
-CONFIG_EXYNOS_THERMAL=y
-CONFIG_TEGRA_BPMP_THERMAL=m
-CONFIG_QCOM_TSENS=y
-CONFIG_QCOM_SPMI_TEMP_ALARM=m
-CONFIG_UNIPHIER_THERMAL=y
-CONFIG_WATCHDOG=y
-CONFIG_ARM_SP805_WATCHDOG=y
-CONFIG_S3C2410_WATCHDOG=y
-CONFIG_DW_WATCHDOG=y
-CONFIG_SUNXI_WATCHDOG=m
-CONFIG_IMX2_WDT=y
-CONFIG_IMX_SC_WDT=m
-CONFIG_QCOM_WDT=m
-CONFIG_MESON_GXBB_WATCHDOG=m
-CONFIG_MESON_WATCHDOG=m
-CONFIG_RENESAS_WDT=y
-CONFIG_UNIPHIER_WATCHDOG=y
-CONFIG_BCM2835_WDT=y
-CONFIG_MFD_ALTERA_SYSMGR=y
-CONFIG_MFD_BD9571MWV=y
-CONFIG_MFD_AXP20X_I2C=y
-CONFIG_MFD_AXP20X_RSB=y
-CONFIG_MFD_EXYNOS_LPASS=m
-CONFIG_MFD_HI6421_PMIC=y
-CONFIG_MFD_HI655X_PMIC=y
-CONFIG_MFD_MAX77620=y
-CONFIG_MFD_SPMI_PMIC=y
-CONFIG_MFD_RK808=y
-CONFIG_MFD_SEC_CORE=y
-CONFIG_MFD_ROHM_BD718XX=y
-CONFIG_REGULATOR_FIXED_VOLTAGE=y
-CONFIG_REGULATOR_AXP20X=y
-CONFIG_REGULATOR_BD718XX=y
-CONFIG_REGULATOR_BD9571MWV=y
-CONFIG_REGULATOR_FAN53555=y
-CONFIG_REGULATOR_GPIO=y
-CONFIG_REGULATOR_HI6421V530=y
-CONFIG_REGULATOR_HI655X=y
-CONFIG_REGULATOR_MAX77620=y
-CONFIG_REGULATOR_MAX8973=y
-CONFIG_REGULATOR_PFUZE100=y
-CONFIG_REGULATOR_PWM=y
-CONFIG_REGULATOR_QCOM_RPMH=m
-CONFIG_REGULATOR_QCOM_SMD_RPM=y
-CONFIG_REGULATOR_QCOM_SPMI=y
-CONFIG_REGULATOR_RK808=y
-CONFIG_REGULATOR_S2MPS11=y
-CONFIG_REGULATOR_VCTRL=m
-CONFIG_RC_CORE=m
-CONFIG_RC_DECODERS=y
-CONFIG_RC_DEVICES=y
-CONFIG_IR_MESON=m
-CONFIG_IR_SUNXI=m
-CONFIG_MEDIA_SUPPORT=y
-CONFIG_MEDIA_SUBDRV_AUTOSELECT=y
-# CONFIG_DVB_NET is not set
-CONFIG_MEDIA_USB_SUPPORT=y
-CONFIG_USB_VIDEO_CLASS=m
-CONFIG_V4L_PLATFORM_DRIVERS=y
-CONFIG_VIDEO_SUN6I_CSI=m
-CONFIG_V4L_MEM2MEM_DRIVERS=y
-CONFIG_VIDEO_SAMSUNG_S5P_JPEG=m
-CONFIG_VIDEO_SAMSUNG_S5P_MFC=m
-CONFIG_VIDEO_SAMSUNG_EXYNOS_GSC=m
-CONFIG_VIDEO_RENESAS_FCP=m
-CONFIG_VIDEO_RENESAS_VSP1=m
-CONFIG_DRM=y
-CONFIG_DRM_LOAD_EDID_FIRMWARE=y
-CONFIG_DRM_I2C_CH7006=m
-CONFIG_DRM_I2C_SIL164=m
-CONFIG_DRM_I2C_NXP_TDA998X=m
-CONFIG_DRM_HDLCD=y
-CONFIG_DRM_KOMEDA=y
-CONFIG_DRM_VIRT_ENCODER=y
-CONFIG_DRM_EXYNOS=m
-CONFIG_DRM_EXYNOS5433_DECON=y
-CONFIG_DRM_EXYNOS7_DECON=y
-CONFIG_DRM_EXYNOS_DSI=y
-# CONFIG_DRM_EXYNOS_DP is not set
-CONFIG_DRM_EXYNOS_HDMI=y
-CONFIG_DRM_EXYNOS_MIC=y
-CONFIG_DRM_ROCKCHIP=m
-CONFIG_ROCKCHIP_ANALOGIX_DP=y
-CONFIG_ROCKCHIP_CDN_DP=y
-CONFIG_ROCKCHIP_DW_HDMI=y
-CONFIG_ROCKCHIP_DW_MIPI_DSI=y
-CONFIG_ROCKCHIP_INNO_HDMI=y
-CONFIG_DRM_RCAR_DU=m
-CONFIG_DRM_SUN4I=m
-CONFIG_DRM_SUN8I_DW_HDMI=m
-CONFIG_DRM_SUN8I_MIXER=m
-CONFIG_DRM_MSM=m
-CONFIG_DRM_TEGRA=m
-CONFIG_DRM_PANEL_SIMPLE=m
-CONFIG_DRM_SII902X=m
-CONFIG_DRM_TI_SN65DSI86=m
-CONFIG_DRM_I2C_ADV7511=m
-CONFIG_DRM_VC4=m
-CONFIG_DRM_ETNAVIV=m
-CONFIG_DRM_HISI_HIBMC=m
-CONFIG_DRM_HISI_KIRIN=m
-CONFIG_DRM_MESON=m
-CONFIG_DRM_PL111=m
-CONFIG_DRM_LIMA=m
-CONFIG_DRM_PANFROST=m
-CONFIG_DRM_LEGACY=y
-CONFIG_FB_MODE_HELPERS=y
-CONFIG_FB_EFI=y
-CONFIG_BACKLIGHT_PWM=m
-CONFIG_BACKLIGHT_LP855X=m
-CONFIG_FRAMEBUFFER_CONSOLE=y
-CONFIG_LOGO=y
-# CONFIG_LOGO_LINUX_MONO is not set
-# CONFIG_LOGO_LINUX_VGA16 is not set
-CONFIG_SOUND=y
-CONFIG_SND=y
-CONFIG_SND_HDA_TEGRA=m
-CONFIG_SND_HDA_CODEC_HDMI=m
-CONFIG_SND_SOC=y
-CONFIG_SND_BCM2835_SOC_I2S=m
-CONFIG_SND_MESON_AXG_SOUND_CARD=m
-CONFIG_SND_SOC_ROCKCHIP=m
-CONFIG_SND_SOC_ROCKCHIP_SPDIF=m
-CONFIG_SND_SOC_ROCKCHIP_RT5645=m
-CONFIG_SND_SOC_RK3399_GRU_SOUND=m
-CONFIG_SND_SOC_SAMSUNG=y
-CONFIG_SND_SOC_RCAR=m
-CONFIG_SND_SUN4I_SPDIF=m
-CONFIG_SND_SOC_AK4613=m
-CONFIG_SND_SOC_ES7134=m
-CONFIG_SND_SOC_ES7241=m
-CONFIG_SND_SOC_PCM3168A_I2C=m
-CONFIG_SND_SOC_TAS571X=m
-CONFIG_SND_SIMPLE_CARD=m
-CONFIG_SND_AUDIO_GRAPH_CARD=m
-CONFIG_HID_A4TECH=y
-CONFIG_HID_APPLE=y
-CONFIG_HID_BELKIN=y
-CONFIG_HID_CHERRY=y
-CONFIG_HID_CHICONY=y
-CONFIG_HID_CYPRESS=y
-CONFIG_HID_EZKEY=y
-CONFIG_HID_ITE=y
-CONFIG_HID_KENSINGTON=y
-CONFIG_HID_LOGITECH=y
-CONFIG_HID_REDRAGON=y
-CONFIG_HID_MICROSOFT=y
-CONFIG_HID_MONTEREY=y
-CONFIG_I2C_HID=m
-CONFIG_USB=y
-CONFIG_USB_OTG=y
-CONFIG_USB_XHCI_HCD=y
-CONFIG_USB_XHCI_TEGRA=y
-CONFIG_USB_EHCI_HCD=y
-CONFIG_USB_EHCI_EXYNOS=y
-CONFIG_USB_EHCI_HCD_PLATFORM=y
-CONFIG_USB_OHCI_HCD=y
-CONFIG_USB_OHCI_EXYNOS=y
-CONFIG_USB_OHCI_HCD_PLATFORM=y
-CONFIG_USB_RENESAS_USBHS=m
-CONFIG_USB_STORAGE=y
-CONFIG_USB_MUSB_HDRC=y
-CONFIG_USB_MUSB_SUNXI=y
-CONFIG_USB_DWC3=y
-CONFIG_USB_DWC2=y
-CONFIG_USB_CHIPIDEA=y
-CONFIG_USB_CHIPIDEA_UDC=y
-CONFIG_USB_CHIPIDEA_HOST=y
-CONFIG_USB_ISP1760=y
-CONFIG_USB_HSIC_USB3503=y
-CONFIG_NOP_USB_XCEIV=y
-CONFIG_USB_GADGET=y
-CONFIG_USB_RENESAS_USBHS_UDC=m
-CONFIG_USB_RENESAS_USB3=m
-CONFIG_USB_CONFIGFS=y
-CONFIG_USB_CONFIGFS_F_FS=y
-CONFIG_USB_CONFIGFS_F_MIDI=y
-CONFIG_TYPEC=m
-CONFIG_TYPEC_TCPM=m
-CONFIG_TYPEC_FUSB302=m
-CONFIG_MMC=y
-CONFIG_MMC_BLOCK_MINORS=32
-CONFIG_MMC_ARMMMCI=y
-CONFIG_MMC_SDHCI=y
-CONFIG_MMC_SDHCI_ACPI=y
-CONFIG_MMC_SDHCI_PLTFM=y
-CONFIG_MMC_SDHCI_OF_ARASAN=y
-CONFIG_MMC_SDHCI_OF_ESDHC=y
-CONFIG_MMC_SDHCI_CADENCE=y
-CONFIG_MMC_SDHCI_ESDHC_IMX=y
-CONFIG_MMC_SDHCI_TEGRA=y
-CONFIG_MMC_SDHCI_F_SDH30=y
-CONFIG_MMC_MESON_GX=y
-CONFIG_MMC_SDHCI_MSM=y
-CONFIG_MMC_SPI=y
-CONFIG_MMC_SDHI=y
-CONFIG_MMC_UNIPHIER=y
-CONFIG_MMC_DW=y
-CONFIG_MMC_DW_EXYNOS=y
-CONFIG_MMC_DW_HI3798CV200=y
-CONFIG_MMC_DW_K3=y
-CONFIG_MMC_DW_ROCKCHIP=y
-CONFIG_MMC_SUNXI=y
-CONFIG_MMC_BCM2835=y
-CONFIG_MMC_SDHCI_XENON=y
-CONFIG_NEW_LEDS=y
-CONFIG_LEDS_CLASS=y
-CONFIG_LEDS_GPIO=y
-CONFIG_LEDS_PWM=y
-CONFIG_LEDS_SYSCON=y
-CONFIG_LEDS_TRIGGER_DISK=y
-CONFIG_LEDS_TRIGGER_HEARTBEAT=y
-CONFIG_LEDS_TRIGGER_CPU=y
-CONFIG_LEDS_TRIGGER_DEFAULT_ON=y
-CONFIG_LEDS_TRIGGER_PANIC=y
-CONFIG_EDAC=y
-CONFIG_EDAC_GHES=y
-CONFIG_RTC_CLASS=y
-CONFIG_RTC_DRV_MAX77686=y
-CONFIG_RTC_DRV_RK808=m
-CONFIG_RTC_DRV_RX8581=m
-CONFIG_RTC_DRV_S5M=y
-CONFIG_RTC_DRV_DS3232=y
-CONFIG_RTC_DRV_EFI=y
-CONFIG_RTC_DRV_S3C=y
-CONFIG_RTC_DRV_PL031=y
-CONFIG_RTC_DRV_SUN6I=y
-CONFIG_RTC_DRV_ARMADA38X=y
-CONFIG_RTC_DRV_TEGRA=y
-CONFIG_RTC_DRV_SNVS=m
-CONFIG_RTC_DRV_IMX_SC=m
-CONFIG_RTC_DRV_XGENE=y
-CONFIG_DMADEVICES=y
-CONFIG_DMA_BCM2835=m
-CONFIG_DMA_SUN6I=m
-CONFIG_FSL_EDMA=y
-CONFIG_IMX_SDMA=y
-CONFIG_K3_DMA=y
-CONFIG_MV_XOR=y
-CONFIG_MV_XOR_V2=y
-CONFIG_OWL_DMA=y
-CONFIG_PL330_DMA=y
-CONFIG_TEGRA20_APB_DMA=y
-CONFIG_QCOM_BAM_DMA=y
-CONFIG_QCOM_HIDMA_MGMT=y
-CONFIG_QCOM_HIDMA=y
-CONFIG_RCAR_DMAC=y
-CONFIG_RENESAS_USB_DMAC=m
-CONFIG_DMABUF_HEAPS=y
-CONFIG_DMABUF_HEAPS_DEFERRED_FREE=y
-CONFIG_DMABUF_HEAPS_PAGE_POOL=y
-CONFIG_DMABUF_HEAPS_SYSTEM=y
-CONFIG_DMABUF_HEAPS_CMA=y
-CONFIG_VFIO=y
-CONFIG_VFIO_PCI=y
-CONFIG_VIRTIO_PCI=y
-CONFIG_VIRTIO_BALLOON=y
-CONFIG_VIRTIO_MMIO=y
-CONFIG_XEN_GNTDEV=y
-CONFIG_XEN_GRANT_DEV_ALLOC=y
-CONFIG_STAGING=y
-CONFIG_ASHMEM=y
-CONFIG_COMMON_CLK_RK808=y
-CONFIG_COMMON_CLK_SCMI=y
-CONFIG_COMMON_CLK_SCPI=y
-CONFIG_COMMON_CLK_CS2000_CP=y
-CONFIG_COMMON_CLK_S2MPS11=y
-CONFIG_CLK_QORIQ=y
-CONFIG_COMMON_CLK_PWM=y
-CONFIG_CLK_RASPBERRYPI=m
-CONFIG_CLK_IMX8MM=y
-CONFIG_CLK_IMX8MN=y
-CONFIG_CLK_IMX8MQ=y
-CONFIG_CLK_IMX8QXP=y
-CONFIG_TI_SCI_CLK=y
-CONFIG_COMMON_CLK_QCOM=y
-CONFIG_QCOM_A53PLL=y
-CONFIG_QCOM_CLK_APCS_MSM8916=y
-CONFIG_QCOM_CLK_SMD_RPM=y
-CONFIG_QCOM_CLK_RPMH=m
-CONFIG_IPQ_GCC_8074=y
-CONFIG_MSM_GCC_8916=y
-CONFIG_MSM_GCC_8994=y
-CONFIG_MSM_MMCC_8996=y
-CONFIG_MSM_GCC_8998=y
-CONFIG_QCS_GCC_404=y
-CONFIG_SDM_GCC_845=y
-CONFIG_SM_GCC_8150=y
-CONFIG_QCOM_HFPLL=y
-CONFIG_HWSPINLOCK=y
-CONFIG_HWSPINLOCK_QCOM=y
-CONFIG_ARM_MHU=y
-CONFIG_ARM_MHU_V2=y
-CONFIG_IMX_MBOX=y
-CONFIG_PLATFORM_MHU=y
-CONFIG_BCM2835_MBOX=y
-CONFIG_QCOM_APCS_IPC=y
-CONFIG_ROCKCHIP_IOMMU=y
-CONFIG_TEGRA_IOMMU_SMMU=y
-CONFIG_ARM_SMMU=m
-CONFIG_ARM_SMMU_V3=y
-CONFIG_REMOTEPROC=y
-CONFIG_QCOM_Q6V5_MSS=m
-CONFIG_QCOM_Q6V5_PAS=m
-CONFIG_QCOM_SYSMON=m
-CONFIG_RPMSG_QCOM_GLINK_RPM=y
-CONFIG_RPMSG_QCOM_GLINK_SMEM=m
-CONFIG_RPMSG_QCOM_SMD=y
-CONFIG_OWL_PM_DOMAINS=y
-CONFIG_RASPBERRYPI_POWER=y
-CONFIG_QCOM_AOSS_QMP=y
-CONFIG_QCOM_GENI_SE=y
-CONFIG_QCOM_RMTFS_MEM=m
-CONFIG_QCOM_RPMH=m
-CONFIG_QCOM_RPMHPD=m
-CONFIG_QCOM_SMEM=y
-CONFIG_QCOM_SMD_RPM=y
-CONFIG_QCOM_SMP2P=y
-CONFIG_QCOM_SMSM=y
-CONFIG_QCOM_SOCINFO=m
-CONFIG_ARCH_R8A77995=y
-CONFIG_ARCH_R8A77990=y
-CONFIG_ARCH_R8A77965=y
-CONFIG_ARCH_R8A77980=y
-CONFIG_ARCH_R8A77970=y
-CONFIG_ARCH_R8A774C0=y
-CONFIG_ARCH_R8A774A1=y
-CONFIG_ROCKCHIP_IODOMAIN=y
-CONFIG_ROCKCHIP_PM_DOMAINS=y
-CONFIG_ARCH_TEGRA_132_SOC=y
-CONFIG_ARCH_TEGRA_210_SOC=y
-CONFIG_ARCH_TEGRA_186_SOC=y
-CONFIG_ARCH_TEGRA_194_SOC=y
-CONFIG_ARCH_K3_AM6_SOC=y
-CONFIG_ARCH_K3_J721E_SOC=y
-CONFIG_TI_SCI_PM_DOMAINS=y
-CONFIG_EXTCON_USB_GPIO=y
-CONFIG_MEMORY=y
-CONFIG_IIO=y
-CONFIG_EXYNOS_ADC=y
-CONFIG_QCOM_SPMI_ADC5=m
-CONFIG_ROCKCHIP_SARADC=m
-CONFIG_SENSORS_ISL29018=m
-CONFIG_MPL3115=m
-CONFIG_PWM=y
-CONFIG_PWM_BCM2835=m
-CONFIG_PWM_MESON=m
-CONFIG_PWM_RCAR=m
-CONFIG_PWM_ROCKCHIP=y
-CONFIG_PWM_SAMSUNG=y
-CONFIG_PWM_SUN4I=m
-CONFIG_PWM_TEGRA=m
-CONFIG_RESET_QCOM_AOSS=y
-CONFIG_RESET_QCOM_PDC=m
-CONFIG_RESET_TI_SCI=y
-CONFIG_PHY_XGENE=y
-CONFIG_PHY_SUN4I_USB=y
-CONFIG_PHY_HI6220_USB=y
-CONFIG_PHY_HISTB_COMBPHY=y
-CONFIG_PHY_HISI_INNO_USB2=y
-CONFIG_PHY_MVEBU_CP110_COMPHY=y
-CONFIG_PHY_QCOM_QMP=m
-CONFIG_PHY_QCOM_QUSB2=m
-CONFIG_PHY_QCOM_USB_HS=y
-CONFIG_PHY_RCAR_GEN3_PCIE=y
-CONFIG_PHY_RCAR_GEN3_USB2=y
-CONFIG_PHY_RCAR_GEN3_USB3=m
-CONFIG_PHY_ROCKCHIP_EMMC=y
-CONFIG_PHY_ROCKCHIP_INNO_HDMI=m
-CONFIG_PHY_ROCKCHIP_INNO_USB2=y
-CONFIG_PHY_ROCKCHIP_PCIE=m
-CONFIG_PHY_ROCKCHIP_TYPEC=y
-CONFIG_PHY_UNIPHIER_USB2=y
-CONFIG_PHY_UNIPHIER_USB3=y
-CONFIG_PHY_TEGRA_XUSB=y
-CONFIG_ARM_SMMU_V3_PMU=m
-CONFIG_FSL_IMX8_DDR_PMU=m
-CONFIG_QCOM_L2_PMU=y
-CONFIG_QCOM_L3_PMU=y
-CONFIG_HISI_PMU=y
-CONFIG_ANDROID=y
-CONFIG_ANDROID_BINDER_IPC=y
-CONFIG_NVMEM_IMX_OCOTP=y
-CONFIG_NVMEM_IMX_OCOTP_SCU=y
-CONFIG_QCOM_QFPROM=y
-CONFIG_ROCKCHIP_EFUSE=y
-CONFIG_NVMEM_SUNXI_SID=y
-CONFIG_UNIPHIER_EFUSE=y
-CONFIG_MESON_EFUSE=m
-CONFIG_FPGA=y
-CONFIG_FPGA_MGR_STRATIX10_SOC=m
-CONFIG_FPGA_BRIDGE=m
-CONFIG_ALTERA_FREEZE_BRIDGE=m
-CONFIG_FPGA_REGION=m
-CONFIG_OF_FPGA_REGION=m
-CONFIG_TEE=y
-CONFIG_OPTEE=y
-CONFIG_EXT2_FS=y
-CONFIG_EXT3_FS=y
-CONFIG_EXT4_FS_POSIX_ACL=y
-CONFIG_EXT4_FS_SECURITY=y
-CONFIG_BTRFS_FS=m
-CONFIG_BTRFS_FS_POSIX_ACL=y
-CONFIG_FANOTIFY=y
-CONFIG_FANOTIFY_ACCESS_PERMISSIONS=y
-CONFIG_QUOTA=y
-CONFIG_AUTOFS4_FS=y
-CONFIG_FUSE_FS=y
-CONFIG_CUSE=m
-CONFIG_OVERLAY_FS=m
-CONFIG_VFAT_FS=y
-CONFIG_HUGETLBFS=y
-CONFIG_EFIVAR_FS=y
-CONFIG_SQUASHFS=y
-CONFIG_PSTORE_RAM=y
-CONFIG_NFS_FS=y
-CONFIG_NFS_V4=y
-CONFIG_NFS_V4_1=y
-CONFIG_NFS_V4_2=y
-CONFIG_ROOT_NFS=y
-CONFIG_9P_FS=y
-CONFIG_NLS_CODEPAGE_437=y
-CONFIG_NLS_ISO8859_1=y
-CONFIG_SECURITY=y
-CONFIG_SECURITY_NETWORK=y
-CONFIG_HARDENED_USERCOPY=y
-CONFIG_SECURITY_SELINUX=y
-CONFIG_CRYPTO_ANSI_CPRNG=y
-CONFIG_CRYPTO_USER_API_RNG=m
-CONFIG_CRYPTO_DEV_FSL_CAAM=m
-CONFIG_CRYPTO_DEV_QCOM_RNG=m
-CONFIG_CRYPTO_DEV_HISI_ZIP=m
-CONFIG_PRINTK_TIME=y
-CONFIG_DEBUG_INFO=y
-CONFIG_MAGIC_SYSRQ=y
-CONFIG_DEBUG_FS=y
-# CONFIG_SCHED_DEBUG is not set
-# CONFIG_DEBUG_PREEMPT is not set
-# CONFIG_FTRACE is not set
-CONFIG_MEMTEST=y
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/gki_defconfig b/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/gki_defconfig
new file mode 100644
index 00000000..30bd964d
--- /dev/null
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/gki_defconfig
@@ -0,0 +1,689 @@
+CONFIG_AUDIT=y
+CONFIG_NO_HZ=y
+CONFIG_HIGH_RES_TIMERS=y
+CONFIG_PREEMPT=y
+CONFIG_IRQ_TIME_ACCOUNTING=y
+CONFIG_TASK_XACCT=y
+CONFIG_TASK_IO_ACCOUNTING=y
+CONFIG_PSI=y
+CONFIG_RCU_EXPERT=y
+CONFIG_RCU_FAST_NO_HZ=y
+CONFIG_RCU_NOCB_CPU=y
+CONFIG_IKCONFIG=y
+CONFIG_IKCONFIG_PROC=y
+CONFIG_IKHEADERS=y
+CONFIG_UCLAMP_TASK=y
+CONFIG_UCLAMP_BUCKETS_COUNT=20
+CONFIG_CGROUPS=y
+CONFIG_MEMCG=y
+CONFIG_BLK_CGROUP=y
+CONFIG_CGROUP_SCHED=y
+CONFIG_UCLAMP_TASK_GROUP=y
+CONFIG_CGROUP_FREEZER=y
+CONFIG_CPUSETS=y
+CONFIG_CGROUP_CPUACCT=y
+CONFIG_CGROUP_BPF=y
+CONFIG_NAMESPACES=y
+# CONFIG_PID_NS is not set
+CONFIG_RT_SOFTINT_OPTIMIZATION=y
+# CONFIG_RD_BZIP2 is not set
+# CONFIG_RD_LZMA is not set
+# CONFIG_RD_XZ is not set
+# CONFIG_RD_LZO is not set
+CONFIG_BOOT_CONFIG=y
+# CONFIG_SYSFS_SYSCALL is not set
+# CONFIG_FHANDLE is not set
+CONFIG_KALLSYMS_ALL=y
+CONFIG_BPF_SYSCALL=y
+CONFIG_BPF_JIT_ALWAYS_ON=y
+CONFIG_USERFAULTFD=y
+# CONFIG_RSEQ is not set
+CONFIG_EMBEDDED=y
+# CONFIG_COMPAT_BRK is not set
+# CONFIG_SLAB_MERGE_DEFAULT is not set
+CONFIG_SLAB_FREELIST_RANDOM=y
+CONFIG_SLAB_FREELIST_HARDENED=y
+CONFIG_SHUFFLE_PAGE_ALLOCATOR=y
+CONFIG_PROFILING=y
+# CONFIG_ZONE_DMA is not set
+CONFIG_ARCH_SUNXI=y
+CONFIG_ARCH_HISI=y
+CONFIG_ARCH_QCOM=y
+CONFIG_ARCH_SPRD=y
+CONFIG_SCHED_MC=y
+CONFIG_NR_CPUS=32
+CONFIG_PARAVIRT=y
+CONFIG_ARM64_SW_TTBR0_PAN=y
+CONFIG_COMPAT=y
+CONFIG_ARMV8_DEPRECATED=y
+CONFIG_SWP_EMULATION=y
+CONFIG_CP15_BARRIER_EMULATION=y
+CONFIG_SETEND_EMULATION=y
+CONFIG_RANDOMIZE_BASE=y
+# CONFIG_RANDOMIZE_MODULE_REGION_FULL is not set
+CONFIG_CMDLINE="stack_depot_disable=on kasan.stacktrace=off kvm-arm.mode=protected cgroup_disable=pressure cgroup.memory=nokmem"
+CONFIG_CMDLINE_EXTEND=y
+# CONFIG_DMI is not set
+CONFIG_PM_WAKELOCKS=y
+CONFIG_PM_WAKELOCKS_LIMIT=0
+# CONFIG_PM_WAKELOCKS_GC is not set
+CONFIG_ENERGY_MODEL=y
+CONFIG_CPU_IDLE=y
+CONFIG_CPU_IDLE_GOV_MENU=y
+CONFIG_CPU_IDLE_GOV_TEO=y
+CONFIG_ARM_CPUIDLE=y
+CONFIG_ARM_PSCI_CPUIDLE=y
+CONFIG_CPU_FREQ=y
+CONFIG_CPU_FREQ_STAT=y
+CONFIG_CPU_FREQ_TIMES=y
+CONFIG_CPU_FREQ_GOV_POWERSAVE=y
+CONFIG_CPU_FREQ_GOV_CONSERVATIVE=y
+CONFIG_ARM_SCPI_CPUFREQ=y
+CONFIG_ARM_SCMI_CPUFREQ=y
+CONFIG_ARM_SCMI_PROTOCOL=y
+# CONFIG_ARM_SCMI_POWER_DOMAIN is not set
+CONFIG_ARM_SCPI_PROTOCOL=y
+# CONFIG_ARM_SCPI_POWER_DOMAIN is not set
+# CONFIG_EFI_ARMSTUB_DTB_LOADER is not set
+CONFIG_VIRTUALIZATION=y
+CONFIG_KVM=y
+CONFIG_CRYPTO_SHA2_ARM64_CE=y
+CONFIG_CRYPTO_AES_ARM64_CE_BLK=y
+CONFIG_KPROBES=y
+CONFIG_JUMP_LABEL=y
+CONFIG_SHADOW_CALL_STACK=y
+CONFIG_LTO_CLANG_FULL=y
+CONFIG_CFI_CLANG=y
+CONFIG_MODULES=y
+CONFIG_MODULE_UNLOAD=y
+CONFIG_MODVERSIONS=y
+CONFIG_MODULE_SCMVERSION=y
+CONFIG_BLK_CGROUP_IOCOST=y
+CONFIG_BLK_INLINE_ENCRYPTION=y
+CONFIG_BLK_INLINE_ENCRYPTION_FALLBACK=y
+CONFIG_IOSCHED_BFQ=y
+CONFIG_BFQ_GROUP_IOSCHED=y
+CONFIG_GKI_HACKS_TO_FIX=y
+# CONFIG_CORE_DUMP_DEFAULT_ELF_HEADERS is not set
+CONFIG_BINFMT_MISC=y
+CONFIG_MEMORY_HOTPLUG=y
+CONFIG_MEMORY_HOTREMOVE=y
+CONFIG_DEFAULT_MMAP_MIN_ADDR=32768
+CONFIG_TRANSPARENT_HUGEPAGE=y
+CONFIG_TRANSPARENT_HUGEPAGE_MADVISE=y
+CONFIG_CLEANCACHE=y
+CONFIG_CMA=y
+CONFIG_CMA_DEBUGFS=y
+CONFIG_CMA_SYSFS=y
+CONFIG_CMA_AREAS=16
+CONFIG_READ_ONLY_THP_FOR_FS=y
+CONFIG_NET=y
+CONFIG_PACKET=y
+CONFIG_UNIX=y
+CONFIG_XFRM_USER=y
+CONFIG_XFRM_INTERFACE=y
+CONFIG_XFRM_MIGRATE=y
+CONFIG_XFRM_STATISTICS=y
+CONFIG_NET_KEY=y
+CONFIG_XDP_SOCKETS=y
+CONFIG_INET=y
+CONFIG_IP_MULTICAST=y
+CONFIG_IP_ADVANCED_ROUTER=y
+CONFIG_IP_MULTIPLE_TABLES=y
+CONFIG_NET_IPIP=y
+CONFIG_NET_IPGRE_DEMUX=y
+CONFIG_NET_IPGRE=y
+CONFIG_NET_IPVTI=y
+CONFIG_INET_ESP=y
+CONFIG_INET_UDP_DIAG=y
+CONFIG_INET_DIAG_DESTROY=y
+CONFIG_IPV6_ROUTER_PREF=y
+CONFIG_IPV6_ROUTE_INFO=y
+CONFIG_IPV6_OPTIMISTIC_DAD=y
+CONFIG_INET6_ESP=y
+CONFIG_INET6_IPCOMP=y
+CONFIG_IPV6_MIP6=y
+CONFIG_IPV6_VTI=y
+CONFIG_IPV6_GRE=y
+CONFIG_IPV6_MULTIPLE_TABLES=y
+CONFIG_NETFILTER=y
+CONFIG_NF_CONNTRACK=y
+CONFIG_NF_CONNTRACK_SECMARK=y
+CONFIG_NF_CONNTRACK_EVENTS=y
+CONFIG_NF_CONNTRACK_AMANDA=y
+CONFIG_NF_CONNTRACK_FTP=y
+CONFIG_NF_CONNTRACK_H323=y
+CONFIG_NF_CONNTRACK_IRC=y
+CONFIG_NF_CONNTRACK_NETBIOS_NS=y
+CONFIG_NF_CONNTRACK_PPTP=y
+CONFIG_NF_CONNTRACK_SANE=y
+CONFIG_NF_CONNTRACK_TFTP=y
+CONFIG_NF_CT_NETLINK=y
+CONFIG_NETFILTER_XT_TARGET_CLASSIFY=y
+CONFIG_NETFILTER_XT_TARGET_CONNMARK=y
+CONFIG_NETFILTER_XT_TARGET_CONNSECMARK=y
+CONFIG_NETFILTER_XT_TARGET_DSCP=y
+CONFIG_NETFILTER_XT_TARGET_IDLETIMER=y
+CONFIG_NETFILTER_XT_TARGET_MARK=y
+CONFIG_NETFILTER_XT_TARGET_NFLOG=y
+CONFIG_NETFILTER_XT_TARGET_NFQUEUE=y
+CONFIG_NETFILTER_XT_TARGET_NOTRACK=y
+CONFIG_NETFILTER_XT_TARGET_TEE=y
+CONFIG_NETFILTER_XT_TARGET_TPROXY=y
+CONFIG_NETFILTER_XT_TARGET_TRACE=y
+CONFIG_NETFILTER_XT_TARGET_SECMARK=y
+CONFIG_NETFILTER_XT_TARGET_TCPMSS=y
+CONFIG_NETFILTER_XT_MATCH_BPF=y
+CONFIG_NETFILTER_XT_MATCH_COMMENT=y
+CONFIG_NETFILTER_XT_MATCH_CONNLIMIT=y
+CONFIG_NETFILTER_XT_MATCH_CONNMARK=y
+CONFIG_NETFILTER_XT_MATCH_CONNTRACK=y
+CONFIG_NETFILTER_XT_MATCH_DSCP=y
+CONFIG_NETFILTER_XT_MATCH_ESP=y
+CONFIG_NETFILTER_XT_MATCH_HASHLIMIT=y
+CONFIG_NETFILTER_XT_MATCH_HELPER=y
+CONFIG_NETFILTER_XT_MATCH_IPRANGE=y
+CONFIG_NETFILTER_XT_MATCH_LENGTH=y
+CONFIG_NETFILTER_XT_MATCH_LIMIT=y
+CONFIG_NETFILTER_XT_MATCH_MAC=y
+CONFIG_NETFILTER_XT_MATCH_MARK=y
+CONFIG_NETFILTER_XT_MATCH_MULTIPORT=y
+CONFIG_NETFILTER_XT_MATCH_OWNER=y
+CONFIG_NETFILTER_XT_MATCH_POLICY=y
+CONFIG_NETFILTER_XT_MATCH_PKTTYPE=y
+CONFIG_NETFILTER_XT_MATCH_QUOTA=y
+CONFIG_NETFILTER_XT_MATCH_QUOTA2=y
+CONFIG_NETFILTER_XT_MATCH_QUOTA2_LOG=y
+CONFIG_NETFILTER_XT_MATCH_SOCKET=y
+CONFIG_NETFILTER_XT_MATCH_STATE=y
+CONFIG_NETFILTER_XT_MATCH_STATISTIC=y
+CONFIG_NETFILTER_XT_MATCH_STRING=y
+CONFIG_NETFILTER_XT_MATCH_TIME=y
+CONFIG_NETFILTER_XT_MATCH_U32=y
+CONFIG_IP_NF_IPTABLES=y
+CONFIG_IP_NF_MATCH_ECN=y
+CONFIG_IP_NF_MATCH_TTL=y
+CONFIG_IP_NF_FILTER=y
+CONFIG_IP_NF_TARGET_REJECT=y
+CONFIG_IP_NF_NAT=y
+CONFIG_IP_NF_TARGET_MASQUERADE=y
+CONFIG_IP_NF_TARGET_NETMAP=y
+CONFIG_IP_NF_TARGET_REDIRECT=y
+CONFIG_IP_NF_MANGLE=y
+CONFIG_IP_NF_RAW=y
+CONFIG_IP_NF_SECURITY=y
+CONFIG_IP_NF_ARPTABLES=y
+CONFIG_IP_NF_ARPFILTER=y
+CONFIG_IP_NF_ARP_MANGLE=y
+CONFIG_IP6_NF_IPTABLES=y
+CONFIG_IP6_NF_MATCH_RPFILTER=y
+CONFIG_IP6_NF_FILTER=y
+CONFIG_IP6_NF_TARGET_REJECT=y
+CONFIG_IP6_NF_MANGLE=y
+CONFIG_IP6_NF_RAW=y
+CONFIG_TIPC=y
+CONFIG_L2TP=y
+CONFIG_BRIDGE=y
+CONFIG_6LOWPAN=y
+CONFIG_IEEE802154=y
+CONFIG_IEEE802154_6LOWPAN=y
+CONFIG_MAC802154=y
+CONFIG_NET_SCHED=y
+CONFIG_NET_SCH_HTB=y
+CONFIG_NET_SCH_PRIO=y
+CONFIG_NET_SCH_MULTIQ=y
+CONFIG_NET_SCH_SFQ=y
+CONFIG_NET_SCH_TBF=y
+CONFIG_NET_SCH_NETEM=y
+CONFIG_NET_SCH_CODEL=y
+CONFIG_NET_SCH_FQ_CODEL=y
+CONFIG_NET_SCH_FQ=y
+CONFIG_NET_SCH_INGRESS=y
+CONFIG_NET_CLS_BASIC=y
+CONFIG_NET_CLS_TCINDEX=y
+CONFIG_NET_CLS_FW=y
+CONFIG_NET_CLS_U32=y
+CONFIG_CLS_U32_MARK=y
+CONFIG_NET_CLS_FLOW=y
+CONFIG_NET_CLS_BPF=y
+CONFIG_NET_CLS_MATCHALL=y
+CONFIG_NET_EMATCH=y
+CONFIG_NET_EMATCH_CMP=y
+CONFIG_NET_EMATCH_NBYTE=y
+CONFIG_NET_EMATCH_U32=y
+CONFIG_NET_EMATCH_META=y
+CONFIG_NET_EMATCH_TEXT=y
+CONFIG_NET_CLS_ACT=y
+CONFIG_NET_ACT_POLICE=y
+CONFIG_NET_ACT_GACT=y
+CONFIG_NET_ACT_MIRRED=y
+CONFIG_NET_ACT_SKBEDIT=y
+CONFIG_VSOCKETS=y
+CONFIG_CGROUP_NET_PRIO=y
+CONFIG_BPF_JIT=y
+CONFIG_CAN=y
+CONFIG_BT=y
+CONFIG_BT_RFCOMM=y
+CONFIG_BT_RFCOMM_TTY=y
+CONFIG_BT_HIDP=y
+CONFIG_BT_HCIBTSDIO=y
+CONFIG_BT_HCIUART=y
+CONFIG_BT_HCIUART_LL=y
+CONFIG_BT_HCIUART_BCM=y
+CONFIG_BT_HCIUART_QCA=y
+CONFIG_RFKILL=y
+CONFIG_NFC=y
+CONFIG_PCI=y
+CONFIG_PCIEPORTBUS=y
+CONFIG_PCIEAER=y
+CONFIG_PCI_IOV=y
+CONFIG_PCI_HOST_GENERIC=y
+CONFIG_PCIE_DW_PLAT_EP=y
+CONFIG_PCIE_QCOM=y
+CONFIG_PCIE_KIRIN=y
+CONFIG_PCI_ENDPOINT=y
+CONFIG_FW_LOADER_USER_HELPER=y
+# CONFIG_FW_CACHE is not set
+# CONFIG_SUN50I_DE2_BUS is not set
+# CONFIG_SUNXI_RSB is not set
+CONFIG_GNSS=y
+CONFIG_BLK_DEV_LOOP=y
+CONFIG_BLK_DEV_LOOP_MIN_COUNT=16
+CONFIG_BLK_DEV_RAM=y
+CONFIG_BLK_DEV_RAM_SIZE=8192
+CONFIG_SRAM=y
+CONFIG_UID_SYS_STATS=y
+CONFIG_SCSI=y
+# CONFIG_SCSI_PROC_FS is not set
+CONFIG_BLK_DEV_SD=y
+CONFIG_SCSI_UFSHCD=y
+CONFIG_SCSI_UFSHCD_PCI=y
+CONFIG_SCSI_UFSHCD_PLATFORM=y
+CONFIG_SCSI_UFS_DWC_TC_PLATFORM=y
+CONFIG_SCSI_UFS_HISI=y
+CONFIG_SCSI_UFS_BSG=y
+CONFIG_SCSI_UFS_CRYPTO=y
+CONFIG_SCSI_UFS_HPB=y
+CONFIG_MD=y
+CONFIG_BLK_DEV_DM=y
+CONFIG_DM_CRYPT=y
+CONFIG_DM_DEFAULT_KEY=y
+CONFIG_DM_SNAPSHOT=y
+CONFIG_DM_UEVENT=y
+CONFIG_DM_VERITY=y
+CONFIG_DM_VERITY_FEC=y
+CONFIG_DM_BOW=y
+CONFIG_NETDEVICES=y
+CONFIG_DUMMY=y
+CONFIG_WIREGUARD=y
+CONFIG_IFB=y
+CONFIG_TUN=y
+CONFIG_VETH=y
+CONFIG_PPP=y
+CONFIG_PPP_BSDCOMP=y
+CONFIG_PPP_DEFLATE=y
+CONFIG_PPP_MPPE=y
+CONFIG_PPTP=y
+CONFIG_PPPOL2TP=y
+CONFIG_USB_RTL8150=y
+CONFIG_USB_RTL8152=y
+CONFIG_USB_USBNET=y
+# CONFIG_USB_NET_AX8817X is not set
+# CONFIG_USB_NET_AX88179_178A is not set
+CONFIG_USB_NET_CDC_EEM=y
+# CONFIG_USB_NET_NET1080 is not set
+# CONFIG_USB_NET_CDC_SUBSET is not set
+# CONFIG_USB_NET_ZAURUS is not set
+CONFIG_USB_NET_AQC111=y
+# CONFIG_WLAN_VENDOR_ADMTEK is not set
+# CONFIG_WLAN_VENDOR_ATH is not set
+# CONFIG_WLAN_VENDOR_ATMEL is not set
+# CONFIG_WLAN_VENDOR_BROADCOM is not set
+# CONFIG_WLAN_VENDOR_CISCO is not set
+# CONFIG_WLAN_VENDOR_INTEL is not set
+# CONFIG_WLAN_VENDOR_INTERSIL is not set
+# CONFIG_WLAN_VENDOR_MARVELL is not set
+# CONFIG_WLAN_VENDOR_MEDIATEK is not set
+# CONFIG_WLAN_VENDOR_RALINK is not set
+# CONFIG_WLAN_VENDOR_REALTEK is not set
+# CONFIG_WLAN_VENDOR_RSI is not set
+# CONFIG_WLAN_VENDOR_ST is not set
+# CONFIG_WLAN_VENDOR_TI is not set
+# CONFIG_WLAN_VENDOR_ZYDAS is not set
+# CONFIG_WLAN_VENDOR_QUANTENNA is not set
+CONFIG_INPUT_EVDEV=y
+CONFIG_KEYBOARD_GPIO=y
+# CONFIG_MOUSE_PS2 is not set
+CONFIG_INPUT_JOYSTICK=y
+CONFIG_JOYSTICK_XPAD=y
+CONFIG_JOYSTICK_XPAD_FF=y
+CONFIG_JOYSTICK_XPAD_LEDS=y
+CONFIG_INPUT_TOUCHSCREEN=y
+CONFIG_INPUT_MISC=y
+CONFIG_INPUT_UINPUT=y
+# CONFIG_VT is not set
+# CONFIG_LEGACY_PTYS is not set
+CONFIG_SERIAL_8250=y
+# CONFIG_SERIAL_8250_DEPRECATED_OPTIONS is not set
+CONFIG_SERIAL_8250_CONSOLE=y
+# CONFIG_SERIAL_8250_EXAR is not set
+CONFIG_SERIAL_OF_PLATFORM=y
+CONFIG_SERIAL_AMBA_PL011=y
+CONFIG_SERIAL_AMBA_PL011_CONSOLE=y
+CONFIG_SERIAL_SAMSUNG=y
+CONFIG_SERIAL_SAMSUNG_CONSOLE=y
+CONFIG_SERIAL_MSM_GENI_EARLY_CONSOLE=y
+CONFIG_SERIAL_SPRD=y
+CONFIG_SERIAL_SPRD_CONSOLE=y
+CONFIG_HVC_DCC=y
+CONFIG_HVC_DCC_SERIALIZE_SMP=y
+CONFIG_SERIAL_DEV_BUS=y
+CONFIG_HW_RANDOM=y
+# CONFIG_HW_RANDOM_CAVIUM is not set
+# CONFIG_DEVMEM is not set
+# CONFIG_DEVPORT is not set
+# CONFIG_I2C_COMPAT is not set
+# CONFIG_I2C_HELPER_AUTO is not set
+CONFIG_I3C=y
+CONFIG_SPI=y
+CONFIG_SPMI=y
+# CONFIG_SPMI_MSM_PMIC_ARB is not set
+# CONFIG_PINCTRL_SUN8I_H3_R is not set
+# CONFIG_PINCTRL_SUN50I_A64 is not set
+# CONFIG_PINCTRL_SUN50I_A64_R is not set
+# CONFIG_PINCTRL_SUN50I_H5 is not set
+# CONFIG_PINCTRL_SUN50I_H6 is not set
+# CONFIG_PINCTRL_SUN50I_H6_R is not set
+CONFIG_GPIO_GENERIC_PLATFORM=y
+CONFIG_POWER_RESET_HISI=y
+# CONFIG_HWMON is not set
+CONFIG_THERMAL=y
+CONFIG_THERMAL_NETLINK=y
+CONFIG_THERMAL_STATISTICS=y
+CONFIG_THERMAL_EMERGENCY_POWEROFF_DELAY_MS=100
+CONFIG_THERMAL_WRITABLE_TRIPS=y
+CONFIG_THERMAL_GOV_USER_SPACE=y
+CONFIG_THERMAL_GOV_POWER_ALLOCATOR=y
+CONFIG_CPU_THERMAL=y
+CONFIG_DEVFREQ_THERMAL=y
+CONFIG_THERMAL_EMULATION=y
+CONFIG_WATCHDOG=y
+CONFIG_WATCHDOG_CORE=y
+CONFIG_MFD_ACT8945A=y
+CONFIG_MFD_SYSCON=y
+CONFIG_REGULATOR=y
+CONFIG_REGULATOR_FIXED_VOLTAGE=y
+CONFIG_RC_CORE=y
+# CONFIG_RC_MAP is not set
+CONFIG_LIRC=y
+CONFIG_BPF_LIRC_MODE2=y
+CONFIG_RC_DECODERS=y
+CONFIG_RC_DEVICES=y
+CONFIG_MEDIA_CEC_RC=y
+# CONFIG_MEDIA_ANALOG_TV_SUPPORT is not set
+# CONFIG_MEDIA_DIGITAL_TV_SUPPORT is not set
+# CONFIG_MEDIA_RADIO_SUPPORT is not set
+# CONFIG_MEDIA_SDR_SUPPORT is not set
+# CONFIG_MEDIA_TEST_SUPPORT is not set
+CONFIG_VIDEO_V4L2_SUBDEV_API=y
+CONFIG_MEDIA_USB_SUPPORT=y
+CONFIG_USB_VIDEO_CLASS=y
+CONFIG_USB_GSPCA=y
+CONFIG_V4L_PLATFORM_DRIVERS=y
+CONFIG_V4L_MEM2MEM_DRIVERS=y
+# CONFIG_VGA_ARB is not set
+CONFIG_DRM=y
+# CONFIG_DRM_FBDEV_EMULATION is not set
+CONFIG_BACKLIGHT_CLASS_DEVICE=y
+CONFIG_SOUND=y
+CONFIG_SND=y
+CONFIG_SND_HRTIMER=y
+CONFIG_SND_DYNAMIC_MINORS=y
+# CONFIG_SND_SUPPORT_OLD_API is not set
+# CONFIG_SND_DRIVERS is not set
+CONFIG_SND_USB_AUDIO=y
+CONFIG_SND_SOC=y
+CONFIG_HID_BATTERY_STRENGTH=y
+CONFIG_HIDRAW=y
+CONFIG_UHID=y
+CONFIG_HID_APPLE=y
+CONFIG_HID_BETOP_FF=y
+CONFIG_HID_PRODIKEYS=y
+CONFIG_HID_ELECOM=y
+CONFIG_HID_UCLOGIC=y
+CONFIG_HID_LOGITECH=y
+CONFIG_HID_LOGITECH_DJ=y
+CONFIG_HID_MAGICMOUSE=y
+CONFIG_HID_MICROSOFT=y
+CONFIG_HID_MULTITOUCH=y
+CONFIG_HID_NINTENDO=y
+CONFIG_HID_PICOLCD=y
+CONFIG_HID_PLANTRONICS=y
+CONFIG_HID_PLAYSTATION=y
+CONFIG_PLAYSTATION_FF=y
+CONFIG_HID_ROCCAT=y
+CONFIG_HID_SONY=y
+CONFIG_SONY_FF=y
+CONFIG_HID_STEAM=y
+CONFIG_HID_WACOM=y
+CONFIG_HID_WIIMOTE=y
+CONFIG_USB_HIDDEV=y
+CONFIG_USB_ANNOUNCE_NEW_DEVICES=y
+CONFIG_USB_OTG=y
+CONFIG_USB_XHCI_HCD=y
+CONFIG_USB_EHCI_HCD=y
+CONFIG_USB_EHCI_ROOT_HUB_TT=y
+CONFIG_USB_EHCI_HCD_PLATFORM=y
+CONFIG_USB_ACM=y
+CONFIG_USB_STORAGE=y
+CONFIG_USB_UAS=y
+CONFIG_USB_DWC3=y
+CONFIG_USB_GADGET=y
+CONFIG_USB_DUMMY_HCD=y
+CONFIG_USB_CONFIGFS=y
+CONFIG_USB_CONFIGFS_UEVENT=y
+CONFIG_USB_CONFIGFS_SERIAL=y
+CONFIG_USB_CONFIGFS_ACM=y
+CONFIG_USB_CONFIGFS_NCM=y
+CONFIG_USB_CONFIGFS_ECM=y
+CONFIG_USB_CONFIGFS_RNDIS=y
+CONFIG_USB_CONFIGFS_EEM=y
+CONFIG_USB_CONFIGFS_MASS_STORAGE=y
+CONFIG_USB_CONFIGFS_F_FS=y
+CONFIG_USB_CONFIGFS_F_ACC=y
+CONFIG_USB_CONFIGFS_F_AUDIO_SRC=y
+CONFIG_USB_CONFIGFS_F_UAC2=y
+CONFIG_USB_CONFIGFS_F_MIDI=y
+CONFIG_USB_CONFIGFS_F_HID=y
+CONFIG_TYPEC=y
+CONFIG_TYPEC_TCPM=y
+CONFIG_TYPEC_TCPCI=y
+CONFIG_TYPEC_UCSI=y
+CONFIG_MMC=y
+# CONFIG_PWRSEQ_EMMC is not set
+# CONFIG_PWRSEQ_SIMPLE is not set
+CONFIG_MMC_CRYPTO=y
+CONFIG_MMC_SDHCI=y
+CONFIG_MMC_SDHCI_PLTFM=y
+CONFIG_LEDS_CLASS_FLASH=y
+CONFIG_LEDS_TRIGGER_TIMER=y
+CONFIG_LEDS_TRIGGER_TRANSIENT=y
+CONFIG_EDAC=y
+CONFIG_RTC_CLASS=y
+CONFIG_RTC_DRV_PL030=y
+CONFIG_RTC_DRV_PL031=y
+CONFIG_DMABUF_HEAPS=y
+CONFIG_DMABUF_SYSFS_STATS=y
+CONFIG_DMABUF_HEAPS_DEFERRED_FREE=y
+CONFIG_DMABUF_HEAPS_PAGE_POOL=y
+CONFIG_UIO=y
+CONFIG_VHOST_VSOCK=y
+CONFIG_STAGING=y
+CONFIG_ASHMEM=y
+CONFIG_DEBUG_KINFO=y
+CONFIG_COMMON_CLK_SCPI=y
+# CONFIG_SPRD_COMMON_CLK is not set
+# CONFIG_CLK_SUNXI is not set
+# CONFIG_SUNXI_CCU is not set
+CONFIG_HWSPINLOCK=y
+CONFIG_SUN4I_TIMER=y
+# CONFIG_SUN50I_ERRATUM_UNKNOWN1 is not set
+CONFIG_MTK_TIMER=y
+CONFIG_MAILBOX=y
+CONFIG_IOMMU_LIMIT_IOVA_ALIGNMENT=y
+CONFIG_IOMMU_IO_PGTABLE_ARMV7S=y
+CONFIG_REMOTEPROC=y
+CONFIG_REMOTEPROC_CDEV=y
+CONFIG_RPMSG_CHAR=y
+CONFIG_DEVFREQ_GOV_PERFORMANCE=y
+CONFIG_DEVFREQ_GOV_POWERSAVE=y
+CONFIG_DEVFREQ_GOV_USERSPACE=y
+CONFIG_DEVFREQ_GOV_PASSIVE=y
+CONFIG_PM_DEVFREQ_EVENT=y
+CONFIG_IIO=y
+CONFIG_IIO_BUFFER=y
+CONFIG_IIO_TRIGGER=y
+CONFIG_PWM=y
+CONFIG_GENERIC_PHY=y
+CONFIG_POWERCAP=y
+CONFIG_DTPM=y
+CONFIG_ANDROID=y
+CONFIG_ANDROID_BINDER_IPC=y
+CONFIG_ANDROID_BINDERFS=y
+CONFIG_ANDROID_DEBUG_SYMBOLS=y
+CONFIG_ANDROID_VENDOR_HOOKS=y
+CONFIG_LIBNVDIMM=y
+# CONFIG_ND_BLK is not set
+CONFIG_INTERCONNECT=y
+CONFIG_EXT4_FS=y
+CONFIG_EXT4_FS_POSIX_ACL=y
+CONFIG_EXT4_FS_SECURITY=y
+CONFIG_F2FS_FS=y
+CONFIG_F2FS_FS_SECURITY=y
+CONFIG_F2FS_FS_COMPRESSION=y
+CONFIG_FS_ENCRYPTION=y
+CONFIG_FS_ENCRYPTION_INLINE_CRYPT=y
+CONFIG_FS_VERITY=y
+CONFIG_FS_VERITY_BUILTIN_SIGNATURES=y
+# CONFIG_DNOTIFY is not set
+CONFIG_QUOTA=y
+CONFIG_QFMT_V2=y
+CONFIG_FUSE_FS=y
+CONFIG_VIRTIO_FS=y
+CONFIG_OVERLAY_FS=y
+CONFIG_INCREMENTAL_FS=y
+CONFIG_MSDOS_FS=y
+CONFIG_VFAT_FS=y
+CONFIG_EXFAT_FS=y
+CONFIG_TMPFS=y
+# CONFIG_EFIVAR_FS is not set
+CONFIG_PSTORE=y
+CONFIG_PSTORE_CONSOLE=y
+CONFIG_PSTORE_PMSG=y
+CONFIG_PSTORE_RAM=y
+CONFIG_EROFS_FS=y
+CONFIG_NLS_CODEPAGE_437=y
+CONFIG_NLS_CODEPAGE_737=y
+CONFIG_NLS_CODEPAGE_775=y
+CONFIG_NLS_CODEPAGE_850=y
+CONFIG_NLS_CODEPAGE_852=y
+CONFIG_NLS_CODEPAGE_855=y
+CONFIG_NLS_CODEPAGE_857=y
+CONFIG_NLS_CODEPAGE_860=y
+CONFIG_NLS_CODEPAGE_861=y
+CONFIG_NLS_CODEPAGE_862=y
+CONFIG_NLS_CODEPAGE_863=y
+CONFIG_NLS_CODEPAGE_864=y
+CONFIG_NLS_CODEPAGE_865=y
+CONFIG_NLS_CODEPAGE_866=y
+CONFIG_NLS_CODEPAGE_869=y
+CONFIG_NLS_CODEPAGE_936=y
+CONFIG_NLS_CODEPAGE_950=y
+CONFIG_NLS_CODEPAGE_932=y
+CONFIG_NLS_CODEPAGE_949=y
+CONFIG_NLS_CODEPAGE_874=y
+CONFIG_NLS_ISO8859_8=y
+CONFIG_NLS_CODEPAGE_1250=y
+CONFIG_NLS_CODEPAGE_1251=y
+CONFIG_NLS_ASCII=y
+CONFIG_NLS_ISO8859_1=y
+CONFIG_NLS_ISO8859_2=y
+CONFIG_NLS_ISO8859_3=y
+CONFIG_NLS_ISO8859_4=y
+CONFIG_NLS_ISO8859_5=y
+CONFIG_NLS_ISO8859_6=y
+CONFIG_NLS_ISO8859_7=y
+CONFIG_NLS_ISO8859_9=y
+CONFIG_NLS_ISO8859_13=y
+CONFIG_NLS_ISO8859_14=y
+CONFIG_NLS_ISO8859_15=y
+CONFIG_NLS_KOI8_R=y
+CONFIG_NLS_KOI8_U=y
+CONFIG_NLS_MAC_ROMAN=y
+CONFIG_NLS_MAC_CELTIC=y
+CONFIG_NLS_MAC_CENTEURO=y
+CONFIG_NLS_MAC_CROATIAN=y
+CONFIG_NLS_MAC_CYRILLIC=y
+CONFIG_NLS_MAC_GAELIC=y
+CONFIG_NLS_MAC_GREEK=y
+CONFIG_NLS_MAC_ICELAND=y
+CONFIG_NLS_MAC_INUIT=y
+CONFIG_NLS_MAC_ROMANIAN=y
+CONFIG_NLS_MAC_TURKISH=y
+CONFIG_NLS_UTF8=y
+CONFIG_UNICODE=y
+CONFIG_SECURITY=y
+CONFIG_SECURITYFS=y
+CONFIG_SECURITY_NETWORK=y
+CONFIG_HARDENED_USERCOPY=y
+# CONFIG_HARDENED_USERCOPY_FALLBACK is not set
+CONFIG_FORTIFY_SOURCE=y
+CONFIG_STATIC_USERMODEHELPER=y
+CONFIG_STATIC_USERMODEHELPER_PATH=""
+CONFIG_SECURITY_SELINUX=y
+CONFIG_INIT_STACK_ALL_ZERO=y
+CONFIG_INIT_ON_ALLOC_DEFAULT_ON=y
+CONFIG_CRYPTO_CHACHA20POLY1305=y
+CONFIG_CRYPTO_ADIANTUM=y
+CONFIG_CRYPTO_XCBC=y
+CONFIG_CRYPTO_BLAKE2B=y
+CONFIG_CRYPTO_MD5=y
+CONFIG_CRYPTO_LZ4=y
+CONFIG_CRYPTO_ZSTD=y
+CONFIG_CRYPTO_ANSI_CPRNG=y
+CONFIG_CRC8=y
+CONFIG_XZ_DEC=y
+CONFIG_DMA_CMA=y
+CONFIG_STACK_HASH_ORDER=12
+CONFIG_PRINTK_TIME=y
+CONFIG_PRINTK_CALLER=y
+CONFIG_DYNAMIC_DEBUG_CORE=y
+CONFIG_DEBUG_INFO=y
+CONFIG_DEBUG_INFO_DWARF4=y
+# CONFIG_ENABLE_MUST_CHECK is not set
+CONFIG_HEADERS_INSTALL=y
+# CONFIG_SECTION_MISMATCH_WARN_ONLY is not set
+CONFIG_MAGIC_SYSRQ=y
+CONFIG_UBSAN=y
+CONFIG_UBSAN_TRAP=y
+CONFIG_UBSAN_LOCAL_BOUNDS=y
+# CONFIG_UBSAN_MISC is not set
+CONFIG_PAGE_OWNER=y
+CONFIG_PAGE_PINNER=y
+CONFIG_DEBUG_MEMORY_INIT=y
+CONFIG_KASAN=y
+CONFIG_KASAN_HW_TAGS=y
+CONFIG_KFENCE=y
+CONFIG_KFENCE_SAMPLE_INTERVAL=500
+CONFIG_KFENCE_NUM_OBJECTS=63
+CONFIG_PANIC_ON_OOPS=y
+CONFIG_PANIC_TIMEOUT=-1
+CONFIG_DETECT_HUNG_TASK=y
+CONFIG_WQ_WATCHDOG=y
+CONFIG_SCHEDSTATS=y
+# CONFIG_DEBUG_PREEMPT is not set
+CONFIG_BUG_ON_DATA_CORRUPTION=y
+CONFIG_TRACE_MMIO_ACCESS=y
+CONFIG_TRACEFS_DISABLE_AUTOMOUNT=y
+CONFIG_HIST_TRIGGERS=y
+# CONFIG_RUNTIME_TESTING_MENU is not set
diff --git a/meta-arm/recipes-kernel/linux/linux-arm64-ack_5.10.bb b/meta-arm/recipes-kernel/linux/linux-arm64-ack_5.10.bb
index e71bdd0d..cf4951cd 100644
--- a/meta-arm/recipes-kernel/linux/linux-arm64-ack_5.10.bb
+++ b/meta-arm/recipes-kernel/linux/linux-arm64-ack_5.10.bb
@@ -8,5 +8,5 @@ SRC_URI = " \
     git://android.googlesource.com/kernel/common.git;protocol=https;branch=android12-5.10-lts \
     "
 
-# tag: ASB-2021-06-05_12-5.10
-SRCREV = "00dc4c64e6592a2e469f7886a6a927778c4a2806"
+# tag: ASB-2021-09-05_12-5.10
+SRCREV = "3d371f087c953c0e08a228169d4e5c44aea99416"
-- 
2.17.1



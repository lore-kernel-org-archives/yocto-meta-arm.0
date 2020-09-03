Received: from EUR03-AM5-obe.outbound.protection.outlook.com (EUR03-AM5-obe.outbound.protection.outlook.com [40.107.3.73])
 by mx.groups.io with SMTP id smtpd.web10.11963.1599133264290204494
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 03 Sep 2020 04:41:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=Zc7nDnac;
 spf=pass (domain: arm.com, ip: 40.107.3.73, mailfrom: diego.sueiro@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JwLFEXX6k0DhnIWCIa/sy3RVwUaCrbpUyScEcOSFpKU=;
 b=Zc7nDnacUgDdEoE/V9N4XE2JMa0IOLKpL6O8L1W5KpZ0CUz72e67Z9l1n/gGRWHzkinz/GVTdqXlHp/P61rMyFCEcc4hyfdhysKoOQg5biQLlySMLxLXekvCuIbVpPsruUFn84+TEzUm4RsxGmqjaJZ0OIXFFez4qBMPqBb1cLM=
Received: from DB3PR08CA0010.eurprd08.prod.outlook.com (2603:10a6:8::23) by
 AM6PR08MB3608.eurprd08.prod.outlook.com (2603:10a6:20b:51::28) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3326.21; Thu, 3 Sep 2020 11:40:59 +0000
Received: from DB5EUR03FT034.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:8:0:cafe::4f) by DB3PR08CA0010.outlook.office365.com
 (2603:10a6:8::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3348.16 via Frontend
 Transport; Thu, 3 Sep 2020 11:40:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT034.mail.protection.outlook.com (10.152.20.87) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3326.19 via Frontend Transport; Thu, 3 Sep 2020 11:40:59 +0000
Received: ("Tessian outbound 195a290eb161:v64"); Thu, 03 Sep 2020 11:40:59 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: aa89a567ce3a035c
X-CR-MTA-TID: 64aa7808
Received: from 3f92a9f9b748.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 07B12BB3-01FF-404A-82FB-82B31F40751D.1;
	Thu, 03 Sep 2020 11:40:39 +0000
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 3f92a9f9b748.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 03 Sep 2020 11:40:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jGLSTa6Qu9WXegtocAEVf+pjivUCT3tttn18DItMGTjARneEz41gfLB9FnBQLT7N5xxERiOixuyjJOlWDINpjBjFZdz2pq7/+QzQZrbc1crzgULhlf3ie8s0XDZIHk0fzzxaGmR++O9zkAVi9AH6ot/vU+pMGbLahXi/5YC3hRnjEl5NFo+lyEelj4eWLP3dgpdaQ7Lbr1tgWUjk9AfnuZQxyyQ+SYIDYg3oYN5ZPXykfHWR/dVDuuD5ysx4fUC5Xz66dOzFjK3OT8HiCvU7/CHwtLOoUl8ozreusFeawzxF8NiwSwjPb5Xhva2tpaNXZDXCGuYj6J+/qfhHXbLFHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JwLFEXX6k0DhnIWCIa/sy3RVwUaCrbpUyScEcOSFpKU=;
 b=LeIDKPB+YJrptVZGD6Ozzc/9d9R34mRINRHD8my/4TRt5qsI+QcjVThO3/ZIbieEC5zjLPbYdsTj0nazcBz8WLmptoZYaOglxRfo1STwMkCZISJvBIcXSOQDzgdp6veNlVA251W1+FrdSHCIZtTDlXxubSK2A06vEcx34zeXD4GtMBPB2IQyZu079C8MnTGfWIbaEQ27kmS1q+GC9EBETNk7uYfLXoF+ZC7qzBFU6LMPnCablQAUAw1okvKe8Dzsc0Ut09vvAUJ3F5zB3mP5esoCupynJpxB1FZUVctzmbBPBr4o4DyGstG/kV7ynA5zAfRaTCFwwOL+ZZ1l+LISKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JwLFEXX6k0DhnIWCIa/sy3RVwUaCrbpUyScEcOSFpKU=;
 b=Zc7nDnacUgDdEoE/V9N4XE2JMa0IOLKpL6O8L1W5KpZ0CUz72e67Z9l1n/gGRWHzkinz/GVTdqXlHp/P61rMyFCEcc4hyfdhysKoOQg5biQLlySMLxLXekvCuIbVpPsruUFn84+TEzUm4RsxGmqjaJZ0OIXFFez4qBMPqBb1cLM=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from AM6PR08MB3461.eurprd08.prod.outlook.com (2603:10a6:20b:47::28)
 by AM6PR08MB3688.eurprd08.prod.outlook.com (2603:10a6:20b:8e::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3326.23; Thu, 3 Sep
 2020 11:40:38 +0000
Received: from AM6PR08MB3461.eurprd08.prod.outlook.com
 ([fe80::8016:e0c:484c:4255]) by AM6PR08MB3461.eurprd08.prod.outlook.com
 ([fe80::8016:e0c:484c:4255%4]) with mapi id 15.20.3348.016; Thu, 3 Sep 2020
 11:40:38 +0000
From: "Diego Sueiro" <diego.sueiro@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH 4/9] arm-autonomy/xen-devicetree: Update XEN_DEVICETREE_DOM0_BOOTARGS for N1SDP
Date: Thu,  3 Sep 2020 12:40:25 +0100
Message-Id: <01160de18bc54f392c9f908cc274f915f501d6d7.1599133172.git.diego.sueiro@arm.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <bff93f4e0c123dc3cfbaf417b7c398e392b9771e.1599133172.git.diego.sueiro@arm.com>
References: <bff93f4e0c123dc3cfbaf417b7c398e392b9771e.1599133172.git.diego.sueiro@arm.com>
X-ClientProxiedBy: LO2P265CA0463.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a2::19) To AM6PR08MB3461.eurprd08.prod.outlook.com
 (2603:10a6:20b:47::28)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from 255.255.255.255 (255.255.255.255) by LO2P265CA0463.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:a2::19) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3348.15 via Frontend Transport; Thu, 3 Sep 2020 11:40:33 +0000
X-Mailer: git-send-email 2.7.4
X-Originating-IP: [217.140.106.55]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: d592480a-a7ae-462c-c074-08d84ffe3a47
X-MS-TrafficTypeDiagnostic: AM6PR08MB3688:|AM6PR08MB3608:
X-Microsoft-Antispam-PRVS: 
	<AM6PR08MB3608358DB92E142F66EAC8DB922C0@AM6PR08MB3608.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:2657;OLM:2657;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 sV+34G1odJ93lOwsJShPP9Sq+ZNB1kbRASmv3BzqI5klY/32DDgnMcJJ0P4S94RED8m/wFN37u7U11PsQ/p8mVtScup7CFPYKBBKyhoPZyyho56/1vr2kw8nYIoGpmMQgMQq8ryMPQZLG2T0diKxsxv5srf58ADQGlFowQCNKwI+stO0VIcWKM4Xnrk6/iNNVXoCMeWkSlxf4cISuTndRFRXXLCjjryALeX7gyymU4SIKEY1fIe1nvsUjgHl4gbTxLsYK5AhWAzS/bo/o/DXQ8ZSJy8lErgCKgmuJH/8nx/Cnlq8lH/WYjTD3UUnBoLMMqfFy8AxvVLeJzKSQv/r5+7Ug/orFXx75Fp82fwda94V1nW1/pqYzT2VaK6UGpFh
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3461.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(136003)(396003)(346002)(376002)(39860400002)(52116002)(8936002)(44832011)(6666004)(86362001)(8676002)(478600001)(36756003)(4326008)(66556008)(66476007)(66946007)(2906002)(6486002)(5660300002)(186003)(83380400001)(26005)(16576012)(6916009)(956004)(316002)(15650500001)(2616005)(32563001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 6sUvziKNh4xMv+xqN44Dhd9+WoCYyqIUVhKkq/Q3ioUyjFsWoP0o14qmxKPp49Y5fRu+JtamNUHWpg0Eu3vDzlxJq1elsGBaDftP8BFRFpIH6KgK8xwGhUnxsFkiB9CaSJ6m4xHmskE/M7GGay57uNsem2tgUs+2yUMxZ7wpaDtmVar0SolO+OdtW+78/EjkUkWJZXkx4TdC7p1CwevIao9ltFQG2lxkEuGrH/sxUPOhBvMRpmogbKP6Lviw6rs2ZAGwObLviaeHhRCc7eGTHV8JHPZWWgPTlHNQ5UBu2tC3J8CExu8nPdY9tMTnShQ5DzS3W3725ZZ8HmVXYFeCcv9qAM1V/8n0Wl6DaNd3HjD5hWTKoaPKhQQTU4SKCuHV+9myFNRvLhTw926IHxIEZs5uieWgKd/yp2+92s3eqou1VS73j6jst3ukQbVoys2wp6qV+Tm+ynIn3hdPzXygPCzqrWd75Vxuq9GkipWliZyTr5Gu52AH4sRQ5Fu021/MoTphvQkQYG5DO5qDF4naFiLaEKPPtfPDsn5AMZHtXWf2Yg9OFVvRtGHbO2fZ19rZeDos2AUhcpAXZwvUtipb6wII12gnamvY0xTGRZ/tWCkgKrMvYF/5C3CnQQa/FaUGvf5U+3xyn/ITGd7buatmow==
X-MS-Exchange-Transport-Forked: True
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3688
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Diego.Sueiro@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5EUR03FT034.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	9b7ef8d9-77b2-4edc-0318-08d84ffe2b36
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	pCD2KdHMFUeQ98J/beYlFbbuhIT3syadBTbKg3uRitN/t0B5FBQCbbe2Rss6zubSbKyXzUOvkFW71+G75bGXpl4KmsnoYW6g9oXZ6vpRFCj45OASMzP2LEqbN728vIwGuCE9lfhOaorDTbq/6iduNCkpP7Xla+789tHcQbVlzREAnVfcg0ZobZgM9/ZVfJ8dRyjpmBTJ02qdPmMmj+WhmG00Yvp7tfawBa7CFjjRo/Aay/M5ZWSzSzB5i0codpnu1aMNYkeSGgAo+FiD6Rp/oKGkvzUbYkx6dN9iqCLlLhmFVVkl7AvnkEUd/uvQBTiHJhl3yQ/JD6ycLBOD9LnQIdOFFNP5Qs3fzgAOgqo1Dv1U/ddrHqCwXXUfTgwNRpIWR5RxBvgbA80Q3QL5WmBJ9EEWOYJHZ448xBfaq9JJbcI=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(39860400002)(346002)(376002)(396003)(136003)(46966005)(5660300002)(6916009)(81166007)(15650500001)(26005)(6486002)(186003)(2616005)(82740400003)(16576012)(6666004)(44832011)(47076004)(336012)(956004)(2906002)(8936002)(478600001)(4326008)(316002)(86362001)(82310400003)(356005)(70586007)(36756003)(8676002)(83380400001)(70206006)(32563001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2020 11:40:59.0923
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d592480a-a7ae-462c-c074-08d84ffe3a47
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5EUR03FT034.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3608
Content-Type: text/plain

For N1SDP the wic image partition layout have the /dev/sda1 as the boot
partition and /dev/sda2 as the rootfs partition.

To reflect this, we need to update the XEN_DEVICETREE_DOM0_BOOTARGS to
set the "root=" command line parameter to /dev/sda2.

Change-Id: Iee52176ab4ac1232a3d726e955835261b0a5ae00
Issue-Id: SCM-1065
Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>
---
 .../recipes-extended/xen-devicetree/xen-devicetree.bbappend             | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-extended/xen-devicetree/xen-devicetree.bbappend b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-extended/xen-devicetree/xen-devicetree.bbappend
index 3787488..91af506 100644
--- a/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-extended/xen-devicetree/xen-devicetree.bbappend
+++ b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-extended/xen-devicetree/xen-devicetree.bbappend
@@ -16,7 +16,7 @@ XEN_DEVICETREE_DTBS_n1sdp = "n1sdp-single-chip.dtb"
 XEN_DEVICETREE_DOM0_BOOTARGS_append_juno = " root=/dev/sda1 rootwait"
 XEN_DEVICETREE_XEN_BOOTARGS_append_juno = " console=dtuart dtuart=serial0 bootscrub=0 iommu=no"
 
-XEN_DEVICETREE_DOM0_BOOTARGS_append_n1sdp = " root=/dev/sda1 rootwait"
+XEN_DEVICETREE_DOM0_BOOTARGS_append_n1sdp = " root=/dev/sda2 rootwait"
 XEN_DEVICETREE_XEN_BOOTARGS_append_n1sdp = " console=dtuart dtuart=serial0 bootscrub=0 iommu=no"
 
 XEN_DEVICETREE_DOM0_BOOTARGS_append_fvp-base = " root=/dev/vda2"
-- 
2.7.4


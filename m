Received: from EUR03-DB5-obe.outbound.protection.outlook.com (EUR03-DB5-obe.outbound.protection.outlook.com [40.107.4.78])
 by mx.groups.io with SMTP id smtpd.web11.3352.1588848097347404285
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 07 May 2020 03:41:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=RftHG7io;
 spf=pass (domain: arm.com, ip: 40.107.4.78, mailfrom: bertrand.marquis@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5/+T14vH+iqVEt0J4gyaMJF2PSFq3Nws1On5uJW6HMI=;
 b=RftHG7ioMVMQ2ot7KVwQ/SdbKS88Clv3QvJp6+l32PEwsQJ1uQJ2Qd6LW1e6DU7jaaon8S2otWH9nT7x7Nkyro1r6pZ8sIXneRUGjxkU+wIUgYLv+/aCfgUa2HuiixnCzESUuSjfQjs01RRT7oZuA/uOlfqREfxYBIxNPi9oAa8=
Received: from AM6P192CA0003.EURP192.PROD.OUTLOOK.COM (2603:10a6:209:83::16)
 by DB8PR08MB4105.eurprd08.prod.outlook.com (2603:10a6:10:b0::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2958.27; Thu, 7 May
 2020 10:41:34 +0000
Received: from VE1EUR03FT020.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:83:cafe::13) by AM6P192CA0003.outlook.office365.com
 (2603:10a6:209:83::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2979.28 via Frontend
 Transport; Thu, 7 May 2020 10:41:34 +0000
Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT020.mail.protection.outlook.com (10.152.18.242) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2979.27 via Frontend Transport; Thu, 7 May 2020 10:41:33 +0000
Received: ("Tessian outbound ff098c684b24:v54"); Thu, 07 May 2020 10:41:33 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: ab53391420cfae0a
X-CR-MTA-TID: 64aa7808
Received: from 8ab97bdbea15.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 859D5014-38E4-4F2E-A4EB-30D4470103E3.1;
	Thu, 07 May 2020 10:41:27 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 8ab97bdbea15.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 07 May 2020 10:41:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UPOw3OVeCOXOOTYW4Tg4AHObnYjXT4bAeuPM83gwlglj5WCfmQGNjs5xGp0997fFpEMjkmy7EA+/uEBu4MKOA7j+x65hCq8qwjC8HEAfUtzuRIUxZYZkx0TAxTFNmSSbr/PzJiVcN2Rd06dO5nqmE0fGAPp+j7d0GIICc/+7x/WgkEGwZ+AJGEWvScfF8tkDA0EbCCOeSgGq0BB3dmiGZLREaOPzbl+zeJkcQuqZ2mmai9lPEhlopAC4HYdJgduZyj3bQ0vGngx83OIuSOgnMwYlQlSI/8CZv7mW1Ne4NU3dMd6G0mGgXvTFjg2Ng9I9y1hv8HuQhrrtlra9XSoTtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5/+T14vH+iqVEt0J4gyaMJF2PSFq3Nws1On5uJW6HMI=;
 b=GN1YfYXp0v7Y/2sDwDB/sH3SVANqO9MPdsugFqtFDmktG1ajOQp+e15sfpv5FC5P0Dg5vAGfrA7SdiSLtc6xDKrYrL0O+HTnqIKwBCdGzNBLZGjdmotQQNvzEaotLnYFhdPOIdTgWbp2SnKSMczpc3/hvs3vjub42PHy9pJ3MY//pXtFCFXFp58HP4icOWlKGVq0wCtJn/AVNhslHlqW7cWJOrGj1oNojKFAoAQG0ZcUocz3cDMzzbsLa9L2Fr4fYVKdaV15JCnhRaYJ1n8HMAsW2UFcB6JTTzXjSTpHrvBadW6SBYDPICsTcE5yAHzRXcse6DPbGU+JICP6c+iSHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5/+T14vH+iqVEt0J4gyaMJF2PSFq3Nws1On5uJW6HMI=;
 b=RftHG7ioMVMQ2ot7KVwQ/SdbKS88Clv3QvJp6+l32PEwsQJ1uQJ2Qd6LW1e6DU7jaaon8S2otWH9nT7x7Nkyro1r6pZ8sIXneRUGjxkU+wIUgYLv+/aCfgUa2HuiixnCzESUuSjfQjs01RRT7oZuA/uOlfqREfxYBIxNPi9oAa8=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DB7PR08MB3708.eurprd08.prod.outlook.com (2603:10a6:10:7a::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2979.30; Thu, 7 May
 2020 10:41:26 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::87c:7c40:a1a0:26e0]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::87c:7c40:a1a0:26e0%7]) with mapi id 15.20.2958.034; Thu, 7 May 2020
 10:41:26 +0000
From: "Bertrand Marquis" <bertrand.marquis@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH] [arm-bsp] trusted-firmware-a-fvp: Fix dependency loop
Date: Thu,  7 May 2020 11:35:23 +0100
Message-Id: <20200507103523.38359-1-bertrand.marquis@arm.com>
X-Mailer: git-send-email 2.17.1
X-ClientProxiedBy: LO2P265CA0025.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:61::13) To DB7PR08MB3689.eurprd08.prod.outlook.com
 (2603:10a6:10:79::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from e109506-lin.cambridge.arm.com (217.140.106.55) by LO2P265CA0025.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:61::13) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2979.26 via Frontend Transport; Thu, 7 May 2020 10:41:26 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [217.140.106.55]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: b0797f58-f49f-4499-387b-08d7f27335b8
X-MS-TrafficTypeDiagnostic: DB7PR08MB3708:|DB8PR08MB4105:
X-Microsoft-Antispam-PRVS: 
	<DB8PR08MB41052F2CB8FB3E84F9D27BE69DA50@DB8PR08MB4105.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;OLM:8273;
X-Forefront-PRVS: 03965EFC76
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 4GOoRwl22k6v/IGEuPdhNL3FCJrvKJxowehWVh0hc0IvBqy144xP8LZoL7nnrLH4NZyw89b63Lgmp3HYi93boi3bgSBLbg+QcDNovGwmzgjGvuU3hS2Zr0k38A7WRbaKMDE6LfnXZNu6Mn/W8zRD5byWTtXi/dH4+cdhnvjmI3eR/qdU5Dw8kIzplPXhslle/Kj8wrPUC5dcEpwXE6S1Hii0bJJFt3mqyVLv05aDJPqgDQuvuekLgLxJZ2mgEmSAVhYjXYt36PZt3V+VEirChsqtTEHbZ93kY2bO9XpgKGeUNPlLmEpiYHyHH4NVjoQnyDUXEeYDhJJp3avK5iZyLkVxaVDyPeBzbX4IbowNSDdDWRTtYfFluaRYXthoNSfYCEXOfT9QLbtjSRH6ihlWribb8z0nqhiMsIjKLsjy6lL7SZM6XhAsV7DG3RD4CoCqgboElTC9df5BUFjVUz6V7dCu/0P/o/MejUc63o4UJh9x1q+w/Do0KpKpO9KrM0kfYtHzEVrG9oVNhUa8TCXi9w==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB3689.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(346002)(376002)(396003)(366004)(39860400002)(136003)(33430700001)(956004)(44832011)(33440700001)(66556008)(478600001)(66476007)(1076003)(8676002)(6486002)(8936002)(6666004)(66946007)(6916009)(316002)(5660300002)(86362001)(7696005)(52116002)(2616005)(26005)(16526019)(83320400001)(83280400001)(83310400001)(2906002)(36756003)(4326008)(83300400001)(83290400001)(186003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 q5ief6jtWFVf/O49R0FL3U83KObLiOijlnwvQnqS3NvkLgJFJVGjnD+NnF23z2jSRkz3mAp8ho8Ph1396ZgBQcIgch1CXCDX8/rXxfNUAXBuEmo7SyzeCDDyYgjwo9gWcYwbyCX78rCcVQdRLkALsP7nZcJE4E6C18f3TT1i4E15by1lCKEbp0CZBa/C6eX8clDG+igB1tcTqSiiwhfeHy/6ScqIp8954dGxArADCoyKrzAGl38kYKrg9ZM935gJuseOfV9lDy7QocWi74Nc/g5Fvuas7Fq/GrmYWmar2JzTzsPaxwEC2bNGuLRGRUPvtTGIQIuYe1b4YeIcYMAYxNNr3Y1UF80bzbsokw9ZI4WZR4+qp5ceEjRfh75x0LHasQgfVF1OiqIHqg98Mdgq/Bu5UNjLckZMf4yWZhVNp51F/1FevzwJHMDdwx9+pjInIiLqQlYfgfXVt0qKtv133jPGgRad4Hy2OOJNdoDM35KRGnisvhBsWyGRDR760++JzMk5p0k1iELmov3Wt9sHKtmgCIyLrCVcJSl1n53RzA+vzdszd/8mJLiJ/DJoxJWB2wgxzKrgGIXMi9S+7Kc/pahPoXO74cwaiFEcdklmAaLS/SKLLEE9TnjhbtVuS2tQMMVxrUFaMmJCkdV7MmnXtpIXFRVvLe/ynTgZtgqc9Yd+nJPLOmQv2hesasEEyNnqIFL+00/acUkA4XCOxMron+5qE/vwra4R3yO6fM35oPh+qd1lqIUBBRwYCwqo4bgbAgljxzfGl5+xCPN2FaR7Ckm9E/cq5k9tzmQmuPhJ+l4=
X-MS-Exchange-Transport-Forked: True
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3708
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Bertrand.Marquis@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 VE1EUR03FT020.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFTY:;SFS:(4636009)(376002)(396003)(346002)(136003)(39860400002)(46966005)(33430700001)(356005)(44832011)(6916009)(16526019)(1076003)(70586007)(336012)(82310400002)(956004)(36906005)(7696005)(186003)(81166007)(26005)(2616005)(316002)(86362001)(2906002)(70206006)(8676002)(4326008)(478600001)(8936002)(6666004)(36756003)(6486002)(47076004)(5660300002)(33440700001)(82740400003);DIR:OUT;SFP:1101;
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	542a505d-9f11-4f70-6f9a-08d7f2733176
X-Forefront-PRVS: 03965EFC76
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	4iGrvWz/TbhlhTphVamnNmv6v+FWmWJ3pePZG70AKT/zD3iekt7EJt8UGGWLm/rie9wk/S3qwBhId5GYzES7ExfNVvN0TJF/XhpjLK8XSa0JZAl2CM/VXCWePwh0qyVJvAz2MIwKNcR0fc9GC0bif5xPstaufUPMr4LJVwfpQtB3NVFYNR15fszNCjWTmZvb3UeSv/xYw6FK8v6hDvlrpYnbLebYwsMyKY84ZR+pWBq6gLz+695bSrW2cVKYDR/upJlbvcDypiPgpNPc//bq1rzFluJ9R7dGdWa9kbxbQbzYanCLTZ0NUI8IdepyEhml8hgH2xIWRqspr/NsFH+GKDwrgDtsyoG0lGr29xl6MqAcm/9xwYRxFtn9/z1JuFhuEqUrYHFHFoYbvXCjX2WwmB3zDHxgGIm/yYyZ182QrBgu0Pqm7xayh1A9zOvdI6Lq1CgkC1gqykGJ57sw+22magiHawYoTwcX0m3HKtRDlaz4x3b+HnmvSldG7+2LS5hW2OVKuHrbvlfVO+ZG8OyXguwtzl0MZYVe70PeseOLdOFBvheTYRDmfCjVfFOywamrdLBVCUUwSZl4EvFE6lFyvg==
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2020 10:41:33.1557
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b0797f58-f49f-4499-387b-08d7f27335b8
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB4105
Content-Type: text/plain

From: Diego Sueiro <diego.sueiro@arm.com>

When building with INITRAMFS_IMAGE_BUNDLE set, there is a dependency
loop between trusted-firmware-a:do_install and virtual/kernel:do_deploy
since the trusted-firmware-a:do_install depends on the kernel dtb to be
passed to the fiptool to generate the fip.bin binary.

The kernel dtb is not mandatory to generate the fip.bin if we compile
the "dtbs" and "fip" targets which will include the in-tree device-tree
used for the --hw-config (HW_CONFIG property) dynamic configuration
during the cold boot.

Change-Id: I7147cc1eeecb7c4b66f198562163438b7b663eba
Issue-Id: SCM-990
Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>
---
 .../trusted-firmware-a-fvp.inc                | 19 +------------------
 1 file changed, 1 insertion(+), 18 deletions(-)

diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-fvp.inc b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-fvp.inc
index 3e58ecf..27031eb 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-fvp.inc
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-fvp.inc
@@ -10,21 +10,4 @@ TFA_PLATFORM = "fvp"
 TFA_DEBUG = "1"
 TFA_MBEDTLS = "1"
 TFA_UBOOT = "1"
-TFA_BUILD_TARGET = "bl1 bl2 bl31 dtbs fiptool"
-
-do_install[depends] += "virtual/kernel:do_deploy"
-
-do_install_append() {
-    ./tools/fiptool/fiptool create \
-        --tb-fw ${S}/${TFA_BUILD_DIR}/bl2.bin \
-        --soc-fw ${S}/${TFA_BUILD_DIR}/bl31.bin \
-        --tb-fw-config ${S}/${TFA_BUILD_DIR}/fdts/fvp_tb_fw_config.dtb \
-        --soc-fw-config ${S}/${TFA_BUILD_DIR}/fdts/fvp_soc_fw_config.dtb \
-        --hw-config ${DEPLOY_DIR_IMAGE}/$(basename ${KERNEL_DEVICETREE}) \
-        --nt-fw ${DEPLOY_DIR_IMAGE}/u-boot.bin \
-        fip.bin
-
-    ./tools/fiptool/fiptool info fip.bin
-
-    install -m 0644 ${S}/fip.bin ${D}/firmware/fip-fvp.bin
-}
+TFA_BUILD_TARGET = "bl1 bl2 bl31 dtbs fip"
-- 
2.17.1

